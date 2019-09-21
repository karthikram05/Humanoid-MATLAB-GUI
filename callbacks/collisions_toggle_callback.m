function [ output_args ] = collisions_toggle_callback(hObject,Eventdata)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
global COLISN plot_az plot_el link_color

if get(COLISN,'Value')==1
set(COLISN,'Backgroundcolor','c');
else
    set(COLISN,'Backgroundcolor','w');
end

link_color = 'kkkkkkkkkkkkkkkkkkkk';
LL=[0 0 0 0 0];
RL=[0 0 0 0 0];
LH=[0 0 0];
RH=[0 0 0];
COM_POS=[0 0 0];
DIP=0;
DISP_FRAMES=1;
NY=0;
NP=0;
[f00,f01,f02,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,f19,f20,fle,fre] = FK_T3_1(LL,RL,LH,RH,NY,NP,DIP,COM_POS);
PLOT_T3_1(f00,f01,f02,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,f19,f20,fle,fre,DISP_FRAMES,1);    
%setting to default view
view([plot_az,plot_el]); 

set(gca, 'XColor', [1 1 1]);
set(gca, 'YColor', [1 1 1]);
set(gca, 'ZColor', [1 1 1]);

end

