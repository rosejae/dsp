w = [-4*pi:0.01:4*pi];
M = 5;
H = 1 / (M+1) * exp(-j*w*M/2) .* sin(w*(M+1)/2) ./ (sin(w/2)+eps);

% subplot(211);
% plot(w/(2*pi),abs(H));
% subplot(212);
% plot(w/(2*pi), angle(H)/pi);

subplot(211);
plot(w/pi,abs(H));
subplot(212);
plot(w/pi, angle(H)/pi);