function [L,D,U] = factorLDU(M)
    siz = size(M);
    L = zeros(siz);
    D = zeros(siz);
    U = zeros(siz);
    i = 1;
    while(i<=siz(1,1))
       j=1;
       while(j<=siz(1,2))
          if(i==j)
              D(i,j)=M(i,j);
          elseif(i>j)
              L(i,j)=M(i,j);
          else
              U(i,j)=M(i,j);
          end
          j = j+1;
       end
       i = i+1;
    end
    
end