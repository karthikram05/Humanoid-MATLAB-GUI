 function [X , Y, Z ] = square_3(a,N,CW)

 % a BASE LENGTH OF SQUARE %
% N IS NUMBER OF SAMPLES %
% CW = 1 POINTS ARE TRAVERSE IN CLOCKWISE DIRECTION 
% CW = 0 POINTS ARE TRAVERSE IN ANTI CLOCKWISE DIRECTION

 
len = a/2;
% draw in yz plane 

if CW == 1
X1 =[0  len  len];
X2 =[0 -len  len]; 
X3 =[0 -len -len]; 
X4 =[0  len  -len]; 
else
X1 =[0  len  len]; 
X2 =[0  len -len]; 
X3 =[0 -len -len]; 
X4 =[0 -len  len]; 
end
% 
 if mod(N,4)== 0
     N1 = N/4;
     N2 = N/4;
     N3 = N/4;
     N4 = N/4;
 elseif mod(N,4)== 1
     N1 = N/4;
     N2 = N/4;
     N3 = N/4;
     N4 = (N/4) +1;
elseif mod(N,4)== 2
     N1 = N/4;
     N2 = (N/4)+1;
     N3 = N/4;
     N4 = (N/4)+1;
     
elseif mod(N,4)== 3
     N1 = N/4;
     N2 = (N/4)+1;
     N3 = (N/4)+1;
     N4 = (N/4)+1;
 end
 
[Mx1, My1,Mz1] = linear_seg_3(X1,X2,N1,1);
[Mx2, My2,Mz2] = linear_seg_3(X2,X3,N2,1);
[Mx3, My3 ,Mz3] = linear_seg_3(X3,X4,N3,1);
[Mx4, My4,Mz4] = linear_seg_3(X4,X1,N4,1);
 

X = [Mx1 Mx2 Mx3 Mx4];
Y = [My1 My2 My3 My4];
Z = [Mz1 Mz2 Mz3 Mz4]; 

