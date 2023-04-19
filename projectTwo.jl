using Pkg
Pkg.add("Plots")
using Plots
Pkg.add("LaTeXStrings")

#define inital bounds
start = 0; stop = 11; 
#define initial function
a = 3; b = -4.2; c = -1.5;
#First Derivative
quadratic(x) = a * x^2 + b * x + c
#Second Derivative
fp(x) = 2 * a * x + b 
#Third Derivative
fdp(x) = 2 * a

function lRam(f, start, stop, num)
    # A running sum of the approximation
    runningApproximation = 0 
    # Width of each box 
    delta = (stop - start)/num
    # Starts the approximation at the left bound
    current = start

    #For each box: 
    for i in 1:num

        #Add the area of the box with h = f(left corner) and width delta
        currentBox = f(current) * delta

        runningApproximation += currentBox

        #updates the location to move onto the next box
        current += delta
    end
    return runningApproximation
end

function rRam(f, start, stop, num)
    # A running sum of the approximation
    runningApproximation = 0 
    # Width of each box 
    delta = (stop - start)/num
    # Starts the approximation at the left bound PLUS delta to the right corner
    current = start + delta

    #For each box: 
    for i in 1:num

        #Add the area of the box with h = f(right corner) and width delta
        currentBox = f(current) * delta

        runningApproximation += currentBox

        #updates the location to move onto the next box
        current += delta
    end
    return runningApproximation
end

function mRam(f, start, stop, num)
    # A running sum of the approximation
    runningApproximation = 0 
    # Width of each box 
    delta = (stop - start)/num
    # Starts the approximation at the left bound PLUS delta/2 to the middle
    current = start + delta/2

    #For each box: 
    for i in 1:num

        #Add the area of the box with h = f(middle) and width delta
        currentBox = f(current) * delta

        runningApproximation += currentBox

        #updates the location to move onto the next box
        current += delta
    end
    return runningApproximation
end

println(lRam(quadratic, start, stop, 9000))
println(rRam(quadratic, start, stop, 9000))
println(mRam(quadratic, start, stop, 9000))
#print(quadratic(0))