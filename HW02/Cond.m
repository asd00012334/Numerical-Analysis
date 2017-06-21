function y = Cond(M)
    if(det(M)==0) y=Inf;
    else
        invM = inv(M);
        y = norm(M,Inf)*norm(invM,Inf);
    end
end