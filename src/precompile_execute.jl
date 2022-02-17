using MappedArrays, IndirectArrays, ColorSchemes, Images, GaussianBeamLens, ImageView
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

I = GaussianBeamLensPropagateColored(0, 25, 1000, 1000)'
