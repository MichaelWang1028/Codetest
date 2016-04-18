% %%对话框
% %uigetfile
% %参数输出意义
 clear;clc;
% [FileName, PathName, FileterIndex] = uigetfile('*.m','Test','default.m');
% 
% if FileterIndex == 1
%     load(fullfile(PathName, FileName));


% % end
% % %文件保存对话框
% % %uiputfile
% [FileName, PathName, FileterIndex] = uiputfile('*.m','Save', 'test.m');
% %只是提供保存的路径和名字，需要其他的函数辅助使用。

% % %%颜色和字体设置对话框
% % %uisetcolor
% % %c = uisetcolor;
% % c = uisetcolor([0,0,0],'fuck');
% % h = plot([0:10]);
% % c = uisetcolor(h);
% 
% hFigure = figure;
% hButton = uicontrol('Parent', hFigure, 'String','EngOnly', 'Style', 'pushbutton',...
%     'Callback','c = uisetcolor(hFigure);S = uisetfont(hButton);',...
%     'Position',[0.2,0.2,0.5,0.5],'Units','normalized');

% %%进度条waitbar
% hWaitbar = waitbar(0.75,'实例');
% %%获得进度条的子对象
% %get(get(hWaitbar,'Children'));
% hAxes = get(hWaitbar, 'Children');
% hChild = get(hAxes, 'Children');
% get(hChild(2));
% get(hChild(2),'Vertices');
% test = allchild(hAxes);
% set(test(1), 'String', 'fuck')
% %%ui菜单
% hUimenu = uimenu(hWaitbar,'Label','New Figure');
% uimenu(hUimenu,'Label','New Figure','Callback','closereq');
% uimenu(hUimenu,'Label','Quit','Callback','close gcf',...
%     'Separator','on','Accelerator','Q');

% hPatch = findall(hAxes, 'Type','patch');
% set(hPatch,'FaceColor','k');
% 
% hWaitbar2 = waitbar(0,'CreateCancelBtn', 'CreateCancelBtn', 'closereq');
% for k = 0.0:0.01:1.0
%     waitbar(k,hWaitbar2);
%     pause(0.5);
% end

% %%普通对话框dialog
% hDialog = dialog('Name','关于。。。','Position',[200,200,200,70]);
% hButton = uicontrol('Style','pushbutton','Parent',hDialog,...
%     'Position',[0.1,0.1,0.6,0.6],'Units','normalized','String','法克',...
%     'Callback','closereq;');
% 
% %fFigure = figure('Parent',hDialog);    %不能这样写，他们俩是并列的
% fAxes = axes('Parent',hDialog);

% %%错误对话框errordlg
% hErrordlg = errordlg;
% hChildren = get(hErrordlg,'Children');
% get(get(hChildren(1),'Children'))
% get(get(hChildren(2),'Children'),'String')
% get(hChildren(3))

% %%警告对话框
% hWarn = warndlg('Fuck')

% %%输入对话框、列表选择对话框、目录对话框
% %inputdlg
% hInput = inputdlg('Please input you name');
%ret = inputdlg({'Name','Sex'},'huck',8,{'edf','dfadf'},'on')
%%目录选择对话框uigetdir
% hUigetdir = uigetdir('E:\','浏览')
% [FileName, PathName, FileterIndex] = uigetfile;
%%列表选择对话框listdlgs
% [Sel, OK] = listdlg(...
%     'ListString', {'A','B','C','D'},...
%     'OKString','确定',...
%     'CancelString','取消',...
%     'Name','选择',...
%     'SelectionMode','multiple')










