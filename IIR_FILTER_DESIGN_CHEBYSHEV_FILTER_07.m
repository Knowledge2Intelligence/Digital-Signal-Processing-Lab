clc; 
close all; 
format long; 

display('Chebyshev Type-I Filter Design'); 

% User input
a2 = input(['Enter the choice of the filter in number:\n', ...
    ' 1. Analog LPF\n 2. Analog HPF\n 3. Analog BPF\n 4. Analog BSF\n', ...
    ' 5. Digital LPF\n 6. Digital HPF\n 7. Digital BPF\n 8. Digital BSF\nChoice: ']);

rp = input('Enter the passband ripple (dB): '); 
rs = input('Enter the stopband ripple (dB): '); 
wp = input('Enter the passband frequency: '); 
ws = input('Enter the stopband frequency: '); 
fs = input('Enter the sampling frequency: '); 

% Normalized frequencies for digital filters
w1 = 2 * wp / fs; 
w2 = 2 * ws / fs; 

% Frequency range
w = 0:0.01:pi; 

% Analog Filters
if a2 == 1  % Analog LPF
    [n, wn] = cheb1ord(2*pi*wp, 2*pi*ws, rp, rs, 's'); 
    [b, a] = cheby1(n, rp, wn, 's'); 
    [h, om] = freqs(b, a, w); 

elseif a2 == 2  % Analog HPF
    [n, wn] = cheb1ord(2*pi*wp, 2*pi*ws, rp, rs, 's'); 
    [b, a] = cheby1(n, rp, wn, 'high', 's'); 
    [h, om] = freqs(b, a, w); 

elseif a2 == 3  % Analog BPF
    [n, wn] = cheb1ord([2*pi*wp 2*pi*ws], [2*pi*ws 2*pi*wp], rp, rs, 's'); 
    [b, a] = cheby1(n, rp, wn, 'bandpass', 's'); 
    [h, om] = freqs(b, a, w); 

elseif a2 == 4  % Analog BSF
    [n, wn] = cheb1ord([2*pi*wp 2*pi*ws], [2*pi*ws 2*pi*wp], rp, rs, 's'); 
    [b, a] = cheby1(n, rp, wn, 'stop', 's'); 
    [h, om] = freqs(b, a, w); 

% Digital Filters
elseif a2 == 5  % Digital LPF
    [n, wn] = cheb1ord(w1, w2, rp, rs); 
    [b, a] = cheby1(n, rp, wn, 'low'); 
    [h, om] = freqz(b, a, w); 

elseif a2 == 6  % Digital HPF
    [n, wn] = cheb1ord(w1, w2, rp, rs); 
    [b, a] = cheby1(n, rp, wn, 'high'); 
    [h, om] = freqz(b, a, w); 

elseif a2 == 7  % Digital BPF
    [n, wn] = cheb1ord([w1 w2], [w2 w1], rp, rs); 
    [b, a] = cheby1(n, rp, wn, 'bandpass'); 
    [h, om] = freqz(b, a, w); 

elseif a2 == 8  % Digital BSF
    [n, wn] = cheb1ord([w1 w2], [w2 w1], rp, rs); 
    [b, a] = cheby1(n, rp, wn, 'stop'); 
    [h, om] = freqz(b, a, w); 

else
    error('Invalid choice! Please enter a number between 1 and 8.');
end

% Compute magnitude and phase response
m = 20 * log10(abs(h)); 
an = angle(h); 

% Plot magnitude response
subplot(2,1,1); 
plot(om/pi, m, 'b', 'LineWidth', 1.5); 
ylabel('Gain (dB)'); 
xlabel('Normalized Frequency'); 
title('Magnitude Response'); 
grid on;

% Plot phase response
subplot(2,1,2); 
plot(om/pi, an, 'r', 'LineWidth', 1.5); 
ylabel('Phase (radians)'); 
xlabel('Normalized Frequency'); 
title('Phase Response'); 
grid on;
