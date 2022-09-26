function hull = QuickHull2D(D, p)
% QUICKHULL2D
%   This function computes the convex hull of 2 dimensional data
%
% Auth: Joshua Pickard
%       jpic@umich.edu
% Date: September 19, 2022

if nargin == 1
    p = false;
end

X = D(1,:);
Y = D(2,:);

[~, max_i] = max(X);
[~, min_i] = min(X);

hull = [X(min_i) X(max_i); Y(min_i) Y(max_i)];

if p
    plot(hull(1,:), hull(2,:));
end

slope = (Y(max_i) - Y(min_i)) / (X(max_i) - X(min_i));
coef = Y(min_i) - slope * X(min_i);


X([min_i max_i]) = [];
Y([min_i max_i]) = [];
D(:, [min_i max_i]) = [];
dist = zeros(1, length(X));
denom = sqrt(slope^2 + 1^2);
for i=1:length(X)
    dist(i) = (-slope * X(i) + Y(i) - coef) / denom;
end

A = (dist > 0);
% B = (dist < 0);
A = D(:, find(A == 1));
B = D(:, find(A == 0));

A = QuickHalfHull2D(A, hull, p);
B = QuickHalfHull2D(B, hull, p);

hull = [hull A B];
% scatter(X, Y, '.')
end

