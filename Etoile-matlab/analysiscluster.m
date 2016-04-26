[idx,C,sumd,D] = kmeans(channels, 50);
for i = 1 : size(idx)
    idx(i,2) = i;
end
resultIdx = sortrows(idx,1);

gaussianmodel = [];
clusterchannel = [];
id = 0;
clusterIdx = 1;
for i = 1 : size(resultIdx, 1)
    if id == resultIdx(i,1)
        clusterchannel = vertcat(clusterchannel, channels(resultIdx(i,2),:));
    else
        if(size(clusterchannel,1) ~= 0)
            gaussianmodel(clusterIdx).mu = mean(clusterchannel(:,:));
            gaussianmodel(clusterIdx).cov = cov(clusterchannel(:,:));
            clusterIdx = clusterIdx + 1;
        end
        id = resultIdx(i,1);
        clusterchannel = channels(id,:);
    end
end
gaussianmodel(clusterIdx).mu = mean(clusterchannel(:,:));
gaussianmodel(clusterIdx).cov = cov(clusterchannel(:,:));

%bvhPlayData(m(1).skel, C, 1)

%order = [];