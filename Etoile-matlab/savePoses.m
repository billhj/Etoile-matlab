
chan = channels;
for i = 1 : size(chan, 1)
    for j = 3 : size(chan, 2) 
        while(chan(i, j) > 180)
            chan(i, j) = chan(i, j) - 360;
        end
        while(chan(i, j) < -180)
            chan(i, j) = chan(i, j) + 360;
        end
        while(chan(i, j) > 180)
            chan(i, j) = chan(i, j) - 360;
        end
        while(chan(i, j) < -180)
            chan(i, j) = chan(i, j) + 360;
        end
    end
    chan(i, 1 : 3) =  chan(i, 1 : 3) * 0.01;
    chan(i, 4 : size(chan, 2)) =  chan(i, 4 : size(chan, 2)) * 3.14159265 / 180.0;
end

fileID = fopen('poses.txt','w');
sizechan = size(chan, 2);
fprintf(fileID, '%i ', sizechan);
fprintf(fileID, '\n');
for i = 1 : size(chan,1)
    for j = 1:size(chan,2)
        fprintf(fileID, '%f ', chan(i,j));
    end
    fprintf(fileID, '\n');
end

fclose(fileID);