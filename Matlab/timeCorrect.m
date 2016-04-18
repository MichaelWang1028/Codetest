    timeNow = clock;timeStr(1:4) = num2str(timeNow(1));
    for i = 2:5
        if timeNow(i) < 10
            timeStr(i*2+1:i*2+2) = strcat(['0',num2str(timeNow(i))]);
        else
            timeStr((i*2+1:i*2+2)) = num2str(timeNow(i));
        end
    end