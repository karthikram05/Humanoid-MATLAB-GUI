function [t1,t2,t3,t4,t5] = IK_5_DOF(x,y,z,phi,sig,mode)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here


%pitch link lengths
l1=1;
l2=1;
l3=1;

if mode==1
t5=(-1)*atan2(y,z);
t1=-t5;
z=z-1;    %pitch angles z compensation
 


x1 = x-l3*cos((phi*pi)/180);
z1 = z-l3*sin((phi*pi)/180)+(sqrt((z^2)+((y)^2))-z); %projection compensation

z2 =  -(z1)/sqrt((x1^2)+(z1^2));
x2 =  -(x1)/sqrt((x1^2)+(z1^2));


t2 = atan2(z2,x2)+ sig*acos(-((x1^2)+(z1^2)+(l1^2)-(l2^2))/((2*l1)*(sqrt((x1^2)+(z1^2)))));

z3 = (z1-l1*sin(t2))/l2;
x3 = (x1-l1*cos(t2))/l2;

t3 = atan2(z3,x3)-t2;

t4 =(phi*(pi/180))-(t2+t3);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if mode==2
    
x=-x;
y=-y;
t1=atan2(y,z);
t5=-t1;


z=z+((sqrt((z^2)+((y)^2))-z-1));

x1 = x-l3*cos((phi*pi)/180);
z1 = z-l3*sin((phi*pi)/180);

z2 =  -(z1)/sqrt((x1^2)+(z1^2));
x2 =  -(x1)/sqrt((x1^2)+(z1^2));


t2 = atan2(z2,x2)+ sig*acos(-((x1^2)+(z1^2)+(l1^2)-(l2^2))/((2*l1)*(sqrt((x1^2)+(z1^2)))));

z3 = (z1-l1*sin(t2))/l2;
x3 = (x1-l1*cos(t2))/l2;

t3 = atan2(z3,x3)-t2;

t4 =(phi*(pi/180))-(t2+t3);
end


end

