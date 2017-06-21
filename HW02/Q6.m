clear();
Ab = [
    4 -1 0 0 0 0 100
    -1 4 -1 0 0 0 200
    0 -1 4 -1 0 0 200
    0 0 -1 4 -1 0 200
    0 0 0 -1 4 -1 200
    0 0 0 0 -1 4 100
];
% Set Up ---------------------
w=1; % band width
siz = size(Ab);
n = siz(1,1);
A = Ab(:,1:n);
b = Ab(:,n+1);
% Set Up --------------------


[M,factorIter] = Cholesky(A,b,w);
x = b;
for i=1:n,
    x(i,1) = x(i,1)/M(1,i);
    for j=i+1:min(i+w,n),
        x(j,1) = x(j,1)-x(i,1)*M(1+j-i,i);
    end
end

for i=n:-1:1,
    x(i,1) = x(i,1)/M(1,i);
    for j=i-1:-1:max(i-w,1),
        x(j,1) = x(j,1)-x(i,1)*M(1+i-j,j);
    end
end
x