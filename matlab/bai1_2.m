%% a) khai báo symbolic và biểu thức
syms t x y
A = 10;
w = pi;
v = 1.5;
k = w / v;
r1 = sqrt((x+5)^2 + y^2);
r2 = sqrt((x-5)^2 + y^2);
u_sym = A*cos(w*t - k*r1) + A*cos(w*t - k*r2);   % u(x,y,t)

%% Vẽ dao động tại N(4,5)
uN = matlabFunction(subs(u_sym, [x y], [4 5]), 'Vars', t);
figure(1)
fplot(uN, [0 4])   % vẽ trong 4 s (thay đổi theo nhu cầu)
xlabel('t (s)')
ylabel('u(4,5,t)')
title('Dao động tại N(4,5)')
grid on

%% b) quỹ tích cực đại / cực tiểu (figure 2)
% chuẩn bị lưới:
xg = linspace(-20,20,900);
yg = linspace(-12,12,500);
[X,Y] = meshgrid(xg, yg);
R1 = sqrt((X+5).^2 + Y.^2);
R2 = sqrt((X-5).^2 + Y.^2);
D = abs(R2 - R1);   % độ dài đường truyền chênh lệch

lambda = v * (2*pi / w);   % =3
% mức cho một vài orders
Nmax = 6;
levels_cons = (0:Nmax) * lambda;           % Δr = n*λ -> cực đại
levels_des  = (0:Nmax) * lambda + lambda/2; % Δr = (n+1/2)λ -> cực tiểu

figure(2)
contour(X,Y,D, levels_cons, 'LineWidth',1.2); hold on
contour(X,Y,D, levels_des, '--','LineWidth',1.0);
plot(-5,0,'ko','MarkerFaceColor','k','MarkerSize',6) % S1
plot(5,0,'ko','MarkerFaceColor','k','MarkerSize',6)  % S2
legend('Cực đại: \Delta r = n\lambda','Cực tiểu: \Delta r = (n+1/2)\lambda','S1','S2','Location','northeastoutside')
axis equal
xlim([-20 20])
ylim([-12 12])
xlabel('x (m)')
ylabel('y (m)')
title('Quỹ tích điểm dao động với biên độ cực đại / cực tiểu')
grid on
hold off
