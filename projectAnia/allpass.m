clc;
audio = audioread('guitar.wav');
a = 0.5;
d = 500;
num = [-a; zeros(d,1); 1]';
den = [1; zeros(d,1); -a]';
%disp(num);
signal = filter(num, den, audio);
%sound(audio);
sound(signal);
figure; 
normalised = signal / max(abs(signal));
audiowrite('outputsignal.wav', normalised, 44100)
%freqz(num, den);
%%plot(audio(1:20000)); 
%hold;
%%plot(signal(1:20000));