function [hull] = QuickHalfHull2D(D, cord, p)
%QUICKHALFHULL2D 
%
% Auth: Joshua Pickard
%       jpic@umich.edu
% Date: September 19, 2022

hull = [];
if isempty(D)
    return
end

slope = (cord(2,2) - cord(2,1)) / (cord(1,2) - cord(1,1));
coef = cord(2,1) - slope * cord(1,1);

[~, n] = size(D);
dist = zeros(1, n);
denom = sqrt(slope^2 + 1^2);
for i=1:length(dist)
    dist(i) = (-slope * D(1, i) + D(2, i) - coef) / denom;
end

[~, max_d] = max(abs(dist));
x_d = D(1, max_d);
y_d = D(2, max_d);
hull = [x_d; y_d];
D(:, max_d) = [];

if p
    plot([x_d cord(1,1)], [y_d cord(2, 1)]);
    plot([x_d cord(1,2)], [y_d cord(2, 2)]);
end

side = zeros(length(D), 1);

% Check if each data point is outside of the hull defined by x_d, y_d, and
a_x = cord(1,1);
a_y = cord(2,1);
b_x = cord(1,2);
b_y = cord(2,2);
[~, n] = size(D);
for i=1:n
    % if (hull(1,2) - hull(1,1)) * (y_d * hull(2,1)) - (hull(2,2) - hull(2,1)) * (x_d - hull(1,1))) < 0
    %if sign of AB AC > 0
    if sign(((x_d - a_x) * (D(2,i) - a_y)) - ((y_d - a_y) * (D(1,i) - a_x))) < 0
        side(i) = 1;
    elseif sign(((b_x - x_d) * (D(2,i) - y_d)) - ((b_y - y_d) * (D(1,i) - x_d))) < 0
        side(i) = 2;        
    end
    %if sign of BC BA > 0
    % AC vs D
    %{
    if ((x_d - cord(1,1)) * (D(2, i) * cord(2,1)) - (y_d - cord(2,1)) * (D(1, i) - cord(1,1))) > 0
        side(i) = 1;
    elseif ((x_d - cord(1,2)) * (D(2, i) * cord(2,2)) - (y_d - cord(2,2)) * (D(1, i) - cord(1,2))) < 0
        side(i) = 2;
    end
    %}
    % if (hull(1,2) - hull(1,1)) * (d(2, i) * hull(2,1)) - (hull(2,2) - hull(2,1)) * (d(1, :) - hull(1,1))) < 0  
    % ((b.X - a.X)*(c.Y - a.Y) - (b.Y - a.Y)*(c.X - a.X))
end

A = D(:, find(side == 1));
B = D(:, find(side == 2));

cord = [x_d, cord(1,1); y_d cord(2,1)];
A = QuickHalfHull2D(A, cord)
cord = [x_d, cord(1,2); y_d cord(2,2)];
B = QuickHalfHull2D(A, cord)

hull = [hull A B]

end


