%SEQ1 BEZIER CURVE       
%SEQ2 CIRCLE
%SEQ3 ELLIPSE
%SEQ4 SQUARE
%SEQ5 RECTANGLE
%SEQ6 TRIANGLE
%SEQ7 TRIANGLE_SCLAE VERSION
%SEQ8 SIN WAVE
%SEQ9 COSINE WAVE
%SEQ10 ABSOLUTE
%SEQ11 SPIRAL
%SEQ12 TAN WAVE
%SEQ13 HELIX
%SEQ14 HELIX SPIRAL 

clear all;
SEQ1_ENABLE=0;      
SEQ2_ENABLE=1; 
SEQ3_ENABLE=1;  
SEQ4_ENABLE=1;  
SEQ5_ENABLE=1;  
SEQ6_ENABLE=1;  
SEQ7_ENABLE=1; 
SEQ8_ENABLE=1;  
SEQ9_ENABLE=1;  
SEQ10_ENABLE=1;  
SEQ11_ENABLE=1; 
SEQ12_ENABLE=1;
SEQ13_ENABLE=1; 
SEQ14_ENABLE=1;
s=0;
generateHex

COMMS=0;
PLOT=1;

PLOT_COLLISION = 0;
DISP_FRAMES=0;
sig=1;
DIP=0;

COM_POS=[0 0 0];

l1=90.54;
l2=96.70;

%SEQ 1 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%wrt body
gamma1_n=80;   
gamma1=0:(1/gamma1_n)*(2*pi):2*pi;
gamma11=0:(1/gamma1_n)*(pi):pi;

XX =[0 50 60  ];
YY = [10 10 10];
% M1 = bezier_4([0 50 60],[10 10 10])
% M2 = bezier_4([10 10 10],[30 -25 -40])
% M3 = bezier_4([30 -25 -40],[10 30 -10])
% M4 = bezier_4([10 30 -10],[0 50 60])

M1 = bezier_3([0 -75 75],[1 75 75])
M2 = bezier_3([1 75 75],[2 75 -75])
M3 = bezier_3([2 75 -75],[1 -75 -75])
M4 = bezier_3([1 -75 -75],[2 -75 75])


MX = [M1; M2; M3; M4];

X1=MX(:,1)+75;
Y1 = MX(:,2);
Z1 = MX(:,3);

x1=MX(:,1)+75;
y1 = MX(:,2)+62+33;
z1 = MX(:,3)+289-64+142.241;



%leg traj
D=5*sin(gamma11);

for i=1:length(gamma1)    
[tl1,tl2,tl3] = hand_ik_test(X1(i),Y1(i),Z1(i),l1,l2,sig);
[tr1,tr2,tr3] = hand_ik_test(X1(i),Y1(i),Z1(i),l1,l2,-1);

TL= AIK_T3_1(0,0,0,90,1,D(i));
TR= AIK_T3_1(0,0,0,90,1,D(i));

LH{i}=[tl1,tl2,tl3];
RH{i}=[tr1,tr2,tr3];
% RL{i}=[0 0 0 0 0];
% LL{i}=[0 0 0 0 0];
LL{i}=[TL(1,1),TL(1,2),TL(1,3),TL(1,4),TL(1,5)];
RL{i}=[TR(1,1),TR(1,2),TR(1,3),TR(1,4),TR(1,5)];

SEQ1=[RH;LH;RL;LL];
end

%SEQ2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 N=40;
 radius = 50 ;
 [X, Y, Z] = circle_3(radius,N,0);

% %wrt body
x2= X + 100
y2= Y + 62+33;
z2= Z + 289-64+142.241;

%wrt to hand
X2 = X +100 ;
Y2 = Y;
Z2 = Z;

for i=1:N       
[tl1,tl2,tl3] = hand_ik_test(X2(i),Y2(i),Z2(i),l1,l2,sig);
[tr1,tr2,tr3] = hand_ik_test(X2(i),-Y2(i),-Z2(i),l1,l2,-1);
RH{i}=[tr1,tr2,tr3];
LH{i}=[tl1,tl2,tl3];
RL{i}=[0 0 0 0 0];
LL{i}=[0 0 0 0 0];
SEQ2=[RH;LH;RL;LL];
end

%SEQ3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 N=40;
 radius_maj = 100 ;
 radius_min = 40 ;
 [X, Y, Z] = ellipse_3(radius_maj,radius_min,N,1)

% %wrt body
x3= X + 100
y3= Y + 62+33;
z3= Z + 289-64+142.241;

%wrt to hand
X3 = X +100 ;
Y3 = Y;
Z3 = Z;

for i=1:N       
[tl1,tl2,tl3] = hand_ik_test(X3(i),Y3(i),Z3(i),l1,l2,sig);
[tr1,tr2,tr3] = hand_ik_test(X3(i),-Y3(i),-Z3(i),l1,l2,-1);
RH{i}=[tr1,tr2,tr3];
LH{i}=[tl1,tl2,tl3];
RL{i}=[0 0 0 0 0];
LL{i}=[0 0 0 0 0];
SEQ3=[RH;LH;RL;LL];
end

%SEQ4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N=40;
 base = 80
 [X, Y, Z] = square_3(base,N,1)

 [XX, YY , ZZ] = Transform_3d(X , Y, Z, N, 0, 0, 0 , [0 0 0],1)
% %wrt body
x4= XX + 100
y4= YY + 62+33;
z4= ZZ + 289-64+142.241;

%wrt to hand
X4 = XX +100 ;
Y4 = YY;
Z4 = ZZ;

% % %wrt body
% x4= X + 100
% y4= Y + 62+33;
% z4= Z + 289-64+142.241;
% 
% %wrt to hand
% X4 = X +100 
% Y4 = Y
% Z4 = Z

for i=1:N       
[tl1,tl2,tl3] = hand_ik_test(X4(i),Y4(i),Z4(i),l1,l2,sig);
[tr1,tr2,tr3] = hand_ik_test(X4(i),-Y4(i),Z4(i),l1,l2,-1);
RH{i}=[tr1,tr2,tr3];
LH{i}=[tl1,tl2,tl3];
RL{i}=[0 0 0 0 0];
LL{i}=[0 0 0 0 0];
SEQ4=[RH;LH;RL;LL];
end

%SEQ5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N=40;
 base = 40;
 height =60;
 [X, Y, Z] = rectangle_3(base,height,N,1)

% %wrt body
x5= X + 100
y5= Y + 62+33;
z5= Z + 289-64+142.241;

%wrt to hand
X5 = X +100 ;
Y5 = Y;
Z5 = Z;

for i=1:N       
[tl1,tl2,tl3] = hand_ik_test(X5(i),Y5(i),Z5(i),l1,l2,sig);
[tr1,tr2,tr3] = hand_ik_test(X5(i),-Y5(i),-Z5(i),l1,l2,-1);
RH{i}=[tr1,tr2,tr3];
LH{i}=[tl1,tl2,tl3];
RL{i}=[0 0 0 0 0];
LL{i}=[0 0 0 0 0];
SEQ5=[RH;LH;RL;LL];
end

%SEQ6
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N=40;
X1 = [0 0 0];
X2 = [0 30 60];
X3 = [0 60 0];
 [X, Y, Z] = Traingle_3(X1,X2,X3,N,1)
%[X, Y , Z] = Transform_3d(X , Y, Z, N, 0, 0, 0 , [0 20 20],2)

% %wrt body
x6= X + 100
y6= Y + 62+33;
z6= Z + 289-64+142.241;

%wrt to hand
X6 = X +100 ;
Y6 = Y;
Z6 = Z;

for i=1:N       
[tl1,tl2,tl3] = hand_ik_test(X6(i),Y6(i),Z6(i),l1,l2,sig);
[tr1,tr2,tr3] = hand_ik_test(X6(i),-Y6(i),Z6(i),l1,l2,-1);
RH{i}=[tr1,tr2,tr3];
LH{i}=[tl1,tl2,tl3];
RL{i}=[0 0 0 0 0];
LL{i}=[0 0 0 0 0];
SEQ6=[RH;LH;RL;LL];
end

%SEQ7
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N=40;
X1 = [0 0 0];
X2 = [0 45 90];
X3 = [0 90 0];
[X, Y, Z] = Traingle_3(X1,X2,X3,N,1)
[XX, YY , ZZ] = Transform_3d(X , Y, Z, N, 0, 0, 0 , [0 20 20],2)
% %wrt body
x7= XX + 100
y7= YY + 62+33;
z7= ZZ + 289-64+142.241;

%wrt to hand
X7 = XX +100 ;
Y7 = YY;
Z7 = ZZ;

for i=1:N       
[tl1,tl2,tl3] = hand_ik_test(X7(i),Y7(i),Z7(i),l1,l2,sig);
[tr1,tr2,tr3] = hand_ik_test(X7(i),-Y7(i),Z7(i),l1,l2,-1);
RH{i}=[tr1,tr2,tr3];
LH{i}=[tl1,tl2,tl3];
RL{i}=[0 0 0 0 0];
LL{i}=[0 0 0 0 0];
SEQ7=[RH;LH;RL;LL];
end


%SEQ8
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


N=40;
[X, Y, Z] = sin_wave_3(25,5,N,1)
[XX, YY , ZZ] = Transform_3d(X , Y, Z, N, 0, 0, 0 , [0 0 0],1)
% %wrt body
x8= XX + 100
y8= YY + 62+33;
z8= ZZ + 289-64+142.241;

%wrt to hand
X8 = XX +100 ;
Y8 = YY;
Z8 = ZZ;

for i=1:N       
[tl1,tl2,tl3] = hand_ik_test(X8(i),Y8(i),Z8(i),l1,l2,sig);
[tr1,tr2,tr3] = hand_ik_test(X8(i),-Y8(i),Z8(i),l1,l2,-1);
RH{i}=[tr1,tr2,tr3];
LH{i}=[tl1,tl2,tl3];
RL{i}=[0 0 0 0 0];
LL{i}=[0 0 0 0 0];
SEQ8=[RH;LH;RL;LL];
end


%SEQ9
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N=40;
[X, Y, Z] = cos_wave_3(25,5,N,1)
[XX, YY , ZZ] = Transform_3d(X , Y, Z, N, 0, 0, 0 , [0 0 0],1)
% %wrt body
x9= XX + 100
y9= YY + 62+33;
z9= ZZ + 289-64+142.241;

%wrt to hand
X9 = XX +100 ;
Y9 = YY;
Z9 = ZZ;

for i=1:N       
[tl1,tl2,tl3] = hand_ik_test(X9(i),Y9(i),Z9(i),l1,l2,sig);
[tr1,tr2,tr3] = hand_ik_test(X9(i),-Y9(i),Z9(i),l1,l2,-1);
RH{i}=[tr1,tr2,tr3];
LH{i}=[tl1,tl2,tl3];
RL{i}=[0 0 0 0 0];
LL{i}=[0 0 0 0 0];
SEQ9=[RH;LH;RL;LL];
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%SEQ10
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N=40;
VAL = 40
[X, Y, Z] = Absolute_3(VAL,N,1)
[XX, YY , ZZ] = Transform_3d(X , Y, Z, N, 0, 0, 0 , [0 0 0],1)
% %wrt body
x10= XX + 100
y10= YY + 62+33;
z10= ZZ + 289-64+142.241;

%wrt to hand
X10 = XX +100 ;
Y10 = YY;
Z10 = ZZ;

for i=1:N       
[tl1,tl2,tl3] = hand_ik_test(X10(i),Y10(i),Z10(i),l1,l2,sig);
[tr1,tr2,tr3] = hand_ik_test(X10(i),-Y10(i),Z10(i),l1,l2,-1);
RH{i}=[tr1,tr2,tr3];
LH{i}=[tl1,tl2,tl3];
RL{i}=[0 0 0 0 0];
LL{i}=[0 0 0 0 0];
SEQ10=[RH;LH;RL;LL];
end

%SEQ11
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N=40;
NUM = 5;
VAL =5;
CW =1;
[X, Y, Z] = Spiral_3(VAL,NUM,N,CW)
[XX, YY , ZZ] = Transform_3d(X , Y, Z, N, 0, 0, 0 , [0 0 0],1)
% %wrt body
x11= XX + 100
y11= YY + 62+33;
z11= ZZ + 289-64+142.241;

%wrt to hand
X11 = XX +100 ;
Y11 = YY;
Z11 = ZZ;

for i=1:N       
[tl1,tl2,tl3] = hand_ik_test(X11(i),Y11(i),Z11(i),l1,l2,sig);
[tr1,tr2,tr3] = hand_ik_test(X11(i),-Y11(i),Z11(i),l1,l2,-1);
RH{i}=[tr1,tr2,tr3];
LH{i}=[tl1,tl2,tl3];
RL{i}=[0 0 0 0 0];
LL{i}=[0 0 0 0 0];
SEQ11=[RH;LH;RL;LL];
end

%SEQ12
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N=40;
[X, Y, Z] = tan_wave_3(15,5,N/5,1)
[XX, YY , ZZ] = Transform_3d(X , Y, Z, N, 0, 0, 0 , [0 0 0],1)
% %wrt body
x12= XX + 100
y12= YY + 62+33;
z12= ZZ + 289-64+142.241;

%wrt to hand
X12 = XX +100 ;
Y12 = YY;
Z12 = ZZ;

for i=1:N       
[tl1,tl2,tl3] = hand_ik_test(X12(i),Y12(i),Z12(i),l1,l2,sig);
[tr1,tr2,tr3] = hand_ik_test(X12(i),-Y12(i),Z12(i),l1,l2,-1);
RH{i}=[tr1,tr2,tr3];
LH{i}=[tl1,tl2,tl3];
RL{i}=[0 0 0 0 0];
LL{i}=[0 0 0 0 0];
SEQ12=[RH;LH;RL;LL];
end

%SEQ13
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N=40;
NUM = 2;
VAL1 =5;
VAL2 =5;
CW =1;
[X, Y, Z] = helix_3(VAL1,VAL2,NUM,N,CW)
[XX, YY , ZZ] = Transform_3d(X , Y, Z, N, 0, 0, 0 , [0 0 0],1)
% %wrt body
x13= XX + 100
y13= YY + 62+33;
z13= ZZ + 289-64+142.241;

%wrt to hand
X13 = XX +100 ;
Y13 = YY;
Z13 = ZZ;

for i=1:N       
[tl1,tl2,tl3] = hand_ik_test(X13(i),Y13(i),Z13(i),l1,l2,sig);
[tr1,tr2,tr3] = hand_ik_test(X13(i),-Y13(i),Z13(i),l1,l2,-1);
RH{i}=[tr1,tr2,tr3];
LH{i}=[tl1,tl2,tl3];
RL{i}=[0 0 0 0 0];
LL{i}=[0 0 0 0 0];
SEQ13=[RH;LH;RL;LL];
end

%SEQ14
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N=40;
NUM = 5;
VAL1 =2;
VAL2=2;
CW =1;
[X, Y, Z] = helix_spiral_3(VAL1,VAL2,NUM,N,CW)
[XX, YY , ZZ] = Transform_3d(X , Y, Z, N, 0, 0, 0 , [0 0 0],1)
% %wrt body
x14= XX + 100
y14= YY + 62+33;
z14= ZZ + 289-64+142.241;

%wrt to hand
X14 = XX +100 ;
Y14 = YY;
Z14 = ZZ;

for i=1:N       
[tl1,tl2,tl3] = hand_ik_test(X14(i),Y14(i),Z14(i),l1,l2,sig);
[tr1,tr2,tr3] = hand_ik_test(X14(i),-Y14(i),Z14(i),l1,l2,-1);
RH{i}=[tr1,tr2,tr3];
LH{i}=[tl1,tl2,tl3];
RL{i}=[0 0 0 0 0];
LL{i}=[0 0 0 0 0];
SEQ14=[RH;LH;RL;LL];
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if COMMS==1
s=serial('COM8');
set(s,'baudrate',57600);
fopen(s);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%SEQ1
if SEQ1_ENABLE==1
for i=1:length(gamma1)
PLOT_AND_WRITE_NINO(s,SEQ1,DIP,COM_POS,x1,y1,z1,DISP_FRAMES,COMMS,PLOT,i) 
pause(0.02);
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%SEQ2
if SEQ2_ENABLE==1
for i=1:N
PLOT_AND_WRITE_NINO(s,SEQ2,DIP,COM_POS,x2,y2,z2,DISP_FRAMES,COMMS,PLOT,i) 
pause(0.02);
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%SEQ3
if SEQ3_ENABLE==1
for i=1:N
PLOT_AND_WRITE_NINO(s,SEQ3,DIP,COM_POS,x3,y3,z3,DISP_FRAMES,COMMS,PLOT,i) 
pause(0.02);
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%SEQ4
if SEQ4_ENABLE==1
for i=1:N
PLOT_AND_WRITE_NINO(s,SEQ4,DIP,COM_POS,x4,y4,z4,DISP_FRAMES,COMMS,PLOT,i) 
pause(0.02);
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%SEQ5
if SEQ5_ENABLE==1
for i=1:N
PLOT_AND_WRITE_NINO(s,SEQ5,DIP,COM_POS,x5,y5,z5,DISP_FRAMES,COMMS,PLOT,i) 
pause(0.02);
end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%SEQ6
if SEQ6_ENABLE==1
for i=1:N
PLOT_AND_WRITE_NINO(s,SEQ6,DIP,COM_POS,x6,y6,z6,DISP_FRAMES,COMMS,PLOT,i) 
pause(0.02);
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%SEQ7
if SEQ7_ENABLE==1
for i=1:N
PLOT_AND_WRITE_NINO(s,SEQ7,DIP,COM_POS,x7,y7,z7,DISP_FRAMES,COMMS,PLOT,i) 
pause(0.02);
end
hold on

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%SEQ8
if SEQ8_ENABLE==1
for i=1:N
PLOT_AND_WRITE_NINO(s,SEQ8,DIP,COM_POS,x8,y8,z8,DISP_FRAMES,COMMS,PLOT,i) 
pause(0.02);
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%SEQ9
if SEQ9_ENABLE==1
for i=1:N
PLOT_AND_WRITE_NINO(s,SEQ9,DIP,COM_POS,x9,y9,z9,DISP_FRAMES,COMMS,PLOT,i) 
pause(0.02);
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%SEQ10
if SEQ10_ENABLE==1
for i=1:N
PLOT_AND_WRITE_NINO(s,SEQ10,DIP,COM_POS,x10,y10,z10,DISP_FRAMES,COMMS,PLOT,i) 
pause(0.02);
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%SEQ11
if SEQ11_ENABLE==1
for i=1:N
PLOT_AND_WRITE_NINO(s,SEQ11,DIP,COM_POS,x11,y11,z11,DISP_FRAMES,COMMS,PLOT,i) 
pause(0.02);
end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%SEQ12
if SEQ12_ENABLE==1
for i=1:N
PLOT_AND_WRITE_NINO(s,SEQ12,DIP,COM_POS,x12,y12,z12,DISP_FRAMES,COMMS,PLOT,i) 
pause(0.02);
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%SEQ13
if SEQ13_ENABLE==1
for i=1:N
PLOT_AND_WRITE_NINO(s,SEQ13,DIP,COM_POS,x13,y13,z13,DISP_FRAMES,COMMS,PLOT,i) 
pause(0.02);
end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%SEQ14
if SEQ14_ENABLE==1
for i=1:N
PLOT_AND_WRITE_NINO(s,SEQ14,DIP,COM_POS,x14,y14,z14,DISP_FRAMES,COMMS,PLOT,i) 
pause(0.02);
end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


if COMMS==1
fclose(s);
end







 

