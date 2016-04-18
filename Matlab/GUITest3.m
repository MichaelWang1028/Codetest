% %常用对象属性
% 
% hFigure = figure;
% %改变颜色
% set(hFigure,...
%     'Color',[0, 0, 1],...
%     'MenuBar','none',...
%     'Name','演示','NumberTitle','off',...
%     'Resize','on',...
%     'WindowButtonDownFcn','closereq',...
%     'WindowKeyPressFcn','closereq',...
%     'WindowStyle','modal');
% pause(1);
% set(hFigure,'Visible','off');
% pause(1);
% set(hFigure,'Visible','on');
% 
% hBurron = uicontrol(...
%     'Style','pushbutton',...
%     'String','Close',...
%     'Callback','closereq');


hAxes = axes; 
%get(hAxes)

hLine = line;

hText = text(1,1,'示例');
set(hText, 'Editing','on','FontSize',20,'String','\int_0^x x^3dF(x)');
text('Interpreter','latex','String','$$\int_0^x x^3_2 dF(x) $$','Position',[.1, .2], 'FontSize',20);

%uicontrol














