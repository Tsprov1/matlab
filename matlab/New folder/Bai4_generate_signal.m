% generate_signal.m
% Tạo dữ liệu s(t) và vẽ đồ thị trong 1 chu kì, mỗi chu kì có N điểm lấy mẫu.
% Bạn CHỈ cần sửa các tham số trong khối 'THIẾT LẬP THAM SỐ' cho khớp đề bài.
%
% Mô hình tín hiệu (một ví dụ phổ biến):
%   s(t) = A * sin(2*pi*f*t + phi) + n(t)
%   với n(t) ~ Normal(mu, sigma^2). Với phân bố chuẩn, trung vị = kỳ vọng = mu.
%
% Kết quả:
%  - Lưu file 's_data.txt' gồm 2 cột [t, s(t)] cho P chu kì
%  - Vẽ đồ thị s(t) trong 1 chu kì (N mẫu)

%% ======================= THIẾT LẬP THAM SỐ ============================
A     = 1.0;          % Biên độ sóng sin (sửa theo đề)
f     = 50;           % Tần số (Hz) của tín hiệu (sửa theo đề)
phi   = pi/6;         % Pha (rad) (sửa theo đề nếu có)
N     = 200;          % Số điểm lấy mẫu trong MỖI chu kì (sửa theo đề)
P     = 3;            % Số chu kì muốn tạo dữ liệu để xuất file .txt
mu    = 0.0;          % Trung vị (== kỳ vọng) của nhiễu Gaussian (sửa theo đề)
sigma = 0.1;          % Độ lệch chuẩn của nhiễu Gaussian (sửa theo đề)
seed  = 2025;         % Hạt giống tạo ngẫu nhiên để tái lập kết quả (tùy chọn)
% =======================================================================

%% Các đại lượng suy ra
T  = 1/f;            % Chu kì (s)
fs = N/T;            % Tần số lấy mẫu để có N mẫu trong 1 chu kì (fs = N * f)
dt = 1/fs;           % Bước thời gian
M  = N * P;          % Tổng số mẫu cho P chu kì

%% Trục thời gian và nhiễu
rng(seed, 'twister');                     % Cố định ngẫu nhiên (tùy chọn)
t = (0:M-1) * dt;                         % Vector thời gian (1 x M)
noise = sigma * randn(1, M) + mu;         % n(t) ~ N(mu, sigma^2)

%% Tín hiệu
s = A * sin(2*pi*f*t + phi) + noise;      % s(t)

%% Lưu dữ liệu ra file TXT: 2 cột [t, s(t)]
data = [t(:), s(:)];
writematrix(data, 's_data.txt', 'Delimiter', 'tab');   % tạo trong thư mục làm việc hiện tại
fprintf('Đã lưu %d mẫu vào file s_data.txt (2 cột: t\\ts)\\n', M);

%% Vẽ s(t) trong 1 chu kì (N điểm)
idx1 = 1:N;                                % chỉ số 1 chu kì đầu tiên
figure;
plot(t(idx1), s(idx1), 'LineWidth', 1.2);
grid on;
xlabel('t (s)');
ylabel('s(t)');
title(sprintf('Tín hiệu s(t) trong 1 chu kì (N = %d mẫu, f = %.3f Hz)', N, f));
