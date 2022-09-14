%% Preferential Detachment Algorithm (PDA)
%   The Preferential Detachment Algorithm (PDA) is motivated by the 
%   Barabasi-Albert model of Preferential Attachment scale free networks. 
%   The PA algorithm results in scale free networks where the degree
%   distribution in the network obeys a power law. This process works by
%   adding edges with preference towards the most central nodes (degree 
%   centrality although other measures work as well).
%
%   I would like to engineer a reversed process to deconstruct a graph into
%   multiple subgraphs that have similar characteristics of the original
%   graph.
%
% Auth: Joshua Pickard
%       jpic@umich.edu
% Date: July 27, 2022

n = 10
G = graph(true(n), 'omitselfloops'); % Alternative without self-loops
p = randperm(numedges(G), e);
G = graph(G.Edges(p, :));
A = adjacency(G)
image(A*100)
figure; plot(G)


