using PackageCompiler
using GaussianBeamLens
gui_file = joinpath(dirname(pathof(GaussianBeamLens)),"GtkGUI.jl")
#(@v1.6) pkg> activate .
#  Activating environment at `C:\Users\kittisopikulm\Documents\Julia\GaussianBeamLens\Project.toml`
create_sysimage([:MappedArrays, :IndirectArrays, :ColorSchemes, :Images, :GaussianBeamLens, :GtkReactive, :Gtk, :ImageView, :FFTW], precompile_execution_file=gui_file, sysimage_path="gaussian_beam_lens_gui.dll")
#PS C:\Users\kittisopikulm\Documents\Julia\GaussianBeamLens> julia --sysimage .\gaussian_beam_lens_gui.dll --project=. .\src\GtkGUI.jl
#  1.318605 seconds (1.82 M allocations: 168.221 MiB, 13.45% gc time, 69.55% compilation time)