%% Bipartite graph multirelations

%% Preamble
close all
clear
clc

%% Set A
m = 40;
n = 30;
A = rand(m,n) > 0.15;
% A = ones(m,n);
A = [zeros(m,m), A; A', zeros(n,n)];

% Plot graph and A
figure; subplot(1,2,1); h = plot(graph(A)); title("Complete Bipartite Graph");
h.XData(1:m) = 1; h.XData((m+1):end) = 2;
h.YData(1:m) = linspace(0,1,m); h.YData((m+1):end) = linspace(0,1,n);
subplot(1,2,2); h = heatmap(A); title("Adjacency Matrix");

%% Compute Covariance Matrix
%   A is our data matrix
D = A;
R = cov(D);
figure; h = heatmap(R); title("Covariance Matrix");

%% 3 Way Multirelation

combos = nchoosek(1:length(D),3);
multirelations = zeros(length(combos),1);
for c=1:length(combos)        
    combo = combos(c,:);     % Select submatrix indices
    Rsub = R(combo, combo);  % Extract submatrix
    multirelations(c) = multirelation(Rsub, 'wang');
end 

% C = ones(length(combos), 3);
% C = C .* multirelations;
C = multirelations;
C = C - mean(C);
C = C / std(C);
C = C + abs(min(C));
min(C)
std(C)
mean(C)
C = C / max(C);
figure; scatter3(combos(:,1), combos(:,2), combos(:,3), C)

% figure; plot(1:length(multirelations),sort(multirelations))






