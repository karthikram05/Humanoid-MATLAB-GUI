function [] = vrepplay(hObeject,EventData)
global LH_S RH_S LL_S RL_S NY_S NP_S FRAMES
 
N=str2num(get(FRAMES,'String'));
nFrames=N;

%PRE-ALLOCATING 50 FRAMES
for i=1:50
 mpos(i,:) = zeros(1,18);
 fTime(i,:) = zeros(1,3);
end

%fTIME
for i=1:N
 fTime(i,:) = [0.050*(i-1)+0.15*(i-1) 0.050 0.150];
end

%EXTRACT DATA FROM SAVED CELLS
for i=1:N
[pos,~] = SERVO_DATA_T3_1(LL_S{i},RL_S{i},LH_S{i},RH_S{i});
mpos(i,:) = [pos,0,0];
mpos(i,17) = (NY_S{i}*(180/pi)*(1023/300))+512;
mpos(i,18) = (NP_S{i}*(180/pi)*(1023/300))+512;
end



    %vrep comms
    EnterLog([datestr(datetime('now')),'  ','STATUS : OK : Clicked on "Play action on VREP" button' ]);
    vrep=remApi('remoteApi'); % using the prototype file (remoteApiProto.m)
    vrep.simxFinish(-1); % just in case, close all opened connections
    clientID=vrep.simxStart('127.0.0.1',19997,true,true,5000,5);
    loadStatus=vrep.simxLoadScene(clientID,[pwd,'\VREPFiles\ninot1.ttt'],'1',vrep.simx_opmode_blocking);
    
    %settings
    dmt=[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];
    pos_offset=[0,0,0,0,0,0,0,0,256,-256,0,0,0,0,0,0];
    
    [hexH,hexL]=generateHex();
    
    if (clientID>-1)
        disp('Connected to remote API server');
        
        % enable the synchronous mode on the client:
        vrep.simxSynchronous(clientID,true);
        
        % start the simulation:
        vrep.simxStartSimulation(clientID,vrep.simx_opmode_blocking);
        
        for i=1:16
            [returnCode,jointHandles(i)]=vrep.simxGetObjectHandle(clientID,['R_Joint',num2str(i)],vrep.simx_opmode_blocking);
        end
        
 
        if(nFrames>0)
            
            totTime=0;
            for i=1:nFrames
                totTime=totTime+fTime(i,2)+fTime(i,3);
            end
            %totTime = total time of simulation
            %set(statustxt,'String','STATUS : Playing Action','ForegroundColor','g');
            %drawnow;
            
            %converiting data to radians
            pos_vec=mpos(1,1:16);
            pos_vec=pos_vec+pos_offset;
            pos_vec(1:10)=(double(pos_vec(1:10))*double((2*pi/4096.0)));
            pos_vec(11:16)=(double(pos_vec(11:16))*double((2*pi*300.0/(1023.0*360.0))));
            
            vrep.simxPauseCommunication(clientID,1);
            
            %first frame
            for j=1:16
                vrep.simxSetJointTargetPosition(clientID,jointHandles(j),dmt(j)*pos_vec(j),vrep.simx_opmode_oneshot);
            end
            
            vrep.simxPauseCommunication(clientID,0);
            vrep.simxSynchronousTrigger(clientID);
            
            %pause for first frame
            pause(fTime(1,2)+fTime(1,3));
            
            %start from 2nd frame
            if(nFrames>1)
                for i=2:nFrames
                    
                    totInFrames=fTime(i,2)*100;
                    totInFrames=int16(totInFrames);
                    
                    for df=1:16
                        posdf(1,df)=double((mpos(i,df)-mpos(i-1,df)))/double(totInFrames);
                    end
                    
                    for inFrames=1:totInFrames
                        pos_vec=double(mpos(i-1,1:16))+double(inFrames)*double(posdf(1,1:16));
                        pos_vec=pos_vec+pos_offset;
                        
                        
                        %                                     pos_vec(1:10)=(double(pos_vec(1:10))*double((2*pi/4096.0))-double(pi));
                        %                                     pos_vec(11:16)=(double(pos_vec(11:16))*double((2*pi/1023.0))-double(pi));
                        pos_vec(1:10)=(double(pos_vec(1:10))*double((2*pi/4096.0)));
                        pos_vec(11:16)=(double(pos_vec(11:16))*double((2*pi*300.0/(1023.0*360.0))));
                        vrep.simxPauseCommunication(clientID,1);
                        for j=1:16
                            vrep.simxSetJointTargetPosition(clientID,jointHandles(j),dmt(j)*pos_vec(j),vrep.simx_opmode_oneshot);
                        end
                        vrep.simxPauseCommunication(clientID,0);
                        vrep.simxSynchronousTrigger(clientID);
                    end
                    pause(fTime(i,3));
                end
            end
            set(statustxt,'String','STATUS : Finished Playing Action','ForegroundColor','g');
        else
            set(statustxt,'String','STATUS : Error - No Frames loaded','ForegroundColor','r');
        end
        vrep.simxStopSimulation(clientID,vrep.simx_opmode_blocking);
        
        % Now close the connection to V-REP:
        loadStatus=vrep.simxLoadScene(clientID,[pwd,'\VREPFiles\ninor1.ttt'],'1',vrep.simx_opmode_blocking);
        vrep.simxFinish(clientID);
    else
        disp('Failed connecting to remote API server');
    end
    vrep.delete(); % call the destructor!
    
    
    