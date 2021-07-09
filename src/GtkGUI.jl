module GtkGUI

    if isdefined(Base, :Experimental) && isdefined(Base.Experimental, Symbol("@optlevel"))
        @eval Base.Experimental.@optlevel 1
    end

    using MappedArrays, IndirectArrays, ColorSchemes, Images, GaussianBeamLens, GtkReactive, Gtk, Gtk.ShortNames, ImageView
    
    export gui

    const cache = Dict{Tuple{Int64,Int64,Int64,Int64},IndirectArray{RGB{Float64}, 2}}()

    """
        color_me_scaleminmax(A, cmap)

    Apply colormap `cmap` to an array `A`.
    See https://discourse.julialang.org/t/how-to-convert-a-matrix-to-an-rgb-image-using-images-jl/7265/9 by Tim Holy
    """
    function color_me_scaleminmax(A, cmap)
        n = length(cmap)
        scale = takemap(scaleminmax, A)
        f = s->clamp(round(Int, (n-1)*scale(s))+1, 1, n)  # safely convert 0-1 to 1:n
        Ai = mappedarray(f, A)       # like f.(A) but does not allocate significant memory
        IndirectArray(Ai, cmap)      # colormap array
    end

    """
        GaussianBeamLensPropagateColored(args...; colormap = ColorSchemes.inferno.colors)

    Apply a colormap to the output of `GaussianBeamLens.GaussianBeamLensPropagate`. See that function for args.
    """
    GaussianBeamLensPropagateColored(args...; colormap = ColorSchemes.inferno.colors) =
        haskey(cache, args) ? 
            cache[args] :
            cache[args] = color_me_scaleminmax(GaussianBeamLens.GaussianBeamLensPropagateUncached(args...)', colormap)

    function gui()
        win = Window("GaussianBeamLens.jl") |> (bx = Box(:v))
        I = GaussianBeamLensPropagateColored(0, 25, 1000, 1000)'
        c = canvas(UserUnit, size(I,2), size(I,1))
        imshow!(c,I)
        x0sl = slider(-240:10:240)
        w0sl = slider(2:50)
        fsl = slider(0:10:2000)
        Lens_zsl = slider(0:10:2000)
        push!(bx, c)
        push!(bx, label("x_0, Lateral offset of the input beam"))
        push!(bx, x0sl)
        push!(bx, label("w_0, Width of the Gaussian beam in object space"))
        push!(bx, w0sl)
        push!(bx, label("f, Focal length of the lens"))
        push!(bx, fsl)
        push!(bx, label("Lens_z, Axial position of the lens"))
        push!(bx, Lens_zsl)

        signals = map(signal, [x0sl, w0sl, fsl, Lens_zsl])
        redraw = draw(c, signals...) do c, x0, w0, f, Lens_z
            copy!(c, GaussianBeamLensPropagateColored(x0, w0, f, Lens_z))
        end

        Gtk.showall(win)
        (win = win, c = c, x0sl = x0sl, w0sl = w0sl, fsl = fsl, Lens_zsl = Lens_zsl, redraw = redraw)
    end

    precompile(color_me_scaleminmax, (Matrix{Float64}, Vector{RGB{Float64}}))
    precompile(GaussianBeamLensPropagateColored,(Int64,Int64,Int64,Int64))
    precompile(gui,())
end