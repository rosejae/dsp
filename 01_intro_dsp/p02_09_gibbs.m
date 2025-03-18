clc; clear; close all;

% 시간 벡터 설정
t = linspace(-1, 1, 1000); % -1부터 1까지 1000개의 점
L = 1; % 주기 2L = 2

% 이상적인 구형파 정의
square_wave = zeros(size(t));
square_wave(t >= 0) = 1;
square_wave(t < 0) = -1;

% 푸리에 급수 근사 계산
N_terms = [1, 3, 5, 10, 50]; % 사용할 푸리에 급수 항의 개수
figure;
hold on;
for k = 1:length(N_terms)
    N = N_terms(k);
    fourier_approx = zeros(size(t));
    
    % 푸리에 급수 근사 계산
    for n = 1:2:2*N-1  % 홀수 항만 사용 (구형파의 푸리에 급수)
        fourier_approx = fourier_approx + (4/pi) * (1/n) * sin(n * pi * t / L);
    end
    
    % 그래프 출력
    subplot(2, 3, k);
    plot(t, square_wave, 'k', 'LineWidth', 2); hold on;
    plot(t, fourier_approx, 'r', 'LineWidth', 1.5);
    title(['N = ', num2str(N)]);
    ylim([-1.5, 1.5]);
    xlabel('Time');
    ylabel('Amplitude');
    grid on;
end

% 전체 제목
sgtitle('Gibbs Phenomenon in Fourier Series Approximation');
hold off;