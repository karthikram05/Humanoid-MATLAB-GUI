function [Mx, My] = linear_seg(x1,y1,x2,y2)

t11= 0.1:0.1:1
Mx = zeros (1,length(t11));
My = zeros (1,length(t11));
for i= 1:length(t11)
    Mx(i) = (1-t11(i))*x1 + t11(i)*x2;
    My(i) = (1-t11(i))*y1 + t11(i)*y2;
end
plot(Mx,My)



