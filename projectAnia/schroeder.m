clc;
sys = 0;
audio = audioread('guitar.wav');
d = [1553; 1613; 1493; 1153; 223; 443];
a = [0.85 ; 0.85; 0.75; 0.75; 0.7; 0.7];
b = [0.3 ; 0.25; 0.25; 0.2];
userInput = 1;

for i=1:length(d)
    if i<=4
        num = b(i)*userInput;
        den = [1 ; zeros(d(i)*userInput,1); -a(i)*userInput]';
        sys = sys + tf(num, den);
    else 
        num = [-a(i)*userInput; zeros(d(i)*userInput,1);1]';
        den = [1 ; zeros(d(i)*userInput,1); -a(i)*userInput]';
        sys = sys*tf(num, den);
    end
end
[n, c] = tfdata(sys, 'v');
signal = filter(n, c, audio);
sound(signal);
figure; 
%plot(signal);
 hold;
%plot(audio);
freqz(n,c);
%impz(signal);
