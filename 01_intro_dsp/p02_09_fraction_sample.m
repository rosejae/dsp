clc; clear; close all;

% 샘플링 개수 설정
N = 64; % DTFT 계산을 위한 신호 길이
n = 0:N-1; % 샘플 인덱스

% 델타 함수 (원본 신호)
x = zeros(1, N);
x(1) = 1; % 단위 임펄스 (델타 함수)

% 신호 지연 값 설정
d1 = 3;      % 정수 지연
d2 = 1/3;    % 비정수 지연

% 정수 지연 신호 (d1 샘플만큼 이동)
x_delayed1 = zeros(1, N);
x_delayed1(mod(n - d1, N) + 1) = 1; % 정수 지연

% 비정수 지연 신호 (d2 샘플만큼 이동, sinc 보간 사용)
x_delayed2 = sinc(n - d2); % sinc 보간을 사용하여 지연 신호 생성
x_delayed2 = x_delayed2 / max(x_delayed2); % 정규화

% DTFT 계산
w = linspace(-pi, pi, N); % 주파수 축
X = fftshift(fft(x, N)); % 원본 신호 DTFT
X_delayed1 = fftshift(fft(x_delayed1, N)); % 정수 지연 DTFT
X_delayed2 = fftshift(fft(x_delayed2, N)); % 비정수 지연 DTFT

% 🔹 DTFT 크기 비교
figure;
subplot(2,1,1);
plot(w, abs(X), 'k', 'LineWidth', 1.5); hold on;
plot(w, abs(X_delayed1), 'b--', 'LineWidth', 1.5);
plot(w, abs(X_delayed2), 'r--', 'LineWidth', 1.5);
legend('원본 신호 DTFT', '정수 지연 (d=3)', '비정수 지연 (d=1/3)');
xlabel('\omega (라디안)');
ylabel('|X(e^{j\omega})|');
title('DTFT 크기 비교');
grid on;

% 🔹 DTFT 위상 비교
subplot(2,1,2);
plot(w, angle(X), 'k', 'LineWidth', 1.5); hold on;
plot(w, angle(X_delayed1), 'b--', 'LineWidth', 1.5);
plot(w, angle(X_delayed2), 'r--', 'LineWidth', 1.5);
legend('원본 신호 위상', '정수 지연 (d=3)', '비정수 지연 (d=1/3)');
xlabel('\omega (라디안)');
ylabel('Phase (라디안)');
title('DTFT 위상 비교');
grid on;