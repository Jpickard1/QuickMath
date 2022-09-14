function plotSquares(bounds)
%PLOTSQUARES This function plots squares defined by the lowerX cordinate
%   and upperY coordinate of the vertices of a square
%
% Auth: Joshua Pickard
%       jpic@umich.edu
% Date: July 24, 2022

hold on;
[squares, ~] = size(bounds);

for i=1:squares
    lowerX = bounds(i, 1);
    upperX = bounds(i, 2);
    lowerY = bounds(i, 3);
    upperY = bounds(i, 4);
    rectangle('Position', [lowerX, lowerY, upperX-lowerX, upperX-lowerX],'FaceColor','blue');
end


end

