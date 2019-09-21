function [ output_args ] = show_assigned_frames_callback(ax2,link,from,to)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
hold(ax2,'on');

switch link
    case 'LEFT HAND'
        plot(ax2,linspace(from,to,to-from+1),ones(1,to-from+1),'Marker','Square','Color','g');
    case 'RIGHT HAND'
        plot(ax2,linspace(from,to,to-from+1),ones(1,to-from+1)+1,'Marker','Square','Color','g');  
    case 'LEFT LEG'
        plot(ax2,linspace(from,to,to-from+1),ones(1,to-from+1)+2,'Marker','Square','Color','g');
    case 'RIGHT LEG'
        plot(ax2,linspace(from,to,to-from+1),ones(1,to-from+1)+3,'Marker','Square','Color','g');
    case 'NECK PITCH'
        plot(ax2,linspace(from,to,to-from+1),ones(1,to-from+1)+4,'Marker','Square','Color','g');
    case 'NECK YAW'
        plot(ax2,linspace(from,to,to-from+1),ones(1,to-from+1)+5,'Marker','Square','Color','g');
end


end

