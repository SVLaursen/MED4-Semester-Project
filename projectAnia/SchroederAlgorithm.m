function [schroederAudio] = SchroederAlgorithm(fileLocation, reverbAmount)
%SCHROEDERALGORITHM Summary of this function goes here
%   Detailed explanation goes here
%   The first input of the function is the location of the file you wish 
%   to alter as a string.

clc;
sys = 0;
delay = [1553; 1613; 1493; 1153; 223; 443];
a = [0.85 ; 0.85; 0.75; 0.75; 0.7; 0.7];
b = [0.3 ; 0.25; 0.25; 0.2];

%audio = audioread(fileLocation);
[audio, fs_audio] = audioread(fileLocation);
audio = resample(audio, 44100, fs_audio);

for i=1:length(delay)
    if i<=4
        num = b(i)*reverbAmount;
        den = [1 ; zeros(int16(delay(i)*reverbAmount),1); int16(-a(i)*reverbAmount)]';
        sys = sys + tf(num, den);
    else 
        num = [int16(-a(i)*reverbAmount); zeros(int16(delay(i)*reverbAmount),1);1]';
        den = [1 ; zeros(int16(delay(i)*reverbAmount),1); int16(-a(i)*reverbAmount)]';
        sys = sys*tf(num, den);
    end
end

%[n, c] = tfdata(sys, 'v');
%signal = filter(n, c, audio);

calculatedReverb = tfdata(sys, 'v');
output = fftfilt(calculatedReverb,audio);

schroederAudio = output;
end

