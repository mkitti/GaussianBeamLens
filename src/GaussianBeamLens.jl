module GaussianBeamLens

# Set optimization level 1 for faster compilation, at potential cost of later performance
if isdefined(Base, :Experimental) && isdefined(Base.Experimental, Symbol("@optlevel"))
    @eval Base.Experimental.@optlevel 1
end

using FFTW: ifft, fft, ifftshift, fftshift

using ColorSchemes, Images

export GaussianBeamLensPropagate

const L = 1                      # wavelength of light 
const n = 1                      # refractive index
const k = 2*pi*n/L               # wave number in material
const Nx = 1024                  # number of x cells
const dx = L/2                   # length of x cells
const Lx = Nx*dx                 # length of grid in x
const dkx = (2*pi)/Lx            # length of kx cell
const Nkx = Nx                   # same number of cells in real and fourier space

const x = dx.*(-(Nx/2):Nx/2-1)
const kx = dkx.*(-(Nkx/2):Nkx/2-1)
const kz = sqrt.(k^2 .- kx.^2)

const dz = 10                    # steps in z
const zmax = 6000                # end of grid in z
const z = 0:dz:zmax              # z grid

const FE = zeros(Complex{Float64}, length(z), length(x))

const cache = Dict{Tuple{Int64,Int64,Int64,Int64},Matrix{Float64}}()



"""
    GaussianBeamLensPropagate(x0,w0,f,Lens_z)
        x0:     Lateral offset of the input beam
        w0:     Width of the Gaussian beam in object space
        f:      Focal length of the lens
        Lens_z: Axial Position of the lens
Computes the intensity of the optical field at every point in x (lateral) and z (axial)
"""
function GaussianBeamLensPropagate(x0,w0,f,Lens_z)
    if haskey(cache,(x0,w0,f,Lens_z))
        return cache[(x0,w0,f,Lens_z)]
    else
        return GaussianBeamLensPropagateUncached(x0, w0, f, Lens_z)
    end
end

function GaussianBeamLensPropagateUncached(x0, w0, f, Lens_z)
    E = exp.(-((x .- x0)./w0).^2)             # initial transverse electric field
    Tf = exp.(1im.*k.*(x.^2)/(2*f))           # transmission function for a thin lens
    
    # Propagate beam
    #FE = zeros(Complex{Float64},length(z),length(E))
    FE[1,:] = E

    for d = 1:length(z)-1
        # We could save some time if we saved the prior iteration in Fourier space
        FE[d+1,:] = ifft(ifftshift( fftshift(fft(FE[d,:])).*exp.(-1im.*kz.*dz) ))
        if abs(z[d]- Lens_z) < dz/2        
            FE[d+1,:] .*= Tf
        end
    end
    I = abs2.(FE)                # intensity of the field at every point in x and z
    cache[(x0,w0,f,Lens_z)] = I
    return I
end

precompile(GaussianBeamLensPropagateUncached, (Int64, Int64, Int64, Int64))
precompile(GaussianBeamLensPropagate, (Int64, Int64, Int64, Int64))

end