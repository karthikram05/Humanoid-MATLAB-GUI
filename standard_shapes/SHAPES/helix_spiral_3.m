function [X, Y, Z] = helix_spiral_3(a,b,NUM,N,CW)
% a height OF spiral %
% b RADIUS OF spiral %
% N IS NUMBER OF SAMPLES %
% CW = 1 POINTS ARE TRAVERSE IN CLOCKWISE DIRECTION %
% CW = 0 POINTS ARE TRAVERSE IN ANTI CLOCKWISE DIRECTION %

XC = [0 0 0]';


if CW == 1
   THETA = NUM*2*pi: -2*NUM*pi/(N): 0 ; 
    
else
   THETA = 0 : NUM*2*pi/N: NUM*2*pi;    
end



xc = XC(1);
yc = XC(2);
zc = XC(3);

X=zeros(1, N);
Y=zeros(1, N);
Z=zeros(1, N);
phi = 0;

% yz plane 
for i = 1:N
X(i)= xc + a*((1/N)*i);
Y(i)= yc + b*((1/N)*i*cos(THETA(i)));
Z(i)= zc + b*((1/N)*i*sin(THETA(i)));  
end
end
