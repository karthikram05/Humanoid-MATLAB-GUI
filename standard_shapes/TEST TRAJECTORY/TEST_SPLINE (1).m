clc
clear all
HERMITE_SPLINE  = 1;
MIN_JERK_SPLINE = 1;
BEZIER_SPLINE   = 1;

X1 = [1 1 1];
X2 = [2  7 3];
X3 = [5  5 2];
X4 = [7  9 5];
X5 = [9  7 4];
X6 = [11  10 2];
X7 = [8  8 3];
X8 = [7  5 2];
X9 = [5  3 1];
X10 = [3  3 1];
X11 = [1  1 1];

P = [X1;X2;X3;X4;X5;X6;X7;X8;X9;X10;X11];
[m,n] = size(P);

if HERMITE_SPLINE == 1
[XX,YY,ZZ] = HERMITE_POLY(P)
plot3(XX,YY,ZZ,'b--')
hold on;
end

if MIN_JERK_SPLINE == 1
[XX,YY,ZZ] = MIN_JERK(P)
plot3(XX,YY,ZZ,'g--')
hold on;
end

if BEZIER_SPLINE == 1
[XX,YY,ZZ] = BEZIER_POLY(P)
plot3(XX,YY,ZZ,'-')
hold on;
end

% ploting points %

for i=1:m
plot3(P(i,1),P(i,2),P(i,3),'r*')
hold on
end