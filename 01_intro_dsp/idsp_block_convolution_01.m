clc;
clear all;
x = input('Enter the sequence x(n) = ');
h = input('Enter the sequence h(n) = ');
n1 = length(x);
n2 = length(h);
N = n1+n2-1;
h1 = [h zeros(1,N-n1)];
n3 = length(h1);
y = zeros(1,N);
x1 = [zeros(1,n3-n2) x zeros(1,n3)];
H = fft(h1);

for i = 1:n2:N
    y1 = x1(i:i+(2*(n3-n2)));
    y2 = fft(y1);
    y3 = y2.*H;
    y4 = round(ifft(y3));
    y(i:(i+n3-n2)) = y4(n2:n3);
end

subplot(3,1,1);
stem(x(1:n1));
grid on;
title('Input Sequence x(n)');
xlabel('Time --->');
ylabel('Amplitude --->');

subplot(3,1,2);
stem(h(1:n2));
grid on;
title('Input Sequence h(n)');
xlabel('Time --->');
ylabel('Amplitude --->');

subplot(3,1,3);
disp('Block Convolution Using Overlap Save Method = ');
disp(y(1:N));
stem(y(1:N));
grid on;
title('Block Convolution Using Overlap Save Method');
xlabel('Time --->');
ylabel('Amplitude --->');