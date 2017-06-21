tolerance=1e-6;
x=[0 1]';
invJ=inline('1/4/(x(1,1)^2+x(2,1)^2)*[x(1,1) x(2,1);-x(2,1) x(1,1)]','x');
f=inline('[x(1,1)^2-x(2,1)^2;2*x(1,1)*x(2,1)-1]','x');
g=inline('x-invJ(x)*f(x)','x','invJ','f');
iterCnt=0;
while(1)
    iterCnt=iterCnt+1;
    x=g(x,invJ,f);
    sprintf('%dth Iteration: %0.6f %0.6f', iterCnt, x(1,1), x(2, 1))
    lower=f([x(1,1)-tolerance;x(2,1)]);
    upper=f([x(1,1)+tolerance;x(2,1)]);
    if(lower(1,1)*upper(1,1)<0 || lower(2,1)*upper(2,1)<0)
        break;
    end
end
sprintf('Total Iteration: %d\nFinal Result: %0.6f %0.6f', iterCnt, x(1,1), x(2, 1))