clc;
reverb = reverberator('HighFrequencyDamping', 0.5);
reverb2 = reverberator('HighFrequencyDamping', 0.2);
audio = audioread('guitar.wav');
disp(audioinfo('guitar.wav'));
audioD = reverb(audio);
audioD2 = reverb2(audio);
sound(audioD);
sound(audioD2);
figure; 
plot(audio); 
hold;
plot(audioD);
hold
plot(audioD2);

