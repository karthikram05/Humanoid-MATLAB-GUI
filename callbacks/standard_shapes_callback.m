function [x] = standard_shapes_callback(hObject,eventdata,panel,FRAMES,TRANS,ROT,SCALE)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%SETTING ALL SLIDER VALUES TO ZERO
for i=1:3
set(TRANS(i),'Value',0);
set(ROT(i),'Value',0);
end
set(SCALE,'Value',1);

%SETTING ALL PANEL VISIBILITY OFF
for i=1:length(panel)
set(panel(i),'Visible','off');
end

%SETTING SELECTED PANEL VISIBILITY ON
set(panel(hObject.Value),'Visible','on');
%STANDARD SHAPES PANEL INPUT DEF

%PANEL DEF FOR POINT
point(1)=uicontrol('Parent',panel(1),'units','normalized','Style','text','Position',[0.0 0.8 0.3 0.1],'String','POINT');
point(2)=uicontrol('Parent',panel(1),'units','normalized','Style','text','Position',[0.0 0.6 0.3 0.1],'String','FROM');
point(3)=uicontrol('Parent',panel(1),'units','normalized','Style','text','Position',[0.0 0.4 0.3 0.1],'String','TO');

point(4)=uicontrol('Parent',panel(1),'units','normalized','Style','edit','Position',[0.5 0.8 0.4 0.1],'String','[0,0,0]');
point(5)=uicontrol('Parent',panel(1),'units','normalized','Style','edit','Position',[0.5 0.6 0.4 0.1],'String','1');
point(6)=uicontrol('Parent',panel(1),'units','normalized','Style','edit','Position',[0.5 0.4 0.4 0.1],'String',char(get(FRAMES,'String')));

%PANEL DEF FOR CIRCLE
circle(1)=uicontrol('Parent',panel(2),'units','normalized','Style','text','Position',[0.0 0.8 0.3 0.1],'String','RADIUS');
circle(2)=uicontrol('Parent',panel(2),'units','normalized','Style','text','Position',[0.0 0.6 0.3 0.1],'String','FROM');
circle(3)=uicontrol('Parent',panel(2),'units','normalized','Style','text','Position',[0.0 0.4 0.3 0.1],'String','TO');
circle(4)=uicontrol('Parent',panel(2),'units','normalized','Style','text','Position',[0.0 0.2 0.3 0.1],'String','TOGGLE DIRECTION');

circle(5)=uicontrol('Parent',panel(2),'units','normalized','Style','edit','Position',[0.5 0.8 0.4 0.1],'String','20');
circle(6)=uicontrol('Parent',panel(2),'units','normalized','Style','edit','Position',[0.5 0.6 0.4 0.1],'String','1');
circle(7)=uicontrol('Parent',panel(2),'units','normalized','Style','edit','Position',[0.5 0.4 0.4 0.1],'String',char(get(FRAMES,'String')));
circle(8)=uicontrol('Parent',panel(2),'units','normalized','Style','toggle','Position',[0.5 0.2 0.4 0.1],'String','TOGGLE');

%PANEL DEF FOR LINE SEGMENT
line(1)=uicontrol('Parent',panel(3),'units','normalized','Style','text','Position',[0.0 0.85 0.3 0.1],'String','POINT 1');
line(2)=uicontrol('Parent',panel(3),'units','normalized','Style','text','Position',[0.0 0.65 0.3 0.1],'String','POINT 2');
line(3)=uicontrol('Parent',panel(3),'units','normalized','Style','text','Position',[0.0 0.45 0.3 0.1],'String','FROM');
line(4)=uicontrol('Parent',panel(3),'units','normalized','Style','text','Position',[0.0 0.25 0.3 0.1],'String','TO');
line(5)=uicontrol('Parent',panel(3),'units','normalized','Style','text','Position',[0.0 0.05 0.3 0.1],'String','TOGGLE DIRECTION');

line(6)=uicontrol('Parent',panel(3),'units','normalized','Style','edit','Position',[0.5 0.85 0.4 0.1],'String','[0,0,0]');
line(7)=uicontrol('Parent',panel(3),'units','normalized','Style','edit','Position',[0.5 0.65 0.4 0.1],'String','[0,0,20]');
line(8)=uicontrol('Parent',panel(3),'units','normalized','Style','edit','Position',[0.5 0.45 0.4 0.1],'String','1');
line(9)=uicontrol('Parent',panel(3),'units','normalized','Style','edit','Position',[0.5 0.25 0.4 0.1],'String',char(get(FRAMES,'String')));
line(10)=uicontrol('Parent',panel(3),'units','normalized','Style','toggle','Position',[0.5 0.05 0.4 0.1],'String','TOGGLE');

%PANEL DEF FOR TRIANGLE
triangle(1)=uicontrol('Parent',panel(4),'units','normalized','Style','text','Position',[0.0 0.85 0.3 0.1],'String','POINT 1');
triangle(2)=uicontrol('Parent',panel(4),'units','normalized','Style','text','Position',[0.0 0.70 0.3 0.1],'String','POINT 2');
triangle(3)=uicontrol('Parent',panel(4),'units','normalized','Style','text','Position',[0.0 0.55 0.3 0.1],'String','POINT 3');
triangle(4)=uicontrol('Parent',panel(4),'units','normalized','Style','text','Position',[0.0 0.40 0.3 0.1],'String','FROM');
triangle(5)=uicontrol('Parent',panel(4),'units','normalized','Style','text','Position',[0.0 0.25 0.3 0.1],'String','TO');
triangle(6)=uicontrol('Parent',panel(4),'units','normalized','Style','text','Position',[0.0 0.10 0.3 0.1],'String','TOGGLE DIRECTION');

triangle(7)=uicontrol('Parent',panel(4),'units','normalized','Style','edit','Position',[0.5 0.85 0.4 0.1],'String','[0,0,0]');
triangle(8)=uicontrol('Parent',panel(4),'units','normalized','Style','edit','Position',[0.5 0.70 0.4 0.1],'String','[20,0,0]');
triangle(9)=uicontrol('Parent',panel(4),'units','normalized','Style','edit','Position',[0.5 0.55 0.4 0.1],'String','[20,0,0]');
triangle(10)=uicontrol('Parent',panel(4),'units','normalized','Style','edit','Position',[0.5 0.40 0.4 0.1],'String','1');
triangle(11)=uicontrol('Parent',panel(4),'units','normalized','Style','edit','Position',[0.5 0.25 0.4 0.1],'String',char(get(FRAMES,'String')));
triangle(12)=uicontrol('Parent',panel(4),'units','normalized','Style','toggle','Position',[0.5 0.10 0.4 0.1],'String','TOGGLE');

%PANEL DEF FOR SQUARE
square(1)=uicontrol('Parent',panel(5),'units','normalized','Style','text','Position',[0.0 0.8 0.3 0.1],'String','LENGTH');
square(2)=uicontrol('Parent',panel(5),'units','normalized','Style','text','Position',[0.0 0.6 0.3 0.1],'String','FROM');
square(3)=uicontrol('Parent',panel(5),'units','normalized','Style','text','Position',[0.0 0.4 0.3 0.1],'String','TO');
square(4)=uicontrol('Parent',panel(5),'units','normalized','Style','text','Position',[0.0 0.2 0.3 0.1],'String','TOGGLE DIRECTION');

square(5)=uicontrol('Parent',panel(5),'units','normalized','Style','edit','Position',[0.5 0.8 0.4 0.1],'String','20');
square(6)=uicontrol('Parent',panel(5),'units','normalized','Style','edit','Position',[0.5 0.6 0.4 0.1],'String','1');
square(7)=uicontrol('Parent',panel(5),'units','normalized','Style','edit','Position',[0.5 0.4 0.4 0.1],'String',char(get(FRAMES,'String')));
square(8)=uicontrol('Parent',panel(5),'units','normalized','Style','toggle','Position',[0.5 0.2 0.4 0.1],'String','TOGGLE');

%PANEL DEF FOR RECTANGLE
rectangle(1)=uicontrol('Parent',panel(6),'units','normalized','Style','text','Position',[0.0 0.85 0.3 0.1],'String','WIDTH');
rectangle(2)=uicontrol('Parent',panel(6),'units','normalized','Style','text','Position',[0.0 0.65 0.3 0.1],'String','HEIGHT');
rectangle(3)=uicontrol('Parent',panel(6),'units','normalized','Style','text','Position',[0.0 0.45 0.3 0.1],'String','FROM');
rectangle(4)=uicontrol('Parent',panel(6),'units','normalized','Style','text','Position',[0.0 0.25 0.3 0.1],'String','TO');
rectangle(5)=uicontrol('Parent',panel(6),'units','normalized','Style','text','Position',[0.0 0.05 0.3 0.1],'String','TOGGLE DIRECTION');

rectangle(6)=uicontrol('Parent',panel(6),'units','normalized','Style','edit','Position',[0.5 0.85 0.4 0.1],'String','20');
rectangle(7)=uicontrol('Parent',panel(6),'units','normalized','Style','edit','Position',[0.5 0.65 0.4 0.1],'String','40');
rectangle(8)=uicontrol('Parent',panel(6),'units','normalized','Style','edit','Position',[0.5 0.45 0.4 0.1],'String','1');
rectangle(9)=uicontrol('Parent',panel(6),'units','normalized','Style','edit','Position',[0.5 0.25 0.4 0.1],'String',char(get(FRAMES,'String')));
rectangle(10)=uicontrol('Parent',panel(6),'units','normalized','Style','toggle','Position',[0.5 0.05 0.4 0.1],'String','TOGGLE');

%PANEL DEF FOR ABSOLUTE
absolute(1)=uicontrol('Parent',panel(7),'units','normalized','Style','text','Position',[0.0 0.8 0.3 0.1],'String','VALUE');
absolute(2)=uicontrol('Parent',panel(7),'units','normalized','Style','text','Position',[0.0 0.6 0.3 0.1],'String','FROM');
absolute(3)=uicontrol('Parent',panel(7),'units','normalized','Style','text','Position',[0.0 0.4 0.3 0.1],'String','TO');
absolute(4)=uicontrol('Parent',panel(7),'units','normalized','Style','text','Position',[0.0 0.2 0.3 0.1],'String','TOGGLE DIRECTION');

absolute(4)=uicontrol('Parent',panel(7),'units','normalized','Style','edit','Position',[0.5 0.8 0.4 0.1],'String','20');
absolute(5)=uicontrol('Parent',panel(7),'units','normalized','Style','edit','Position',[0.5 0.6 0.4 0.1],'String','1');
absolute(6)=uicontrol('Parent',panel(7),'units','normalized','Style','edit','Position',[0.5 0.4 0.4 0.1],'String',char(get(FRAMES,'String')));
rectangle(10)=uicontrol('Parent',panel(7),'units','normalized','Style','toggle','Position',[0.5 0.2 0.4 0.1],'String','TOGGLE');

%PANEL DEF FOR SIN
sin(1)=uicontrol('Parent',panel(8),'units','normalized','Style','text','Position',[0.0 0.85 0.3 0.1],'String','MAGNITUDE');
sin(2)=uicontrol('Parent',panel(8),'units','normalized','Style','text','Position',[0.0 0.65 0.3 0.1],'String','CYCLE(S)');
sin(3)=uicontrol('Parent',panel(8),'units','normalized','Style','text','Position',[0.0 0.45 0.3 0.1],'String','FROM');
sin(4)=uicontrol('Parent',panel(8),'units','normalized','Style','text','Position',[0.0 0.25 0.3 0.1],'String','TO');
sin(5)=uicontrol('Parent',panel(8),'units','normalized','Style','text','Position',[0.0 0.05 0.3 0.1],'String','TOGGLE DIRECTION');

sin(6)=uicontrol('Parent',panel(8),'units','normalized','Style','edit','Position',[0.5 0.85 0.4 0.1],'String','20');
sin(7)=uicontrol('Parent',panel(8),'units','normalized','Style','edit','Position',[0.5 0.65 0.4 0.1],'String','1');
sin(8)=uicontrol('Parent',panel(8),'units','normalized','Style','edit','Position',[0.5 0.45 0.4 0.1],'String','1');
sin(9)=uicontrol('Parent',panel(8),'units','normalized','Style','edit','Position',[0.5 0.25 0.4 0.1],'String',char(get(FRAMES,'String')));
sin(10)=uicontrol('Parent',panel(8),'units','normalized','Style','toggle','Position',[0.5 0.05 0.4 0.1],'String','TOGGLE');

%PANEL DEF FOR COS
cos(1)=uicontrol('Parent',panel(9),'units','normalized','Style','text','Position',[0.0 0.85 0.3 0.1],'String','MAGNITUDE');
cos(2)=uicontrol('Parent',panel(9),'units','normalized','Style','text','Position',[0.0 0.65 0.3 0.1],'String','CYCLE(S)');
cos(3)=uicontrol('Parent',panel(9),'units','normalized','Style','text','Position',[0.0 0.45 0.3 0.1],'String','FROM');
cos(4)=uicontrol('Parent',panel(9),'units','normalized','Style','text','Position',[0.0 0.25 0.3 0.1],'String','TO');
cos(5)=uicontrol('Parent',panel(9),'units','normalized','Style','text','Position',[0.0 0.05 0.3 0.1],'String','TOGGLE DIRECTION');

cos(6)=uicontrol('Parent',panel(9),'units','normalized','Style','edit','Position',[0.5 0.85 0.4 0.1],'String','20');
cos(7)=uicontrol('Parent',panel(9),'units','normalized','Style','edit','Position',[0.5 0.65 0.4 0.1],'String','1');
cos(8)=uicontrol('Parent',panel(9),'units','normalized','Style','edit','Position',[0.5 0.45 0.4 0.1],'String','1');
cos(9)=uicontrol('Parent',panel(9),'units','normalized','Style','edit','Position',[0.5 0.25 0.4 0.1],'String',char(get(FRAMES,'String')));
cos(10)=uicontrol('Parent',panel(9),'units','normalized','Style','toggle','Position',[0.5 0.05 0.4 0.1],'String','TOGGLE');

%PANEL DEF FOR TAN
tan(1)=uicontrol('Parent',panel(10),'units','normalized','Style','text','Position',[0.0 0.85 0.3 0.1],'String','MAGNITUDE');
tan(2)=uicontrol('Parent',panel(10),'units','normalized','Style','text','Position',[0.0 0.65 0.3 0.1],'String','CYCLE(S)');
tan(3)=uicontrol('Parent',panel(10),'units','normalized','Style','text','Position',[0.0 0.45 0.3 0.1],'String','FROM');
tan(4)=uicontrol('Parent',panel(10),'units','normalized','Style','text','Position',[0.0 0.25 0.3 0.1],'String','TO');
tan(5)=uicontrol('Parent',panel(10),'units','normalized','Style','text','Position',[0.0 0.05 0.3 0.1],'String','TOGGLE DIRECTION');

tan(6)=uicontrol('Parent',panel(10),'units','normalized','Style','edit','Position',[0.5 0.85 0.4 0.1],'String','20');
tan(7)=uicontrol('Parent',panel(10),'units','normalized','Style','edit','Position',[0.5 0.65 0.4 0.1],'String','1');
tan(8)=uicontrol('Parent',panel(10),'units','normalized','Style','edit','Position',[0.5 0.45 0.4 0.1],'String','1');
tan(9)=uicontrol('Parent',panel(10),'units','normalized','Style','edit','Position',[0.5 0.25 0.4 0.1],'String',char(get(FRAMES,'String')));
tan(10)=uicontrol('Parent',panel(10),'units','normalized','Style','toggle','Position',[0.5 0.05 0.4 0.1],'String','TOGGLE');

%PANEL DEF FOR HELIX
helix(1)=uicontrol('Parent',panel(11),'units','normalized','Style','text','Position',[0.0 0.85 0.3 0.1],'String','LENGTH');
helix(2)=uicontrol('Parent',panel(11),'units','normalized','Style','text','Position',[0.0 0.70 0.3 0.1],'String','RADIUS');
helix(3)=uicontrol('Parent',panel(11),'units','normalized','Style','text','Position',[0.0 0.55 0.3 0.1],'String','CYCLES');
helix(4)=uicontrol('Parent',panel(11),'units','normalized','Style','text','Position',[0.0 0.40 0.3 0.1],'String','FROM');
helix(5)=uicontrol('Parent',panel(11),'units','normalized','Style','text','Position',[0.0 0.25 0.3 0.1],'String','TO');
helix(6)=uicontrol('Parent',panel(11),'units','normalized','Style','text','Position',[0.0 0.10 0.3 0.1],'String','TOGGLE DIRECTION');

helix(7)=uicontrol('Parent',panel(11),'units','normalized','Style','edit','Position',[0.5 0.85 0.4 0.1],'String','20');
helix(8)=uicontrol('Parent',panel(11),'units','normalized','Style','edit','Position',[0.5 0.70 0.4 0.1],'String','10');
helix(9)=uicontrol('Parent',panel(11),'units','normalized','Style','edit','Position',[0.5 0.55 0.4 0.1],'String','2');
helix(10)=uicontrol('Parent',panel(11),'units','normalized','Style','edit','Position',[0.5 0.40 0.4 0.1],'String','1');
helix(11)=uicontrol('Parent',panel(11),'units','normalized','Style','edit','Position',[0.5 0.25 0.4 0.1],'String',char(get(FRAMES,'String')));
helix(12)=uicontrol('Parent',panel(11),'units','normalized','Style','toggle','Position',[0.5 0.10 0.4 0.1],'String','TOGGLE');

%PANEL DEF FOR SPIRAL
spiral(1)=uicontrol('Parent',panel(12),'units','normalized','Style','text','Position',[0.0 0.85 0.3 0.1],'String','RADIUS');
spiral(2)=uicontrol('Parent',panel(12),'units','normalized','Style','text','Position',[0.0 0.65 0.3 0.1],'String','CYCLE(S)');
spiral(3)=uicontrol('Parent',panel(12),'units','normalized','Style','text','Position',[0.0 0.45 0.3 0.1],'String','FROM');
spiral(4)=uicontrol('Parent',panel(12),'units','normalized','Style','text','Position',[0.0 0.25 0.3 0.1],'String','TO');
spiral(5)=uicontrol('Parent',panel(12),'units','normalized','Style','text','Position',[0.0 0.05 0.3 0.1],'String','TOGGLE DIRECTION');

spiral(6)=uicontrol('Parent',panel(12),'units','normalized','Style','edit','Position',[0.5 0.85 0.4 0.1],'String','20');
spiral(7)=uicontrol('Parent',panel(12),'units','normalized','Style','edit','Position',[0.5 0.65 0.4 0.1],'String','2');
spiral(8)=uicontrol('Parent',panel(12),'units','normalized','Style','edit','Position',[0.5 0.45 0.4 0.1],'String','1');
spiral(9)=uicontrol('Parent',panel(12),'units','normalized','Style','edit','Position',[0.5 0.25 0.4 0.1],'String',char(get(FRAMES,'String')));
spiral(10)=uicontrol('Parent',panel(12),'units','normalized','Style','toggle','Position',[0.5 0.05 0.4 0.1],'String','TOGGLE');

%PANEL DEF FOR HELIX-SPIRAL
helix_spiral(1)=uicontrol('Parent',panel(13),'units','normalized','Style','text','Position',[0.0 0.85 0.3 0.1],'String','LENGTH');
helix_spiral(2)=uicontrol('Parent',panel(13),'units','normalized','Style','text','Position',[0.0 0.70 0.3 0.1],'String','RADIUS');
helix_spiral(3)=uicontrol('Parent',panel(13),'units','normalized','Style','text','Position',[0.0 0.55 0.3 0.1],'String','CYCLES');
helix_spiral(4)=uicontrol('Parent',panel(13),'units','normalized','Style','text','Position',[0.0 0.40 0.3 0.1],'String','FROM');
helix_spiral(5)=uicontrol('Parent',panel(13),'units','normalized','Style','text','Position',[0.0 0.25 0.3 0.1],'String','TO');
helix_spiral(6)=uicontrol('Parent',panel(13),'units','normalized','Style','text','Position',[0.0 0.10 0.3 0.1],'String','TOGGLE DIRECTION');

helix_spiral(7)=uicontrol('Parent',panel(13),'units','normalized','Style','edit','Position',[0.5 0.85 0.4 0.1],'String','20');
helix_spiral(8)=uicontrol('Parent',panel(13),'units','normalized','Style','edit','Position',[0.5 0.70 0.4 0.1],'String','10');
helix_spiral(9)=uicontrol('Parent',panel(13),'units','normalized','Style','edit','Position',[0.5 0.55 0.4 0.1],'String','2');
helix_spiral(10)=uicontrol('Parent',panel(13),'units','normalized','Style','edit','Position',[0.5 0.40 0.4 0.1],'String','1');
helix_spiral(11)=uicontrol('Parent',panel(13),'units','normalized','Style','edit','Position',[0.5 0.25 0.4 0.1],'String',char(get(FRAMES,'String')));
helix_spiral(12)=uicontrol('Parent',panel(13),'units','normalized','Style','toggle','Position',[0.5 0.10 0.4 0.1],'String','TOGGLE');

%PANEL DEF FOR ARC
arc(1)=uicontrol('Parent',panel(14),'units','normalized','Style','text','Position',[0.0 0.85 0.3 0.1],'String','ANGLE');
arc(2)=uicontrol('Parent',panel(14),'units','normalized','Style','text','Position',[0.0 0.70 0.3 0.1],'String','RADIUS');
arc(3)=uicontrol('Parent',panel(14),'units','normalized','Style','text','Position',[0.0 0.55 0.3 0.1],'String','FROM');
arc(4)=uicontrol('Parent',panel(14),'units','normalized','Style','text','Position',[0.0 0.40 0.3 0.1],'String','TO');
arc(5)=uicontrol('Parent',panel(14),'units','normalized','Style','text','Position',[0.0 0.25 0.3 0.1],'String','TOGGLE DIRECTION');

arc(6)=uicontrol('Parent',panel(14),'units','normalized','Style','edit','Position',[0.5 0.85 0.4 0.1],'String','20');
arc(7)=uicontrol('Parent',panel(14),'units','normalized','Style','edit','Position',[0.5 0.70 0.4 0.1],'String','10');
arc(8)=uicontrol('Parent',panel(14),'units','normalized','Style','edit','Position',[0.5 0.55 0.4 0.1],'String','1');
arc(9)=uicontrol('Parent',panel(14),'units','normalized','Style','edit','Position',[0.5 0.40 0.4 0.1],'String',char(get(FRAMES,'String')));
arc(10)=uicontrol('Parent',panel(14),'units','normalized','Style','toggle','Position',[0.5 0.25 0.4 0.1],'String','TOGGLE');

%PANEL DEF FOR PARABOLA
parabola(1)=uicontrol('Parent',panel(15),'units','normalized','Style','text','Position',[0.0 0.85 0.3 0.1],'String','y');
parabola(2)=uicontrol('Parent',panel(15),'units','normalized','Style','text','Position',[0.0 0.70 0.3 0.1],'String','z');
parabola(3)=uicontrol('Parent',panel(15),'units','normalized','Style','text','Position',[0.0 0.55 0.3 0.1],'String','FROM');
parabola(4)=uicontrol('Parent',panel(15),'units','normalized','Style','text','Position',[0.0 0.40 0.3 0.1],'String','TO');
parabola(5)=uicontrol('Parent',panel(15),'units','normalized','Style','text','Position',[0.0 0.25 0.3 0.1],'String','TOGGLE DIRECTION');

parabola(6)=uicontrol('Parent',panel(15),'units','normalized','Style','edit','Position',[0.5 0.85 0.4 0.1],'String','10');
parabola(7)=uicontrol('Parent',panel(15),'units','normalized','Style','edit','Position',[0.5 0.70 0.4 0.1],'String','20');
parabola(8)=uicontrol('Parent',panel(15),'units','normalized','Style','edit','Position',[0.5 0.55 0.4 0.1],'String','1');
parabola(9)=uicontrol('Parent',panel(15),'units','normalized','Style','edit','Position',[0.5 0.40 0.4 0.1],'String',char(get(FRAMES,'String')));
parabola(10)=uicontrol('Parent',panel(15),'units','normalized','Style','toggle','Position',[0.5 0.25 0.4 0.1],'String','TOGGLE');

%PANEL DEF FOR ELLIPSE
ellipse(1)=uicontrol('Parent',panel(16),'units','normalized','Style','text','Position',[0.0 0.85 0.3 0.1],'String','y');
ellipse(2)=uicontrol('Parent',panel(16),'units','normalized','Style','text','Position',[0.0 0.70 0.3 0.1],'String','z');
ellipse(3)=uicontrol('Parent',panel(16),'units','normalized','Style','text','Position',[0.0 0.55 0.3 0.1],'String','FROM');
ellipse(4)=uicontrol('Parent',panel(16),'units','normalized','Style','text','Position',[0.0 0.40 0.3 0.1],'String','TO');
ellipse(5)=uicontrol('Parent',panel(16),'units','normalized','Style','text','Position',[0.0 0.25 0.3 0.1],'String','TOGGLE DIRECTION');

ellipse(6)=uicontrol('Parent',panel(16),'units','normalized','Style','edit','Position',[0.5 0.85 0.4 0.1],'String','10');
ellipse(7)=uicontrol('Parent',panel(16),'units','normalized','Style','edit','Position',[0.5 0.70 0.4 0.1],'String','20');
ellipse(8)=uicontrol('Parent',panel(16),'units','normalized','Style','edit','Position',[0.5 0.55 0.4 0.1],'String','1');
ellipse(9)=uicontrol('Parent',panel(16),'units','normalized','Style','edit','Position',[0.5 0.40 0.4 0.1],'String',char(get(FRAMES,'String')));
ellipse(10)=uicontrol('Parent',panel(16),'units','normalized','Style','toggle','Position',[0.5 0.25 0.4 0.1],'String','TOGGLE');


%PANEL DEF FOR MULTI-POINT SEGMENT
%PANEL DEF FOR POLYNOMIAL

end

