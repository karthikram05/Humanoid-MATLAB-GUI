function [ output_args ] = joint_velocity_check(EventData,Hobject)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
global LH_S RH_S RL_S LL_S 

frames=length(LH_S)

for i=1:1:frames
    LH(i,:) = LH_S{i}*(180/pi)*(1023/300);  
    RH(i,:) = RH_S{i}*(180/pi)*(1023/300);
    LL(i,:) = LL_S{i}*(180/pi)*(4096/360);
    RL(i,:) = RL_S{i}*(180/pi)*(4096/360);
end

LH_V=abs(diff(LH)/0.05);
RH_V=abs(diff(RH)/0.05);
LL_V=abs(diff(LL)/0.05);
RL_V=abs(diff(RL)/0.05);



end

