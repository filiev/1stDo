%% 6 A
N = 400;
T = 200;

n = [0:1:N-1];
x(1) = 0;

for i = 0:N-1
    if mod(ceil(2*i/T),2) == 0
        x(i+1) = 0;
    else
        x(i+1) = 1;
    end
end

%% 6B 
% y(n) = (1-a)y(n-1) + ax(n-1) ; y(0) = 0

alpha = 0.1;

a = [1, -(1-alpha)];
b = [0, alpha];

y = filter(b,a,x);


plot(n,x, n, y, '-', 'Linewidth', 2);
grid on;
set(gca,'FontSize', 16);
legend('x(n)', 'y(n)');
xlabel('n');
ylabel('Output');

%% 6C


alpha = [0.01 0.1 0.2];
nalpha = length(alpha);
y = zeros(N,nalpha);

for ialpha = 1:nalpha
    alphai = alpha(ialpha);
    y(:,ialpha) = filter([0,alphai], [1, -(1-alphai)],x);
        
end

plot(y,'-', 'Linewidth', 1.4);
grid on;
set(gca,'FontSize', 16);
legend('a=0.01', 'a=0.1','a=0.2');
xlabel('n');
ylabel('Output');

