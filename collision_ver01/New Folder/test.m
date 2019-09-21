clf
PLOT_COLLISION = 1;

LH =[0 0 0]*(pi/180);
RH =[0 00 00]*(pi/180);
LL =[0 0 0 0 0 ]*(pi/180);
RL = [0 0 0 0 0]*(pi/180);
DIP =20;
COM_POS = [0 0 0];
DISP_FRAMES = 0;
%change to normal
[f00,f01,f02,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,f19,f20,fle,fre] = FK_T3_1(LL,RL,LH,RH,0,0,DIP,COM_POS);
%over lap cubes properly
PLOT_T3_1(f00,f01,f02,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,f19,f20,fle,fre,0,1);