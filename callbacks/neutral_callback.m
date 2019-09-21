function [ output_args ] = neutral_callback(hObject,Eventdata)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
generateHex
set(hObject,'BackgroundColor','r');
%Neutral pose
LL=[0 0 0 0 0];
RL=[0 0 0 0 0];
LH=[0 0 0];
RH=[0 0 0];

pos_vec =  [2048 2048 2048 2048 2048 2048 2048 2048 2048 2048 820 206 820 206 512 512];
v=60;
vel_vec=[v v v v v v v v v v v v v v v v];

[sync_packet_body] = SERVO_PACKETS_T3_1(pos_vec,vel_vec);
[sync_packet_neckp] = NINO_neck_pitch(512);
[sync_packet_necky] = NINO_neck_yaw(512);

s=serial('COM4');
set(s,'baudrate',222222);
fopen(s);
pause(0.5);

   set(s,'baudrate',222222);
    fwrite(s,sync_packet_body);
    pause(0.02);
    set(s,'baudrate',57600);
    fwrite(s,sync_packet_neckp);
    pause(0.01);
    set(s,'baudrate',57600);
    fwrite(s,sync_packet_necky);
    pause(0.01)

fclose(s);
pause(1.5);
set(hObject,'BackgroundColor',[0.94 0.94 0.94]);
end

