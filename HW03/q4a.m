x = [10 50 75 90 105 150 180 190 160 130]
y = [10 15 60 100 140 200 140 120 100 80]
A = [
    -1 3 -3 1
    3 -6 3 0
    -3 3 0 0
    1 0 0 0
];
u = [0:0.01:1]';
v = [u.^3 u.^2 u u.^0];
for i = 1:3,
    curv = v * A * [x(i*3-2:i*3+1)' y(i*3-2:i*3+1)'];
    bx=curv(:,1);
    by=curv(:,2);
    plot(bx,by);
    hold on;
end
hold off;