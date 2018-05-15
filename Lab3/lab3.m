%% LAB 3 %%

clear all;
close all;
clc;

freqz(f0); % F0 is a lowpass filter with wcT = 0.45*pi and wsT = 0.55*pi.

freqz(f1); % F1 is a highpass filter with wsT = 0.45*pi and wcT = 0.55*pi.

%% QUESTION 3.1.1 %%

clear all;
close all;
clc;

load('Filters2.mat');                           % Importing the values

figure;                                         % Ploting
subplot(2,1,1);                                 % Subplot
plot(f0);                                       % Ploting f0
axis tight;                                     % Set limited axis
grid;                                           % Grid set on
title('Impulse Response f0 (lowpass');          % Title
subplot(2,1,2);                                 % Subplot
plot(f1);                                       % Ploting f1
axis tight;                                     % Set limited axis
grid;                                           % Grid set on
title('Impulse Response f1 (highpass)');        % Title

N0 = length(f0);
N1 = length(f1);

% F0 is a filter with an even number of samples and it's symmetric, so it's
% a type I filter. It's length is 94, so the filter order is 94.

% F1 is a filter with an even number of samples and it's anti-symmetric, 
% so it's a type IV filter. It's length is 94, so the filter order is 94.

%% QUESTION 3.1.2 %%

clear all;
close all;
clc;

load('Filters2.mat');                           % Importing the values

figure;                                         % Ploting
subplot(2,1,1);                                 % Subplot
plot(f0);                                       % Ploting f0
xlim([0, pi]);                                  % Set limited axis
grid;                                           % Grid set on
title('Impulse Response f0 (lowpass)');         % Title
subplot(2,1,2);                                 % Subplot
plot(f1);                                       % Ploting f1
xlim([0, pi]);                                  % Set limited axis
grid;                                           % Grid set on
title('Impulse Response f1 (highpass)');        % Title

% Both F0 and F1 start in -1.24. 

% F0 starts going down to -2.27 and then goes up to 3.075. When f = pi, F1
% is 2.77.

% F1 starts going up to 3.075 and then starts going down, but it doesn't
% reach the minimum point in the interval (0, pi). When f = pi, F1 is 2.5

%% QUESTION 3.1.3.1 %%

clear all;
close all;
clc;

load('Filters1.mat');                           % Importing the values
T = 1;                                          % For the DA Conversion

wc0T_d = 0.45*pi;                               % Digital wc for F0
ws0T_d = 0.55*pi;                               % Digital ws for F0
ws1T_d = 0.45*pi;                               % Digital wc for F1
wc1T_d = 0.55*pi;                               % Digital ws for F1

wc0T = (2/T)*tan(wc0T_d/2);                     % Analog wc for F0
ws0T = (2/T)*tan(ws0T_d/2);                     % Analog ws for F0
wc1T = (2/T)*tan(wc1T_d/2);                     % Analog wc for F1
ws1T = (2/T)*tan(ws1T_d/2);                     % Analog ws for F1

f0_dc = f0(0:wc0T);                             % Samples for dc for F0
f0_ds = f0(ws0T:pi);                            % Samples for ds for F0
f1_dc = f1(wc1T:pi);                            % Samples for dc for F1
f1_ds = f1(0:ws1T);                             % Samples for ds for F1

M0_dc = max(f0_dc);                             % Max value for dc for F0
m0_dc = min(f0_dc);                             % Min value for dc for F0
M0_ds = max(f0_ds);                             % Max value for ds for F0

M1_dc = max(f1_dc);                             % Max value for dc for F1
m1_dc = min(f1_dc);                             % Min value for dc for F1
M1_ds = max(f1_ds);                             % Max value for ds for F1

dc0_max = M0_dc - 1;                            % f = 1 + dc; dc = fc - 1
dc0_min = 1 - m0_dc;                            % f = 1 - dc; dc = 1 - fc
ds0 = M0_dc;                                    % f = ds

dc1_max = M1_dc - 1;                            % f = 1 + dc; dc = fc - 1
dc1_min = 1 - m1_dc;                            % f = 1 - dc; dc = 1 - fc
ds1 = M1_dc;                                    % f = ds

% For the lowpass filter F0 we get that dc = 0.9932 and ds = 0.0068

% For the highpass filter F1 we get that dc = 1.0052 and ds = 0.0052

%% QUESTION 3.1.3.2 %%

clear all;
close all;
clc;

load('Filters2.mat');                           % Importing the values
T = 1;                                          % For the DA Conversion

wc0T_d = 0.45*pi;                               % Digital wc for F0
ws0T_d = 0.55*pi;                               % Digital ws for F0
ws1T_d = 0.45*pi;                               % Digital wc for F1
wc1T_d = 0.55*pi;                               % Digital ws for F1

wc0T = (2/T)*tan(wc0T_d/2);                     % Analog wc for F0
ws0T = (2/T)*tan(ws0T_d/2);                     % Analog ws for F0
wc1T = (2/T)*tan(wc1T_d/2);                     % Analog wc for F1
ws1T = (2/T)*tan(ws1T_d/2);                     % Analog ws for F1

f0_dc = f0(0:wc0T);                             % Samples for dc for F0
f0_ds = f0(ws0T:pi);                            % Samples for ds for F0
f1_dc = f1(wc1T:pi);                            % Samples for dc for F1
f1_ds = f1(0:ws1T);                             % Samples for ds for F1

M0_dc = max(f0_dc);                             % Max value for dc for F0
m0_dc = min(f0_dc);                             % Min value for dc for F0
M0_ds = max(f0_ds);                             % Max value for ds for F0

M1_dc = max(f1_dc);                             % Max value for dc for F1
m1_dc = min(f1_dc);                             % Min value for dc for F1
M1_ds = max(f1_ds);                             % Max value for ds for F1

dc0_max = M0_dc - 1;                            % f = 1 + dc; dc = fc - 1
dc0_min = 1 - m0_dc;                            % f = 1 - dc; dc = 1 - fc
ds0 = M0_dc;                                    % f = ds

dc1_max = M1_dc - 1;                            % f = 1 + dc; dc = fc - 1
dc1_min = 1 - m1_dc;                            % f = 1 - dc; dc = 1 - fc
ds1 = M1_dc;                                    % f = ds

% For the lowpass filter F0 we get that dc = 1.0001 and ds = 0.00012421

% For the highpass filter F1 we get that dc = 0.9998 and ds = 0.00022733

%% QUESTION 3.1.3.3 %%

clear all;
close all;
clc;

load('Filters3.mat');                           % Importing the values
T = 1;                                          % For the DA Conversion

wc0T_d = 0.45*pi;                               % Digital wc for F0
ws0T_d = 0.55*pi;                               % Digital ws for F0
ws1T_d = 0.45*pi;                               % Digital wc for F1
wc1T_d = 0.55*pi;                               % Digital ws for F1

wc0T = (2/T)*tan(wc0T_d/2);                     % Analog wc for F0
ws0T = (2/T)*tan(ws0T_d/2);                     % Analog ws for F0
wc1T = (2/T)*tan(wc1T_d/2);                     % Analog wc for F1
ws1T = (2/T)*tan(ws1T_d/2);                     % Analog ws for F1

f0_dc = f0(0:wc0T);                             % Samples for dc for F0
f0_ds = f0(ws0T:pi);                            % Samples for ds for F0
f1_dc = f1(wc1T:pi);                            % Samples for dc for F1
f1_ds = f1(0:ws1T);                             % Samples for ds for F1

M0_dc = max(f0_dc);                             % Max value for dc for F0
m0_dc = min(f0_dc);                             % Min value for dc for F0
M0_ds = max(f0_ds);                             % Max value for ds for F0

M1_dc = max(f1_dc);                             % Max value for dc for F1
m1_dc = min(f1_dc);                             % Min value for dc for F1
M1_ds = max(f1_ds);                             % Max value for ds for F1

dc0_max = M0_dc - 1;                            % f = 1 + dc; dc = fc - 1
dc0_min = 1 - m0_dc;                            % f = 1 - dc; dc = 1 - fc
ds0 = M0_dc;                                    % f = ds

dc1_max = M1_dc - 1;                            % f = 1 + dc; dc = fc - 1
dc1_min = 1 - m1_dc;                            % f = 1 - dc; dc = 1 - fc
ds1 = M1_dc;                                    % f = ds

% For the lowpass filter F0 we get that dc = 1.0000 and ds = 0.000012400

% For the highpass filter F1 we get that dc = 1.0000 and ds = 0.000012099

%% QUESTION 3.1.4 %%

clear all;
close all;
clc;

load('Filters2.mat');                           % Importing the values

figure;                                         % Ploting
subplot(2,1,1);                                 % Subplot
zplane(f0);                                     % Poles and zeros
grid;                                           % Grid set on
title('Poles and Zeros of f0 (lowpass)');       % Title
subplot(2,1,2);                                 % Subplot
zplane(f1);                                     % Poles and zeros
grid;                                           % Grid set on
title('Poles and Zeros of f1 (highpass)');      % Title

% As they are lowpass and highpass, the diagram of poles and zeros is the
% same but inverted regarding the y-axis.
