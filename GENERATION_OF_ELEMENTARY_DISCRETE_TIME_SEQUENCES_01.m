%unit impulse 
clc; 
N=25; 
n=-3:1:3; 
x4=(N==0); 
subplot(3,2,1); 
stem(n==0); 
title('unit impulse signal'); 
xlabel('time'); 
ylabel('amp');

%cosine wave 
clc; 
N=20; 
n=(0:.5:N); 
x1=((exp(1i*n)+exp(-1i*n))/2); 
subplot(3,2,3); 
stem(x1); 
xlabel('time'); 
ylabel('amp'); 
title('cosine wave'); 
 
%unit step 
clc; 
N=20; 
n=0:3;N; 
x2=(n>=0); 
subplot(3,2,5); 
stem(x2); 
xlabel('time'); 
ylabel('amp'); 
title('unit step'); 
 
%sine wave 
clc; 
n=(1:.4:20); 
x=((exp(i*n)-exp(-1*n))/(2*i)); 
subplot(3,2,2); 
stem(x); 
xlabel('time'); 
ylabel('amp'); 
title('sine wave'); 
 
%exponential 
clc; 
N=5; 
a=2; 
n=0:1:N; 
x5=a.^n; 
subplot(3,2,4); 
stem(n,x5); 
xlabel('time'); 
ylabel('amp'); 
title('exponential'); 

%unit ramp 
clc; 
n=20; 
n=(0:2:n); 
x3=n; 
subplot(3,2,6); 
stem(n,x3); 
xlabel('time'); 
ylabel('amp'); 
title('unit ramp'); 