clear();
Ab = [
    4 -1 0 0 0 0 100
    -1 4 -1 0 0 0 200
    0 -1 4 -1 0 0 200
    0 0 -1 4 -1 0 200
    0 0 0 -1 4 -1 200
    0 0 0 0 -1 4 100
];
A = Ab(:,1:6);
b = Ab(:,7);
n=6;
[M,factorIter] = Cholesky(A,b,1);
factorIter
x = b;

for i=1:n-1,
    x(i,1) = x(i,1)/M(1,i);
    x(i+1,1) = x(i+1,1)-x(i,1)*M(2,i);
end
x(n,1) = x(n,1)/M(1,n);

for i=n:-1:2,
    x(i,1) = x(i,1)/M(1,i);
    x(i-1,1) = x(i-1,1)-x(i,1)*M(2,i-1);
end
x(1,1) = x(1,1)/M(1,1);
subIter = 6*n-4
x