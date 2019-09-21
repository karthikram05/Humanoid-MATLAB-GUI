function [] = play_on_matlab_callback(hObject,Eventdata)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
global LH_S RH_S LL_S RL_S NY_S NP_S status_text plot_az plot_el ax DISP_PATH link_color

link_color = 'k';

COM_POS=[0 0 0];
DIP=0;
DISP_FRAMES=0;

fprintf('HI')

if get(DISP_PATH,'Value')==1
 for i=1:h
 [f00,f01,f02,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,f19,f20,fle,fre] = FK_T3_1(LL_S{i},RL_S{i},LH_S{i},RH_S{i},NY,NP,0,[0 0 0]);  
 LH_P(i,:)=[f14(1,4),f14(2,4),f14(3,4)];
 RH_P(i,:)=[f18(1,4),f18(2,4),f18(3,4)];
 LL_P(i,:)=[fle(1,4),fle(2,4),fle(3,4)];
 RL_P(i,:)=[fre(1,4),fre(2,4),fre(3,4)];
 end
end

% cla(ax)
% view(plot_az,plot_el);

if length(LH_S)>1
    
    for i=1:length(LH_S)
    [f00,f01,f02,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,f19,f20,fle,fre] = FK_T3_1(LL_S{i},RL_S{i},LH_S{i},RH_S{i},NY_S{i},NP_S{i},DIP,COM_POS);
    PLOT_T3_1(f00,f01,f02,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,f19,f20,fle,fre,DISP_FRAMES,1); 
    if get(DISP_PATH,'Value')==1
             hold on;
             plot3(LH_P(:,1),LH_P(:,2),LH_P(:,3));
             plot3(RH_P(:,1),RH_P(:,2),RH_P(:,3));
             plot3(LL_P(:,1),LL_P(:,2),LL_P(:,3));
             plot3(RL_P(:,1),RL_P(:,2),RL_P(:,3));
             hold off;
    end
  
    pause(0.0001);
    end
 
else
    set(status_text,'String','NO FRAMES AVAILABEL','Position',[0.05,0.0,0.13,0.02],'Backgroundcolor','w');
end

end

