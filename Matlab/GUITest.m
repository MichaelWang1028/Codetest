clear;clc

X = linspace(-pi,pi,25);
Y = sin(X);
plot(X,Y,'rX');

h_line=findobj(gca,'Marker','X')

get(h_line)

h_line_parent=get(h_line,'Parent')

get(h_line_parent)

set(h_line,'Color',[1 1 1],'MarkerSize',10);

set(gca,'Color',[0,0,0])

set(gca,'XGrid','on','GridLineStyle','-.','XColor',[0.75 0.75 0])
set(gca,'YGrid','on','GridLineStyle','-.','YColor',[0 0.75 0.75])

set(gcf,'Color',[0 0 1])
 
%h_line_parent=get(h_line,'Parent');