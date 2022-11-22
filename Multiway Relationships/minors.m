rng(0)

D = rand(4,3)
D(4,:) = 1;

figure;
pointsize = 10;

% Drezner
l = 10;
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
            D(1:3,3) = x2';
            R = cov(D);
            d = 1 - min(eig(R));
            A(i, j, k) = d;
        end
    end
end

A = real(A);
A = abs(A);
A(A > 1.005 * mean(mean(mean(A))) | A < 0.995 * mean(mean(mean(A)))) = 0;

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
subplot(2,2, 1);
C = zeros(length(cords), 1); C(:,1) = cords(:,3);
scatter3(cords(:,1), cords(:,2), cords(:,3), pointsize, C, '.')
title('Drezner');

% Benjamin Taylor
l = 10;
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
            D(1:3,3) = x2';
            % R = cov(D);
            d = (1/sqrt(length(D))) * std(eig(corrcoef(D)));
            % d = (1/sqrt(4)) * std(eig(R));
            A(i, j, k) = d;
        end
    end
end

A = real(A);
A = abs(A);
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
subplot(2,2, 2);
C = zeros(length(cords), 1); C(:,1) = cords(:,3);
scatter3(cords(:,1), cords(:,2), cords(:,3), pointsize, C, '.')
title('Taylor');

% Weng Zheng
l = 10;
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
            D(1:3,3) = x2';
            R = cov(D);
            d = (1-det(R))^0.5;
            A(i, j, k) = d;
        end
    end
end

A = real(A);
A(A > 1.02 * mean(mean(mean(A))) | A < 0.97 * mean(mean(mean(A)))) = 0;
% A(A > 0.9999991 * mean(mean(mean(A)))) = 0;
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
subplot(2,2, 3);
C = zeros(length(cords), 1); C(:,1) = cords(:,3);
scatter3(cords(:,1), cords(:,2), cords(:,3), pointsize, C, '.')
title('Weng and Zheng');

% Covariance tensor
l = 10;
n = 200;
s = linspace(-l,l, n);
A = zeros(n, n, n);
for i=1:n
    a = s(i);
    for j=1:n
        b = s(j);
        for k=1:n
            c = s(k);
            x2 = [a b c];
            D(1:3,3) = x2';
            d = sum(prod(D'));
            A(i, j, k) = d;
        end
    end
end

A = real(A);
A(A > 1.02 * mean(mean(mean(A))) | A < 0.97 * mean(mean(mean(A)))) = 0;
% A(A > 0.9999991 * mean(mean(mean(A)))) = 0;
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
subplot(2,2, 4);
C = zeros(length(cords), 1); C(:,1) = cords(:,3);
scatter3(cords(:,1), cords(:,2), cords(:,3), pointsize, C, '.')
title('Covariance Tensor');

saveas(gcf, 'multiway_locus.png')