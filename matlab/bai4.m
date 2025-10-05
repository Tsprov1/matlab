C = sqrt(2*pi );
omega = 2*pi;
mu =0.0;
sigma = 1;
N = 5; 
V = 40;
t = linspace(0,N,50) ;
n = rand(1,50); 
s = C * sin(omega*t) + n ;
plot(s)
%% dữ liệu 
data = [t(:), s(:)];
writematrix(data, 'data_1', 'Delimiter', 'tab' );
