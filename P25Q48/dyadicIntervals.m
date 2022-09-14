function intervals = dyadicIntervals(k, lower, upper)
%DYADICINTERVALS This function returns all dyadic intervals between the
%   lower and upper bounds for a specific value of k.
%
% Auth: Joshua Pickard
%       jpic@umich.edu
% Date: July 24, 2022

if nargin == 1
    lower = 0;
    upper = 1;
end

intervals = [];

% Compute intervals
denom = 2^k;
i = lower * denom;
while (i+1) / denom <= upper
    intervals = [intervals; (i / denom) ((i+1) / denom)];
    i = i + 1;
end

end