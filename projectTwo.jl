using Pkg
Pkg.add("Roots")
using Roots
Pkg.add("Plots")
using Plots
Pkg.add("LaTeXStrings")

#define inital bounds
start = 0; stop = 11; 
#define initial function
a = 3; b = -4.2; c = -1.5;

quadratic(x) = a * x^2 + b * x + c

fprime(x) = 2 * a * x + b 



function lRam(f, start, stop, num)
    # A running sum of the approximation
    runningApproximation = 0 
    # Width of each box 
    delta = (stop - start)/num
    # Starts the approximation at the left bound
    current = start

    # Starts the graph, starts and stops slightly outside of the bounds
    x = range(start -1, stop + 1, length=100)
    plot(x, f, dpi = 1000, legend = false)

    #For each box: 
    for i in 1:num

        #Add the area of the box with h = f(left corner) and width delta
        currentBox = f(current) * delta

        runningApproximation += currentBox

        #plots rectangles, using left edge as height        
        plot!(rectangle(delta, f(current) ,current, 0), opacity=.5, color = "blue")
        
        #updates the location to move onto the next box
        current += delta
    end

    #saves graph
    savefig("left.png") 

    return runningApproximation
end

function rRam(f, start, stop, num)
    
    # A running sum of the approximation
    runningApproximation = 0 
    # Width of each box 
    delta = (stop - start)/num
    # Starts the approximation at the left bound PLUS delta to the right corner
    current = start + delta

    # Starts the graph, starts and stops slightly outside of the bounds
    x = range(start -1, stop + 1, length=100)
    plot(x, f, dpi = 1000, legend = false)

    #For each box: 
    for i in 1:num

        #Add the area of the box with h = f(right corner) and width delta
        currentBox = f(current) * delta

        runningApproximation += currentBox

        #plots rectangles, using right edge as height        
        plot!(rectangle(delta, f(current) ,current - delta, 0), opacity=.5, color = "blue")
        
        #updates the location to move onto the next box
        current += delta
    end

    savefig("right.png") 

    return runningApproximation
end

function mRam(f, start, stop, num)
    # A running sum of the approximation
    runningApproximation = 0 
    # Width of each box 
    delta = (stop - start)/num
    # Starts the approximation at the left bound PLUS delta/2 to the middle
    current = start + delta/2

    # Starts the graph, starts and stops slightly outside of the bounds
    x = range(start -1, stop + 1, length=100)
    plot(x, f, dpi = 1000, legend = false)

    #For each box: 
    for i in 1:num

        #Add the area of the box with h = f(middle) and width delta
        currentBox = f(current) * delta

        runningApproximation += currentBox
        #plots rectangles using midpoint as height
        plot!(rectangle(delta, f(current) ,current - delta/2, 0), opacity=.5, color = "blue")
        #updates the location to move onto the next box
        current += delta
    end

    savefig("middle.png") 

    return runningApproximation
end

# function finds the absolute highest point of a function between two bounds
function findHighest(func, funcp, leftBound, rightBound)

    endPoints = [func(leftBound),func(rightBound)]
    #location at which the first derivative is 0, only 1 such location in a quadratic

    criticalPoint = find_zeros(funcp, leftBound, rightBound)

    upper = max(endPoints[1], endPoints[2])

    # of all possible points, check all  to see which is the largest
    if (length(criticalPoint) > 0)
        val = criticalPoint[1]
        upper = max(endPoints[1], endPoints[2], func(val))   
    end
    
    return upper
end

#creates a rectangle 
function rectangle(w, h, x, y) # Inspired by a post from juliohm : https://discourse.julialang.org/t/how-to-draw-a-rectangular-region-with-plots-jl/1719
    return Shape(x .+ [0,w,w,0], y .+ [0,0,h,h])
end

function upperRam(func, fp, start, stop, num)
    # A running sum of the approximation
    runningApproximation = 0 
    # Width of each box 
    delta = (stop - start)/num
    # Starts the approximation at the left bound PLUS delta/2 to the middle
    current = start

    #Plots:
    x = range(start -1, stop + 1, length=100)
    plot(x, func, dpi = 1000, legend = false)
    
    #For each box: 
    for i in 1:num
        lb = current
        rb = current + delta
        #Add the area of the box with h = f(middle) and width delta
        currentBox = findHighest(func, fp,lb, rb) * delta

        runningApproximation += currentBox

        #updates the location to move onto the next box
        
        height = findHighest(func, fp,lb, rb)
        #println(height)
        
        #plot rectangle from the highest point in its domain
        plot!(rectangle(delta, height ,current, 0), opacity=.5, color = "blue")
        current += delta
    end

    savefig("upper.png")  
    return runningApproximation
end


#calculate using 15 boxes with all methods
println(upperRam(quadratic, fprime, start, stop, 15))
println(lRam(quadratic, start, stop, 15))
println(rRam(quadratic, start, stop, 15))
println(mRam(quadratic, start, stop, 15))

#calculate using 50 boxes with all methods
println(upperRam(quadratic, fprime, start, stop, 50))
println(lRam(quadratic, start, stop, 50))
println(rRam(quadratic, start, stop, 50))
println(mRam(quadratic, start, stop, 50))
