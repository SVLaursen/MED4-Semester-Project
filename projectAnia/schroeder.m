clc;
sys = 0;
audio = audioread('guitar.wav');
de = [1553; 1613; 1493; 1153; 223; 443];
a = [0.85 ; 0.85; 0.75; 0.75; 0.7; 0.7];
b = [0.3 ; 0.25; 0.25; 0.2];

for i=1:length(de)
    if i<=4
        num = b(i);
        den = [1 ; zeros(de(i),1); -a(i)]';
        sys = sys + tf(num, den);
    else 
        num = [-a(i); zeros(de(i),1)]';
        den = [1 ; zeros(de(i),1); -a(i)]';
        sys = sys*tf(num, den);
    end
end
[n, d] = tfdata(sys, 'v');
signal = filter(n, d, audio);
sound(signal);
figure; 
plot(audio(1:40000)); 
hold;
plot(signal(1:40000));
