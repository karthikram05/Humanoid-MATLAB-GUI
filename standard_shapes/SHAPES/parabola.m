function [X , Y, Z] = parabola(y,z,N,CW)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

if CW == 1
   YP = -y/2:(y)/N:y/2;
   ZP = (YP.^2)*(z/y);
else 
   YP = y/2:(y)/N:-y/2;
   ZP = (YP.^2)*(z/y);    
end

X=zeros(1, N);

for i=1:N
   Y(i)=YP(i);
   Z(i)=ZP(i);
end
end

