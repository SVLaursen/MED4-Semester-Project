%audio = audioread('guitar.wav');
[audio, fs_audio] = audioread('guitar.wav');
audio = resample(audio, 44100, fs_audio);
ss = schroederFunction(1);
y = fftfilt(ss,audio); 
sound(y);