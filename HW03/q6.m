x = [-120 -110 -80 -40 -10 30 80 110 120];
y = [7.92 7.98 8.95 10.71 11.70 10.01 8.23 7.86 7.92];
sx = linspace(-120,120,1000);
sy = ppval(csape(x,y,'periodic'),sx);
hold on;
plot(sx,sy);
plot([-100 -60 -20 20 60 100],...
[8.37 9.40 11.39 10.84 8.53 7.89]...
,'o');
hold off;