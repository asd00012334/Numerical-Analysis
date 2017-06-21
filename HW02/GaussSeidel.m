function y=GaussSeidel(x,b,invL,U)
    y = invL*(b-U*x);
end