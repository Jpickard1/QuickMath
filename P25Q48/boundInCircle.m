function [bounds] = boundsInCircle(bounds)
%BOUNDINCIRCLE This function takes a set of bounds and returns only those
%   that are within the unit circle.
%
% Auth: Joshua Pickard
%       jpic@umich.edu
% Date: July 24, 2022

max_dists = [sqrt(bounds(:,1).^2 + bounds(:,3).^2) sqrt(bounds(:,1).^2 + bounds(:,4).^2) sqrt(bounds(:,2).^2 + bounds(:,3).^2) sqrt(bounds(:,2).^2 + bounds(:,4).^2)];
bounded = (max(max_dists, [], 2) <= 1);
bounds = bounds(bounded,:);

end

