%% Topology of Data

%% Generate Random Data
num_clusters = 2;
num_pts = 8;
sig = 0.005;

D = make_clusters(num_pts, num_clusters, sig);

figure; scatter(D(:,1), D(:,2), '.')
title('Random Data')
saveas(gcf, 'Data Cluster.png')