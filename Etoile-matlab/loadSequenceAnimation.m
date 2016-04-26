MyFolderInfo = dir('C:\Users\Jing\Documents\GitHub\Etoile2015\mdata2\*.bvh')
m = [];
for i = 1:size(MyFolderInfo, 1)
    [m(i).skel, m(i).channels, m(i).frameLength] = bvhReadFile(strcat('C:\Users\Jing\Documents\GitHub\Etoile2015\mdata2\', MyFolderInfo(i).name));
end
channels = [];
for i = 1 : size(m, 2)
    channels = vertcat(channels, m(i).channels);
end