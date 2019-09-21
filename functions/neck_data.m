function [ND] = neck_data(from_angle,to_angle,N)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
for i=1:1:N
ND(i)=from_angle+((to_angle-from_angle)*i*(1/N));
end
ND=(ND*pi/180);

