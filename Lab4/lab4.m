%% LAB 4 %%

clear all;
close all;
clc;

%% COEFFICIENT SENSIBILITY %%

%% QUESTION 4.1.1 %%

clear all;
close all;
clc;

load('fifthOrderFilter.mat');                   % Importing the values

figure;                                         % Ploting
freqz(b, a);                                    % Ploting

% We can see that the pb edge = 0.3*pi, that the sb edge = 0.584*pi,
% that Amax = 0.000065 dB and that Amin = 61.2 dB

%% QUESTION 4.1.2 %%

% clear all;
% close all;
% clc;
% 
% load('fifthOrderFilter.mat');                   % Importing the values
% 
% h = directFormFilter(impulse(tf(a, b)));        % ?????????
% wT = linspace(0, pi, 1000);
% H = freqz(h, 1, wT);
% 
% figure;
% plot(wT/pi, 20*log10(abs(H)), 'r')
% 
% NFFT = 8192; % length of FFT
% n = 0:NFFT-1;
% x = 0.5*(sin(0.2171*pi*n) + sin(.631711*pi*n));
% x = quant(x, 2^-12); % quantize to 12 fractional bits
% 
% xw = x.*blackmanharris(NFFT).';
% X = fft(xw);
% wT = 0:2*pi/NFFT:pi-2*pi/NFFT; % Convert FFT index k to wT
% plot(wT/pi, 20*log10(2*abs(X(1:length(wT))/NFFT)));
% xlabel('\omegaT [\times\pi rad]','FontName','times');
% ylabel('|X(k)| [dB]','FontName','times');

%% QUESTION 4.1.3 %%

%% QUESTION 4.2 %%

clear all;
close all;
clc;

load('fifthOrderFilter.mat');                   % Importing the values

Wf = 8;
Wr = 12;

x = 2*(rand(1,1000)-0.5);

yI = directFormFilter(x, 0, Wf);
yI = fifthOrderLadderWDF(x, Wf);

yQ = directFormFilter(x, 0, Wf, Wr);
yQ = fifthOrderLadderWDF(x, Wf, Wr);
