function y = newton(x, fn,xn,h)
    n = size(fn);
    n = n(2);
    y = 0;
    for dif = 0:n-1,
        mul = 1;
        for i=1:dif,
            mul = mul * (x-xn(i))/h;
        end
        mul = mul * fn(dif+1)/ factorial(dif);
        y = y + mul;
    end
end