% simulation is run from this file

disp('Program started');
    
% Build up remote API for v-rep
vrep=remApi('remoteApi'); % using the prototype file (remoteApiProto.m)
vrep.simxFinish(-1); % just in case, close all opened connections
clientID=vrep.simxStart('127.0.0.1',19997,true,true,5000,5);

if (clientID>-1)
    disp('Connected to remote API server');
    
    % start the simulation:
    vrep.simxStartSimulation(clientID,vrep.simx_opmode_blocking);
    
    % get joint handles
    for j=1:18
        [returnCode,jointHandles(j)]=vrep.simxGetObjectHandle(clientID,['R_Joint',num2str(j)],vrep.simx_opmode_blocking);
    end    
    
    % start reading (to avoid wrong values in the begining)
    for j=1:18
        [err]=vrep.simxGetJointPosition(clientID,jointHandles(j),vrep.simx_opmode_oneshot);
    end
    pause(1);
        
    i=1;
    tic;
    % while connected to vrep
    while vrep.simxGetConnectionId(clientID)~=-1
        for j=1:18
            [err,pos_sim(j,i)]=vrep.simxGetJointPosition(clientID,jointHandles(j),vrep.simx_opmode_oneshot);
        end
        time(1,i)=toc;
        i=i+1;
        if toc>10
            break
        end
    end
    % stop simulation
    vrep.simxStopSimulation(clientID,vrep.simx_opmode_blocking);
            
    % close the connection to V-REP:
    vrep.simxFinish(clientID);
else
    disp('Failed connecting to remote API server');
end

vrep.delete(); % call the destructor!

disp('Program ended');