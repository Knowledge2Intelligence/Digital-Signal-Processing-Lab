%Program for computing autocorrelation 
clc;clear all;close all; 
x=input('Enter X[n]:'); 
y= xcorr(x,x); 
subplot(2,2,1); 
stem(x); 
xlabel('time'); 
ylabel('amplitude'); 
title('input sequence x[n]'); 
subplot(2,2,2); 
stem(y); 
xlabel('time'); 
ylabel('amplitude'); 
title('auto correlation '); 
disp(y); 