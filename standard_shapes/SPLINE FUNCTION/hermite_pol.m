function [px, py,pz] = hermite_pol(X1,X2,V1,V2)
    
% FITTING HERMITE POLYNOMIAL BASED ON POSITION AND VELOCITY INPUT %    
% X1 : START POSITION %
% X2 : END POSITION %
% V1 : INITIAL VELOCITY %
% V2 : FINAL VELOCITY %


    j = 1;
    A = [2,-2,1,1;
        -3,3,-2,-1;
         0,0,1,0;
         1,0,0,0] ; % Hermite polynomial
    
    Px = [X1(1),X2(1),V1(1),V2(1)];
    Py = [X1(2),X2(2),V1(2),V2(2)];
    Pz = [X1(3),X2(3),V1(3),V2(3)];

        for ts=0:0.05:1
            px(j) = [ts^3,ts^2,ts,1]*A*Px';
            py(j) = [ts^3,ts^2,ts,1]*A*Py';
            pz(j) = [ts^3,ts^2,ts,1]*A*Pz';
            j = j+1;
        end
        
end
