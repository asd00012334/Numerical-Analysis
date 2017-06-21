x = linspace(-1,1,5);
n = size(x);
n = n(2);
y = [];
for i = 1:n,
    if(x(i)<-0.5) y = [y 0];
    elseif(x(i)<0.5) y = [y 1-2*abs(x(i))];
    else y = [y 0];
    end
end
plot(x,y, '-o');
hold on;
sx = linspace(-1,1,1000);
sy = ppval(csape(x,y,'v'),sx);
plot(sx,sy);
hold off;