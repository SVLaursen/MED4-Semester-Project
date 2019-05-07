function [RirAudio] = RirFunction(fileLocation, roomSize, receiverPosition, sourcePosition)
%   RIR 
%   Detailed explanation goes here

c = 340;                  % Sound velocity (m/s)
fs = 44100;                      % Sample frequency (samples/s)
r = receiverPosition;                      % Receiver position [x y z] (m)
s = sourcePosition;                      % Source position [x y z] (m)
L = roomSize;   % Room dimensions [x y z] (m)
beta = 0.4;                  % Reverberation time (s)
n = 4096;                           % Number of samples

h = rir_generator(c, fs, r, s, L, beta, n);

[audio, fs] = audioread(fileLocation);
audio = resample(audio, 44100, fs);

RirAudio = fftfilt(h, audio);
end