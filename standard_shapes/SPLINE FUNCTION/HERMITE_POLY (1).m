function [XX,YY,ZZ] = HERMITE_POLY(P)

% P : SEQUENCE OF POINTS %

[M,N] = size(P)

V =zeros(M,3);

for i = 1 : M-1
   V(i,:) = P(i+1,:)-P(i,:);
   % V(i,:) = V(i,:)/norm(V(i,:));
end
V(M,:) = [0 0 0];   

for i =1 : M-1 
    if i==1
    [px1, py1,pz1] = hermite_poly(P(i,:),P(i+1,:),V(i,:),V(i+1,:)); 
    XX = px1;  
    YY = py1;
    ZZ = pz1;
    else
    [px1, py1,pz1] = hermite_poly(P(i,:),P(i+1,:),V(i,:),V(i+1,:)); 
    XX = [ XX  px1];  
    YY = [ YY  py1];
    ZZ = [ ZZ  pz1];
    end
end  
  
    
    
 