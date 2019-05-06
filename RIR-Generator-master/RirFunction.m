function [RirAudio] = RirFunction(fileLocation, soundVelocity, roomSize, reverbTime)
%   RIR 
%   Detailed explanation goes here

c = soundVelocity;                  % Sound velocity (m/s)
fs = 44100;                      % Sample frequency (samples/s)
r = [2 1.5 2];                      % Receiver position [x y z] (m)
s = [2 3.5 2];                      % Source position [x y z] (m)
L = [roomSize roomSize roomSize];   % Room dimensions [x y z] (m)
beta = reverbTime;                  % Reverberation time (s)
n = 4096;                           % Number of samples

h = rir_generator(c, fs, r, s, L, beta, n);

[audio, fs] = audioread(fileLocation);
audio = resample(audio, 44100, fs);

RirAudio = fftfilt(h, audio);
end