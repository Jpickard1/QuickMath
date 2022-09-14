function [] = rotateLeft(seg, scale, angle)
%ROTATELEFT 
%   Returns 2 sticks from the end of the input that are rotated and scaled
%   accordingly
%
% Auth: Joshua Pickard 
%       jpic@umich.edu
% Date: July 11, 2022

% Info from parent
slope   = (seg(2,2) - seg(1,2)) / (seg(2,1) - seg(1,1));
len     = sqrt((seg(2,2) - seg(1,2))^2 + (seg(2,2) - seg(1,2)^2));
angle   = atan(slope);

% Make child
child = [0 0; len 0];

% Rotation matrix
th = angle*pi/180;
th = 30
R = [cos(th) -sin(th); sin(th) cos(th)];
c = child * R

% Translate
leftX = leftX + X(2);
leftY = leftY + Y(2);


sin(slope)
cos(slope)
            

sind((Y(2) - Y(1)) / len)
cosd((X(2) - X(1)) / len)

end

plot(leftX,leftY,'.-b');
