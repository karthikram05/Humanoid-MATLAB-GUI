clear all
close all

global status_text FRAMES DISP_PATH plot_az plot_el ax2 COLISN link_color

%DEFUALT VIEW 
plot_az = 70;
plot_el = 36;

[I]=imread('img8.png'); %background image
%bt1_img = imread('bt1.png');
%creating figure

MAIN_FIG=figure('units','normalized','Name','NINO','color',[1 1 1],'outerposition',[0 0 1 1],'GraphicsSmoothing','on','Color',[0 0 0]);

%needs to be fixed %this part is fucked
%main axis to contain background image
% main_ax =axes('units','normalized','position',[0 0 1 1]);
%imshow(I,'Border','tight');
% rotate3d(main_ax,'off');

%axis to contain frame data
ax2=axes('units','normalized','position',[0.15 0.03 0.83 0.08]);
%axis to contain fk plot
ax1=axes('units','normalized','position',[0.37,0.15,0.8,0.8]);

rotate3d(ax1,'off');
rotate3d(ax2,'off');

%HEADER 
MAIN_TEXT1 = uicontrol('units','normalized','Style','text','Position',[0.35 0.95 0.3 0.05],'String','NINO MOTION PLANNER','Fontsize',25,'Foregroundcolor','w','Backgroundcolor','k');

%FRAMES IN ACTION
MAIN_TEXT2 = uicontrol('units','normalized','Style','text','Position',[0.0 0.93 0.07 0.05],'String','FRAMES','Fontsize',19,'Backgroundcolor','w');
FRAMES = uicontrol('units','normalized','Style','Edit','Position',[0.08 0.93 0.02 0.05],'String','0');

%COLLISIONS TOGGLE
COLISN = uicontrol('units','normalized','Style','toggle','Position',[0.93 0.85 0.07 0.05],'String','COLLISIONS','Backgroundcolor','w');

%VELOCITY PLAN
VEL = uicontrol('units','normalized','Style','pushbutton','Position',[0.93 0.75 0.07 0.05],'String','VELOCITY PLAN','Backgroundcolor','w');

%PLANNING TOGGLE BUTTONS
bsx1=0.07;
bsy1=0.05;
BP(1) = uicontrol('units','normalized','String','PLAN LEFT HAND','Style','pushbutton','Position',[0,0.85,bsx1,bsy1],'Backgroundcolor','w');
BP(2) = uicontrol('units','normalized','String','PLAN RIGHT HAND','Style','pushbutton','Position',[0,0.75,bsx1,bsy1],'Backgroundcolor','w');
BP(3) = uicontrol('units','normalized','String','PLAN LEFT LEG','Style','pushbutton','Position',[0,0.65,bsx1,bsy1],'Backgroundcolor','w');
BP(4) = uicontrol('units','normalized','String','PLAN RIGHT LEG','Style','pushbutton','Position',[0,0.55,bsx1,bsy1],'Backgroundcolor','w');
BP(5) = uicontrol('units','normalized','String','PLAN COM','Style','pushbutton','Position',[0,0.45,bsx1,bsy1],'Backgroundcolor','w');
BP(6) = uicontrol('units','normalized','String','PLAN NECK YAW','Style','pushbutton','Position',[0,0.35,bsx1,bsy1],'Backgroundcolor','w');
BP(7) = uicontrol('units','normalized','String','PLAN NECK PITCH','Style','pushbutton','Position',[0,0.25,bsx1,bsy1],'Backgroundcolor','w');

%SET FRAME RATE
SET_FRAME_RATE = uicontrol('units','normalized','String','SET FRAME RATE','Style','pushbutton','Position',[0,0.15,0.07,bsy1],'Backgroundcolor','w');
FRAME_RATE = uicontrol('units','normalized','String','50','Style','Edit','Position',[0.08,0.15,0.02,0.05]);

%CLEAR ALL FRAMES
CLEAR_FRAMES = uicontrol('units','normalized','String','CLEAR ALL FRAMES','Style','pushbutton','Position',[0,0.05,0.1,bsy1],'Backgroundcolor','w');

ST = uicontrol('units','normalized','Style','text','String','STATUS :','Fontsize',10,'Position', [0.0,0.00,0.05,0.02]);
status_text = uicontrol('units','normalized','Style','text','String','READY TO PLAN','Fontsize',10,'Position', [0.05,0.0,0.07,0.02]);

bsx2=0.02;
bsy2=0.05;
CLEAR(1) = uicontrol('units','normalized','String','X','Style','toggle','Position',[0.08,0.85,bsx2,bsy2],'Backgroundcolor','w');
CLEAR(2) = uicontrol('units','normalized','String','X','Style','toggle','Position',[0.08,0.75,bsx2,bsy2],'Backgroundcolor','w');
CLEAR(3) = uicontrol('units','normalized','String','X','Style','toggle','Position',[0.08,0.65,bsx2,bsy2],'Backgroundcolor','w');
CLEAR(4) = uicontrol('units','normalized','String','X','Style','toggle','Position',[0.08,0.55,bsx2,bsy2],'Backgroundcolor','w');
CLEAR(5) = uicontrol('units','normalized','String','X','Style','toggle','Position',[0.08,0.45,bsx2,bsy2],'Backgroundcolor','w');
CLEAR(6) = uicontrol('units','normalized','String','X','Style','toggle','Position',[0.08,0.35,bsx2,bsy2],'Backgroundcolor','w');
CLEAR(7) = uicontrol('units','normalized','String','X','Style','toggle','Position',[0.08,0.25,bsx2,bsy2],'Backgroundcolor','w');

%MOTION PLANNING PANEL 
PLANNER = uipanel('Parent',MAIN_FIG,'units','normalized','Title','MOTION PLANNING PANEL','Fontsize',10,'Position',[0.15,0.15,0.4,0.75],'Backgroundcolor','w');

%MOTION PLANNING STANDARD SHAPES MENU
SHAPES_MENU=uicontrol('Style','popup',...
                          'Parent',PLANNER,...
                          'units','normalized',...
                           'String',{'point','circle','line segment','triangle','square','rectangle','absolute','sin','cos','tan','helix','spiral','helix-spiral','arc','parabola','ellipse','multi-point segment','polynomial'},...
                           'Position', [.02 .9 .15 .05],...
                           'Visible','on');
                       
FILL_FRAMES=uicontrol('units','normalized','String','FILL FRAMES','Style','pushbutton','Parent',PLANNER,'position',[0.18 0.91 .12 0.04]);
DISP_PATH=uicontrol('units','normalized','String','DISP PATH','Style','toggle','Parent',PLANNER,'position',[0.31 0.91 .11 0.04]);

%SET_VIEW=uicontrol('units','normalized','String','DISP PATH','Style','pushbutton','Parent',MAIN_FIG,'position',[0.31 0.91 .11 0.04]);


%MOTION PLANNING STANDARD SHAPES PANELS
SHAPES_PANEL(1) =uipanel('Parent',PLANNER,'units','normalized','Position',[0.02 0.4 0.4 0.5],'Title','POINT');
SHAPES_PANEL(2) =uipanel('Parent',PLANNER,'units','normalized','Position',[0.02 0.4 0.4 0.5],'Title','CIRCLE');
SHAPES_PANEL(3) =uipanel('Parent',PLANNER,'units','normalized','Position',[0.02 0.4 0.4 0.5],'Title','LINE SEGMENT');
SHAPES_PANEL(4) =uipanel('Parent',PLANNER,'units','normalized','Position',[0.02 0.4 0.4 0.5],'Title','TRIANGLE');
SHAPES_PANEL(5) =uipanel('Parent',PLANNER,'units','normalized','Position',[0.02 0.4 0.4 0.5],'Title','SQAURE');
SHAPES_PANEL(6) =uipanel('Parent',PLANNER,'units','normalized','Position',[0.02 0.4 0.4 0.5],'Title','RECTANGLE');
SHAPES_PANEL(7) =uipanel('Parent',PLANNER,'units','normalized','Position',[0.02 0.4 0.4 0.5],'Title','ABSOLUTE');
SHAPES_PANEL(8) =uipanel('Parent',PLANNER,'units','normalized','Position',[0.02 0.4 0.4 0.5],'Title','sin');
SHAPES_PANEL(9) =uipanel('Parent',PLANNER,'units','normalized','Position',[0.02 0.4 0.4 0.5],'Title','cos');
SHAPES_PANEL(10)=uipanel('Parent',PLANNER,'units','normalized','Position',[0.02 0.4 0.4 0.5],'Title','tan');
SHAPES_PANEL(11)=uipanel('Parent',PLANNER,'units','normalized','Position',[0.02 0.4 0.4 0.5],'Title','helix');
SHAPES_PANEL(12)=uipanel('Parent',PLANNER,'units','normalized','Position',[0.02 0.4 0.4 0.5],'Title','spiral');
SHAPES_PANEL(13)=uipanel('Parent',PLANNER,'units','normalized','Position',[0.02 0.4 0.4 0.5],'Title','helix spiral');
SHAPES_PANEL(14)=uipanel('Parent',PLANNER,'units','normalized','Position',[0.02 0.4 0.4 0.5],'Title','arc');
SHAPES_PANEL(15)=uipanel('Parent',PLANNER,'units','normalized','Position',[0.02 0.4 0.4 0.5],'Title','parabola');
SHAPES_PANEL(16)=uipanel('Parent',PLANNER,'units','normalized','Position',[0.02 0.4 0.4 0.5],'Title','elipse');
SHAPES_PANEL(17)=uipanel('Parent',PLANNER,'units','normalized','Position',[0.02 0.4 0.4 0.5],'Title','multi-point segment');
SHAPES_PANEL(18)=uipanel('Parent',PLANNER,'units','normalized','Position',[0.02 0.4 0.4 0.5],'Title','polynomail');
SHAPES_PANEL(19)=uipanel('Parent',PLANNER,'units','normalized','Position',[0.02 0.4 0.4 0.5],'Title','NECK YAW PLANNING'); %changed to 20
SHAPES_PANEL(20)=uipanel('Parent',PLANNER,'units','normalized','Position',[0.02 0.4 0.4 0.5],'Title','NECK PITCH PLANNING'); %changed to 21
SHAPES_PANEL(21)=uipanel('Parent',PLANNER,'units','normalized','Position',[0.02 0.4 0.4 0.5],'Title','SELECT ANY STANDARD SHAPE'); %changed to 22

set(SHAPES_PANEL,'Backgroundcolor','w');

%MOTION PLANNING PANEL SLIDERS
ROT(1) = uicontrol('units','normalized','Parent',PLANNER,'Style','slider','Min',-2*pi,'Max',2*pi,'Value',0,'Position', [0.60,0.90,0.3,0.03]);
ROT(2) = uicontrol('units','normalized','Parent',PLANNER,'Style','slider','Min',-2*pi,'Max',2*pi,'Value',0,'Position', [0.60,0.82,0.3,0.03]);
ROT(3) = uicontrol('units','normalized','Parent',PLANNER,'Style','slider','Min',-2*pi,'Max',2*pi,'Value',0,'Position', [0.60,0.74,0.3,0.03]);
TRANS(1) = uicontrol('units','normalized','Parent',PLANNER,'Style','slider','Min',-100,'Max',100,'Value',0,'Position', [0.60,0.66,0.3,0.03]);
TRANS(2) = uicontrol('units','normalized','Parent',PLANNER,'Style','slider','Min',-100,'Max',100,'Value',0,'Position', [0.60,0.58,0.3,0.03]);
TRANS(3) = uicontrol('units','normalized','Parent',PLANNER,'Style','slider','Min',-100,'Max',100,'Value',0,'Position', [0.60,0.50,0.3,0.03]);
SCALE = uicontrol('units','normalized','Parent',PLANNER,'Style','slider','Min',1,'Max',10,'Value',1,'Position',        [0.60,0.42,0.3,0.03]);

%MOTION PLANNING PANEL SLIDERS STATIC TEXT

panel_text(1) = uicontrol('units','normalized','Parent',PLANNER,'Style','text','String','ROTATE X','Position',    [0.43,0.90,0.15,0.03]);
panel_text(2) = uicontrol('units','normalized','Parent',PLANNER,'Style','text','String','ROTATE Y','Position',    [0.43,0.82,0.15,0.03]);
panel_text(3) = uicontrol('units','normalized','Parent',PLANNER,'Style','text','String','ROTATE Z','Position',    [0.43,0.74,0.15,0.03]);
panel_text(4) = uicontrol('units','normalized','Parent',PLANNER,'Style','text','String','TRANSLATE X','Position', [0.43,0.66,0.15,0.03]);
panel_text(5) = uicontrol('units','normalized','Parent',PLANNER,'Style','text','String','TRANSLATE Y','Position', [0.43,0.58,0.15,0.03]);
panel_text(6) = uicontrol('units','normalized','Parent',PLANNER,'Style','text','String','TRANSLATE Z','Position', [0.43,0.50,0.15,0.03]);
panel_text(7) = uicontrol('units','normalized','Parent',PLANNER,'Style','text','String','SCALE','Position',       [0.43,0.42,0.15,0.03]);
set(panel_text,'Backgroundcolor','w');

%MOTION PLANNING PANEL CONTROL BUTTONS
PLANNER_BUTTON(1) = uicontrol('units','normalized','Parent',PLANNER,'Style','pushbutton','String','EXECUTE LINK ACTION','Position',[0.015,0.35,0.25,0.04]);
PLANNER_BUTTON(2) = uicontrol('units','normalized','Parent',PLANNER,'Style','pushbutton','String','SAVE LINK ACTION','Position',   [0.015,0.30,0.25,0.04]);
PLANNER_BUTTON(3) = uicontrol('units','normalized','Parent',PLANNER,'Style','pushbutton','String','PLAY ON MATLAB','Position',     [0.015,0.25,0.25,0.04]);
PLANNER_BUTTON(4) = uicontrol('units','normalized','Parent',PLANNER,'Style','pushbutton','String','PLAY ON VREP','Position',       [0.015,0.20,0.25,0.04]);
PLANNER_BUTTON(5) = uicontrol('units','normalized','Parent',PLANNER,'Style','pushbutton','String','NEUTRAL','Position',            [0.015,0.15,0.25,0.04]);
PLANNER_BUTTON(6) = uicontrol('units','normalized','Parent',PLANNER,'Style','pushbutton','String','PLAY ON NINO','Position',       [0.015,0.10,0.25,0.04]);
PLANNER_BUTTON(7) = uicontrol('units','normalized','Parent',PLANNER,'Style','pushbutton','String','SAVE FULL ACTION','Position',   [0.015,0.05,0.25,0.04]);
PLANNER_BUTTON(8) = uicontrol('units','normalized','Parent',PLANNER,'Style','pushbutton','String','LOAD ACTION','Position',        [0.015,0.00,0.25,0.04]);

%NECK MOTION PLANING CONTROL
%NECK YAW MOTOR
NY(1) = uicontrol('units','normalized','Parent',SHAPES_PANEL(19),'Style','slider','Min',-30,'Max',30,'Value',0,'Position',  [0.01,0.8,0.8,0.07]);
NY(2) = uicontrol('units','normalized','Parent',SHAPES_PANEL(19),'Style','slider','Min',-30,'Max',30,'Value',0,'Position',  [0.01,0.4,0.8,0.07]);
NY(3) = uicontrol('units','normalized','Parent',SHAPES_PANEL(19),'Style','edit','String','0','Position',[0.3,0.65,0.2,0.08]);
NY(4) = uicontrol('units','normalized','Parent',SHAPES_PANEL(19),'Style','edit','String','0','Position',[0.3,0.25,0.2,0.08]);

NY(5) = uicontrol('units','normalized','Parent',SHAPES_PANEL(19),'Style','text','String','0','Position',[0.85,0.8,0.13,0.08],'Backgroundcolor','w');
NY(6) = uicontrol('units','normalized','Parent',SHAPES_PANEL(19),'Style','text','String','0','Position',[0.85,0.4,0.13,0.08],'Backgroundcolor','w');
NY(7) = uicontrol('units','normalized','Parent',SHAPES_PANEL(19),'Style','text','String','FROM','Position',[0.43,0.9,0.13,0.08],'Backgroundcolor','w');
NY(8) = uicontrol('units','normalized','Parent',SHAPES_PANEL(19),'Style','text','String','TO','Position',[0.43,0.5,0.13,0.08],'Backgroundcolor','w');

%NECK PITCH MOTOR
NP(1) = uicontrol('units','normalized','Parent',SHAPES_PANEL(20),'Style','slider','Min',-30,'Max',30,'Value',0,'Position', [0.01,0.8,0.8,0.07]);
NP(2) = uicontrol('units','normalized','Parent',SHAPES_PANEL(20),'Style','slider','Min',-30,'Max',30,'Value',0,'Position', [0.01,0.4,0.8,0.07]);
NP(3) = uicontrol('units','normalized','Parent',SHAPES_PANEL(20),'Style','edit','String','0','Position',[0.3,0.65,0.2,0.08]);
NP(4) = uicontrol('units','normalized','Parent',SHAPES_PANEL(20),'Style','edit','String','0','Position',[0.3,0.25,0.2,0.08]);

NP(5) = uicontrol('units','normalized','Parent',SHAPES_PANEL(20),'Style','text','String','0','Position',[0.85,0.8,0.13,0.08],'Backgroundcolor','w');
NP(6) = uicontrol('units','normalized','Parent',SHAPES_PANEL(20),'Style','text','String','0','Position',[0.85,0.4,0.13,0.08],'Backgroundcolor','w');
NP(7) = uicontrol('units','normalized','Parent',SHAPES_PANEL(20),'Style','text','String','FROM','Position',[0.43,0.9,0.13,0.08],'Backgroundcolor','w');
NP(8) = uicontrol('units','normalized','Parent',SHAPES_PANEL(20),'Style','text','String','TO','Position',[0.43,0.5,0.13,0.08],'Backgroundcolor','w');

% %SET VIEW
% SET_VIEW = uicontrol('units','normalized','Parent',MAIN_FIG,'Style','pushbutton','String','SET VIEW','Position',[0.57,0.15,0.08,0.03],'Backgroundcolor','w');

%SETTING CALLBACKS
set(SHAPES_MENU,'Callback',{@standard_shapes_callback,SHAPES_PANEL,FRAMES,TRANS,ROT,SCALE});

set(ROT,'Callback',{@load_shape_callback,BP,SHAPES_MENU,SHAPES_PANEL,ROT,TRANS,SCALE,PLANNER_BUTTON});
set(TRANS,'Callback',{@load_shape_callback,BP,SHAPES_MENU,SHAPES_PANEL,ROT,TRANS,SCALE,PLANNER_BUTTON});
set(SCALE,'Callback',{@load_shape_callback,BP,SHAPES_MENU,SHAPES_PANEL,ROT,TRANS,SCALE,PLANNER_BUTTON});

set(BP,'Callback',{@load_shape_callback,BP,SHAPES_MENU,SHAPES_PANEL,ROT,TRANS,SCALE,PLANNER_BUTTON});
set(DISP_PATH,'Callback',{@load_shape_callback,BP,SHAPES_MENU,SHAPES_PANEL,ROT,TRANS,SCALE,PLANNER_BUTTON});

set(PLANNER_BUTTON(1),'Callback',{@load_shape_callback,BP,SHAPES_MENU,SHAPES_PANEL,ROT,TRANS,SCALE,PLANNER_BUTTON});
set(PLANNER_BUTTON(2),'Callback',{@load_shape_callback,BP,SHAPES_MENU,SHAPES_PANEL,ROT,TRANS,SCALE,PLANNER_BUTTON});
set(PLANNER_BUTTON(3),'Callback',@play_nino_matlab_callback);
set(PLANNER_BUTTON(4),'Callback',@vrepplay_callback);
set(PLANNER_BUTTON(5),'Callback',@neutral_callback);
set(PLANNER_BUTTON(6),'Callback',@play_on_nino_callback);
set(PLANNER_BUTTON(7),'Callback',@save_action_callback);
set(PLANNER_BUTTON(8),'Callback',@load_action_callback);

set(CLEAR_FRAMES,'Callback',{@clear_frames_callback,ax2});
set(FRAMES,'Callback',{@assign_frames_callback,ax2});

set(NY,'Callback',{@load_shape_callback,BP,SHAPES_MENU,SHAPES_PANEL,ROT,TRANS,SCALE,PLANNER_BUTTON});
set(NP,'Callback',{@load_shape_callback,BP,SHAPES_MENU,SHAPES_PANEL,ROT,TRANS,SCALE,PLANNER_BUTTON});

set(COLISN,'Callback',@collisions_toggle_callback);
set(VEL,'Callback',@joint_velocity_check);

%set(SET_VIEW,'Callback',@set_view_callback);

%NINO DEFAULT STATE PLOT   
link_color = 'kkkkkkkkkkkkkkkkkkkk';
LL=[0 0 0 0 0];
RL=[0 0 0 0 0];
LH=[0 0 0];
RH=[0 0 0];
COM_POS=[0 0 0];
DIP=0;
DISP_FRAMES=1;
NY=0;
NP=0;
[f00,f01,f02,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,f19,f20,fle,fre] = FK_T3_1(LL,RL,LH,RH,NY,NP,DIP,COM_POS);
PLOT_T3_1(f00,f01,f02,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,f19,f20,fle,fre,DISP_FRAMES,1);    
%setting to default view
view([plot_az,plot_el]); 

set(gca, 'XColor', [1 1 1]);
set(gca, 'YColor', [1 1 1]);
set(gca, 'ZColor', [1 1 1]);

%set(ax1,'Callback',@axes_callback)
