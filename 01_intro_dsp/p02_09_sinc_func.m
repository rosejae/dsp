clc; clear; close all;

% x 값 설정
x = linspace(-10, 10, 1000); % -10부터 10까지 1000개의 점

% sinc 함수 정의
y = sinc(x); % MATLAB의 sinc 함수는 sin(πx)/(πx) 형태로 정의됨

% 그래프 그리기
figure;
plot(x, y, 'b', 'LineWidth', 2);
grid on;
xlabel('x');
ylabel('sinc(x)');
title('Sinc Function: sinc(x) = sin(\pi x) / (\pi x)');
ylim([-0.3, 1.1]); % y축 범위 설정

% 원점 강조
hold on;
plot(0, 1, 'ro', 'MarkerFaceColor', 'r'); % sinc(0) = 1인 점 표시
hold off;