[idx,C,sumd,D] = kmeans(channels, 100);
for i = 1 : size(idx)
    idx(i,2) = i;
end
resultIdx = sortrows(idx,1);

gaussianmodel = [];
clusterchannel = [];
id = 0;
clusterIdx = 1;

channelsReal = channels;
for i = 1 : size(channelsReal, 1)
    channelsReal(i, 1 : 3) =  channelsReal(i, 1 : 3) * 0.01;
    channelsReal(i, 4 : size(channelsReal, 2)) =  channelsReal(i, 4 : size(channelsReal, 2)) * 3.14159265 / 180.0;
end 

for i = 1 : size(resultIdx, 1)
    if id == resultIdx(i,1)
        clusterchannel = vertcat(clusterchannel, channelsReal(resultIdx(i,2),:));
    else
        if(size(clusterchannel,1) ~= 0)
            gaussianmodel(clusterIdx).mu = mean(clusterchannel(:,:));
            gaussianmodel(clusterIdx).cov = cov(clusterchannel(:,:));
            clusterIdx = clusterIdx + 1;
        end
        id = resultIdx(i,1);
        clusterchannel = channelsReal(id,:);
    end
end
gaussianmodel(clusterIdx).mu = mean(clusterchannel(:,:));
gaussianmodel(clusterIdx).cov = cov(clusterchannel(:,:));

%bvhPlayData(m(1).skel, C, 1)

%order = [];