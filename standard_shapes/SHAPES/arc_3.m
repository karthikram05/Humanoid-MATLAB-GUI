function [X, Y, Z] = arc_3(A,radius,N,CW)

% radius RADIUS OF CIRCLE %
% N IS NUMBER OF SAMPLES %
% CW = 1 POINTS ARE TRAVERSE IN CLOCKWISE DIRECTION %
% CW = 0 POINTS ARE TRAVERSE IN ANTI CLOCKWISE DIRECTION %


if CW == 1
   THETA =(A*pi/180): -(A*pi/180)/N: 0;     
else 
   THETA = 0 : (A*pi/180)/N: (A*pi/180);    
end

X=zeros(1, N);
Y=zeros(1, N);
Z=zeros(1, N);


% yz plane 

 b = radius;
 c = radius;

for i = 1:N
Y(i)=  radius * cos(THETA(i));
Z(i)=  radius * sin(THETA(i));  
end
