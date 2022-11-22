function r = multirelation(R,type)
%MULTIRELATION This function computes the multirelation between all
%   variables in the covariance matrix.
%
% Auth: Joshua Pickard
%       jpic@umich.edu
% Date: August 24, 2022

r = -1;
if strcmp(type, 'zvi')
    e = real(eigs(R,1,'smallestabs'));
    r = 1 - e;
elseif strcmp(type, 'wang')
    d = det(R);
    r = (1-d)^(1/2);
end
% r = 
end

