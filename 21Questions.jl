import Pkg; Pkg.add("MTH229")
using MTH229
using Plots

#Practice Using Plots and Newton's method

#=
f(x) = x^3 - 2x - 5
#plot(f, -3, 3)


fp(x) = 3x^2 - 2
x = 2
x = x - f(x)/fp(x)
x0, x1 = 2, x
plot(f, 1, 3, legend=false)
plot!([x0,x0,x1], [0,f(x0),0])
scatter!([x0, x1],[0, 0])

f(x) = x^3 -2x -5
x = 2
x = x - f(x)/fp(x)
x = x - f(x)/fp(x)
x = x - f(x)/fp(x)
x = x - f(x)/fp(x)
x = x - f(x)/fp(x)

print(x, f(x))
=#

# 8.2.2 
f(x) = x^2 - 15
fp(x) = 2x
x = 4
#print(x)

for i in 1:3
    global x = x - f(x)/fp(x)
end

f1(x) = sin(x)
fp1(x) = cos(x)
x = 3

for i in 1:3
    global x = x - f1(x)/fp1(x)
end

#print(x)


f2(x) = x^2 - 3^(x)
fp2(x) = 2x - 3^(x) * log(3)
x = 0

for i in 1:10
    global x = x - f2(x)/fp2(x)
end

#print(x)

#8.3


#function for newton's method
function nm(f, fp, x)
    xnew,xold = x,Inf
    fn,fo = f(xnew),Inf

    tol = 1e-14
    ctr = 1

    while (ctr<100) && (abs(xnew - xold) > tol) && (abs(fn - fo) > tol)
        x = xnew - f(xnew) / fp(xnew) 
        xnew,xold = x,xnew
            fn,fo = f(xnew),fn
        ctr = ctr + 1
    end

    if ctr == 100
        error("Did not converge in 100 steps")
    else
        xnew, ctr
    end
end


f(x) = x^3 - 5x + 1
fp(x) = 3x^2 - 5
#nm(f, fp, 0)

f(x) = exp(x) - x^4
x = 2
xstar = newton(f,2)
#println(xstar)
#println(xstar, f(xstar))

f(x) = exp(x) - x^4
x = 8
#newton(f,x,verbose = true)

f(x) = sin(x) - cos(4x)
x = pi/8
#newton(f,x)

# 8.4.1

x2,x1 = 1,2
f(x) = x^2 - 2
fp(x1,x2) = (f(x1) -f(x2))/(x1 -x2)
x2,x1 = x2 - f(x2)/fp(x1,x2), x2

#println(x2)
#println(x1)

x2, x1 = x2 - f(x2)/fp(x1, x2), x2
x2, x1 = x2 - f(x2)/fp(x1, x2), x2
x2, x1 = x2 - f(x2)/fp(x1, x2), x2
x2, x1 = x2 - f(x2)/fp(x1, x2), x2
x2, x1 = x2 - f(x2)/fp(x1, x2), x2

#println(x2)
#println(f(x2))

#secant method
x2,x1 =  0.5, 1
f(x) = cos(x) - x^3
fp(x) = -sin(x) - 3x^2


x2, x1 = x2 - f(x2)/fp(x1, x2), x2
x2, x1 = x2 - f(x2)/fp(x1, x2), x2
x2, x1 = x2 - f(x2)/fp(x1, x2), x2
x2, x1 = x2 - f(x2)/fp(x1, x2), x2
x2, x1 = x2 - f(x2)/fp(x1, x2), x2
x2, x1 = x2 - f(x2)/fp(x1, x2), x2
x2, x1 = x2 - f(x2)/fp(x1, x2), x2

#print(x2)

x2,x1 =  0.5, 1
f(x) = x^5 + x - 1
fp(x) = 5x^4 + 1


x2, x1 = x2 - f(x2)/fp(x1, x2), x2
x2, x1 = x2 - f(x2)/fp(x1, x2), x2
x2, x1 = x2 - f(x2)/fp(x1, x2), x2
x2, x1 = x2 - f(x2)/fp(x1, x2), x2
x2, x1 = x2 - f(x2)/fp(x1, x2), x2
x2, x1 = x2 - f(x2)/fp(x1, x2), x2
x2, x1 = x2 - f(x2)/fp(x1, x2), x2

#print(x2)


#8.5

f(x) = exp(x) - x^4
#plot(f,-5,9)

r1 = find_zero(f,9)
r2 = find_zero(f,2)
r3 = find_zero(f,-1)
#print(r1,r2,r3)

f(x) = cos(x^2)^2
#plot(f', -1, 2)

arr = [find_zero(f',x) for x in [0, 1.2, 1.7]]
#print(arr)

f(x) = 4x^4 - 5x^3 +4x^2 - 20x - 6

find_zero(f, 0)

f(x) = x^x -2
#plot(f,0,2)
plot!(zero)

newton(f,1)

f(x) = x^5 - x - 1
#plot(f, -1.5, 1.5)
#print(find_zero(f,1))

f(x) = 5/sin(x) + 8/cos(x) 
#plot(f',-2,2)
#print(find_zero(f',pi/4))

tangent(f, c) = x -> f(c) + f'(c)* (x- c)

f(x) = x^2 - 3x + 5
h(x) = tangent(f, 1)(x) -  tangent(f, 3)(x)

#print(find_zero(h,0))

#8.6

f(x) = sin(x) - x/4
fp(x) = cos(x) -1/4
#newton(f,fp,2pi,verbose = true)
