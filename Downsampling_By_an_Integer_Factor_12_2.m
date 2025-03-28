x = [1 2 3 4 5 6 7 8 9 10];  % Example input signal
k = 2;                       % Downsampling factor
y = dns(x, k);
disp(y);                     % Output: [1 3 5 7 9]
stem(y);                     % Plot the downsampled signal
function y = dns(x, k)
    % Function to perform downsampling by a factor of k
    % Usage: y = dns(x, k)
    
    y = x(1:k:end);  % Select every k-th sample
end
