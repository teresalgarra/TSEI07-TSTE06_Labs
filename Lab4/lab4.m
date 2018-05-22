%% LAB 4 %%

close all;
clc;

%% COEFFICIENT SENSIBILITY %%

%% QUESTION 4.1.1 %%

close all;
clc;

load('fifthOrderFilter.mat');                   % Importing the values

H = freqz(b, a);                                % Frequency Response
wT = linspace(0, pi, 512);                      % Space vector 

figure;                                         % Ploting
freqz(b, a);                                    % Ploting

figure;                                         % Ploting
plot(wT/pi, 20*log10(abs(H)), 'r')              % Magnitude Response

% We can see that the pb edge = 0.3*pi, that the sb edge = 0.584*pi,
% that Amax = 0.000065 dB and that Amin = 61.2 dB

%% QUESTION 4.1.2.1 %%

close all;
clc;

load('fifthOrderFilter.mat');                   % Importing the values

im = zeros(1000, 1);                            % Impulse matrix
im(1) = 1;                                      % Setting the impulse value
h = directFormFilter(im);                       % Given function
wT = linspace(0, pi, 1000);                     % Space vector 
H = freqz(h, 1, wT);                            % Frequency Response
H1 = freqz(b, a, wT);                           % Frequency Response (4.1.1)

figure;                                         % Ploting
freqz(b, a);                                    % Frequency Response
title('Using Transfer Function');               % Title

figure;                                         % Ploting
freqz(h, 1, wT);                                % Frequency Response
title('Using the Given Function');              % Title

figure;                                         % Ploting
subplot(2,1,1);                                 % Subploting
plot(wT/pi, 20*log10(abs(H1)), 'b')             % Magnitude Response
grid on;                                        % Setting grid
title('Using Transfer Function');               % Title
subplot(2,1,2);                                 % Subploting
plot(wT/pi, 20*log10(abs(H)), 'r')              % Magnitude Response
grid on;                                        % Setting grid
title('Using the Given Function');              % Title

%% QUESTION 4.1.2.2 %%

close all;
clc;

im = zeros(1000, 1);                            % Impulse matrix
im(1) = 1;                                      % Setting the impulse value
h = directFormFilter(im);                       % Given function

NFFT = 8192;                                    % Length of FFT
n = 0:NFFT-1;                                   % Vector for the input
x = 0.5*(sin(.2171*pi*n) + sin(.631711*pi*n));  % Input to the system
x = quant(x, 2^-12);                            % Quantize to 12 frac bits

wTx = 0:2*pi/NFFT:pi-2*pi/NFFT;                 % Convert FFT index k to wT
xw = x.*blackmanharris(NFFT).';                 % Windowing
X = fft(xw);                                    % Fourier Transform
X_k = 20*log10(2*abs(X(1:length(wTx))/NFFT));   % |X(k)| in dB

figure;                                         % Ploting
plot(wTx/pi, X_k);                              % |X(k)| in dB   
xlabel('\omegaT [\pi rad]');                    % X title
ylabel('|X(k)| [dB]');                          % Y title

y = conv(h, xw);                                % Getting the output
Y = fft(y);                                     % Fourier Transform
Y_k = 20*log10(2*abs(Y(1:length(wTx))/NFFT));   % |Y(k)| in dB

figure;                                         % Ploting
plot(wTx/pi, Y_k);                              % |Y(k)| in dB 
xlabel('\omegaT [\pi rad]');                    % X title
ylabel('|X(k)| [dB]');                          % Y title

% For the input, both the first and the second tone have 15 dB.
% For the output, the first tone has 15 dB and the second tone has 77 dB.

%% QUESTION 4.1.2.3 %%

close all;
clc;

Wf = 6;                                         % Fractional Bits

im = zeros(1000, 1);                            % Impulse matrix
im(1) = 1;                                      % Setting the impulse value
h = directFormFilter(im, 0, Wf);                % Given function
h1 = directFormFilter(im);                      % Given function
wT = linspace(0, pi, 1000);                     % Space vector 
H = freqz(h, 1, wT);                            % Frequency Response
H1 = freqz(h1, 1, wT);                          % Frequency Response

figure;                                         % Ploting
subplot(2,1,1);                                 % Subploting
plot(wT/pi, 20*log10(abs(H1)), 'b')             % Magnitude Response
grid on;                                        % Setting grid
title('Without Coefficient Quantization');      % Title
subplot(2,1,2);                                 % Subploting
plot(wT/pi, 20*log10(abs(H)), 'r')              % Magnitude Response
grid on;                                        % Setting grid
title('With Coefficient Quantization');         % Title

Wf_test1 = 12;                                  % Fractional Bits
h_test1 = directFormFilter(im, 0, Wf_test1);    % Given function
H_test1 = freqz(h_test1, 1, wT);                % Frequency Response

Wf_test2 = 16;                                  % Fractional Bits
h_test2 = directFormFilter(im, 0, Wf_test2);    % Given function
H_test2 = freqz(h_test2, 1, wT);                % Frequency Response

figure;                                         % Ploting
subplot(3,1,1);                                 % Subploting
plot(wT/pi, 20*log10(abs(H1)), 'b')             % Magnitude Response
grid on;                                        % Setting grid
title('Without Coefficient Quantization');      % Title
subplot(3,1,2);                                 % Subploting
plot(wT/pi, 20*log10(abs(H_test1)), 'r')        % Magnitude Response
grid on;                                        % Setting grid
title('With Coefficient Quantization 12');      % Title
subplot(3,1,3);                                 % Subploting
plot(wT/pi, 20*log10(abs(H_test2)), 'b')        % Magnitude Response
grid on;                                        % Setting grid
title('With Coefficient Quantization 16');      % Title

% We think with 12 it's very accurate, but after 8 it doesn't matter.

%% QUESTION 4.1.2.4 %%

close all;
clc;

Wf = 12;                                        % Fractional Bits
im = zeros(1000, 1);                            % Impulse matrix
im(1) = 1;                                      % Setting the impulse value
wT = linspace(0, pi, 1000);                     % Space vector 
h = directFormFilter(im, 0, Wf);                % Given function
L2 = sqrt(sum(abs(h).^2));                      % L2-Norm

% L2 is 0,6031, so it's underscaled

h_scale = directFormFilter(im, 1);              % Given function
H_scale = freqz(h_scale, 1, wT);                % Frequency Response
L2_scale = sqrt(sum(abs(h_scale).^2));          % L2-Norm

% L2_scale is 1,0000, so it's scaled

%% QUESTION 4.1.3.1 %%

close all;
clc;

im = zeros(1000, 1);                            % Impulse matrix
im(1) = 1;                                      % Setting the impulse value
[h, ~] = fifthOrderLadderWDF(im);               % Given Function
wT = linspace(0, pi, 1000);                     % Space vector 
H = freqz(h, 1, wT);                            % Frequency Response

figure;                                         % Ploting
plot(wT/pi, 20*log10(abs(H)))                   % Magnitude Response
grid on;                                        % Setting grid
title('WDF Fifth Order Filter');                % Title

% It meets the specifications

%% QUESTION 4.1.3.2 %%

close all;
clc;

im = zeros(1000, 1);                            % Impulse matrix
im(1) = 1;                                      % Setting the impulse value
[~, cnodes] = fifthOrderLadderWDF(im);          % Given Function

c1 = cnodes(1, :);                              % Multipliers for L2-norm
c2 = cnodes(2, :);                              % Multipliers for L2-norm
c3 = cnodes(3, :);                              % Multipliers for L2-norm
c4 = cnodes(4, :);                              % Multipliers for L2-norm
c5 = cnodes(5, :);                              % Multipliers for L2-norm
c6 = cnodes(6, :);                              % Multipliers for L2-norm
c7 = cnodes(7, :);                              % Multipliers for L2-norm
c8 = cnodes(8, :);                              % Multipliers for L2-norm

L2_1 = sqrt(sum(abs(c1).^2));                   % L2-Norm
L2_2 = sqrt(sum(abs(c2).^2));                   % L2-Norm
L2_3 = sqrt(sum(abs(c3).^2));                   % L2-Norm
L2_4 = sqrt(sum(abs(c4).^2));                   % L2-Norm
L2_5 = sqrt(sum(abs(c5).^2));                   % L2-Norm
L2_6 = sqrt(sum(abs(c6).^2));                   % L2-Norm
L2_7 = sqrt(sum(abs(c7).^2));                   % L2-Norm
L2_8 = sqrt(sum(abs(c8).^2));                   % L2-Norm

% L2_1 = 0,6235
% L2_2 = 1,0116
% L2_3 = 0,5689
% L2_4 = 0,3675
% L2_5 = 0,6333
% L2_6 = 0,3203
% L2_7 = 0,7692
% L2_8 = 0,4899

%% QUESTION 4.1.3.3 %%

close all;
clc;

Wf = 6;                                         % Fractional Bits

im = zeros(1000, 1);                            % Impulse matrix
im(1) = 1;                                      % Setting the impulse value
[h, ~] = fifthOrderLadderWDF(im, Wf);           % Given Function
[h1, ~] = fifthOrderLadderWDF(im);              % Given Function
wT = linspace(0, pi, 1000);                     % Space vector 
H = freqz(h, 1, wT);                            % Frequency Response
H1 = freqz(h1, 1, wT);                          % Frequency Response

figure;                                         % Ploting
subplot(2,1,1);                                 % Subploting
plot(wT/pi, 20*log10(abs(H1)), 'b')             % Magnitude Response
grid on;                                        % Setting grid
title('Without Coefficient Quantization');      % Title
subplot(2,1,2);                                 % Subploting
plot(wT/pi, 20*log10(abs(H)), 'r')              % Magnitude Response
grid on;                                        % Setting grid
title('With Coefficient Quantization');         % Title

% With 6 bits it's accurate already

% Direct-form I filter is more sensitive to quantization.

%% QUESTION 4.2 %%

close all;
clc;

Wf = 8;                                         % Fractional bits
Wr = 12;                                        % Wordlength
x = 2*(rand(1,1000)-0.5);                       % Input signal

yI_DFF = directFormFilter(x, 0, Wf);            % Given Function
yI_WDF = fifthOrderLadderWDF(x, Wf);            % Given Function

yQ_DFF = directFormFilter(x, 0, Wf, Wr);        % Given Function
yQ_WDF = fifthOrderLadderWDF(x, Wf, Wr);        % Given Function

e_DFF = yI_DFF - yQ_DFF;                        % Error between signals
NP_DFF = 10*log10(var(e_DFF));                  % Noise Power

e_WDF = yI_WDF - yQ_WDF;                        % Error between signals
NP_WDF = 10*log10(var(e_WDF));                  % Noise Power

SP_DFF = 10*log10(var(yQ_DFF));                 % Signal Power
SP_WDF = 10*log10(var(yQ_WDF));                 % Signal Power

SNR_DFF = SP_DFF - NP_DFF;                      % Signal to Noise Ratio
SNR_WDF = SP_WDF - NP_WDF;                      % Signal to Noise Ratio

% SNR_DFF = 53,4855
% SNR_WDF = 57,9212

yI_DFF_es = directFormFilter(x, 1, Wf);         % Given Function
yQ_DFF_es = directFormFilter(x, 1, Wf, Wr);     % Given Function
e_DFF_es = yI_DFF_es - yQ_DFF_es;               % Error between signals
NP_DFF_es = 10*log10(var(e_DFF_es));            % Noise Power
SP_DFF_es = 10*log10(var(yQ_DFF_es));           % Signal Power
SNR_DFF_es = SP_DFF_es - NP_DFF_es;             % Signal to Noise Ratio

% SNR_DFF_es = 57,6836
