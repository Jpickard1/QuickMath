function nodeLabels = nodelabels_mat(combos, multicorr)
%NODELABELS_MAT Summary of this function goes here
%   Detailed explanation goes here
% Author: Joshua Pickard
%         jpic@umich.edu
% Date: 8/23/2022

nodeLabels = cell(length(combos),1);
for c=1:length(combos)
    nodeLabels{c} = strjoin(string(combos(c,:)));
end

for c=1:length(combos)
    nodeLabels{c} = nodeLabels{c} + ": "  + string(multicorr(c));
end

end

