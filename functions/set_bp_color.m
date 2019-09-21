function [ output_args ] = set_bp_color(link,bp)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

if strcmp(link,'LEFT HAND')
 set(bp(1),'Backgroundcolor','g');
else
 set(bp(1),'Backgroundcolor','w');   
end

if strcmp(link,'RIGHT HAND')
 set(bp(2),'Backgroundcolor','g');
else
 set(bp(2),'Backgroundcolor','w');
end

if strcmp(link,'LEFT LEG')
set(bp(3),'Backgroundcolor','g');
else
 set(bp(3),'Backgroundcolor','w');
end

if strcmp(link,'RIGHT LEG')
 set(bp(4),'Backgroundcolor','g');
else
 set(bp(4),'Backgroundcolor','w');
end


if strcmp(link,'NECK YAW')
 set(bp(6),'Backgroundcolor','g');
else
 set(bp(6),'Backgroundcolor','w');
end


if strcmp(link,'NECK PITCH')'
 set(bp(7),'Backgroundcolor','g');
else
 set(bp(7),'Backgroundcolor','w');
end


end

