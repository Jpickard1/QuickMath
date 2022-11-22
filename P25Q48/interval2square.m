function bounds = interval2square(Xintervals, Yintervals)
%INTERVALS2SQUARE This function takes 2 sets of paired intervals and
%   returns the squares they define. It is intended to be used with dyadic
%   squares, as that is the focus of this directory, but could be
%   repuposed.
%
% Auth: Joshua Pickard
%       jpic@umich.edu
% Date: July 24, 2022

% Check the number of intervals
[num_X_intervals, ~] = size(Xintervals);
[num_Y_intervals, ~] = size(Yintervals);

square = 1;
bounds = zeros(num_X_intervals * num_Y_intervals, 4);
for x=1:num_X_intervals
    for y=1:num_Y_intervals
        bounds(square, 1) = Xintervals(x, 1);
        bounds(square, 2) = Xintervals(x, 2);
        bounds(square, 3) = Yintervals(y, 1);
        bounds(square, 4) = Yintervals(y, 2);
        square = square + 1;
    end
end

end

