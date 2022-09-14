function [X] = make_clusters(n, c, sig)
% MAKE_CLUSTERS This function makes clustered 2D data in the interval [0 1]
%
%   n - is the number of data points
%   c - is the number of clusters
%
% Auth: Joshua Pickard
% Date: July 11, 2022

C = rand(c, 2)

X = [];
for i=1:c
    X = [X; mvnrnd(C(i,:), sig * eye(2), n)];
end

end

