function [Mx, My, Mz] = linear_seg_3(X1,X2,sample,CW)

if CW ==1
x1 = X1(1);
y1 = X1(2);
z1 = X1(3);
x2 = X2(1);
y2 = X2(2);
z2 = X2(3);
elseif CW == 0
x1 = X2(1);
y1 = X2(2);
z1 = X2(3);
x2 = X1(1);
y2 = X1(2);
z2 = X1(3);
end


t11= 0:1/(sample-1):1;
Mx = zeros (1,length(t11));
My = zeros (1,length(t11));
Mz = zeros (1,length(t11));

for i= 1:length(t11)
    Mx(i) = (1-t11(i))*x1 + t11(i)*x2;
    My(i) = (1-t11(i))*y1 + t11(i)*y2;
    Mz(i) = (1-t11(i))*z1 + t11(i)*z2;
end




