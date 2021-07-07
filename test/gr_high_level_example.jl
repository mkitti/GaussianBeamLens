@time begin
    @time using GaussianBeamLens
    @time using GR

    @time X = GaussianBeamLens.GaussianBeamLensPropagate(0, 25, 1000, 1000);
    # See https://gr-framework.org/workstations.html
    #ENV["GKSwstype"] = 41 # Use quick native Win32 GUI
    @time GR.heatmap(X)
    println("Total time:") #  7.397603 seconds
end