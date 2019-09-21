function [ output_args ] = play_on_nino_callback(hObject,Eventdata)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
set(hObject,'BackgroundColor','g');
global LH_S RH_S LL_S RL_S NY_S NP_S status_text FRAMES
generateHex
set(status_text,'String','PLAYING ON NINO');

N=str2num(get(FRAMES,'String'));

for i=1:1:N
[pos_vec,vel_vec] = SERVO_DATA_T3_1(LL_S{i},RL_S{i},LH_S{i},RH_S{i});
[sync_packet_body{i}] = SERVO_PACKETS_T3_1(pos_vec,vel_vec);
[sync_packet_neckp{i}] = NINO_neck_pitch(int16((NP_S{i}*180/pi)+150)*(1023/300));
[sync_packet_necky{i}] = NINO_neck_yaw(int16((NY_S{i}*180/pi)+150)*(1023/300));
end

s=serial('COM4');
set(s,'baudrate',222222);
fopen(s);
pause(0.5);

[c_packet] = set_hand_compliance(128);
pause(0.1);
fwrite(s,c_packet);
pause(0.1);
% s
% N=40;
for i=1:1:N
    tic
    set(s,'baudrate',222222);
    fwrite(s,sync_packet_body{i});
    pause(0.01);
    set(s,'baudrate',57600);
    fwrite(s,sync_packet_neckp{i});
    pause(0.01);
    set(s,'baudrate',57600);
    fwrite(s,sync_packet_necky{i});
    pause(0.01)
    while(toc<0.01)
    end
    toc
end

fclose(s);
set(hObject,'BackgroundColor',[0.94 0.94 0.94]);
end

