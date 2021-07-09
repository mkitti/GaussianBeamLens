### A Pluto.jl notebook ###
# v0.15.1

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ a7ef92d7-41c1-4f7d-a0f9-b8037237af4f
begin
	using Pkg
	Pkg.activate(mktempdir())
	Pkg.add(url="https://github.com/mkitti/GaussianBeamLens.git")
	Pkg.add("GR")
	Pkg.add("PlutoUI")
end


# ╔═╡ bca271a4-ee26-48ab-bef8-e6c28ae76351
begin
	using GaussianBeamLens
	using GR
	using PlutoUI
end

# ╔═╡ 10e09fe7-cc23-4487-b1dc-b0a545bf2489
begin
	#cm = GR.COLORMAP_INFERNO
	colormaps = [
			string(getfield(GR,name)) => replace(string(name),"COLORMAP_" => "")
			for name in names(GR, all=true)
			if startswith(string(name),"COLORMAP_")
				]
	println(colormaps)
	md"""
	Colormap:
		$(@bind cm Select(colormaps; default = "45"))
	"""
end

# ╔═╡ b1e13be1-d608-43a1-a7d5-29a6c3f98229
md"""
x0:
$(@bind x0 Slider(-240:10:240; default=0, show_value=true))

w0:
$(@bind w0 Slider(2:1:50; default=25, show_value=true))

f:
$(@bind f Slider(0:10:2000; default=1000, show_value=true))

Lens\_z:
$(@bind Lens_z Slider(0:10:2000; default=1000, show_value=true))
"""

# ╔═╡ 4b7b50c6-1304-4c81-b2ac-92ecf7a3d4d1
begin
xlabel("z")
ylabel("x")
GR.heatmap(GaussianBeamLens.z,GaussianBeamLens.x,GaussianBeamLensPropagate(x0, w0, f, Lens_z)'; colormap = parse(Int,cm))
end

# ╔═╡ Cell order:
# ╠═a7ef92d7-41c1-4f7d-a0f9-b8037237af4f
# ╠═bca271a4-ee26-48ab-bef8-e6c28ae76351
# ╠═10e09fe7-cc23-4487-b1dc-b0a545bf2489
# ╠═4b7b50c6-1304-4c81-b2ac-92ecf7a3d4d1
# ╠═b1e13be1-d608-43a1-a7d5-29a6c3f98229
