clear all;
analytical =  (exp(1.4)-exp(-0.2))*(cos(5.2)-cos(0.8))/-2;
fprintf('Analytical: %.10f\n',analytical);
f = @(x,y) exp(x).*sin(2*y);
% Trapezoidal
fx = [];
h = 0.01;
for x=-0.2:h:1.4,
    lis = f(x,[0.4:h:2.6]);
    sliceArea = (sum(lis)*2-lis(1)-lis(end))*h/2;
    fx(end+1) = sliceArea;
end
trape = (sum(fx)*2 - fx(1) - fx(end))*h/2;


fx = [];
h = 0.01;
for y=0.4:h:2.6,
    lis = f([-0.2:h:1.4],y);
    sliceArea = (sum(lis)*2-lis(1)-lis(end))*h/2;
    fx(end+1) = sliceArea;
end
trape2 = (sum(fx)*2 - fx(1) - fx(end))*h/2;


% Simpson's
fx = [];
h = 0.01;
for x=-0.2:h:1.4,
    lis = f(x,[0.4:h:2.6]);
    sliceArea = 0;
    n = 2.2/h;
    for i=0:2:n-1,
        sliceArea=sliceArea+f(x,0.4+i*h)+4*f(x,0.4+(i+1)*h)+f(x,0.4+(i+2)*h);
    end
    fx(end+1) = sliceArea*h/3;
end
simpson = 0;
n = 1.6/h;
for i=1:2:n-1,
    simpson=simpson+fx(i)+4*fx(i+1)+fx(i+2);
end
simpson = simpson*h/3;
fx = [];
h = 0.01;
for y=0.4:h:2.6,
    lis = f(-0.2:h:1.4,y);
    sliceArea = 0;
    n = 1.6/h;
    for i=0:2:n-1,
        sliceArea=sliceArea+f(-0.2+i*h,y)+4*f(-0.2+(i+1)*h,y)+f(-0.2+(i+2)*h,y);
    end
    fx(end+1) = sliceArea*h/3;
end
simpson2 = 0;
n = 2.2/h;
for i=1:2:n-1,
    simpson2=simpson2+fx(i)+4*fx(i+1)+fx(i+2);
end
simpson2 = simpson2*h/3;

% Gauss
t = roots([5 0 -3 0]/2);
nf = @(x,y) 0.8*1.1*f((x+3/4)*0.8,(y+15/11)*1.1);
A = [t.^0';t.^1';t.^2'];
b = [2;0;2/3];
fx = [];
w = A\b;
for xi = 1:3,
    x = t(xi);
    sliceArea = w'*nf(x,t);
    fx(end+1) = sliceArea;
end
gauss = w'*fx';

t = roots([5 0 -3 0]/2);
nf = @(x,y) 0.8*1.1*f((x+3/4)*0.8,(y+15/11)*1.1);
A = [t.^0';t.^1';t.^2'];
b = [2;0;2/3];
fx = [];
w = A\b;
for yi = 1:3,
    y = t(yi);
    sliceArea = w'*nf(t,y);
    fx(end+1) = sliceArea;
end
gauss2 = w'*fx';

fprintf('Trapezoidal: %.10f\n',trape);
fprintf('Trapezoidal Error: %.10f\n',trape-analytical);
fprintf('Trapezoidal2: %.10f\n',trape2);
fprintf('Trapezoidal2 Error: %.10f\n',trape2-analytical);
fprintf('Simpson: %.10f\n',simpson);
fprintf('Simpson Error: %.10f\n',simpson-analytical);
fprintf('Simpson2: %.10f\n',simpson2);
fprintf('Simpson2 Error: %.10f\n',simpson2-analytical);
fprintf('Gaussian: %.10f\n',gauss);
fprintf('Gaussian Error: %.10f\n',gauss-analytical);
fprintf('Gaussian2: %.10f\n',gauss2);
fprintf('Gaussian2 Error: %.10f\n',gauss2-analytical);