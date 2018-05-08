close all;
clc;

%% QUESTION 1.1.A %%

%Filter 1 -> Chebyshev I because we can have more ripples in pb than in sb

%Filter 2 -> Chebyshev I because we can have more ripples in pb than in sb

%Filter 3 -> Chebyshev I because we can have more ripples in pb than in sb
%         -> Butterworth because we need an abrupt fall

%Filter 4 -> Chebyshev I because we can have more ripples in pb than in sb
%         -> Butterworth because we need an abrupt fall

%% QUESTION 1.1.B %%

%firpmord finds the approximate order, normalized frequency band edges,
%frequency band amplitudes, and weights that meet input specifications

%Filter 1
wT1 = [0.3 0.4]*pi;                             % Cutoff frequencies
b1 = [1 0];                                     % Desired amplitudes
d1 = [0.01 0.001];                              % Ripples
fs1 = 2*pi;                                     % Sampling frequency
[N1, F1, D1, W1] = firpmord(wT1, b1, d1, fs1);  % Function

%Filter 2
wT2 = [0.3 0.4]*pi;                             % Cutoff frequencies
b2 = [1 0];                                     % Desired amplitudes
d2 = [0.001 0.0001];                            % Ripples
fs2 = 2*pi;                                     % Sampling frequency
[N2, F2, D2, W2] = firpmord(wT2, b2, d2, fs2);  % Function

%Filter 3
wT3 = [0.39 0.4]*pi;                            % Cutoff frequencies
b3 = [1 0];                                     % Desired amplitudes
d3 = [0.01 0.001];                              % Ripples
fs3 = 2*pi;                                     % Sampling frequency
[N3, F3, D3, W3] = firpmord(wT3, b3, d3, fs3);  % Function

%Filter 4
wT4 = [0.69 0.7]*pi;                            % Cutoff frequencies
b4 = [1 0];                                     % Desired amplitudes
d4 = [0.01 0.001];                              % Ripples
fs4 = 2*pi;                                     % Sampling frequency
[N4, F4, D4, W4] = firpmord(wT4, b4, d4, fs4);  % Function

%% QUESTION 1.1.C %%

wT = [0.3 0.4]*pi;                              % Cutoff frequencies
b = [1 0];                                      % Desired amplitudes
d = [0.01 0.001];                               % Ripples
fs = 2*pi;                                      % Sampling frequency
[N, F, D, W] = firpmord(wT, b, d, fs);          % Function
h = firpm(N, F, D, W);                          % Function

figure;
freqz(h,1,1024,fs)
title('Filter 1')

%Does not exactly satisfy the requirements because it's only an estimation
%of the order required. In practice, firpm.m must be called several times,
%with increasing or decreasing order, in order to find a filter of minimum
%order that satisfies the specification at hand. The estimated order is,
%however, for most practical cases close to the minimum order which means
%that only a few function calls need to be done.

%By hand, our minimum filter degree is 53.333 = 54, so:

N1 = 54;
h1 = firpm(N1, F, D, W);

figure;
freqz(h1,1,1024,fs)
title('Filter 1 (Theoretical)')

%Now it looks more accurate

%% QUESTION 1.1.D %%

%% QUESTION 1.2.A %%

%% QUESTION 1.2.B %%

%% QUESTION 1.2.C %%

%% QUESTION 1.3.A %%

%% QUESTION 1.3.B %%

%% QUESTION 1.3.C %%
