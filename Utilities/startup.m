%-------------------------------------------------------------------------------
% startup.m should contain settings that are used for every session. A global
% default one is executed if this one is not. Using the "preferences"
% setting in the Matlab GUI also works, and is better especially for things like
% font sizes and editor settings. 
%---------------------------------------
% Started: When the earth was without form, and void
% Last Modified: Tue 15 Jan 2019, 04:51 PM 
%-------------------------------------------------------------------------------

format compact;  % Avoid double spaced lines
format short g;  % Give reasonable format; use format long e for full precision
% Use dbstop when developing functions
% dbstop if error;
% Turn on or off the pager; usually scrolling is good enough but if the scrollback
% length is limited, turning more on puts only one page at a time on screeen
more off;

% Many ways to add to the search path. Suppose I want to add the m-files in
% the directory '/home/bramley/a321' to Matlab's search path. 
%
%   prepend:  addpath('/home/bramley/a321')
%   prepend:  addpath('/home/bramley/a321', '-begin')
%   append:   addpath('/home/bramley/a321', '-end')
%   prepend:     path('/home/bramley/a321', path)
%   append:      path(path, '/home/bramley/a321')

%-----------------------------------------------------------------------------
% Set all plots to have grid lines by default. Override this by "grid off" on
% individual plots. 
%-----------------------------------------------------------------------------
set(groot,'DefaultAxesXGrid', 'on')
set(groot,'DefaultAxesYGrid', 'on')
set(groot,'DefaultAxesZGrid', 'on')

