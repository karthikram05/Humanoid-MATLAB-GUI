function [] = clear_frames_callback(hObject,Eventdata,ax2)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
global status_text FRAMES plot_az plot_el link_color

set(status_text,'String','ALL FRAMES CLEARED','Position',[0.05,0.0,0.13,0.02],'Backgroundcolor','w');
set(FRAMES,'String','0');

clearvars -global LH_S RH_S LL_S RL_S NY_S NP_S 

link_color = 'kkkkkkkkkkkkkkkkkk'; 

cla(ax2);
%NINO DEFAULT STATE PLOT          
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
view(74,26);
end

