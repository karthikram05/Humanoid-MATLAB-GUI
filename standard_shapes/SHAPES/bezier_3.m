function [MX] = bezier_3(X1,X2)

% DRAWING CUBIC BEZIER CURVE USING 2 POINTS %
% X1,X2 : 3D POINTS 

XQ = cross(X1,X2);
XQ = XQ/norm(XQ);
if norm(X2)>=norm(X1)
XQ = XQ;
else
XQ=XQ;
end
X3 = cross(XQ,X1);
X3 = X3/norm(X3);
X = ((X1+X2)./2)+2*X3
i= 0:0.05:1;
MX =zeros(21,3);

% X : CONTROL POINT

for k= 1:21
   B = ((1-i(k))^2)*X1 +2*(1-i(k))*i(k)*X +i(k)^2 *X2;
   MX(k,1)=B(1);
   MX(k,2)=B(2);
   MX(k,3)=B(3);
%    figure(2)
%    axis equal
%    plot3(B(1),B(2),B(3),'*')
%    hold on
    
end
