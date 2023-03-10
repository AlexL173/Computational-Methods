using Pkg
Pkg.add("Plots")
using Plots
Pkg.add("LaTeXStrings")
using LaTeXStrings

function defineCbrt(num)
    return (num^3) - 3
end

function defineQuadratic(num)
    return (num)^2 - (num) - 0.5
end

function quadraticFormulaD(a,b,c)
    numerator = (-2) * c
    discriminant = b^2 - (4 * a * c)
    denominator1 = b + sqrt(discriminant)
    denominator2 = b - sqrt(discriminant)
    
    
    a = [numerator/denominator1, numerator/denominator2]

    return sort(a)
end

function plotQuadratic(a,b,c)

    #Plot for quadratic 1

        x = range(-1, 2, length=100)
        y = @. (a * x^2 + (b) * x + c)
        plot(x, y, label=(string(a) * L"$\ x^2 + $" * string(b) * L"$\ x + $" * string(c)))
        scatter!(quadraticFormulaD(a,b,c), [0,0], label = "Zeroes")
        title!("QuadraticGraph")
        xlabel!("x")
        ylabel!("y")

        #Save plots as image files
        savefig("QuadraticPlot.png")  

end

function bisectIterations(lb, ub, numIter, f)
    lowerBound = lb
    upperBound = ub
    for i in 1:numIter
        middleVal = (lowerBound + upperBound)/2
        if (f(lowerBound) * f(middleVal)) < 0
            upperBound = middleVal
        elseif f(middleVal) == 0
            
            return middleVal
        else 
            
            lowerBound = middleVal
        end


    end
    return (lowerBound + upperBound)/2
end

function bisectDecimals(lb, ub, numDecimals, f)
    lowerBound = lb
    upperBound = ub
    flag = 0
    while flag == 0
        #println("---")
        #println(lowerBound)
        #println(upperBound)
        #println(modf((lowerBound + upperBound)/2)[1])
        #println((length(string(modf((lowerBound + upperBound)/2)[1])) -2))
        middleVal = (lowerBound + upperBound)/2

        if (f(lowerBound) * f(middleVal)) < 0
            upperBound = middleVal
        elseif f(middleVal) == 0
            return middleVal
        else 
            lowerBound = middleVal
        end

        if ((length(string(modf((lowerBound + upperBound)/2)[1])) -2) >= numDecimals)
            flag = 1
        end

    end

    return (lowerBound + upperBound)/2
end

function solveCbrt3(iterations)
    println("-----------------------")
    currentApproximation = bisectIterations(1,2,iterations, defineCbrt)
    previousApproximation = bisectIterations(1,2,iterations - 1, defineCbrt)

    print("Approximation: ")
    print(currentApproximation)
    println()
    print("Last Approximation: ")
    print(previousApproximation)
    println()
    print("Absolute Relative Approximate Error: ")
    absoluteRelativeError = abs(currentApproximation - previousApproximation)/abs(currentApproximation)
    print(absoluteRelativeError)
    println()
    println("-----------------------")
end

function solveQuadratic(iterations,decimals)
    
    approximation = bisectDecimals(1,2,decimals,defineQuadratic)
    trueValue = (1 + sqrt(3))/2
    absoluteTrueError = abs(approximation - trueValue)
    absoluteTrueRelativeError = absoluteTrueError /trueValue
    println("-----------------------")
    print("Approximation: ")
    println(approximation)
    print("Absolute Relative True Error: ")
    println(absoluteTrueRelativeError)
    println("-----------------------")
end


#solveCbrt3(3)
#solveQuadratic(3)

solveQuadratic(100,3)


#plotQuadratic(1,-1,-0.5)


#println(bisectIterations(1,2,100,defineCbrt))
#println(bisectIterations(1,2,100,defineQuadratic))