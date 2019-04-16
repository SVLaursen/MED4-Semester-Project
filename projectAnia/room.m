clc;
clear;
audio = audioread('guitar.wav');            %%here is the guitar audio that TA recommended to use             
x = audioread('speech_dft_8kHz.wav');       %%here is the speaking voice that Mathew recommended to use
%N = 10000;                                 %%here is the most basic signal
                                             %that we built 
%n = 0:N-1;
%t = 0:1e-4:1;
%x = cos(2*pi*180*t);
%plot(x);
%audio1 = audioread('dropitem.mp3');

rrr = rir(44100, [19 18 1.6], 12, 0.3, [20 19 21], [5 2 1]); %%here we create an filter called 'rrr', based on rir.m function, the input values are just the one recommended by the author
%disp(rrr);
%%[n, d] = tfdata(rrr, 'v');
%signal = conv(rrr, audio1);
%sound(audio);
%sound(signal);
y = fftfilt(rrr,audio);                             %% here we filter audio with rir, the y one is guitar, and yx is speech, go with the yx, cause that is the he wanted us to use
yx = fftfilt(rrr,x);

%%disp(audioinfo('guitar.wav'));                      
%sound(x);                                         
sound(yx);                                          %% use 'sound' to play
                                                    %the sound, converted or not (x- not, yx - converted)
%freqz(audio);
figure('Name', 'Frequency of x');                   %% see txt file that i uploaded
freqz(x);
%freqz(rrr);
%dt = 1/44100;
%t = 0:dt:(length(y)*dt)-dt;
%plot(115196, audio1);
%plot(t,y); 
%xlabel('Seconds'); 
% ylabel ('Amplitude');
%sound([y,fs]);
%freqz(rrr);
%figure;
%plot(x);
%figure;
%freqz(x);
%figure;
%impz(x);
figure('Name', 'Spectogram of x');
spectrogram(x);
figure;
%plot(yx);
figure('Name', 'Frequency of yx');
freqz(yx);
%figure; 
%impz(yx);
figure('Name', 'Spectogram of yx');
spectrogram(yx);
%impz(yx);
figure('Name', 'Frequency of the filter');
freqz(rrr);