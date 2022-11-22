% close all
% clear
% D = rand(2,10)
figure; scatter(D(1,:), D(2,:), '.'); hold on;
hull = QuickHull2D(D, true)

