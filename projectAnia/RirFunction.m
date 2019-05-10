function [RirAudio] = RirFunction(filename, roomSize, receiverPosition, sourcePosition, reverbTime)
%   RIR 
%   Detailed explanation goes here

c = 340;                  % Sound velocity (m/s)
fs = 16000;                      % Sample frequency (samples/s)
r = receiverPosition;                      % Receiver position [x y z] (m)
s = sourcePosition;                      % Source position [x y z] (m)
L = roomSize;   % Room dimensions [x y z] (m)
beta = reverbTime;                  % Reverberation time (s)
n = 4096;                           % Number of samples

h = rir_generator(c, fs, r, s, L, beta, n);
[data, samplerate] = audioread(filename);
audio = resample(data, fs, samplerate);

RirAudio = fftfilt(h, audio);
end