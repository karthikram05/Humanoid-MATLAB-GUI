function [X, Y, Z] = helix_3(a,b,NUM,N,CW)

% radius RADIUS OF spiral %
% N IS NUMBER OF SAMPLES %
% CW = 1 POINTS ARE TRAVERSE IN CLOCKWISE DIRECTION %
% CW = 0 POINTS ARE TRAVERSE IN ANTI CLOCKWISE DIRECTION %

XC = [0 0 0]';


if CW == 1
   THETA = NUM*2*pi: -2*NUM*pi/(N): 2*pi/(N);
    
else
   THETA = 2*pi/(N) : NUM*2*pi/N: NUM*2*pi;    
end



xc = XC(1);
yc = XC(2);
zc = XC(3);

X=zeros(1, N);
Y=zeros(1, N);
Z=zeros(1, N);



% yz plane 
for i = 1:N
X(i)= xc + a*((1/N)*i);
Y(i)= yc + b*(cos(THETA(i)));
Z(i)= zc + b*(sin(THETA(i)));  
end
end
