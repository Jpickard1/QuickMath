function [X] = toggle_switch(A0, B0, max_t)
%TOGGLE_SWITCH 
% 
% Author: Joshua Pickard
%         jpic@umich.edu
% Date: June 22, 2022

alpha = 1;  % Effective rate of synthesis
beta  = 1;  % Repression rate

Xt = zeros(2, max_t);
Xt(:, 1) = [A0; B0];
for t=2:max_t
    dx_dt = (alpha / (1 + Xt(:,t-1).^beta))- Xt(:, t-1);
    Xt(:,t) = Xt(:,t-1) + dx_dt;
end

end

