%%���Ի�ͼʱʱ���ӳ٣������ʾ:���ݵ�ȫ��������»��Ƶ��ٶ���졣
%%ʵ���У���ʾ2���ӵ�ʱ�䣬����10���ӵ�����

value = 0;
% for i = 0:0.0001:8
%     line([i,i+0.0001],[value,sin(i)]);
%     value = sin(i);
% end
% value = 0;
testline = plot(0,0);grid on;
set(testline,'XData',[],'YData',[]);
%testline =  line('XData',[],'YData',[]);
%set(testline,'XData',[],'YData',[]);
i = 0:0.1:6000;
value = sin(i);
for j = 1: 120000-1
    
    tic;
    if j < 6000
        x = i(1:j);
        y = value(1:j);
        if j <= 1600
            set(gca,'XLim',[0,120],'YLim',[-1, 1]);
        else
            set(gca,'XLim',[x(j)-80,x(j) + 40],'YLim',[-1, 1]);
        end
    else
        x = i(j-5999:j);
        y = value(j-5999:j);
        set(gca,'XLim',[(x(5999)-80),(x(5999) + 40)],'YLim',[-1, 1]);
    end
 plot(x,y);
drawnow;

time2(j) = toc;
end
