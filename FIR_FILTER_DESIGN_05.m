clc; 
clear all; 
close all; 

% User input
c = input('Enter your choice of window function: 1.Rectangular 2.Kaiser 3.Bartlett 4.Blackman 5.Hamming 6.Hanning: '); 
rp = input('Enter passband ripple: '); 
rs = input('Enter stopband ripple: '); 
fp = input('Enter passband freq: '); 
fs = input('Enter stopband freq: '); 
f = input('Enter sampling freq: '); 
beta = input('Enter the beta value (for Kaiser window): '); 

% Normalized frequencies
wp = 2 * fp / f; 
ws = 2 * fs / f; 

% Calculate filter order
num = -20 * log10(sqrt(rp * rs)) - 13; 
dem = 14.6 * (fs - fp) / f; 
n = ceil(num / dem); 
n1 = n + 1; 

% Ensure filter order is even
if rem(n,2) ~= 0
    n1 = n; 
    n = n - 1; 
end 

% Select window function
if c == 1
    y = rectwin(n1); 
    disp('Rectangular window filter response'); 
elseif c == 2
    y = kaiser(n1, beta); 
    disp('Kaiser window filter response'); 
elseif c == 3
    y = bartlett(n1); 
    disp('Bartlett window filter response'); 
elseif c == 4
    y = blackman(n1); 
    disp('Blackman window filter response'); 
elseif c == 5
    y = hamming(n1); 
    disp('Hamming window filter response'); 
elseif c == 6
    y = hann(n1); 
    disp('Hanning window filter response'); 
else
    error('Invalid choice! Please enter a number between 1 and 6.');
end

% LPF Design
b = fir1(n, wp, y); 
[h, o] = freqz(b, 1, 256); 
m = 20 * log10(abs(h)); 
subplot(2,2,1); 
plot(o/pi, m); 
title('LPF'); 
ylabel('Gain (dB)'); 
xlabel('Normalized Frequency');

% HPF Design
b = fir1(n, wp, 'high', y); 
[h, o] = freqz(b, 1, 256); 
m = 20 * log10(abs(h)); 
subplot(2,2,2); 
plot(o/pi, m); 
title('HPF'); 
ylabel('Gain (dB)'); 
xlabel('Normalized Frequency');

% BPF Design
wn = [wp ws]; 
b = fir1(n, wn, y); 
[h, o] = freqz(b, 1, 256); 
m = 20 * log10(abs(h)); 
subplot(2,2,3);
plot(o/pi, m); 
title('BPF'); 
ylabel('Gain (dB)'); 
xlabel('Normalized Frequency');

% BSF Design
b = fir1(n, wn, 'stop', y); 
[h, o] = freqz(b, 1, 256); 
m = 20 * log10(abs(h)); 
subplot(2,2,4); 
plot(o/pi, m); 
title('BSF'); 
ylabel('Gain (dB)'); 
xlabel('Normalized Frequency');
