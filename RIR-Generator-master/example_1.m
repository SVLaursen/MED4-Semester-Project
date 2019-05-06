c = 340;                    % Sound velocity (m/s)
fs = 16000;                 % Sample frequency (samples/s)
r = [2 1.5 2];              % Receiver position [x y z] (m)
s = [2 3.5 2];              % Source position [x y z] (m)
L = [5 4 6];                % Room dimensions [x y z] (m)
beta = 0.9;                 % Reverberation time (s)
n = 4096;                   % Number of samples

h = rir_generator(c, fs, r, s, L, beta, n);

[audio, fs_audio] = audioread('guitar.wav');
audio = resample(audio, 16000, fs_audio);

reverb_audio = fftfilt(h, audio);