audio = audioread('guitar.wav');
ss = schroederFunction(0.8);
y = fftfilt(ss,audio); 
sound(y);