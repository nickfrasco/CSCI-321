%---------------------------------------------------------------------------------
% A script to create an array of window positions when spawning off multiple 
% figures in Matlab. The resulting array can then be used in the function 
% positionfig(), using the same array name as below.
%
% The procedure is to set how many figures positions you want to specify. Then
% this script opens that many figures, and you are prompted to move them around
% and resize them to tile your monitors the way you want. The script then will
% output an array that specifies the locations, which can be put into the
% function positionfig.m
%
%--------------
% Randall Bramley
% Department of Computer Science
% Indiana University, Bloomington
%------------------------
% Started: Mon 05 Dec 2011, 03:24 PM 
% Last Modified: Thu 06 Apr 2017, 07:48 AM 
%---------------------------------------------------------------------------------

% How many figure window positions to use before recycling them. If you have an 
% 8 monitor setup, then maybe you want to use 32 or 40 positions. 
number_of_figure_positions = ...
    input('How many figure positions to set up [default = 8]: ');

if isempty(number_of_figure_positions)
    number_of_figure_positions = 8;
end
fhandle = zeros(1,number_of_figure_positions);

for k = 1:number_of_figure_positions
    fhandle(k) = figure;
end

disp('Move the figure windows around to whereever, then hit enter');
pause

figurepositions = get(fhandle(1), 'position');
for k = 2:number_of_figure_positions
    figurepositions = [figurepositions; get(fhandle(k), 'position')];
end

disp('Grab the next array of numbers and put them into the positionfig() function')
disp(figurepositions)
