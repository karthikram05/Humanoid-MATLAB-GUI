function [ output_args ] = load_action_callback(hObject,Eventdata)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

clearvars -global LH_S RH_S LL_S RL_S NY_S NP_S 

global FRAMES NF

prompt='Name of file:';
position = [.5 .5 .25 .2];
name='Load File';
filename=loadaction_pop_up(prompt,name,position);

load(strcat('C:\Users\karthik\Google Drive\T3.1_NINO\NINO_IK_GUI\actions\',filename));

LEG = (mpos(:,1:10)*((360/4096)*(pi/180)))-pi;
HAND = mpos(:,11:16)*(300/1023)*(pi/180);
NECK_Y = (mpos(:,17)-512)*(300/1023)*(pi/180);
NECK_P = (mpos(:,18)-512)*(300/1023)*(pi/180);

LL_L = [LEG(:,1),LEG(:,3),LEG(:,5),LEG(:,7),LEG(:,9)];
RL_L = [LEG(:,2),LEG(:,4),LEG(:,6),LEG(:,8),LEG(:,10)];

LH_L = [HAND(:,1)-4.1970,HAND(:,3)-4.1970,HAND(:,5)-2.6206];
RH_L = [HAND(:,2)-1.0544,HAND(:,4)-1.0544,HAND(:,6)-2.6206];

global LH_S RH_S LL_S RL_S NY_S NP_S

direction_left_leg=[-1,-1,-1,-1,-1];
direction_right_leg=[-1,1,1,1,-1];
direction_left_hand=[1,-1,-1];
direction_right_hand=[-1,-1,-1];

for i=1:nFrames
 LH_S{i} = LH_L(i,:)./direction_left_hand; 
 RH_S{i} = RH_L(i,:)./direction_right_hand;
 LL_S{i} = LL_L(i,:)./direction_left_leg;
 RL_S{i} = RL_L(i,:)./direction_right_leg;
 NY_S{i} = NECK_Y(i);
 NP_S{i} = NECK_P(i);
end

NF = nFrames;
set(FRAMES,'String',nFrames);
end

