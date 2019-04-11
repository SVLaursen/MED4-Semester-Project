[audioIn,Fs] = audioread('guitar.wav');
audio = audioread('dropitem.mp3');
d =20;
a =0.5;
b =1;
num = b;
den = [1; zeros(d,1); -a]';
signal1 = filter(num, den, audioIn);
%sound(audio);
sound(signal1);
figure; 
%%plot(audio(1:20000)); 
%zplane(d, a);
freqz(num, den);
%t = 1:100;

%freqz(num,den);
%impz(num, den);
%figure, plot(t, abs(fre)), title('fuck')
hold;
%%plot(signal(1:20000));
