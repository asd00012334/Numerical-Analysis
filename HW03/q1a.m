x = [-1 3 2 -2 4];
y = [8 0 -1 15 3];
n = size(x);
n = n(1,2);
fprintf('%d ', y);
fprintf('\n');
for length = 2:n
    for start = 1:n-length+1
        y(start) = (y(start+1)-y(start))/(x(start+length-1)-x(start));
    end
    fprintf('%d ', y(1:n-length+1));
    fprintf('\n');
end