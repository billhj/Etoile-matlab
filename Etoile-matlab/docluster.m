positionIndex = 66
leftwristindex = [positionIndex + 9 * 3 + 1, positionIndex + 9 * 3 + 2, positionIndex + 10 * 3]
rightwristindex = [positionIndex + 14 * 3 + 1, positionIndex + 14 * 3 + 2, positionIndex + 15 * 3]
righthandpos = allfeatures(1, rightwristindex)
lefthandpos = allfeatures(1, leftwristindex)

%right hand cluster
[idx,C] = kmeans(allfeatures(:, rightwristindex), 50);
xlabel('x label')
ylabel('y label')
zlabel('z label')
scatter3(C(:,1),C(:,2),C(:,3))