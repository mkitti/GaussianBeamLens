@time begin
    @time using GaussianBeamLens
    @time using GR

    @time X = GaussianBeamLens.GaussianBeamLensPropagate(0, 25, 1000, 1000);
    # See https://gr-framework.org/workstations.html
    ENV["GKSwstype"] = 41 # Use quick native Win32 GUI
    @time GR.init()
    @time w, h = size(X)
    @time GR.setwindow(0, w, 0, h)
    @time GR.setcolormap(GR.COLORMAP_VIRIDIS)
    @time cmap = colormap();
    @time cmin, cmax = extrema(X)
    #@time data = map(x -> GR.jlgr.normalize_color(x, cmin, cmax), X)
    #@time rgba = [GR.jlgr.to_rgba(value, cmap) for value = data]
    data = GR.jlgr.normalize_color.(X, cmin, cmax)
    rgba = GR.jlgr.to_rgba.(data, Ref(cmap))
    @time GR.drawimage(0, w, 0, h, w, h, rgba)
    @time GR.updatews()
    println("Total time:") #  2.238569 seconds
end