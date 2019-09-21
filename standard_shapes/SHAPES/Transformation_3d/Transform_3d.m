function [XX, YY , ZZ] = Transform_3d(X , Y, Z, N, ANGLE_X, ANGLE_Y, ANGLE_Z , Xtrans,S)

% APPLYING HOMOGENEOUS TRANSFORMATION TO GIVEN 3D POINTS X,Y,Z %
% N : NO OF SAMPLE % 
% ANGLE_X : ROTATION ANGLE ABOUT X AXIS %
% ANGLE_Y : ROTATION ANGLE ABOUT Y AXIS %
% ANGLE_Z : ROTATION ANGLE ABOUT Z AXIS %
% Xtrans :  TRANSLATION COMPONENT %
% S : SCLAING COMP0NENT %

[R_zyx] = Trans_Rotate(ANGLE_X ,ANGLE_Y, ANGLE_Z, Xtrans(1), Xtrans(2), Xtrans(3) );

XX = zeros(1,N);
YY = zeros(1,N);
ZZ = zeros(1,N);

for i=1:N   
  XYZ   = R_zyx * [X(i) Y(i) Z(i) S]';
  XX(i) = XYZ(1);
  YY(i) = XYZ(2);
  ZZ(i) = XYZ(3);
end
