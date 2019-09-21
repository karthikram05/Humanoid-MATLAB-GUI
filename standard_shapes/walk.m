%function SEQ = walk(N,DIP)

clear all;

SEQ1_ENABLE=1;      
SEQ2_ENABLE=1; 
SEQ3_ENABLE=1;  
SEQ4_ENABLE=1;  
SEQ5_ENABLE=1;
s=0;
COMMS=0;
PLOT=1;
DISP_FRAMES=0;


load('stopsyncpackets.mat');

osc2
generateHex

sig=1;
DIP=20;

COM_POS=[0 0 0];

l1=90.54;
l2=96.70;

hamp=pi/4;
k=80;
N=1;
n=1;


if COMMS==1
s=serial('COM8');
set(s,'baudrate',57600);
fopen(s);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%% 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5555 
x1=0
y1=0
z1=0  


for i=1:1:k/2
    dipa=double(double(DIP)*double(i*2/k));

%	[tl1,tl2,tl3] = hand_ik_test(X1(i),Y1(i),Z1(i),l1,l2,sig);
%	[tr1,tr2,tr3] = hand_ik_test(X1(i),Y1(i),Z1(i),l1,l2,-1);

	TL= AIK_T3_1(0,0,0,90,1,dipa);
	TR= AIK_T3_1(0,0,0,90,1,dipa);

	
%COM trajecotory
x=trajbavgx(i)+(79*(n-1));
y=-5*trajby(i);
if(i<=40)
 z=-1*cos(TL(1,1)*5)*trajtotz(i);
else
 z=-1*cos(TL(1,1)*5)*trajtotz2(i);
end
COM_POS=[x y z];


    LH{i}=[pi/2,pi/2,0];
	RH{i}=[pi/2,pi/2,0];

	LL{i}=[TL(1,1),TL(1,2),TL(1,3),TL(1,4),TL(1,5)];
	RL{i}=[TR(1,1),TR(1,2),TR(1,3),TR(1,4),TR(1,5)];

	SEQ1=[RH;LH;RL;LL];
    
    
    %SEQ1
    if SEQ1_ENABLE==1
    PLOT_AND_WRITE_NINO(s,SEQ1,DIP,COM_POS,x1,y1,z1,DISP_FRAMES,COMMS,PLOT,i) 
    pause(0.02);
    end
   
%	pos_vec=(double(pos_vec)*double((2*pi/4096.0))-double(pi));
%   pvecDIP{i}=[pos_vec,pi/2,pi/2,pi/2,pi/2,0,0];
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%5 2%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:1:k/2

%	[tl1,tl2,tl3] = hand_ik_test(X1(i),Y1(i),Z1(i),l1,l2,sig);
%	[tr1,tr2,tr3] = hand_ik_test(X1(i),Y1(i),Z1(i),l1,l2,-1);

	TL= AIK_T3_1(0,0,0,90,1,DIP);
	TR= AIK_T3_1(0,0,0,90,1,DIP);

    
%COM trajecotory
x=trajbavgx(i)+(79*(n-1));
y=-5*trajby(i);
if(i<=40)
 z=-1*cos(TL(1,1)*5)*trajtotz(i);
else
 z=-1*cos(TL(1,1)*5)*trajtotz2(i);
end
COM_POS=[x y z];


    
	boff=0.0766;
	boffa=boff*(i*2/k);
    
	LH{i}=[pi/2,pi/2,0];
	RH{i}=[pi/2,pi/2,0];

	LL{i}=[TL(1,1),TL(1,2),TL(1,3),TL(1,4)+boffa,TL(1,5)];
	RL{i}=[TR(1,1),TR(1,2),TR(1,3),TR(1,4)-boffa,TR(1,5)];

	SEQ2=[RH;LH;RL;LL];
    
    if SEQ2_ENABLE==1
    PLOT_AND_WRITE_NINO(s,SEQ2,DIP,COM_POS,x1,y1,z1,DISP_FRAMES,COMMS,PLOT,i) 
    pause(0.02);
    end
    
%	pos_vec=(double(pos_vec)*double((2*pi/4096.0))-double(pi));
%   pvecDIP{i}=[pos_vec,pi/2,pi/2,pi/2,pi/2,0,0];



end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:1:3*k/4
    
     if(i<k/4)
        TL = AIK_T3_1(0,0.8*trajtoty(1,i+k/2),0,90,1,DIP);
        TR = AIK_T3_1(0,0.8*trajtoty2(1,i+k/2),0,90,1,DIP);
    elseif(i>=k/4 && i<k/2)
        TL = AIK_T3_1(0,1*trajtoty(1,3*k/4),trajtotz(1,i+k/4),90,1,DIP);
        TR = AIK_T3_1(0,1*trajtoty2(1,3*k/4),trajtotz2(1,i+k/4),90,1,DIP);
    elseif(i>=k/2 && i<3*k/4)
        TL = AIK_T3_1(trajtotx(1,i+k/4),trajtoty(1,i+k/4),trajtotz(1,i+k/4),90,1,DIP);
        TR = AIK_T3_1(trajtotx2(1,i+k/4),trajtoty2(1,i+k/4),trajtotz2(1,i+k/4),90,1,DIP);
    end
    
    boff=0.0766;

	LH{i}=[pi/2,pi/2,0];
	RH{i}=[pi/2,pi/2,0];

	LL{i}=[TL(1,1),TL(1,2),TL(1,3),TL(1,4) + boff,TL(1,5)];
	RL{i}=[TR(1,1),TR(1,2),TR(1,3),TR(1,4) - boff ,TR(1,5)];

	SEQ3=[RH;LH;RL;LL];

    COM_POS = [0 0 0];
    if SEQ3_ENABLE==1
    PLOT_AND_WRITE_NINO(s,SEQ3,DIP,COM_POS ,x1,y1,z1,DISP_FRAMES,COMMS,PLOT,i) 
    pause(0.02);
    end
end
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 4 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55
for i=1:1:k
    
    TL = AIK_T3_1(trajtotx(1,i),trajtoty(1,i),trajtotz(1,i),90,1,DIP);
    TR = AIK_T3_1(trajtotx2(1,i),trajtoty2(1,i),trajtotz2(1,i),90,1,DIP);
    
x=trajbavgx(i)+(79*(n-1));
y=-5*trajby(i);
if(i<=40)
 z=-1*cos(TL(1,1)*5)*trajtotz(i);
else
 z=-1*cos(TL(1,1)*5)*trajtotz2(i);
end
COM_POS=[x y z];

    
    
    boff=0.0766;
    
    m11=hamp*sind((i*360.0/k)+180);
    m12=hamp*sind((i*360.0/k));

	LH{i}=[pi/2 + m11 ,pi/2,0];
	RH{i}=[pi/2 + m12 ,pi/2,0];

	LL{i}=[TL(1,1),TL(1,2),TL(1,3),TL(1,4)+boff,TL(1,5)];
	RL{i}=[TR(1,1),TR(1,2),TR(1,3),TR(1,4)-boff,TR(1,5)];

	SEQ4=[RH;LH;RL;LL];
   
    if SEQ4_ENABLE==1
    PLOT_AND_WRITE_NINO(s,SEQ4,DIP,COM_POS,x1,y1,z1,DISP_FRAMES,COMMS,PLOT,i) 
    pause(0.02);
    end
    
end

%%%%%%%%%%%%%%%%%%%%%% 5 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:1:k/2
    
    if(i<=k/4)
        TL = AIK_T3_1(trajtotx(1,i),trajtoty(1,i),trajtotz(1,i),90,1,DIP);
        TR = AIK_T3_1(trajtotx2(1,i),trajtoty2(1,i),trajtotz2(1,i),90,1,DIP);
    elseif(i>=k/4)
        TL = AIK_T3_1(0,trajtoty(1,i),trajtotz(1,i),90,1,DIP);
        TR = AIK_T3_1(0,trajtoty2(1,i),trajtotz2(1,i),90,1,DIP);
    end
    
%	pos_vec_prev=pos_vec;
	boff=0.0766;
	
	LH{i}=[pi/2,pi/2,0];
	RH{i}=[pi/2,pi/2,0];

	LL{i}=[TL(1,1),TL(1,2),TL(1,3),TL(1,4)+boff,TL(1,5)];
	RL{i}=[TR(1,1),TR(1,2),TR(1,3),TR(1,4)-boff,TR(1,5)];

	SEQ5=[RH;LH;RL;LL];
    
    if SEQ5_ENABLE==1
    PLOT_AND_WRITE_NINO(s,SEQ5,DIP,COM_POS,x1,y1,z1,DISP_FRAMES,COMMS,PLOT,i) 
    pause(0.02);
    end
    
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% if COMMS==1
% s=serial('COM8');
% set(s,'baudrate',57600);
% fopen(s);
% end
% 
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% %SEQ1
% if SEQ1_ENABLE==1
% for i=1:1:k/2
% PLOT_AND_WRITE_NINO(s,SEQ1,DIP,COM_POS,x1,y1,z1,DISP_FRAMES,COMMS,PLOT,i) 
% pause(0.02);
% end
% end
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% %SEQ2
% if SEQ2_ENABLE==1
% for i=1:1:k/2
% PLOT_AND_WRITE_NINO(s,SEQ2,DIP,COM_POS,x1,y1,z1,DISP_FRAMES,COMMS,PLOT,i) 
% pause(0.02);
% end
% end
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% %SEQ3
% if SEQ3_ENABLE==1
% for i=1:1:3*k/4
% PLOT_AND_WRITE_NINO(s,SEQ3,DIP,COM_POS,x1,y1,z1,DISP_FRAMES,COMMS,PLOT,i) 
% pause(0.02);
% end
% end
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% %SEQ4
% if SEQ4_ENABLE==1
% for i=1:1:k
% PLOT_AND_WRITE_NINO(s,SEQ4,DIP,COM_POS,x1,y1,z1,DISP_FRAMES,COMMS,PLOT,i) 
% pause(0.02);
% end
% end
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% %SEQ5
% if SEQ5_ENABLE==1
% for i=1:1:k/2
% PLOT_AND_WRITE_NINO(s,SEQ5,DIP,COM_POS,x1,y1,z1,DISP_FRAMES,COMMS,PLOT,i) 
% pause(0.02);
% end
%end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if COMMS==1
fclose(s);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%