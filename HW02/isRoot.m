function y=isRoot(A,x,b,tolerance)
    i = 1;
    siz = size(A);
    x0 = x;
    x1 = x;
    x0(i,1) = x0(i,1)-tolerance;
    x1(i,1) = x1(i,1)+tolerance;
    y0 = A*x0-b;
    y1= A*x1-b;
    y = true;
    while(i<=siz(1))
        y = y&differSign(y0(i,1), y1(i,1));
        i = i+1;
    end
end

function y=differSign(a,b)
    y = a<=0 & b>=0 | a>=0 & b<=0;
end