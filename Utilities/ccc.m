%---------------------------------------------------------------------------------
% This script clears everything I know about in Matlab, except builtin  
% variables like pi or eye(). The three major parts are
%
%     clear all: remove all user-defined variables from the workspace
%     close all: remove all plots
%     clc      : clear the command window and position cursor at top
%
% Warnings are turned off temporarily because there may be some messages if,
% e.g., you try to close figures that don't exist. Use "help" to see more 
% details. Mainly this is used when the workspace is hopelessly mucked up, 
% and you want to start a session over.
%
% Beware: this does not toggle the "hold" attribute, but instead turns it
% off for the latest (focused) graph window. Also, it turns on all warnings
% before returning. If you turn off some warnings in startup.m, you should
% turn them back on yourself.
%---------------
% Randall Bramley
% Department of Computer Science
% Indiana University, Bloomington
%------------------------
% Started: Back when I used to exit Matlab and then restart Matlab to get rid
%   of evil influences. Maybe around 1990.
% Last Modified: Tue 15 Jan 2019, 04:48 PM 
%---------------------------------------------------------------------------------

warning('off', 'all');
clear all;
clear global;
clear functions;
clear java;
clear classes;
% Only do the next for R2017a or later
if ~verLessThan('matlab','9.2.0')
    clearAllMemoizedCaches;
end

hold off;
close all;
clc;
warning('on', 'all');
