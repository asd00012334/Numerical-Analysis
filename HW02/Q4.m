clear();
A = [
    4.63 -1.21 3.22
    -3.07 5.48 2.11
    1.26 3.11 4.57
];
b = [2.22;-3.17;5.11];
[L,D,U] = factorLDU(A);
L = L+D;
clear D;
invL = inv(L);
x = [0;0;0];
tolerance = 1e-6;
iteration = 0;
relax = 1.74;
while(1)
    iteration = iteration+1;
    x = x+relax*(GaussSeidel(x,b,invL,U)-x);
    if(isRoot(A,x,b,tolerance))
        break;
    end
end
iteration
sprintf('%.6f ',x)