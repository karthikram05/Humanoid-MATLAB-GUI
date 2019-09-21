function [ output_args ] = load_shape_callback(hObject,eventdata,bp,menu_object,panel_object,ROT,TRANS,SCALE,planner_bt)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%ALL GLOBAL VARIABLES
global LH_S RH_S LL_S RL_S NY_S NP_S FRAMES link status_text ax DISP_PATH plot_az plot_el ax2 link_color
% LH_P = [0 0 0];
% RH_P = [0 0 0];
% LL_P = [0 0 0];
% RL_P = [0 0 0];

[plot_az,plot_el]=view;

if get(DISP_PATH,'Value')==1
set(DISP_PATH,'Backgroundcolor','c');
else
    set(DISP_PATH,'Backgroundcolor','w');
end

%CLEAR AXIS BEFORE PLOT
NY=0;
NP=0;
%[al,ez]=view;
cla(ax)
%view([al,ez]);
h=str2double(get(FRAMES,'String'));

%DISP ALL PLANNED PLATHS toggle this
if get(DISP_PATH,'Value')==1
 for i=1:h
 [f00,f01,f02,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,f19,f20,fle,fre] = FK_T3_1(LL_S{i},RL_S{i},LH_S{i},RH_S{i},NY,NP,0,[0 0 0]);  
 LH_P(i,:)=[f14(1,4),f14(2,4),f14(3,4)];
 RH_P(i,:)=[f18(1,4),f18(2,4),f18(3,4)];
 LL_P(i,:)=[fle(1,4),fle(2,4),fle(3,4)];
 RL_P(i,:)=[fre(1,4),fre(2,4),fre(3,4)];
 end
end
 

%SELECT FRAMES CHECK ***
if h>0   
%GET SHAPE PROPERTIES
shape_number=get(menu_object,'Value');
shape=allchild(panel_object(shape_number));

%GET SELECTED LINK
if get(bp(1),'Value')==1
   link='LEFT HAND';
end
if get(bp(2),'Value')==1
  link='RIGHT HAND';
end
if get(bp(3),'Value')==1
 link='LEFT LEG';
end
if get(bp(4),'Value')==1
   link='RIGHT LEG';
end
if get(bp(5),'Value')==1
   link='COM';
end
if get(bp(6),'Value')==1
   link='NECK YAW'; 
   shape=allchild(panel_object(19));
   set(shape(6),'String','1');
   set(shape(5),'String',get(FRAMES,'String'));
   set(shape(7),'Value',0);
   set(shape(8),'Value',0);
end
if get(bp(7),'Value')==1
   link='NECK PITCH';
   shape=allchild(panel_object(20));
   set(shape(6),'String','1');
   set(shape(5),'String',get(FRAMES,'String'));
   set(shape(7),'Value',0);
   set(shape(8),'Value',0);
end

set_bp_color(link,bp);

%PRINT STATUS
selected_link= sprintf('SELECTED LINK:%s',link);
set(status_text,'String',selected_link,'Position',[0.05,0.0,0.13,0.02],'Backgroundcolor','w');

%GET ROTATION AND TRANSLATION DATA
for i=1:3
ANGLE(i)=get(ROT(i),'Value');
TRAN(i)=get(TRANS(i),'Value');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%DO A SWITCH HERE 
%CHECK FOR NECK PLANNING CALLS 
if strcmp(link,'NECK YAW')~=1 && strcmp(link,'NECK PITCH')~=1  %skipping this part when neck motors are selected
switch shape_number
    case 1
        %%%%%%%%%%%%%%%%%%%%%%%%%change this fucking thing
        %case:point
        POINT=str2num(get(shape(3),'String'));
        from=str2double(get(shape(2),'String'));
        to=str2double(get(shape(1),'String'));
        [X,Y,Z]=point_3(POINT,(to-from+1));
    case 2
        %case:circle
        radius=str2double(get(shape(4),'String'));
        from=str2double(get(shape(3),'String'));
        to=str2double(get(shape(2),'String'));
        T=get(shape(1),'Value');
        [X,Y,Z] = circle_3(radius,(to-from+1),T);
    case 3
        %case: line segment
        point1=str2num(get(shape(5),'String'));
        point2=str2num(get(shape(4),'String'));
        from=str2double(get(shape(3),'String'));
        to=str2double(get(shape(2),'String'));
        T=get(shape(1),'Value');
        [X,Y,Z] = linear_seg_3(point1,point2,(to-from+1),T);
    case 4
        %case: triangle
        point1=str2num(get(shape(6),'String'));
        point2=str2num(get(shape(5),'String'));
        point3=str2num(get(shape(4),'String'));
        from=str2double(get(shape(3),'String'));
        to=str2double(get(shape(2),'String'));
        T=get(shape(1),'Value');
        [X,Y,Z] = Traingle_3(point1,point2,point3,(to-from+1),T);
    case 5
        %case:square
        side=str2double(get(shape(4),'String'));
        from=str2double(get(shape(3),'String'));
        to=str2double(get(shape(2),'String'));
        T=get(shape(1),'Value');
        [X,Y,Z] = square_3(side,(to-from+1),T);
    case 6
        %case:rectangle
        width=str2double(get(shape(5),'String'));
        height=str2double(get(shape(4),'String'));
        from=str2double(get(shape(3),'String'));
        to=str2double(get(shape(2),'String'));
        T=get(shape(1),'Value');
        [X,Y,Z] = rectangle_3(width,height,(to-from+1),T);
    case 7
        %case:absolute
        mag=str2double(get(shape(4),'String'));
        from=str2double(get(shape(3),'String'));
        to=str2double(get(shape(2),'String'));
        T=get(shape(1),'Value');
        [X,Y,Z] = Absolute_3(mag,(to-from+1),T);
    case 8
        %case:sin
        mag=str2double(get(shape(5),'String'));
        cycle=str2double(get(shape(4),'String'));
        from=str2double(get(shape(3),'String'));
        to=str2double(get(shape(2),'String'));
        T=get(shape(1),'Value');
        [X, Y, Z] = sin_wave_3(mag,cycle,(to-from+1),T);
    case 9
        %case:cos
        mag=str2double(get(shape(5),'String'));
        cycle=str2double(get(shape(4),'String'));
        from=str2double(get(shape(3),'String'));
        to=str2double(get(shape(2),'String'));
        T=get(shape(1),'Value');
        [X, Y, Z] = cos_wave_3(mag,cycle,(to-from+1),T);
    case 10
        %case:tan
        mag=str2double(get(shape(5),'String'));
        cycle=str2double(get(shape(4),'String'));
        from=str2double(get(shape(3),'String'));
        to=str2double(get(shape(2),'String'));
        T=get(shape(1),'Value');
        [X, Y, Z] = tan_wave_3(mag,cycle,(to-from+1),T);
    case 11
        %case:helix
        height=str2double(get(shape(6),'String'));
        radius=str2double(get(shape(5),'String'));
        cycle=str2double(get(shape(4),'String'));
        from=str2double(get(shape(3),'String'));
        to=str2double(get(shape(2),'String'));
        T=get(shape(1),'Value');
        [X, Y, Z] = helix_3(height,radius,cycle,(to-from+1),T);
     case 12
        %case:spiral
        radius=str2double(get(shape(5),'String'));
        cycle=str2double(get(shape(4),'String'));
        from=str2double(get(shape(3),'String'));
        to=str2double(get(shape(2),'String'));
        T=get(shape(1),'Value');
        [X, Y, Z] = Spiral_3(radius,cycle,(to-from+1),T); 
    case 13
        %case:helix-spiral
        height=str2double(get(shape(6),'String'));
        radius=str2double(get(shape(5),'String'));
        cycle=str2double(get(shape(4),'String'));
        from=str2double(get(shape(3),'String'));
        to=str2double(get(shape(2),'String'));
        T=get(shape(1),'Value');
        [X, Y, Z] = helix_spiral_3(height,radius,cycle,(to-from+1),T);
    case 14
        %case:arc
        angle=str2double(get(shape(5),'String'));
        radius=str2double(get(shape(4),'String'));
        from=str2double(get(shape(3),'String'));
        to=str2double(get(shape(2),'String'));
        T=get(shape(1),'Value');
        [X, Y, Z] = arc_3(angle,radius,(to-from+1),T);
    case 15
        %case:parabola
        yp=str2double(get(shape(5),'String'));
        zp=str2double(get(shape(4),'String'));
        from=str2double(get(shape(3),'String'));
        to=str2double(get(shape(2),'String'));
        T=get(shape(1),'Value');
        [X , Y, Z] = parabola_3(yp,zp,(to-from+1),T);
    case 16
        %case:ellipse
        ye=str2double(get(shape(5),'String'));
        ze=str2double(get(shape(4),'String'));
        from=str2double(get(shape(3),'String'));
        to=str2double(get(shape(2),'String'));
        T=get(shape(1),'Value');
        [X , Y, Z] = ellipse_3(ye,ze,(to-from+1),T);
    otherwise
        disp('ERROR')
end

%TRANSFORM STANDARD SHAPE
[XX, YY , ZZ] = Transform_3d(X,Y,Z,(to-from+1),ANGLE(1),ANGLE(2),ANGLE(3) ,TRAN,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%SCALE DATA
XX=XX*get(SCALE,'Value');
YY=YY*get(SCALE,'Value');
ZZ=ZZ*get(SCALE,'Value');

end

%PLOT DATA OF LINK USING SWITCH CASE
hold on;
COM_POS=[0 0 0];
DIP=0;
DISP_FRAMES=0;

switch link
    
    case 'LEFT HAND'
      
        link_color = 'kkkkkkkkkkgkgkgkkkkk';
        if get(planner_bt(2),'Value')==0
        plot3(XX(:)+100,YY(:)+92.34,ZZ(:)+368.2);
         if get(DISP_PATH,'Value')==1
             hold on;
             plot3(LH_P(:,1),LH_P(:,2),LH_P(:,3));
             plot3(RH_P(:,1),RH_P(:,2),RH_P(:,3));
             plot3(LL_P(:,1),LL_P(:,2),LL_P(:,3));
             plot3(RL_P(:,1),RL_P(:,2),RL_P(:,3));
         end
        end
        LH_X=XX+100;
        LH_Y=YY;
        LH_Z=ZZ;
        if get(planner_bt(1),'Value')==1 || get(planner_bt(2),'Value')==1
        if get(planner_bt(1),'Value')==1
            set(planner_bt(1),'Backgroundcolor','c');
        end
            for i=1:length(LH_X)
                LH = HAND_IK_T3_1(LH_X(i),-LH_Y(i),LH_Z(i),-1); 
                RH = [0 0 0];
                LL = LEG_IK_T3_1(0,0,0,90,1,0);       
                RL = LEG_IK_T3_1(0,0,0,90,1,0);
           if get(planner_bt(2),'Value')==0
                plot3(XX(:)+100,YY(:)+92.34,ZZ(:)+368.2);
                hold on;
                    [f00,f01,f02,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,f19,f20,fle,fre] = FK_T3_1(LL,RL,LH,RH,NY,NP,DIP,COM_POS);
                    PLOT_T3_1(f00,f01,f02,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,f19,f20,fle,fre,DISP_FRAMES,0);  
                    view([plot_az,plot_el]); 
                hold off;
                    pause(0.0001);
           end
           
                if get(planner_bt(2),'Value')==1
                    LH_S{from+i-1}=LH;
                    show_assigned_frames_callback(ax2,link,from,to);
                end
            end
            set(planner_bt(1),'Backgroundcolor',[0.94 0.94 0.94]);
        end
        
        
    case 'RIGHT HAND'
        link_color = 'kkkkkkkkkkkgkgkgkkkk';
        if get(planner_bt(2),'Value')==0
        plot3(XX(:)+100,YY(:)-92.34,ZZ(:)+368.2); 
        if get(DISP_PATH,'Value')==1
             hold on;
             plot3(LH_P(:,1),LH_P(:,2),LH_P(:,3));
             plot3(RH_P(:,1),RH_P(:,2),RH_P(:,3));
             plot3(LL_P(:,1),LL_P(:,2),LL_P(:,3));
             plot3(RL_P(:,1),RL_P(:,2),RL_P(:,3));
         end
        end
        RH_X=XX+100;
        RH_Y=YY;
        RH_Z=ZZ;
        if get(planner_bt(1),'Value')==1 || get(planner_bt(2),'Value')==1
        if get(planner_bt(1),'Value')==1
            set(planner_bt(1),'Backgroundcolor','c');
        end
            for i=1:length(RH_X)
                RH = HAND_IK_T3_1(RH_X(i),-RH_Y(i),RH_Z(i),1);
                LH = [0 0 0];
                LL = LEG_IK_T3_1(0,0,0,90,1,0);       
                RL = LEG_IK_T3_1(0,0,0,90,1,0);
                if get(planner_bt(2),'Value')==0
                plot3(XX(:)+100,YY(:)-92.34,ZZ(:)+368.2);
                hold on;
                [f00,f01,f02,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,f19,f20,fle,fre] = FK_T3_1(LL,RL,LH,RH,NY,NP,DIP,COM_POS);
                PLOT_T3_1(f00,f01,f02,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,f19,f20,fle,fre,DISP_FRAMES,0); 
                view([plot_az,plot_el]); 
                hold off;
                pause(0.0001);
                end
                if get(planner_bt(2),'Value')==1
                RH_S{from+i-1}=RH;
                show_assigned_frames_callback(ax2,link,from,to);
                end
            end
            set(planner_bt(1),'Backgroundcolor',[0.94 0.94 0.94]);
        end
        
    case 'LEFT LEG'
        link_color = 'gkgkgkgkgkkkkkkkkkkk';
        if get(planner_bt(2),'Value')==0
        plot3(XX(:),YY(:)+42.5,ZZ(:));
        if get(DISP_PATH,'Value')==1
             hold on;
             plot3(LH_P(:,1),LH_P(:,2),LH_P(:,3));
             plot3(RH_P(:,1),RH_P(:,2),RH_P(:,3));
             plot3(LL_P(:,1),LL_P(:,2),LL_P(:,3));
             plot3(RL_P(:,1),RL_P(:,2),RL_P(:,3));
         end
        end
         if get(planner_bt(1),'Value')==1 || get(planner_bt(2),'Value')==1
            if get(planner_bt(1),'Value')==1
            set(planner_bt(1),'Backgroundcolor','c');
            end
            for i=1:length(XX)
                RH = [0 0 0];
                LH = [0 0 0];
                LL = LEG_IK_T3_1(XX(i),YY(i),ZZ(i),90,1,0);          
                RL = LEG_IK_T3_1(0,0,0,90,1,0);
                if get(planner_bt(2),'Value')==0
                plot3(XX(:),YY(:)+42.5,ZZ(:));
                hold on;
                [f00,f01,f02,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,f19,f20,fle,fre] = FK_T3_1(LL,RL,LH,RH,NY,NP,DIP,COM_POS);
                PLOT_T3_1(f00,f01,f02,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,f19,f20,fle,fre,DISP_FRAMES,0); 
                view([plot_az,plot_el]); 
                hold off;
                pause(0.0001);
                end
                if get(planner_bt(2),'Value')==1
                LL_S{from+i-1}=LL;
                show_assigned_frames_callback(ax2,link,from,to);
                end
            end
            set(planner_bt(1),'Backgroundcolor',[0.94 0.94 0.94]);
        end
        
    case 'RIGHT LEG'
        link_color = 'kgkgkgkgkgkgkkkkkkkk';
        if get(planner_bt(2),'Value')==0
        plot3(XX(:),YY(:)-42.5,ZZ(:)); 
        if get(DISP_PATH,'Value')==1
             hold on;
             plot3(LH_P(:,1),LH_P(:,2),LH_P(:,3));
             plot3(RH_P(:,1),RH_P(:,2),RH_P(:,3));
             plot3(LL_P(:,1),LL_P(:,2),LL_P(:,3));
             plot3(RL_P(:,1),RL_P(:,2),RL_P(:,3));
         end
        end
         if get(planner_bt(1),'Value')==1 || get(planner_bt(2),'Value')==1
            if get(planner_bt(1),'Value')==1
            set(planner_bt(1),'Backgroundcolor','c');
            end
            for i=1:length(XX)
                RH = [0 0 0];
                LH = [0 0 0];
                LL = LEG_IK_T3_1(0,0,0,90,1,0);       
                RL = LEG_IK_T3_1(XX(i),YY(i),ZZ(i),90,1,0); 
                if get(planner_bt(2),'Value')==0
                plot3(XX(:),YY(:)-42.5,ZZ(:));
                hold on;
                [f00,f01,f02,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,f19,f20,fle,fre] = FK_T3_1(LL,RL,LH,RH,NY,NP,DIP,COM_POS);
                PLOT_T3_1(f00,f01,f02,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,f19,f20,fle,fre,DISP_FRAMES,0); 
                view([plot_az,plot_el]); 
                hold off;
                pause(0.0001);
                end
                if get(planner_bt(2),'Value')==1
                RL_S{from+i-1}=RL;
                show_assigned_frames_callback(ax2,link,from,to);
                end
            end
            set(planner_bt(1),'Backgroundcolor',[0.94 0.94 0.94]);
         end
    case 'NECK YAW'
        link_color = 'kkkkkkkkkkkkkkkkkkgk';
                RH = [0 0 0];
                LH = [0 0 0];
                LL = [0 0 0 0 0];       
                RL = [0 0 0 0 0];
                
                %make panel visible
                set(panel_object(:),'Visible','off'); %%%%%%%%%%%%%%%%%%%%%%
                set(panel_object(19),'Visible','on'); %%%%%%%%%%%%%%%%%%%%%%
                shape=allchild(panel_object(19));
                
                %get neck yaw prop
                from_angle=get(shape(8),'Value');
                to_angle=get(shape(7),'Value');
                NY=to_angle*(pi/180);
                from_frame=str2num(get(shape(6),'String'));
                to_frame=str2num(get(shape(5),'String'));
                set(shape(4),'String',num2str(from_angle));
                set(shape(3),'String',num2str(to_angle));
                ND = neck_data(from_angle,to_angle,(to_frame-from_frame)+1);
                from=from_frame;
                to=to_frame;
        if get(planner_bt(1),'Value')==1 || get(planner_bt(2),'Value')==1
            if get(planner_bt(1),'Value')==1
            set(planner_bt(1),'Backgroundcolor','c');
            end
            for i=1:length(ND)
                if get(planner_bt(2),'Value')==0
                [f00,f01,f02,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,f19,f20,fle,fre] = FK_T3_1(LL,RL,LH,RH,ND(i),NP,DIP,COM_POS);
                PLOT_T3_1(f00,f01,f02,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,f19,f20,fle,fre,DISP_FRAMES,1); 
                view([plot_az,plot_el]); 
                pause(0.0001);
                end
                if get(planner_bt(2),'Value')==1
                NY_S{from+i-1}=ND(i);
                show_assigned_frames_callback(ax2,link,from,to);
                end
            end
            set(planner_bt(1),'Backgroundcolor',[0.94 0.94 0.94]);
         end
                
    case 'NECK PITCH'
        link_color = 'kkkkkkkkkkkkkkkkkkkg';
                RH = [0 0 0];
                LH = [0 0 0];
                LL = [0 0 0 0 0];       
                RL = [0 0 0 0 0];
                
                %make panel visible
                set(panel_object(:),'Visible','off');
                set(panel_object(20),'Visible','on');
                shape=allchild(panel_object(20));
                
                %get neck pitch prop
                from_angle=get(shape(8),'Value');
                to_angle=get(shape(7),'Value');
                NP=to_angle*(pi/180);
                from_frame=str2num(get(shape(6),'String'));
                to_frame=str2num(get(shape(5),'String'));
                set(shape(4),'String',num2str(from_angle));
                set(shape(3),'String',num2str(to_angle));
                [ND] = neck_data(from_angle,to_angle,(to_frame-from_frame)+1);
                from=from_frame;
                to=to_frame;
         if get(planner_bt(1),'Value')==1 || get(planner_bt(2),'Value')==1
            if get(planner_bt(1),'Value')==1
            set(planner_bt(1),'Backgroundcolor','c');
            end
            for i=1:length(ND)
                if get(planner_bt(2),'Value')==0
                [f00,f01,f02,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,f19,f20,fle,fre] = FK_T3_1(LL,RL,LH,RH,NY,ND(i),DIP,COM_POS);
                PLOT_T3_1(f00,f01,f02,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,f19,f20,fle,fre,DISP_FRAMES,1); 
                view([plot_az,plot_el]); 
                pause(0.0001);
                end
                if get(planner_bt(2),'Value')==1
                NP_S{from+i-1}=ND(i);
                show_assigned_frames_callback(ax2,link,from,to);
                end
            end
            
         end   
         set(planner_bt(1),'Backgroundcolor',[0.94 0.94 0.94]);
end  
        
if get(DISP_PATH,'Value')==1
             hold on;
             plot3(LH_P(:,1),LH_P(:,2),LH_P(:,3));
             plot3(RH_P(:,1),RH_P(:,2),RH_P(:,3));
             plot3(LL_P(:,1),LL_P(:,2),LL_P(:,3));
             plot3(RL_P(:,1),RL_P(:,2),RL_P(:,3));
end

else
    set(status_text,'String','INPUT FRAMES!!!','Position',[0.05,0.0,0.13,0.02],'Backgroundcolor','w');
end
%^end of switch case
set(gca, 'XColor', [1 1 1]);
set(gca, 'YColor', [1 1 1]);
set(gca, 'ZColor', [1 1 1]);

%DEFAULT PLOT 
if get(planner_bt(1),'Value')==0 || get(DISP_PATH,'Value')==0
LL=[0 0 0 0 0];
RL=[0 0 0 0 0];
LH=[0 0 0];
RH=[0 0 0];
COM_POS=[0 0 0];
DIP=0;
DISP_FRAMES=0;
[f00,f01,f02,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,f19,f20,fle,fre] = FK_T3_1(LL,RL,LH,RH,NY,NP,DIP,COM_POS);
PLOT_T3_1(f00,f01,f02,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,f19,f20,fle,fre,DISP_FRAMES,1);    
view([plot_az,plot_el]); 
end

%SAVE GLOBAL FRAME (CELL DATA)
set(gca, 'XColor', [1 1 1]);
set(gca, 'YColor', [1 1 1]);
set(gca, 'ZColor', [1 1 1]);


end

