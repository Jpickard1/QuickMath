function dydt = Asymmetric_Networks_Repressilators(t,init,b,a,m,n,L)
%THIS WORKS FOR ANY NUMBER OF SYSTEMS IN NETWORK

%k = number of systems in network*
k = length(init)/n;

x = zeros(k,1);
y = zeros(k,1);
z = zeros(k,1);


%EXAMPLE: 3 nodes per system (n), two systems in network (k)
%   L = [-3   1;
%        1  -3];
% L = ones(k);
% for i = 1:k
%     L(i,i) = L(i,i)*-(k-1);
% end

count = 1;
for i = 1:length(init)
    if mod(i,3) == 1
        x(count,1) = init(i);
    elseif mod(i,3) == 2
        y(count,1) = init(i);
    else
        z(count,1) = init(i);
        count = count + 1;
    end
end

% L = [-2 1 0 0 1
%      1 -2 1 0 0
%      0 1 -2 1 0
%      0 0 1 -2 1
%      1 0 0 1 -2];
     
x_couple = L*b(1)*x;
y_couple = L*b(2)*y;
z_couple = L*b(3)*z;

%k = number of systems in network*
for i = 1:k
    %REPRESSILATOR
    dx(i) = a(1)/(1+z(i)^m) - x(i) + x_couple(i);
    dy(i) = a(2)/(1+x(i)^m) - y(i) + y_couple(i);
    dz(i) = a(3)/(1+y(i)^m) - z(i) + z_couple(i);
end


dydt = zeros(length(init),1);
for i = 1:length(init)
    if mod(i,3) == 1
        dydt(i,1) = dx(ceil(i/3));
    elseif mod(i,3) == 2
        dydt(i,1) = dy(ceil(i/3));
    else
        dydt(i,1) = dz(ceil(i/3));
    end
end

%(return dydt)
return;