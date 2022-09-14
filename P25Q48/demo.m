clear;
close all;
clc;

%% Transforming dyadic tilings

k = 4;
intervals = dyadicIntervals(k, -1, 1);

%% All together now

k = 4;
intervals = dyadicIntervals(k, -1, 1);
bounds = interval2square(intervals, intervals);
bounds = boundInCircle(bounds);
figure; p = nsidedpoly(1000, 'Center', [0 0], 'Radius', 1);
plot(p, 'FaceColor', 'r'); plotSquares(bounds);
title('Circle Tiling');

%% Intervals in circle
k = 6
intervals = dyadicIntervals(k);
bounds = interval2square(intervals, intervals);
bounds = boundInCircle(bounds);
figure; plotSquares(bounds);

%% Make dyadic intervals
k = 3
intervals = dyadicIntervals(k);
bounds = interval2square(intervals, intervals);
figure; plotSquares(bounds);

%% Int -> sq -> plot
Xintervals = [0 1;
              0 1;
              1 2];
Yintervals = [0 1;
              1 2;
              0 1;];
          
bounds = interval2square(Xintervals, Yintervals);
figure; plotSquares(bounds);



%% lower left cord & upper right cord
% lowerX, upperX, lowerY, upperY
b1 = [0 1 0 1;
      0 1 1 2;
      1 2 0 1];

figure; plotSquares(b1);

