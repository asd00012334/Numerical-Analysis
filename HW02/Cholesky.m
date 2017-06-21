function [y,iter] = Cholesky(A, b, w)
    iter = 0;
    siz = size(A);
    n = siz(1);
    L = zeros(siz);
    for i = 1:n,
        for j = 1:i,
            if(i == j)
                L(i,j) = sqrt(A(i,j)-sum(L(i,1:j-1).^2));
                iter = iter+(j-1)*2+1;
            else
                L(i,j) = A(i,j);
                for k = 1:j-1,
                    L(i,j) = L(i,j)-L(i,k)*L(j,k);
                end
                L(i,j) = L(i,j)/L(j,j);
                iter = iter+j;
            end
        end
    end
    L = [L;zeros(siz)];
    y = [];
    for i = 1:n,
        y = [y L(i:i+w,i)];
    end
end