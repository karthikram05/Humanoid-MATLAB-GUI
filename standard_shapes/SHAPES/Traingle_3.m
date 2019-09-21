function [X , Y, Z] = Traingle_3(X1,X2,X3,N,CW)

% X1,X2,X3 ARE 3 DIMENSIONAL POINTS OF TRAINGLE %
% N IS NUMBER OF SAMPLES %
% CW = 1 POINTS ARE TRAVERSE IN CLOCKWISE DIRECTION 
% CW = 0 POINTS ARE TRAVERSE IN ANTI CLOCKWISE DIRECTION


 if mod(N,3)== 0
     N1 = N/3;
     N2 = N/3;
     N3 = N/3;
 elseif mod(N,3)== 1
     N1 = N/3;
     N2 = N/3;
     N3 = (N/3) + 1;
elseif mod(N,4)== 2
     N1 = N/4;
     N2 = (N/4)+1;
     N3 = (N/4)+1;
 end


if CW == 1
[Mx1, My1,Mz1] = linear_seg_3(X1,X2,N1,1);
[Mx2, My2,Mz2] = linear_seg_3(X2,X3,N2,1);
[Mx3, My3 ,Mz3] = linear_seg_3(X3,X1,N3,1);
else
[Mx1, My1,Mz1] = linear_seg_3(X1,X3,N1,1);
[Mx2, My2,Mz2] = linear_seg_3(X3,X2,N2,1);
[Mx3, My3 ,Mz3] = linear_seg_3(X2,X1,N3,1);
end

X = [ Mx1 Mx2 Mx3 ];
Y = [ My1 My2 My3 ];
Z = [ Mz1 Mz2 Mz3 ]; 
