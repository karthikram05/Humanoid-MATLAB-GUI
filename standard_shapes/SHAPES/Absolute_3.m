function [X,Y,Z] = Absolute_3(V,N,CW)

% V MAXIMUM ABSOLUTE VALUE % 
% N IS NUMBER OF SAMPLES %
% CW = 1 POINTS ARE TRAVERSE IN CLOCKWISE DIRECTION 
% CW = 0 POINTS ARE TRAVERSE IN ANTI CLOCKWISE DIRECTION

X1 = [0 -V V];
X2 = [0 0 0];
X3 = [0 V V];

 if mod(N,2)== 0
     N1 = N/2;
     N2 = N/2;
 elseif mod(N,2) == 1
     N1 = N/2;
     N2 = (N/2) + 1;
 end   
     
if CW == 1
[Mx1, My1,Mz1] = linear_seg_3(X1,X2,N1,1);
[Mx2, My2,Mz2] = linear_seg_3(X2,X3,N2,1);
else X2 = [0 0 0];
X3 = [0 V V];

[Mx1, My1,Mz1] = linear_seg_3(X3,X2,N1,1);
[Mx2, My2 ,Mz2] = linear_seg_3(X2,X1,N2,1);
end

X = [Mx1 Mx2];
Y = [My1 My2];
Z = [Mz1 Mz2]; 
