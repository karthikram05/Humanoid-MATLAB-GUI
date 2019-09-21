function [V,VP]=triangleshape(a,b,c,r)

V1 = a*[ 0;1.12;-1.12; 0;1.12;-1.12]
V2 = b*[1; -1; -1; 1;-1; -1];
V3 = c*[-1; -1;-1; 1; 1;  1;];

[THETA,PHI,R] = cart2sph(V1,V2,V3);
R = r.*ones(size(V1(:,1)));
[V1,V2,V3] = sph2cart(THETA,PHI,R);
V = [V1 V2 V3];

% for plolting %   

V4 = a*[ 0;1.12;-1.12; 0;  0;1.12;-1.12;0;-1.12;-1.12;1.12;1.12;0]
V5 = b*[1; -1; -1; 1; 1;-1; -1; 1;-1;-1;-1;-1;1];
V6 = c*[-1; -1;-1; -1; 1; 1;  1; 1;-1;1;-1;1;-1];

[THETA,PHI,R] = cart2sph(V4,V5,V6);
R = r.*ones(size(V4(:,1)));
[V4,V5,V6] = sph2cart(THETA,PHI,R);
VP = [V4 V5 V6];



