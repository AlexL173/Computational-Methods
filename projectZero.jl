using Pkg
Pkg.add("Plots")
using Plots

function quadraticFormulaD(a,b,c)
    numerator = (-2) * c
    insideRoot = b^2 - (4 * a * c)
    denominator1 = b + sqrt(insideRoot)
    denominator2 = b - sqrt(insideRoot)

    a = [numerator/denominator1, numerator/denominator2]
    return a
end

x = range(0, 10, length=100)
y = sin.(x)
plot(x, y)