clear;
f = @(x) (x.^2-1);
kernel = @(x,k) exp((0-1i)*2*pi/3*k*x);
syms x k;
fk = int(f(x).*kernel(x,k),'x',-1,2)*2/3;
F = [];

for k=0:10,
    eval(fk)
end