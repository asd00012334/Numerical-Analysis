clear();
B = [
    2.68 3.04 -1.48 -0.53
    2.51 1.48 4.53 0.05
    1.48 0.93 -1.30 1.03
    
];

x=Gauss(B,@round)'

% Below is for problem D
M = [
    2.51 1.48 4.53 0.05
    1.48 0.93 -1.30 1.03
    2.68 3.04 -1.48 -0.53
];
error = M(:,1:3)*x - M(:,4)