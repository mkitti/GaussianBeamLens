using GLMakie: Node, @lift, labelslidergrid!, set_close_to!, connect!
using GLMakie: Figure, heatmap, contourf
using GaussianBeamLens

z = GaussianBeamLens.z
x = GaussianBeamLens.x

# Sliders
x0_index = Node(1)
w0_index = Node(2)
f_index = Node(3)
Lensz_index = Node(4)

# Use the values from the Sliders as inputs to get Intensity of the field at every point in x and z
@time I = @lift(GaussianBeamLensPropagate($x0_index, $w0_index, $f_index, $Lensz_index))

# Initialize figure
fig = Figure(resolution = (2304, 768))

@time heatmap(fig[1, 1], z, x, I, 
	colormap = :thermal,
	axis =(aspect=3,
		title = "Gaussian Beam: Lens Transmission",
        xlabel="Propagation Direction (z)", 
        ylabel="Lateral Offset (x)"))
#Other colormap options: deep

# Define a grid with slider label, value ranges
@time lsgrid = labelslidergrid!(
    fig,
    ["lateral offset", "input beam width", "focal length", "lens z-position"],
    [-240:10:240, 2:1:50, 0:10:2000, 0:10:2000];
    formats = [x -> "$x λ"],
    width = 555,
    tellheight = false)
fig[1, 2] = lsgrid.layout

# Set default value for each slider
set_close_to!(lsgrid.sliders[1], 60)
set_close_to!(lsgrid.sliders[2], 32)
set_close_to!(lsgrid.sliders[3], 1000)
set_close_to!(lsgrid.sliders[4],1000)

# Connect sliders to values
connect!(x0_index, lsgrid.sliders[1].value)
connect!(w0_index, lsgrid.sliders[2].value)
connect!(f_index, lsgrid.sliders[3].value)
connect!(Lensz_index, lsgrid.sliders[4].value)

# show figure
fig