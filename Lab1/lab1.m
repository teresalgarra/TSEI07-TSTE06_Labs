%% LAB 1 %%

close all;
clc;

%% QUESTION 1.1.A %%

% Filter 1 -> Types I & II because it's LP

% Filter 2 -> Types I & II because it's LP

% Filter 3 -> Types I & II because it's LP

% Filter 4 -> Types I & II because it's LP

%% QUESTION 1.1.B %%

% firpmord finds the approximate order, normalized frequency band edges,
% frequency band amplitudes, and weights that meet input specifications

% Filter 1
wT1 = [0.3 0.4]*pi;                             % Cutoff frequencies
b1 = [1 0];                                     % Desired amplitudes
d1 = [0.01 0.001];                              % Ripple specifications
fs1 = 2*pi;                                     % Sampling frequency
[N1, F1, D1, W1] = firpmord(wT1, b1, d1, fs1);  % Required Function

% Filter 2
wT2 = [0.3 0.4]*pi;                             % Cutoff frequencies
b2 = [1 0];                                     % Desired amplitudes
d2 = [0.001 0.0001];                            % Ripple specifications
fs2 = 2*pi;                                     % Sampling frequency
[N2, F2, D2, W2] = firpmord(wT2, b2, d2, fs2);  % Required Function

% Filter 3
wT3 = [0.39 0.4]*pi;                            % Cutoff frequencies
b3 = [1 0];                                     % Desired amplitudes
d3 = [0.01 0.001];                              % Ripple specifications
fs3 = 2*pi;                                     % Sampling frequency
[N3, F3, D3, W3] = firpmord(wT3, b3, d3, fs3);  % Required Function

% Filter 4
wT4 = [0.69 0.7]*pi;                            % Cutoff frequencies
b4 = [1 0];                                     % Desired amplitudes
d4 = [0.01 0.001];                              % Ripple specifications
fs4 = 2*pi;                                     % Sampling frequency
[N4, F4, D4, W4] = firpmord(wT4, b4, d4, fs4);  % Required Function

[N1, N2, N3, N4]                                % Filter orders

%% QUESTION 1.1.C %%

wT = [0.3 0.4]*pi;                              % Cutoff frequencies
b = [1 0];                                      % Desired amplitudes
d = [0.01 0.001];                               % Ripple specifications
fs = 2*pi;                                      % Sampling frequency
[N, F, D, W] = firpmord(wT, b, d, fs);          % Required Function
h = firpm(N, F, D, W);                          % Required Function

figure;                                         % Ploting
freqz(h);                                       % Frequency Response
title('Filter');                                % Title

% Does not exactly satisfy the requirements because it's only an estimation
% of the order required. In practice, firpm.m must be called several times,
% with increasing or decreasing order, in order to find a filter of minimum
% order that satisfies the specification at hand. The estimated order is,
% however, for most practical cases close to the minimum order which means
% that only a few function calls need to be done.

% By hand, our minimum filter degree is 52, so:

N1 = 52;                                        % Hand filter order result
h1 = firpm(N1, F, D, W);                        % Required Function

figure;                                         % Ploting
freqz(h1);                                      % Frequency Response
title('Filter (Theoretical)');                  % Title

% Now it looks more accurate

%% QUESTION 1.1.D %%

% Just analyze the plot above

%% QUESTION 1.2.A %%

% LP Filter -> Types I & II

% HP Filter -> Types I & IV

% BP Filter -> Types I & III

% BS Filter -> Type I

%% QUESTION 1.2.B %%

% Lowpass
wT1 = [0.4 0.5]*pi;                             % Cutoff frequencies
b1 = [1 0];                                     % Desired amplitudes
d1 = [0.01 0.001];                              % Ripple specifications
fs1 = 2*pi;                                     % Sampling frequency
[N1, F1, D1, W1] = firpmord(wT1, b1, d1, fs1);  % Required Function

% Highpass
wT2 = [0.5 0.6]*pi;                             % Cutoff frequencies
b2 = [0 1];                                     % Desired amplitudes
d2 = [0.001 0.01];                              % Ripple specifications
fs2 = 2*pi;                                     % Sampling frequency
[N2, F2, D2, W2] = firpmord(wT2, b2, d2, fs2);  % Required Function

% Bandpass
wT3 = [0.3 0.4 0.6 0.7]*pi;                     % Cutoff frequencies
b3 = [0 1 0];                                   % Desired amplitudes
d3 = [0.001 0.01 0.001];                        % Ripple specifications
fs3 = 2*pi;                                     % Sampling frequency
[N3, F3, D3, W3] = firpmord(wT3, b3, d3, fs3);  % Required Function

% Filter 4
wT4 = [0.3 0.4 0.6 0.7]*pi;                     % Cutoff frequencies
b4 = [1 0 1];                                   % Desired amplitudes
d4 = [0.01 0.001 0.01];                         % Ripple specifications
fs4 = 2*pi;                                     % Sampling frequency
[N4, F4, D4, W4] = firpmord(wT4, b4, d4, fs4);  % Required Function

[N1, N2, N3, N4]                                % Filter orders

% This is underestimated, we have to use more.

%% QUESTION 1.2.C.1 %%

wT = [0.4 0.5]*pi;                              % Cutoff frequencies
b = [1 0];                                      % Desired amplitudes
d = [0.01 0.001];                               % Ripple specifications
fs = 2*pi;                                      % Sampling frequency
[N, F, D, W] = firpmord(wT, b, d, fs);          % Required Function
h = firpm(N, F, D, W);                          % Required Function

figure;                                         % Ploting
freqz(h);                                       % Frequency Response
title('Filter 1 (Frequency Response)');         % Title

figure;                                         % Ploting
zplane(h);                                      % Poles and zeros
grid;                                           % Grid set on
title('Filter 1 (Poles and Zeros)');            % Title

%% QUESTION 1.2.C.2 %%

wT = [0.5 0.6]*pi;                              % Cutoff frequencies
b = [0 1];                                      % Desired amplitudes
d = [0.001 0.01];                               % Ripple specifications
fs = 2*pi;                                      % Sampling frequency
[N, F, D, W] = firpmord(wT, b, d, fs);          % Required Function
h = firpm(N, F, D, W);                          % Required Function

figure;                                         % Ploting
freqz(h);                                       % Frequency Response
title('Filter 2 (Frequency Response)');         % Title

figure;                                         % Ploting
zplane(h);                                      % Poles and zeros
grid;                                           % Grid set on
title('Filter 2 (Poles and Zeros)');            % Title

%% QUESTION 1.2.C.3 %%

wT = [0.3 0.4 0.6 0.7]*pi;                      % Cutoff frequencies
b = [0 1 0];                                    % Desired amplitudes
d = [0.001 0.01 0.001];                         % Ripple specifications
fs = 2*pi;                                      % Sampling frequency
[N, F, D, W] = firpmord(wT, b, d, fs);          % Required Function
h = firpm(N, F, D, W);                          % Required Function

figure;                                         % Ploting
freqz(h);                                       % Frequency Response
title('Filter 3 (Frequency Response)');         % Title

figure;                                         % Ploting
zplane(h);                                      % Poles and zeros
grid;                                           % Grid set on
title('Filter 3 (Poles and Zeros)');            % Title

%% QUESTION 1.2.C.4 %%

wT = [0.3 0.4 0.6 0.7]*pi;                      % Cutoff frequencies
b = [1 0 1];                                    % Desired amplitudes
d = [0.01 0.001 0.01];                          % Ripple specifications
fs = 2*pi;                                      % Sampling frequency
[N, F, D, W] = firpmord(wT, b, d, fs);          % Required Function
h = firpm(N, F, D, W);                          % Required Function

figure;                                         % Ploting
freqz(h);                                       % Frequency Response
title('Filter 4 (Frequency Response)');         % Title

figure;                                         % Ploting
zplane(h);                                      % Poles and zeros
grid;                                           % Grid set on
title('Filter 4 (Poles and Zeros)');            % Title

%% QUESTION 1.3.A %%

%See Section 5.10 in the course book

%% QUESTION 1.3.B %%

%See Section 5.10 in the course book

%% QUESTION 1.3.C %%

h_LP = Ex13cLP;                                 % LP Given Function
m_LP = 20*log10(abs(h_LP));                     % Magnitude Response
E_LP = 20*log10(sum(abs(m_LP(0.4*pi:end))));    % Energy in the SB

h_QP = Ex13cQP;                                 % QP Given Function
m_QP = 20*log10(abs(h_QP));                     % Magnitude Response
E_QP = 20*log10(sum(abs(m_QP(0.4*pi:end))));    % Energy in the SB

figure;                                         % Ploting
freqz(h_LP);                                    % Frequency Response
title('Filter LP (Frequency Response)');        % Title

figure;                                         % Ploting
freqz(h_QP);                                    % Frequency Response
title('Filter QP (Frequency Response)');        % Title

[E_LP E_QP]                                     % Energy values
