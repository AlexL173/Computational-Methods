using Pkg
Pkg.add("Plots")
using Plots
Pkg.add("LaTeXStrings")
using LaTeXStrings

#Defines the cbrt function
function defineCbrt(num)
    return (num^3) - 3
end

#Defines the quadratic to solve for part 3
function defineQuadratic(num)
    return (num)^2 - (num) - 0.5
end

#Implementation of the quadratic formula from project 0
function quadraticFormulaD(a,b,c)
    numerator = (-2) * c
    discriminant = b^2 - (4 * a * c)
    denominator1 = b + sqrt(discriminant)
    denominator2 = b - sqrt(discriminant)
    
    
    a = [numerator/denominator1, numerator/denominator2]

    return sort(a)
end

#plotQuadratic function from project 0 
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

#runs the bisection algorithm, makes numIter bisections
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

#runs the bisection algorithm until the answer has numDecimals of precision
function bisectDecimals(lb, ub, numDecimals, f)
    lowerBound = lb
    upperBound = ub
    flag = 0
    counter = 0
    while flag == 0
        counter += 1
        middleVal = (lowerBound + upperBound)/2
        if (f(lowerBound) * f(middleVal)) < 0
            upperBound = middleVal
        elseif f(middleVal) == 0
            return middleVal
        else 
            lowerBound = middleVal
        end
        #This checks if the decimal is long enough
        if ((length(string(modf((lowerBound + upperBound)/2)[1])) -2) >= numDecimals)
            flag = 1
        end
    end

    print("Ran for ")
    print(counter)
    println(" iterations.")

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

function solveQuadratic(itOrDec, number)
    
    if (itOrDec == 1)
        currentApproximation = bisectIterations(1,2,number, defineQuadratic)
        previousApproximation = bisectIterations(1,2,number-1, defineQuadratic)
    else 
        currentApproximation = bisectDecimals(1,2,number, defineQuadratic)
        previousApproximation = bisectDecimals(1,2,number-1, defineQuadratic)
    end

    
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


solveCbrt3(3)
solveQuadratic(1,10)
solveQuadratic(2,3)
