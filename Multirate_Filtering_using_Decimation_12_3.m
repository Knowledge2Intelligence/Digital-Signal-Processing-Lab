Fs = 48000;                      % Sampling frequency
t = 0:1/Fs:1-(1/Fs);             % Time vector
x = cos(2*pi*4000*t);            % Input cosine wave

% FIR Decimation filter (lowpass filter before downsampling)
Hm = designfilt('lowpassfir', ...
                'PassbandFrequency', 0.2, ...
                'StopbandFrequency', 0.3, ...
                'PassbandRipple', 1, ...
                'StopbandAttenuation', 60, ...
                'DesignMethod', 'equiripple');

fvtool(Hm);                      % View frequency response
fvtool(Hm, 'analysis', 'grpdelay');  % View group delay

% Apply filter and then downsample
y_filtered = filter(Hm, x);       % Low-pass filter the signal
y = downsample(y_filtered, 2);    % Downsample by factor of 2

% Plot the decimated output
stem(y(1:48), 'markerfacecolor', [0 0 1]); 
title('Decimated Signal');
xlabel('Sample Index'); ylabel('Amplitude');
grid on;
