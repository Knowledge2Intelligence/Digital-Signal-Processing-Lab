clc; clear all; close all;

% Input sequence
x = input('Enter the sequence: ');
N = input('Enter the number of samples: ');

% Compute FFT
X = fft(x, N);
disp('FFT of the sequence:');
disp(X);

% Plot FFT (Real Part)
subplot(2,2,1);
stem(0:N-1, real(X), 'filled');  
xlabel('Index k');
ylabel('Amplitude');
title('FFT (Real Part)');

% Compute and Plot Magnitude Response
z = abs(X);
disp('Magnitude response is:');
disp(z);
subplot(2,2,2);
stem(0:N-1, z, 'filled');
xlabel('Index k');
ylabel('Magnitude');
title('Magnitude Response |X(k)|');

% Compute and Plot Phase Response
t = angle(X);
disp('Phase response is:');
disp(t);
subplot(2,2,3);
stem(0:N-1, t, 'filled');
xlabel('Index k');
ylabel('Angle (radians)');
title('Phase Response ∠X(k)');
grid on;

% Compute IFFT
x_ifft = ifft(X, N);
disp('Reconstructed sequence using IFFT:');
disp(real(x_ifft));

% Plot IFFT (Reconstructed Signal)
subplot(2,2,4);
stem(0:N-1, real(x_ifft), 'filled');
xlabel('Index n');
ylabel('Amplitude');
title('IFFT (Reconstructed Signal)');
