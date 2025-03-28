Fs = 48000;                      % Original sampling frequency
t = 0:1/Fs:1-(1/Fs);             % Time vector
x = cos(2*pi*4000*t);            % Input cosine wave

% FIR Interpolation filter (lowpass filter after upsampling)
Hm = designfilt('lowpassfir', ...
                'PassbandFrequency', 0.2, ...
                'StopbandFrequency', 0.3, ...
                'PassbandRipple', 1, ...
                'StopbandAttenuation', 60, ...
                'DesignMethod', 'equiripple');

fvtool(Hm);                      % View frequency response
fvtool(Hm, 'analysis', 'grpdelay');  % View group delay

% Upsample and then apply filter
y_upsampled = upsample(x, 2);    % Upsample by factor of 2 (inserts zeros)
y = filter(Hm, y_upsampled);     % Low-pass filter the upsampled signal

% Plot the interpolated output
stem(y(1:96), 'markerfacecolor', [0 0 1]);  % Plot first 96 samples
title('Interpolated Signal');
xlabel('Sample Index'); ylabel('Amplitude');
grid on;
