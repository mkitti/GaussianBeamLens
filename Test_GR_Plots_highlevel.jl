using GR
#lines
x = LinRange(0, 10, 100)
y1 = sin.(x)
y2 = cos.(x)

figure()
subplot(2, 2, 1)
plot(x, y1, "r")

subplot(2, 2, 2)
plot(x, y2, "b")

subplot(2, 2, (3,4))
plot(x, y1, "r", x, y2, "b", labels = ["sin", "cos"])
