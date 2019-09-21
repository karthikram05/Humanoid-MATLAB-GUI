
% 0 TO 1 time interval
function [px, py,pz] = minimum_jerk(X1,X2,V1,V2)
 
% FITTING 5TH ORDER POLYNOMIAL BASED ON POSITION AND VELOCITY INPUT %    
% X1 : START POSITION %
% X2 : END POSITION %
% V1 : INITIAL VELOCITY %
% V2 : FINAL VELOCITY %

A = [0 0 0 0 0 1;
     1 1 1 1 1 0;
     0 0 0 0 1 0;
     5 4 3 2 1 0;
     0 0 0 2 0 0;
     20 12 6 2 0 0];
 
C1 = [X1(1) X2(1) V1(1) V2(1) 0 0]';
C2 = [X1(2) X2(2) V1(2) V2(2) 0 0]'; 
C3 = [X1(3) X2(3) V1(3) V2(3) 0 0]';

B1 = inv(A)*C1;
B2 = inv(A)*C2;
B3 = inv(A)*C3;

px = zeros(1,21);
py = zeros(1,21);
pz = zeros(1,21);

t= 0:0.05:1;

for i=1:21
    px(i) =  B1(1)*t(i)^5 + B1(2)*t(i)^4 + B1(3)*t(i)^3 + B1(4)*t(i)^2 + B1(5)*t(i) + B1(6);
    py(i) =  B2(1)*t(i)^5 + B2(2)*t(i)^4 + B2(3)*t(i)^3 + B2(4)*t(i)^2 + B2(5)*t(i) + B2(6);
    pz(i) =  B3(1)*t(i)^5 + B3(2)*t(i)^4 + B3(3)*t(i)^3 + B3(4)*t(i)^2 + B3(5)*t(i) + B3(6);
end
    
    
 