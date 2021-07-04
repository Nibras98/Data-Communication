clc;
clear all;
close all;
Transmitted_Message= 'Red'
%Converting Information Message to bit%
x=asc2bn(Transmitted_Message); % Binary Information
bp=.000001;
% bit period
disp(' Binary information at Trans mitter :');
disp(x);
