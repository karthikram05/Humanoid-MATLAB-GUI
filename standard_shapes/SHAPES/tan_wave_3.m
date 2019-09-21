function [X, Y, Z] = tan_wave_3(MAG,NUM,N,CW)

% MAG MAGANITUDE OF WAVE %
% NUM IS NUMBER OF CYCLES %
% N IS NUMBER OF SAMPLES PER CYCLE %
% CW = 1 POINTS ARE TRAVERSE IN CLOCKWISE DIRECTION %
% CW = 0 POINTS ARE TRAVERSE IN ANTI CLOCKWISE DIRECTION %

XC = [0 0 0]';
aa=80*pi/180;
a=10*pi/180;

if CW == 1
   THETA = -aa: (pi-2*a)/N: aa;   
    
else
   THETA = aa : (-pi-2*a)/N: -aa;    
end
   
xc = XC(1);
yc = XC(2);
zc = XC(3);
X=zeros(1, N*NUM);
Y=zeros(1, N*NUM);
Z=zeros(1, N*NUM);


% yz plane 
for ii =0:NUM-1
for i = 1:N
X(i+(ii*N))= xc + 0;
Y(i+(ii*N))= yc + i+(ii*N);
Z(i+(ii*N))= zc + MAG*tan(THETA(i));  
end
end
