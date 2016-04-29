MyFolderInfo = dir('C:\Users\Jing\Documents\GitHub\Etoile2015\mdata2\*.bvh')
m = [];
for i = 1:size(MyFolderInfo, 1)
    [m(i).skel, m(i).channels, m(i).frameLength] = bvhReadFile(strcat('C:\Users\Jing\Documents\GitHub\Etoile2015\mdata2\', MyFolderInfo(i).name));
end
channels = [];
for i = 1 : size(m, 2)
    channels = vertcat(channels, m(i).channels);
end
for i = 1 : size(channels, 1)
    channels(i, 1) = 0;
    %channels(i, 2) = 0;
    channels(i, 3) = 0;
    channels(i, 4) = 0;
    channels(i, 5) = 0;
    channels(i, 6) = 0;
end
% for i = 1 : size(channels, 1)
%     channels(i, 4) = channels(i, 4) + 180;
%     channels(i, 6) = channels(i, 6) + 180;
%     while(channels(i, 4) > 180)
%         channels(i, 4) = channels(i, 4) - 360;
%     end
%     while(channels(i, 4) < -180)
%         channels(i, 4) = channels(i, 4) + 360;
%     end
%     while(channels(i, 6) > 180)
%         channels(i, 6) = channels(i, 6) - 360;
%     end
%     while(channels(i, 6) < -180)
%         channels(i, 6) = channels(i, 6) + 360;
%     end
% end

%bvhPlayData(m(1).skel, channels, m(1).frameLength)