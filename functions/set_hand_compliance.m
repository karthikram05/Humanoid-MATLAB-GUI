function [c_packet] = set_hand_compliance(C)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
c_sum=6*(2*C);
crc=254+19+131+28+2+c_sum+81;
crc=255-bitand(crc,255);
c_packet=[255,255,254,19,131,28,2,11,C,C,12,C,C,13,C,C,14,C,C,15,C,C,16,C,C,crc];

end

