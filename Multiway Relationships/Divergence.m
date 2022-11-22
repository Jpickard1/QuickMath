pointsize = 10;
figure;
l = 1.2;

n = 300;

x1 = rand(1,3);
x1 = x1 / sum(x1);

s = linspace(-l,l, n);
% SDE
alpha = 0.5;
A = zeros(n, n, n);
for i=1:n
    a = s(i);
    for j=1:n
        b = s(j);
        for k=1:n
            c = s(k);
            x2 = [a b c];
            x2 = x2 / sum(x2);
            d = sum((x1 - x2).^2);
            % d = (1/(1-alpha)) * log(sum((x1.^alpha)./(x2.^(alpha-1))));
            % d = sum(x1 .* log(x1 ./ x2));
            % kl = relativeEntropy([x1' x2'])
            A(i, j, k) = d;
        end
    end
end
A = real(A);
% A = abs(A);
A(A > 1.20 * mean(mean(mean(A))) | A < 0.80 * mean(mean(mean(A)))) = 0;

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
%subplot(2,2, 1);
C = zeros(length(cords), 1); C(:,1) = cords(:,3);
scatter3(cords(:,1), cords(:,2), cords(:,3), pointsize, C, '.');
title('SED Divergence');

% KL Divergence
x1 = 100 * rand(1,3);
x1 = x1 / sum(x1);
l = 50;
n = 100;
s = linspace(-2*l,2*l, n);
A = zeros(n, n, n);
for i=1:n
    a = s(i);
    for j=1:n
        b = s(j);
        for k=1:n
            c = s(k);
            x2 = [a b c];
            x2 = x2 / sum(x2);
            d = sum(x1 .* log(x1 ./ x2));
            % kl = relativeEntropy([x1' x2'])
            A(i, j, k) = d;
        end
    end
end
A = real(A);
A = abs(A);
A(A > 1.1 * mean(mean(mean(A))) | A < 0.9 * mean(mean(mean(A)))) = 0;

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
scatter3(cords(:,1), cords(:,2), cords(:,3), pointsize, C, '.');
title('KL Divergence');

% Renyi divergence
alpha = 0.5;
A = zeros(n, n, n);
for i=1:n
    a = s(i);
    for j=1:n
        b = s(j);
        for k=1:n
            c = s(k);
            x2 = [a b c];
            x2 = x2 / sum(x2);
            d = (1/(1-alpha)) * log(sum((x1.^alpha)./(x2.^(alpha-1))));
            % d = sum(x1 .* log(x1 ./ x2));
            % kl = relativeEntropy([x1' x2'])
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
subplot(2,2, 3);
C = zeros(length(cords), 1); C(:,1) = cords(:,3);
scatter3(cords(:,1), cords(:,2), cords(:,3), pointsize, C, '.');
title('Renyi Divergence: ' + string(alpha));

% Renyi divergence
alpha = 10;
A = zeros(n, n, n);
for i=1:n
    a = s(i);
    for j=1:n
        b = s(j);
        for k=1:n
            c = s(k);
            x2 = [a b c];
            x2 = x2 / sum(x2);

            d = (1/(1-alpha)) * log(sum((x1.^alpha)./(x2.^(alpha-1))));
            % d = sum(x1 .* log(x1 ./ x2));
            % kl = relativeEntropy([x1' x2'])
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
subplot(2,2, 4);
C = zeros(length(cords), 1); C(:,1) = cords(:,3);
scatter3(cords(:,1), cords(:,2), cords(:,3), pointsize, C, '.');
title('Renyi Divergence: ' + string(alpha));

saveas(gcf, 'divergence_locus.png')
