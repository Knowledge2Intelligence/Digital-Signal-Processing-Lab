clc;
clear all;
close all;
x=input('Enter X[n]:'); 
h=input('enter h[n]:'); 
y= conv(x,h)
subplot(3,2,1);
stem(x); 
xlabel('time');
ylabel('amplitude'); 
title('input sequence x[n]'); 
subplot(3,2,2); 
stem(h); 
xlabel('time');
ylabel('amplitude');
title('impluse resonse of the system h[n]');
subplot(3,2,3);
stem(y);
xlabel('time');
ylabel('amplitude');
title('linear convolution');
disp(y);