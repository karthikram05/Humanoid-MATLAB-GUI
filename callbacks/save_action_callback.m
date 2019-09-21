function [ output_args ] = save_action_callback(hObject,Eventdata)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

global LH_S RH_S LL_S RL_S NY_S NP_S FRAMES 

N=str2num(get(FRAMES,'String'));
nFrames=N;
%PRE-ALLOCATING 50 FRAMES
for i=1:50
 mpos(i,:) = zeros(1,18);
 fTime(i,:) = zeros(1,3);
end

%fTIME
%fTime(1,:) = [0 1 0];
for i=1:N
 fTime(i,:) = [0.050*(i-1) 0.050 0];
end

%EXTRACT DATA FROM SAVED CELLS
for i=1:N
[pos,~] = SERVO_DATA_T3_1(LL_S{i},RL_S{i},LH_S{i},RH_S{i});
mpos(i,:) = [pos,0,0];
mpos(i,17) = int16((NY_S{i}*(180/pi)*(1023/300))+512);
mpos(i,18) = int16((NP_S{i}*(180/pi)*(1023/300))+512);
end

% mpos(1,:)=    [2048 2048 2048 2048 2048 2048 2048 2048 1792 2304 820 206 820 206 512 512 512 512];
% mpos(N+2,:) = [2048 2048 2048 2048 2048 2048 2048 2048 1792 2304 820 206 820 206 512 512 512 512];

prompt='Name of file:';
position = [.5 .5 .25 .2];
name='Save File name';
filename=ppdlg(prompt,name,position);
dir = strcat('C:\Users\karthik\Google Drive\T3.1_NINO\NINO_IK_GUI\actions\',filename);
currentFrame=1;
actionTitle=filename;
save(dir,'mpos','fTime','nFrames','currentFrame','actionTitle');

clear mpos
end

