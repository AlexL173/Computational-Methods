using Pkg
Pkg.add("Plots")
using Plots
Pkg.add("LaTeXStrings")
using LaTeXStrings

#Finds roots using specified quadratic equation
function quadraticFormulaD(a,b,c)
    numerator = (-2) * c
    discriminant = b^2 - (4 * a * c)
    denominator1 = b + sqrt(discriminant)
    denominator2 = b - sqrt(discriminant)
    
    
    a = [numerator/denominator1, numerator/denominator2]

    return sort(a)
end

#Plots quadratics
function plotQuadratic(a,b,c, equationNumber)

    #Plot for quadratic 1
    if(equationNumber == 1)
        x = range(-1, 2, length=100)
        y = @. (a * x^2 + b * x + c)
        plot(x, y, label=(string(a) * L"$\ x^2 + $" * string(b) * L"$\ x + $" * string(c)))
        scatter!(quadraticFormulaD(a,b,c), [0,0], label = "Zeroes")
        title!("Equation 1")
        xlabel!("x")
        ylabel!("y")

        #Save plots as image files
        savefig("Plot1.png")  

    else
        #Plot for quadratic 2
        x = range(-1,2,length = 100)
        y = @. (a * x^2 + b * x + c)
        plot(x, y, label=(string(a) * L"$\ z^2 + $" * string(b) * L"$\ z + $" * string(c)))
        scatter!(quadraticFormulaD(a,b,c), [0,0], label = "Zeroes")
        title!("Equation 4")
        xlabel!("z")
        ylabel!("y")
        
        #Save plots as image files
        savefig("Plot2.png")  
    end
    
end

#Print roots for Float32, Float64, and BigFloat (Equation 1)
println(quadraticFormulaD(Float32(1), Float32(-1), Float32(-1)))
println(quadraticFormulaD(Float64(1), Float64(-1), Float64(-1)))
println(quadraticFormulaD(BigFloat(1), BigFloat(-1), BigFloat(-1)))


#Print roots for Float32, Float64, and BigFloat (Equation 4)
println(quadraticFormulaD(Float32(3), Float32(-4.2), Float32(-1.5)))
println(quadraticFormulaD(Float64(3), Float64(-4.2), Float64(-1.5)))
println(quadraticFormulaD(BigFloat(3), BigFloat(-4.2), BigFloat(-1.5)))


#Call both quadratic graphing functions
plotQuadratic(1,-1,-0.5,1)
plotQuadratic(3,-4.2,-1.5, 4)