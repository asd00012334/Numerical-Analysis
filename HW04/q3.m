clear all;
f = @(x) sin(x)./x;
ref = integral(f,0,2);
fprintf('ref: %.10f\n',ref);
clear f;

% Gaussian Quadrature
t = roots([35 0 -30 0 3]/8);
A = [t.^0';t';t.^2';t.^3'];
w = inv(A)*[2;0;2/3;0];
f = sin(t+1)./(t+1);
integral = sum(w.*f);
clear f t w A;

%Simpson's Rule
n = 17;
h = 2/(2*n);
x = [0:h:2];
y = sin(x)./x;
y(1) = 1;
simpson = 0;
for i=1:2:n*2,
    simpson=simpson+y(i)+4*y(i+1)+y(i+2);
end
simpson=simpson/3*h;
clear n h x y;
fprintf('aprox Gaussian: %.10f\n',integral);
fprintf('error Gaussian: %.10f\n',integral-ref);
fprintf('aprox Simpson: %.10f\n',simpson);
fprintf('error Simpson: %.10f\n',simpson-ref);
fprintf('\n');