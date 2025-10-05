clc ; clear;
syms t ;
a = 15;
lambda = 0.45;
omega = pi /2 ; 
phi = -pi /2;
x = a * exp(-lambda*t) * cos(omega* t + phi ) ;
fplot(x,[0 10],'r--')
hold on
grid on
title('mô tả dao động tắt dần');
xlabel('thời gian')
ylabel('hàm f(x)')
syms x y 
