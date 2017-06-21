clear();
A = [
    1e10 0
    0 1e-10
];

B = [
    1e10 0
    0 1e10
];

C = [
    1e-10 0
    0 1e-10
];

D = [
    1 2
    2 4
];


condA=Cond(A)

condB=Cond(B)

condC=Cond(C)

condD=Cond(D)