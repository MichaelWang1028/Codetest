%界面

clc;clear
hFigure = figure('Units', 'Normalized',...
                 'Position', [0.1, 0.1, 0.5, 0.5],...
                 'Menu','None');
hAxes = axes('Parent', hFigure, 'Units', 'Normalized',...
             'Position', [0.1, 0.1, 0.8, 0.8]);
         
hLine = line('Parent', hAxes, 'xData', [0:0.01:6], 'yData', sin([0:0.01:6]),...
             'Color', 'r');

hPoint = line('Parent', hAxes, 'xData', 3, 'yData', 0.5,...
             'Color', 'm', 'Marker', '.','MarkerSize',12,...
             'LineWidth',10);

cString = 'gbkmy';     
% k = 0;
% while(1)
%     k = mod((k+1),5) + 1;
%     set(hLine,'Color',cString(k));
%     pause(1);
% end

%获取绘制的点的坐标 
hEzplot = ezplot('sin(x)');
xData = get(hEzplot, 'XData');
yData = get(hEzplot, 'YData');

hFigure2 = figure;plot(xData,yData);
