function M = bezier_4(X1,X2)

X = cross(X1,X2);
X = X/norm(X);
X3 = cross(X,X1);
X3 = X3/norm(X3);
X4 = ((X1+X2)*0.33)+10*X3;
X5 = ((X1+X2)*0.66)+10*X3;
i= 0:0.05:1;
M =zeros(21,3);
for k= 1:21
   B = ((1-i(k))^3)*X1 +3*((1-i(k))^2)*i(k)*X4 +3*(1-i(k))*(i(k)^2)*X5 +i(k)^3 *X2;
   M(k,1)=B(1);
   M(k,2)=B(2);
   M(k,3)=B(3);
%    figure(2)
%    axis equal
%    plot3(B(1),B(2),B(3),'*')
%    hold on
    
end
