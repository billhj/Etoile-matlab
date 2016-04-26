addpath('C:/Users/Jing/Documents/Matlab-TSI-R2014b/bin')
[skel, channels, frameLength] = bvhReadFile('C:/Users/Jing/Downloads/Male2_bvh/Male2_A1_Stand.bvh');
%

% frames = length(channels)
% for i = 1 : frames
%     channels(i,5) = 0;
%     channels(i,4) = 0;
%     channels(i,6) = 0;
% end
% az = 0;
% el = 90;
channels(:,:) = (0)
bvhPlayData(skel, channels, frameLength)

% pos = zeros(frames, 26 * 3);
% localchanels = zeros(frames, 66);
% for i = 1 : frames
%     localchannel = horzcat(zeros(1,6), channels(i, 7:66));
%     localchanels(i,:) = localchannel;
%     xyz = skel2xyz(skel, localchannel);
%     pos(i,:) = reshape(xyz.', 1, 26 * 3);
% end
% allfeatures = horzcat(localchanels, pos);