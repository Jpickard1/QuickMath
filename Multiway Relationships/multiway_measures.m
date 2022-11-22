%% Multi-way Measures
%
%   The purpose of this file is to generate a series of 3 dimensional data
%   sets in a 3 x n matrix and compute the multi-way correlation on these
%   data.
%
% Auth: Joshua Pickard
%       jpic@umich.edu
% Date: September 25, 2022

%% No relation
n = 1000;
D = rand(3, n);
D(4:2*n,:) = 4:2*n;
figure; scatter3(D(1,:), D(2,:), D(3,:), '.')

R = cov(D);

zvi = 1 - min(eig(R));
wang = (1 - det(R))^(0.5);
taylor = (1/sqrt(length(D))) * std(eig(corrcoef(D)));
disp(zvi)
disp(wang)
disp(taylor)

%% 3D Plane
N = [1; 2; 3]; % the normal to the plane
xyz0=[4; 5; 6]; % point inside the plane
sz = 4; % size of the rectangle
n = 500; % number of random points
Q = null(N');
D = xyz0 + Q*((rand(2,n)-0.5)*sz);

figure; scatter3(D(1,:), D(2,:), D(3,:), '.')

R = cov(D);

zvi = 1 - min(eig(R));
wang = (1 - det(R)^2)^(0.5);
taylor = (1/sqrt(n)) * std(eig(corrcoef(D)));
disp(zvi)
disp(wang)
disp(taylor)

%% 3D Line

