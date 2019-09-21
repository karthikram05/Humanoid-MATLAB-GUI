function [ output_args ] = assign_frames_callback(hObject,Eventdata,ax2)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
global LH_S RH_S LL_S RL_S NY_S NP_S 

N=str2num(hObject.String);

for i=1:N
    LH_S{i}=[0,0,0]; 
    RH_S{i}=[0,0,0]; 
    LL_S{i}=[0,0,0,0,0]; 
    RL_S{i}=[0,0,0,0,0];
    NY_S{i}=[0]; 
    NP_S{i}=[0];
end


hold(ax2,'on');
plot(ax2,linspace(1,N,N),ones(1,N),'Marker','Square','Color','k');
plot(ax2,linspace(1,N,N),ones(1,N)+1,'Marker','Square','Color','k');
plot(ax2,linspace(1,N,N),ones(1,N)+2,'Marker','Square','Color','k');
plot(ax2,linspace(1,N,N),ones(1,N)+3,'Marker','Square','Color','k');
plot(ax2,linspace(1,N,N),ones(1,N)+4,'Marker','Square','Color','k');
plot(ax2,linspace(1,N,N),ones(1,N)+5,'Marker','Square','Color','k');
ax2.YLim =[0,7];
ax2.XLim =[1,N];

set(ax2, 'XColor', [1 1 1]);
set(ax2, 'YColor', [1 1 1]);
hold(ax2,'off');
end

