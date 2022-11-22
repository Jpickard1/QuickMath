p = [0.5 1 2 10];
figure;
for ii=1:length(p)
    l = 1.2;
    n = 50;
    if ii==1
        n=300;
    end
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
    subplot(2, 2, ii);
    C = zeros(length(cords), 1); C(:,1) = cords(:,3);
    scatter3(cords(:,1), cords(:,2), cords(:,3), pointsize, C, '.');
    title(string(p(ii)) + " Norm");
end
saveas(gcf, 'norm_locus.png')