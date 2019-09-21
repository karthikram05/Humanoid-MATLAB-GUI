
global link_color 

link_color = 'kkkkkkkkkkbbkkkkkk';

% COLLISION AVOIDANCE ALGORITHM FOR HUMANOID ROBOT NINO-3 %
% ALGO USED IS GJK DISTANCE ALGO %
PLOT_COLLISION = 1;
iterationsAllowed = 6;
axis equal
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CHEST %
% axis equal


%THIS IS FOR CUBE CHEST
[V,VP]=cubeshape(52,72.8,72,1);


%transforming chest box to chest
for i=1:8
    v(i,:) = f01*[V(i,1) V(i,2) V(i,3) 1]';
end

%transforming chest box to chest
if PLOT_COLLISION ==1
for i=1:16
    aa(i,:) = f01*[VP(i,1) VP(i,2) VP(i,3)-45 1]';
end

line(aa(:,1),aa(:,2),aa(:,3),'Color','b');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5

%THIS IS FOR LEFT HAND
[VL,VPL]=hexagonshape(35/2,20/2,40,1);
F14 = f12*T(-1,10,-45.54);
for i=1:12
    vl(i,:) = F14*[VL(i,1) VL(i,2) VL(i,3) 1]';
end

if PLOT_COLLISION ==1

for i=1:25
    aa3(i,:) = F14*[VPL(i,1) VPL(i,2) VPL(i,3) 1]';
end

line(aa3(:,1),aa3(:,2),aa3(:,3),'Color','b');
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[VLW,VPLW]=hexagonshape(26.1/2,20/2,(24+21.670),1);
F15 = f13*T(0,10,-55);

for i=1:12
    vlw(i,:) = F15*[VLW(i,1) VLW(i,2) VLW(i,3) 1]';
end

vl_ee =  f13*T(0,0,-96.70)*[0 0 0 1]'; 

if PLOT_COLLISION ==1
for i=1:25
    aa3(i,:) = F15*[VPLW(i,1) VPLW(i,2) VPLW(i,3) 1]';
end

line(aa3(:,1),aa3(:,2),aa3(:,3),'Color','b');
end

                    
% right hand %
[VR,VPR]= hexagonshape(35/2,20/2,40,1);
F16 = f16*T(0,-6,-45.54);
for i=1:12
     vr(i,:) = F16*[VR(i,1) VR(i,2) VR(i,3) 1]';
end

if PLOT_COLLISION ==1

for i=1:25
    aa3(i,:) = F16*[VPR(i,1) VPR(i,2) VPR(i,3) 1]';
end

line(aa3(:,1),aa3(:,2),aa3(:,3),'Color','b');
end

                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


[VRW,VPRW]=hexagonshape(26.1/2,20/2,(24+21.670),1);
F17 = f17*T(0,-6,-55);
for i=1:12
    vrw(i,:) = F17*[VRW(i,1) VRW(i,2) VRW(i,3) 1]';
end
vr_ee =  f17*T(0,0,-96.70)*[0 0 0 1]'; 

if PLOT_COLLISION ==1

for i=1:25
    aa3(i,:) = F17*[VPRW(i,1) VPRW(i,2) VPRW(i,3) 1]';
end

line(aa3(:,1),aa3(:,2),aa3(:,3),'Color','b');
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LEFT LEG %

[VLE7,VPLE7]=hexagonshape(28/2,22/2,21,1);
F7 = f2*T(0,18,-24);

for i=1:12
    vle7(i,:) = F7*[VLE7(i,1) VLE7(i,2) VLE7(i,3) 1]';
end

if PLOT_COLLISION ==1

for i=1:25
    aa3(i,:) = F7*[VPLE7(i,1) VPLE7(i,2) VPLE7(i,3) 1]';
end

line(aa3(:,1),aa3(:,2),aa3(:,3),'Color','b');
end


[VLE5,VPLE5]=hexagonshape(27/2,29/2,27,1);
F5 = f3*T(0,18,-27);
for i=1:12
    vle5(i,:) = F5*[VLE5(i,1) VLE5(i,2) VLE5(i,3) 1]';
end

if PLOT_COLLISION ==1
for i=1:25
    aa3(i,:) = F5*[VPLE5(i,1) VPLE5(i,2) VPLE5(i,3) 1]';
end

line(aa3(:,1),aa3(:,2),aa3(:,3),'Color','b');
end

[VLE3,VPLE3]=hexagonshape(28/2,20/2,15,1);
F3 = f4*T(0,18,-18);
for i=1:12
    vle3(i,:) = F3*[VLE3(i,1) VLE3(i,2) VLE3(i,3) 1]';
end
if PLOT_COLLISION ==1
for i=1:25
    aa3(i,:) = F3*[VPLE3(i,1) VPLE3(i,2) VPLE3(i,3) 1]';
end

line(aa3(:,1),aa3(:,2),aa3(:,3),'Color','b');
end


[VLE1,VPLE1]=cubeshape(78,48,24,1);
F1 = f5*T(0,36,-28);
for i=1:8
    vle1(i,:) = F1*[VLE1(i,1) VLE1(i,2) VLE1(i,3) 1]';
end
if PLOT_COLLISION ==1

for i=1:16
    aa5(i,:) = F1*[VPLE1(i,1) VPLE1(i,2) VPLE1(i,3) 1]';
end

line(aa5(:,1),aa5(:,2),aa5(:,3),'Color','b');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% RIGHT LEG %

[VLE8,VPLE8]=hexagonshape(28/2,22/2,21,1);
F8 = f7*T(0,-18,-24);
for i=1:12
    vle8(i,:) = F8*[VLE8(i,1) VLE8(i,2) VLE8(i,3) 1]';
end
if PLOT_COLLISION ==1
for i=1:25
    aa3(i,:) = F8*[VPLE8(i,1) VPLE8(i,2) VPLE8(i,3) 1]';
end

line(aa3(:,1),aa3(:,2),aa3(:,3),'Color','b');
end


[VLE6,VPLE6]=hexagonshape(27/2,29/2,27,1);
F6 = f8*T(0,-18,-27);
for i=1:12
    vle6(i,:) = F6*[VLE6(i,1) VLE6(i,2) VLE6(i,3) 1]';
end
if PLOT_COLLISION ==1

for i=1:25
    aa3(i,:) = F6*[VPLE6(i,1) VPLE6(i,2) VPLE6(i,3) 1]';
end

line(aa3(:,1),aa3(:,2),aa3(:,3),'Color','b');
end

[VLE4,VPLE4]=hexagonshape(28/2,20/2,15,1);
F4 = f9*T(0,-18,-18);
for i=1:12
    vle4(i,:) = F4*[VLE4(i,1) VLE4(i,2) VLE4(i,3) 1]';
end

if PLOT_COLLISION ==1

for i=1:25
    aa3(i,:) = F4*[VPLE4(i,1) VPLE4(i,2) VPLE4(i,3) 1]';
end

line(aa3(:,1),aa3(:,2),aa3(:,3),'Color','b');
end


[VLE2,VPLE2]=cubeshape(78,48,24,1);
F2 = f10*T(0,-36,-27);
for i=1:8
    vle2(i,:) = F2*[VLE2(i,1) VLE2(i,2) VLE2(i,3) 1]';
end

if PLOT_COLLISION ==1

for i=1:16
    aa6(i,:) = F2*[VPLE2(i,1) VPLE2(i,2) VPLE2(i,3) 1]';
end

%plot3(vle2(:,1),vle2(:,2),vle2(:,3),'*');
line(aa6(:,1),aa6(:,2),aa6(:,3),'Color','b');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% HEAD %

[VH,VPH]=hexagonshape(25,23,45,1);

FH = f00*T(0,0,220);

for i=1:12
    vh(i,:) = FH*[VH(i,1) VH(i,2) VH(i,3) 1]';
end
if PLOT_COLLISION ==1

for i=1:25
    aa3(i,:) = FH*[VPH(i,1) VPH(i,2) VPH(i,3) 1]';
end
line(aa3(:,1),aa3(:,2),aa3(:,3),'Color','b');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% COLLISION CHECKS FOR HAND %

collisionFlag1 = GJK1(v,vlw,iterationsAllowed);

if (collisionFlag1)
        link_color(17)='r';
         link_color(15)='r'; 
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   
collisionFlag2 = GJK1(v,vrw,iterationsAllowed);

    if (collisionFlag2)
         link_color(17)='r';
         link_color(16)='r';
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
collisionFlag3 = GJK1(vrw,vlw,iterationsAllowed);
    no = norm(vl_ee - vr_ee);
    
    if (collisionFlag3*(no<=8))     
        link_color(15)='r';
         link_color(16)='r';
    end
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
collisionFlag4 = GJK1(vlw,vr,iterationsAllowed);

    
    if (collisionFlag4)
        collisionFlag4;    
        link_color(14)='r';
         link_color(15)='r';   
    end

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
collisionFlag5 = GJK1(vrw,vl,iterationsAllowed);


    if (collisionFlag5)
         link_color(16)='r';
         link_color(13)='r';
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
collisionFlag6 = GJK1(vr,v,iterationsAllowed);

          
    if (collisionFlag6)    
        link_color(17)='r';
         link_color(14)='r';
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
    
 collisionFlag7 = GJK1(vl,v,iterationsAllowed);
 
    if (collisionFlag7)
          link_color(13)='r';
         link_color(17)='r';
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55
    
    % COLLISION CHECK HEAD %
    
collisionFlag8 = GJK1(vrw,vh,iterationsAllowed);
          
    if (collisionFlag8)
         link_color(16)='r';
         link_color(18)='r';    
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
    
 collisionFlag9 = GJK1(vlw,vh,iterationsAllowed);
 
    if (collisionFlag9)
         link_color(15)='r';
         link_color(18)='r';    
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
% COLLISION CHECK LEG %
    
collisionFlag10 = GJK1(vle2,vle1,iterationsAllowed);
          
    if (collisionFlag10)
        link_color(2)='r';
         link_color(1)='r';    
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
    
 collisionFlag11 = GJK1(vle2,vle3,iterationsAllowed);
 
    if (collisionFlag11)
        link_color(2)='r';
         link_color(3)='r';    
    end

    collisionFlag12 = GJK1(vle2,vle5,iterationsAllowed);
          
    if (collisionFlag12)
        link_color(2)='r';
         link_color(5)='r';    
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
    
 collisionFlag13 = GJK1(vle2,vle7,iterationsAllowed);
 
    if (collisionFlag13)
        link_color(2)='r';
         link_color(7)='r';    
    end

    collisionFlag14 = GJK1(vle2,vlw,iterationsAllowed);
          
    if (collisionFlag14)
        link_color(2)='r';
         link_color(15)='r';    
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
    
 collisionFlag15 = GJK1(vle1,vle4,iterationsAllowed);
 
    if (collisionFlag15)

         link_color(1)='r';
         link_color(4)='r';
    end

    
    collisionFlag16 = GJK1(vle1,vle6,iterationsAllowed);
          
    if (collisionFlag16)
        link_color(1)='r';
         link_color(6)='r';    
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
    
 collisionFlag17 = GJK1(vle1,vle8,iterationsAllowed);
 
    if (collisionFlag17)
        link_color(1)='r';
         link_color(8)='r';    
    end

    collisionFlag18 = GJK1(vle1,vrw,iterationsAllowed);
          
    if (collisionFlag18)
    link_color(1)='r';
         link_color(16)='r';       
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5

     collisionFlag19 = GJK1(v,vle8,iterationsAllowed);
 
    if (collisionFlag19)
         link_color(17)='r';
         link_color(8)='r';

    end

    collisionFlag20 = GJK1(v,vle7,iterationsAllowed);
          
    if (collisionFlag20)
         link_color(17)='r';
         link_color(7)='r';
        
    end

    
    collisionFlag21 = GJK1(vle8,vle7,iterationsAllowed);
          
    if (collisionFlag21)
         link_color(8)='r';
         link_color(7)='r';
     end
    
    
    
axis equal
% view([64,40]);
% hold on;