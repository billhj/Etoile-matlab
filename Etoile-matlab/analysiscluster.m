[idx,C,sumd,D, midx,info] = kmedoids(channels, 100);
for i = 1 : size(idx)
    idx(i,2) = i;
end
resultIdx = sortrows(idx,1);


for i = 1 : size(C, 1)
    for j = 3 : size(C, 2) 
        while(C(i, j) > 180)
            C(i, j) = C(i, j) - 360;
        end
        while(C(i, j) < -180)
            C(i, j) = C(i, j) + 360;
        end
        while(C(i, j) > 180)
            C(i, j) = C(i, j) - 360;
        end
        while(C(i, j) < -180)
            C(i, j) = C(i, j) + 360;
        end
    end
    C(i, 1 : 3) =  C(i, 1 : 3) * 0.01;
    C(i, 4 : size(C, 2)) =  C(i, 4 : size(C, 2)) * 3.14159265 / 180.0;
end

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
            gaussianmodel(clusterIdx).mu = C(id,:);
            gaussianmodel(clusterIdx).cov = cov(clusterchannel(:,:));
            clusterIdx = clusterIdx + 1;
        end
        id = resultIdx(i,1);
        clusterchannel = channelsReal(id,:);
    end
end
gaussianmodel(clusterIdx).mu = median(clusterchannel(:,:));
gaussianmodel(clusterIdx).cov = cov(clusterchannel(:,:));

for i = 1 : size(gaussianmodel, 2)
    gaussianmodel(i).cov_noise = gaussianmodel(i).cov + eye(size(gaussianmodel(i).cov, 1))*0.01 ;
    gaussianmodel(i).incov = inv(gaussianmodel(i).cov_noise);
end

% for i = 1 : size(gaussianmodel, 2)
%     gaussianmodel(i).cov(:, 54 : 66) = gaussianmodel(i).cov(:, 54 : 66) / 100;
% end
% 
% for i = 1 : size(gaussianmodel, 2)
%     gaussianmodel(i).cov(54 : 66, 1 : 53) = gaussianmodel(i).cov(54 : 66, 1 : 53) / 100;
% end

%bvhPlayData(m(1).skel, C, 1)

%order = [];