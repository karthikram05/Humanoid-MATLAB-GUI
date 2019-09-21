function Answer = loadaction_pop_up(prompt,title,position)

allfiles=dir('C:\Users\karthik\Google Drive\T3.1_NINO\NINO_IK_GUI\actions');
for i=3:1:length(allfiles)
files{i-2}=allfiles(i).name;
end

%set up main window figure
dialogWind = figure('Units','normalized','Position', ...
    position,'MenuBar','none','NumberTitle','off','Name',title);


% %set up GUI controls and text
uicontrol('style','text','String',prompt,'Units','normalized', ...
    'Position',[.05,.75,.9,.1],'HorizontalAlignment','left');

file_name = uicontrol('style','popup','Units','normalized',...
    'Position',[.05,.5,.9,.2],'String',files);
 
 okayButton = uicontrol('style','pushbutton','Units','normalized',...
    'position', [.05,.1,.4,.3],'string','OK','callback',@okCallback);
cancelButton = uicontrol('style','pushbutton','Units','normalized',...
    'position', [.55,.1,.4,.3],'string','Cancel','callback',@cancCallback);

%initialize ANSWER to empty cell array
Answer = '';

uiwait(dialogWind);

%callbacks for 'OK' and 'Cancel' buttons
    function okCallback(hObject,eventdata)
        n = get(file_name,'Value');
        Answer = files{n};
        uiresume(dialogWind);
        close(dialogWind);
    end

    function cancCallback(hObject,eventdata)
        uiresume(dialogWind);
        close(dialogWind);
    end

end
 