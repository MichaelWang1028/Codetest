% %%�Ի���
% %uigetfile
% %�����������
 clear;clc;
% [FileName, PathName, FileterIndex] = uigetfile('*.m','Test','default.m');
% 
% if FileterIndex == 1
%     load(fullfile(PathName, FileName));


% % end
% % %�ļ�����Ի���
% % %uiputfile
% [FileName, PathName, FileterIndex] = uiputfile('*.m','Save', 'test.m');
% %ֻ���ṩ�����·�������֣���Ҫ�����ĺ�������ʹ�á�

% % %%��ɫ���������öԻ���
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

% %%������waitbar
% hWaitbar = waitbar(0.75,'ʵ��');
% %%��ý��������Ӷ���
% %get(get(hWaitbar,'Children'));
% hAxes = get(hWaitbar, 'Children');
% hChild = get(hAxes, 'Children');
% get(hChild(2));
% get(hChild(2),'Vertices');
% test = allchild(hAxes);
% set(test(1), 'String', 'fuck')
% %%ui�˵�
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

% %%��ͨ�Ի���dialog
% hDialog = dialog('Name','���ڡ�����','Position',[200,200,200,70]);
% hButton = uicontrol('Style','pushbutton','Parent',hDialog,...
%     'Position',[0.1,0.1,0.6,0.6],'Units','normalized','String','����',...
%     'Callback','closereq;');
% 
% %fFigure = figure('Parent',hDialog);    %��������д���������ǲ��е�
% fAxes = axes('Parent',hDialog);

% %%����Ի���errordlg
% hErrordlg = errordlg;
% hChildren = get(hErrordlg,'Children');
% get(get(hChildren(1),'Children'))
% get(get(hChildren(2),'Children'),'String')
% get(hChildren(3))

% %%����Ի���
% hWarn = warndlg('Fuck')

% %%����Ի����б�ѡ��Ի���Ŀ¼�Ի���
% %inputdlg
% hInput = inputdlg('Please input you name');
%ret = inputdlg({'Name','Sex'},'huck',8,{'edf','dfadf'},'on')
%%Ŀ¼ѡ��Ի���uigetdir
% hUigetdir = uigetdir('E:\','���')
% [FileName, PathName, FileterIndex] = uigetfile;
%%�б�ѡ��Ի���listdlgs
% [Sel, OK] = listdlg(...
%     'ListString', {'A','B','C','D'},...
%     'OKString','ȷ��',...
%     'CancelString','ȡ��',...
%     'Name','ѡ��',...
%     'SelectionMode','multiple')










