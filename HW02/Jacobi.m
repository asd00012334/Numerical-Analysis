function y = Jacobi(x, b, L, invD, U)
    y = invD * (b-(L+U)*x);
end