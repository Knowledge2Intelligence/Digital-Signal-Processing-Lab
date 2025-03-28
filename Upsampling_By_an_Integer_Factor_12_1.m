x = [1 2 3 4];   % Example input signal
k = 3;           % Upsampling factor
y = up(x, k);
disp(y);         % Output: [1 0 0 2 0 0 3 0 0 4]
stem(y);         % Plot the upsampled signal

function y = up(x, k)
    % Function to perform upsampling by a factor of k
    % Usage: y = up(x, k)
    
    y = zeros(1, k * length(x));  % Allocate memory for output
    y(1:k:end) = x;               % Insert original samples at intervals of k
end
