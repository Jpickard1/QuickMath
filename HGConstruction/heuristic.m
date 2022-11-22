%% Set data matrix

k = 5;
n = 20;
D = rand(n,k);
for i=1:k
    D(:,i) = D(:,i) / norm(D(:,i));
end
R = D'*D;

[evec, eval] = eig(R);

%% Multicorrelation

h = 3;
combos = nchoosek(1:k,h);
multicor = zeros(length(combos),1);

for c=1:length(combos)
    R_prime = R(combos(c,:), combos(c,:));
    multicor(c) = 1 - min(eig(R_prime));
end

% Build A from combos
A = false(length(combos));
for i=1:length(combos)
    for j=1:length(combos)
        if length(intersect(combos(i,:),combos(j,:))) == 2
            A(i,j) = true;
        end
    end
end

nodeLabels = nodelabels_mat(combos, multicor);
figure; G = graph(A); p = plot(G);
p.NodeLabel = cellstr(nodeLabels);
