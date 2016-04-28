% for i = 1 : size(gaussianmodel,2)
%     bvhPlayData(m(1).skel, gaussianmodel(i).mu * 180 / 3.14159265, 0.5)
% end
%bvhPlayData(m(1).skel, gaussianmodel(36).mu * 180 / 3.14159265, 0.5)
fileID = fopen('gaussian.txt','w');
sizeMu = size(gaussianmodel(1).mu, 2);

for i = 1 : size(gaussianmodel,2)
    fprintf(fileID, '%i %i \n', i, sizeMu);
    for j = 1:size(gaussianmodel(i).mu,2)
        fprintf(fileID, '%f ', gaussianmodel(i).mu(1,j));
    end
    fprintf(fileID, '\n');
    for h = 1:size(gaussianmodel(i).cov,1)
        for w = 1:size(gaussianmodel(i).cov,2)
            fprintf(fileID, '%f ', gaussianmodel(i).cov(h,w));
        end
    end
    fprintf(fileID, '\n');
end

fclose(fileID);