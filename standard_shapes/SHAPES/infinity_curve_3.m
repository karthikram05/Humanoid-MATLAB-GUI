function [X, Y, Z] = infinity_curve_3(radius,N,CW)

% radius : RADIUS OF MINOR AXIS %
% N IS NUMBER OF SAMPLES %
% CW = 1 POINTS ARE TRAVERSE IN CLOCKWISE DIRECTION %
% CW = 0 POINTS ARE TRAVERSE IN ANTI CLOCKWISE DIRECTION %

XC = [0 0 0]'; 

if CW == 1
   THETA = 2*pi: -2*pi/(N-1): 0;    
    
else
   THETA = 0 : 2*pi/(N-1): 2*pi;    
end

xc = XC(1);
yc = XC(2);
zc = XC(3);
X=zeros(1, N);
Y=zeros(1, N);
Z=zeros(1, N);

phi =90;

% Draw ellipse in yz plane % 
 a = 0 ;
 c = radius;
 
for i = 1:N-1
X(i)= xc + a * sin(THETA(i));
Y(i) = yc + c * sin(THETA(i));
Z(i)= zc + c * sin(2*THETA(i));  
end
