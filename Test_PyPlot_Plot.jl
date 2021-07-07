using PyPlot
#lines
x = LinRange(0, 10, 100)
y1 = sin.(x)
y2 = cos.(x)

subplot(221)
plot(x, y1, "r")
subplot(222)
plot(x, y2, "b")

subplot(2,2, (3,4))
plot(x, y1, "r", label = "sin")
plot(x, y2, "b", label = "cos")

if !isinteractive()
    PyPlot.show()
end


#fig = Figure()
#lines(fig[1, 1], x, y1, color = :red)
#lines(fig[1, 2], x, y2, color = :blue)

#lines(fig[2, 1:2], x, y1, color = :red, label = "sin")
#lines!(fig[2, 1:2], x, y2, color = :blue, label = "cos")
#axislegend()
#current_figure()
#fig