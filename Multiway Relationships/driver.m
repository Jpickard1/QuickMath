%% Multiway Relationship Locust Map

%{
n = 100;
m = 2;

X1 = rand(n , m);
X2 = rand(n , m);

X1 = X1 - mean(X1);
X2 = X2 - mean(X2);

%X1 = X1 / std(X1);
%X2 = X2 / std(X2);

X1 = X1 + [0 1];
X2 = X2 + [1 0];

figure; hold on;
scatter(X1(:,1), X1(:,2), '.');
scatter(X2(:,1), X2(:,2), '.');
%}

clear all
close all
%% 2D Multirelation Locust
% figure; scatter(D(1,:), D(2,:), '.')

s = 200;

Zvi = zeros(s,s);
Wang = zeros(s,s);
Taylor = zeros(s,s);

idxs = linspace(-10,10,s);

for i=1:s
    for j=1:s
        D = [1 2 idxs(i)
             2 1 idxs(j)];

        R = cov(D);
        
        Zvi(i,j) = 1 - min(eig(R));
        Wang(i,j) = (1- det(R)^0.5);
        Taylor(i,j) = (1/sqrt(length(R))) * std(eig(R));
        
    end
end

figure; image(Taylor * 100); title('Taylor');
figure; image(Zvi * 100); title('Zvi');
figure; image(Wang * 100); title('Wang')

%% 3D Multirelation Locust
% figure; scatter(D(1,:), D(2,:), '.')

s = 20;

Zvi = zeros(s,s,s);
Wang = zeros(s,s,s);
Taylor = zeros(s,s,s);

idxs = linspace(-1,2,s);

Dfixed = rand(3,2);

for i=1:s
    for j=1:s
        for k=1:s
            D = [0 0 idxs(i);
                 0 0 idxs(j);
                 0 0 idxs(k)];
            D(1:3,1:2) = Dfixed;

            R = cov(D);

            Zvi(i,j) = 1 - min(eig(R));
            Wang(i,j) = (1- det(R)^0.5);
            Taylor(i,j) = (1/sqrt(length(R))) * std(eig(R));
        end
    end
end

figure; 
[X,Y,Z] = ndgrid(1:size(Taylor,1), 1:size(Taylor,2), 1:size(Taylor,3));
scatter3(X(:), Y(:), Z(:), pointsize, 100 * Taylor(:), '.'); title('Taylor'); hold on;

figure; 
[X,Y,Z] = ndgrid(1:size(Zvi,1), 1:size(Zvi,2), 1:size(Zvi,3));
scatter3(X(:), Y(:), Z(:), pointsize, 100 * Zvi(:), '.'); title('Zvi'); hold on;


figure;
[X,Y,Z] = ndgrid(1:size(Wang,1), 1:size(Wang,2), 1:size(Wang,3));
scatter3(X(:), Y(:), Z(:), pointsize, 100 * Wang(:), '.'); title('Wang'); hold on;

%% 3D retry

s = 3;

Zvi = zeros(s,s,s);
Wang = zeros(s,s,s);
Taylor = zeros(s,s,s);

idxs = linspace(-1.1,2.1,s);

Dfixed = rand(3,2);

for i=1:s
    for j=1:s
        for k=1:s
            D = [0 0 idxs(i);
                 0 0 idxs(j);
                 0 0 idxs(k)];
            D(1:3,1:2) = Dfixed;

            D = D - mean(D);
            R = D' * D;
            % R = cov(D);

            Zvi(i,j) = 1 - min(eig(R));
            Wang(i,j) = (1- det(R)^0.5);
            Taylor(i,j) = (1/sqrt(length(R))) * std(eig(R));
        end
    end
end

figure; 
[X,Y,Z] = ndgrid(1:size(Taylor,1), 1:size(Taylor,2), 1:size(Taylor,3));
scatter3(X(:), Y(:), Z(:), pointsize, 100 * Taylor(:), '.'); title('Taylor'); hold on;

figure; 
[X,Y,Z] = ndgrid(1:size(Zvi,1), 1:size(Zvi,2), 1:size(Zvi,3));
scatter3(X(:), Y(:), Z(:), pointsize, 100 * Zvi(:), '.'); title('Zvi'); hold on;


figure;
[X,Y,Z] = ndgrid(1:size(Wang,1), 1:size(Wang,2), 1:size(Wang,3));
scatter3(X(:), Y(:), Z(:), pointsize, 100 * Wang(:), '.'); title('Wang'); hold on;


D = eye(3)
D = D - mean(D)
R = cov(D)
rank(D)
rank(R)


%% Plotting only

clear all;
D = zeros(2,2,2);
D(1,1,2) = 1;
D(1,2,1) = 1;
D(2,1,1) = 1;

scatter3(D);


[X,Y,Z] = xyz2grd(D(:,1),D(:,2),D(:,3)); 
surf(X,Y,Z) 


%% Suft plot continued

X = [0 1]
Y = [0 1]
Z = [0 0;0 0;]
figure; surf(X,Y,Z)

[X,Y] = meshgrid(1:0.5:10,1:20);



%%

clear all
D = rand(4,3)
rank(D)
rank(D'*D)

C = D - mean(D)
rank(C)
rank(C'*C)

% D
% C


%% 

n = 10;
for i=1:1000;
    D = rand(n,n);
    r = rank(D);
    if r ~= n
        disp(r)
    end
    D = D - mean(D);
    r = rank(D);
    if r ~= (n-1)
        disp(r)
    end    
end


%% 2D Norms
l = 1;
n = 100;
s = linspace(-l,l, n);
A = zeros(n,n);
for i=1:n
    a = s(i);
    for j=1:n
        b = s(j);
        A(i,j) = norm([a b], Fro);
    end
end
figure; image(A*100); title('Check which Norm this Is')

%% 3D Norms scatter

p = [0.5, 1, 2, 10];
figure;
for ii=1:length(p)
    l = 1.2;
    n = 100;
    s = linspace(-l,l, n);
    A = zeros(n, n, n);
    for i=1:n
        a = s(i);
        for j=1:n
            b = s(j);
            for k=1:n
                c = s(k);
                A(i, j, k) = norm([a b c], p(ii));
            end
        end
    end

    % find(A > 1.05 & A < 1.10)

    % mean(A);

    A(A < 1.05 | A > 1.10) = 0;

    cords = zeros(1,3);
    for i=1:n
        a = s(i);
        for j=1:n
            b = s(j);
            for k=1:n
                if A(i,j,k) > 0
                    a = s(i);
                    b = s(j);
                    c = s(k);
                    cords = [cords; a b c];
                end
            end
        end
    end
    subplot(1, length(p), ii);
    C = zeros(length(cords), 3)
    C(:,1) = cords(:,3) * 100;
    scatter3(cords(:,1), cords(:,2), cords(:,3), 10, cords(:,3), '.')
    title(string(p(ii)) + " Norm");
end

%% 3D Norms scatter

p = [0.5 1 2 10];
figure;
for ii=1:length(p)
    l = 1.2;
    n = 50;
    %if ii==1
    %    n=300;
    %end
    s = linspace(-l,l, n);
    A = zeros(n, n, n);
    for i=1:n
        a = s(i);
        for j=1:n
            b = s(j);
            for k=1:n
                c = s(k);
                A(i, j, k) = norm([a b c], -1); % p(ii));
            end
        end
    end

    find(A > 1.05 & A < 1.10)

    % mean(A);

    A(A < 1.04 | A > 1.14) = 0;

    cords = zeros(1,3);
    for i=1:n
        a = s(i);
        for j=1:n
            b = s(j);
            for k=1:n
                if A(i,j,k) > 0
                    a = s(i);
                    b = s(j);
                    c = s(k);
                    cords = [cords; a b c];
                end
            end
        end
    end
    subplot(1, length(p), ii);
    scatter3(cords(:,1), cords(:,2), cords(:,3), '.')
    title(string(p(ii)) + " Norm");
end

%% surf

X = [0 1 2]
Y = [0 1 2]
Z = [0 0 0; 
     0 1 0]
figure; surf(X, Y, Z)

stem3
C = zeros(length(cords), 3)
C(:,1) = cords(:,3) * 100;
figure; scatter3(cords(:,1), cords(:,2), cords(:,3), 10, cords(:,3))

%% online help: https://www.mathworks.com/matlabcentral/answers/387362-how-do-i-create-a-3-dimensional-surface-from-x-y-z-points
x = cords(:,1);
y = cords(:,2);
z = cords(:,3);

xlin = linspace(min(x), max(x), 100);
ylin = linspace(min(y), max(y), 100);
[X,Y] = meshgrid(xlin, ylin);
% Z = griddata(x,y,z,X,Y,'natural');
% Z = griddata(x,y,z,X,Y,'cubic');
Z = griddata(x,y,z,X,Y,'v4');
figure;
mesh(X,Y,Z)
axis tight; hold on
figure; plot3(x,y,z,'.','MarkerSize',15)




%% Kernels

figure;
p = ["poly"]; %, "rbf"];
for ii=1:length(p)
    l = 1.0;
    n = 50;
    s = linspace(-l,l, n);
    A = zeros(n, n);
    for i=1:n
        a = s(i);
        for j=1:n
            b = s(j);
            % for k=1:n
            %     c = s(k);
                if strcmp(p(ii), "poly")
                    coef = 1;
                    degree = 0.5;
                    d = (norm([1 1] - [a b]) + coef)^degree;
                    disp(d);
                elseif strcmp(p(ii), "rbf")
                    sigma = 2;
                    d = exp(-norm([1 1] - [a b])/(2 * sigma^2));
                end
                A(i, j) = d; %norm([a b c], p(ii));
            % end
        end
    end

    % find(A > 1.05 & A < 1.10)

    % mean(A);

    % A(A < 0.74 | A > 0.82) = 0;

    cords = zeros(1,2);
    C = zeros(length(cords), 3);
    for i=1:n
        a = s(i);
        for j=1:n
            b = s(j);
            for k=1:n
                % if A(i,j,k) > 0
                    C = [C; A(i,j)*100 0 0];
                    a = s(i);
                    b = s(j);
                    cords = [cords; a b];
                % end
            end
        end
    end
    subplot(1, length(p), ii);
    % C(:,1) = cords(:,3) * 100;
    % scatter(cords(:,1), cords(:,2), 10, cords(:,3), '.')
    scatter(cords(:,1), cords(:,2), 10, round(C), '.')
    title(string(p(ii)) + " Kernel");
end

%% 3Way interactions in 2D data
D = [1 1 1;
     0.2 1 3];
disp(rank(D));
disp(rank(D'*D));
D = D - mean(D)
disp(rank(D));
disp(rank(D'*D));
ksdensity

%% My 3way measure

p = [1];
figure;
for ii=1:length(p)
    l = 1.2;
    n = 100;
    s = linspace(-l,l, n);
    A = zeros(n, n, n);
    for i=1:n
        a = s(i);
        for j=1:n
            b = s(j);
            for k=1:n
                c = s(k);
                v1 = [a b c];
                v2 = [0.01 0.75 1.25];
                v3 = [0.75 0.1 1.5];
                D = [v1' v2' v3'];
                ss = prod(D');
                d = sum(ss);
                A(i, j, k) = d;
            end
        end
    end

    % find(A > 1.05 & A < 1.10)

    % mean(A);

    A(A < 1.00 | A > 1.2) = 0;

    cords = zeros(1,3);
    for i=1:n
        a = s(i);
        for j=1:n
            b = s(j);
            for k=1:n
                if A(i,j,k) > 0
                    a = s(i);
                    b = s(j);
                    c = s(k);
                    cords = [cords; a b c];
                end
            end
        end
    end
    figure; %subplot(1, length(p), ii);
    C = zeros(length(cords), 3)
    C(:,1) = cords(:,3) * 100;
    scatter3(cords(:,1), cords(:,2), cords(:,3), 10, cords(:,3), '.')
    title(string(p(ii)) + " Norm");
end

%% 2D Kernels
    
    l = 1.0;
    n = 75;
    s = linspace(2500,3500, n);
    A = zeros(n, n);
    for i=1:n
        a = s(i);
        for j=1:n
            b = s(j);
            % for k=1:n
            %     c = s(k);
                % if strcmp(p(ii), "poly")
                %    coef = 1;
                %    degree = 0.5;
                %    d = (norm([3400 3100] - [a b]) + coef)^degree;
                %    disp(d);
                % elseif strcmp(p(ii), "rbf")
                     sigma = 2;
                     d = exp(-norm([1 1] - [a b])/(2 * sigma^2));
                % end
                A(i, j) = d; %norm([a b c], p(ii));
            % end
        end
    end

    % find(A > 1.05 & A < 1.10)

    % mean(A);

    % A(A < 0.74 | A > 0.82) = 0;

    A(A>mean(mean(A))) = 0;
    
    cords = zeros(1,2);
    C = zeros(length(cords), 3);
    for i=1:n
        a = s(i);
        for j=1:n
            if A(i,j) > 0
                C = [C; A(i,j)*200 0 0];
                a = s(i);
                b = s(j);
                cords = [cords; a b];
            end
        end
    end
    figure;
    % C(:,1) = cords(:,3) * 100;
    % scatter(cords(:,1), cords(:,2), 10, cords(:,3), '.')
    C(1,:) = [];
    C(2,:) = [];
    cords(1,:) = [];
    scatter(cords(:,1), cords(:,2), 10, round(C), '.')
    
%% 3D Triangle distance

    x1 = [0 0 0];
    x2 = [25 25 5];
    l = 50;
    n = 50;
    s = linspace(-l,l, n);
    A = zeros(n, n, n);
    for i=1:n
        a = s(i);
        for j=1:n
            b = s(j);
            for k=1:n
                c = s(k);
                x3 = [a b c];                
                A(i, j, k) = norm(x1 - x2) + norm(x2 - x3) + norm(x3 - x1);
            end
        end
    end

    A(A > 1.05 * mean(mean(mean(A))) | A < 0.95 * mean(mean(mean(A)))) = 0;

    cords = zeros(1,3);
    for i=1:n
        a = s(i);
        for j=1:n
            b = s(j);
            for k=1:n
                if A(i,j,k) > 0
                    a = s(i);
                    b = s(j);
                    c = s(k);
                    cords = [cords; a b c];
                end
            end
        end
    end
    % subplot(1, length(p), ii);
    figure;
    scatter3(cords(:,1), cords(:,2), cords(:,3), '.')

%% 3D Covariance Plane

    x1 = rand(1,3);
    % x1 = [0 0 0];
    % x2 = [25 25 5];
    l = 50;
    n = 50;
    s = linspace(-l,l, n);
    A = zeros(n, n, n);
    for i=1:n
        a = s(i);
        for j=1:n
            b = s(j);
            for k=1:n
                c = s(k);
                x2 = [a b c];
                r = cov([x1; x2]');
                A(i, j, k) = abs(r(1,2));
            end
        end
    end

    A(A > 1.05 * mean(mean(mean(A))) | A < 0.95 * mean(mean(mean(A)))) = 0;

    cords = zeros(1,3);
    for i=1:n
        a = s(i);
        for j=1:n
            b = s(j);
            for k=1:n
                if A(i,j,k) > 0
                    a = s(i);
                    b = s(j);
                    c = s(k);
                    cords = [cords; a b c];
                end
            end
        end
    end
    % subplot(1, length(p), ii);
    figure;
    scatter3(cords(:,1), cords(:,2), cords(:,3), '.')

%% 3D KL Divergence

    x1 = 100 * rand(1,3);
    % x1 = [0 0 0];
    % x2 = [25 25 5];
    l = 50;
    n = 50;
    s = linspace(-2*l,2*l, n);
    A = zeros(n, n, n);
    for i=1:n
        a = s(i);
        for j=1:n
            b = s(j);
            for k=1:n
                c = s(k);
                x2 = [a b c];
                d = sum(x1 .* log(x1 ./ x2));
                % kl = relativeEntropy([x1' x2'])
                A(i, j, k) = d;
            end
        end
    end
    A = real(A);
    A(A > 1.05 * mean(mean(mean(A))) | A < 0.95 * mean(mean(mean(A)))) = 0;

    cords = zeros(1,3);
    for i=1:n
        a = s(i);
        for j=1:n
            b = s(j);
            for k=1:n
                if A(i,j,k) > 0
                    a = s(i);
                    b = s(j);
                    c = s(k);
                    cords = [cords; a b c];
                end
            end
        end
    end
    % subplot(1, length(p), ii);
    figure;
    scatter3(cords(:,1), cords(:,2), cords(:,3), '.')
    
    