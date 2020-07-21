%--------------------------------------------------------------------------
% Return the values of one hour, one day, etc. in seconds.
% Use this for putting measure lines onto a plot with long time spans.
% The value for month is 1/12 of a year, rather than trying to match the
% bizarre 28, 29, 30,or 31 schema of different months.
%--------------------------------------------------------------------------

function [minute, hour, day, week, month, year, millenia] = OtherUnits()

    minute = 60;
    hour   = 60*minute;
    day    = 24*hour;
    week   = 7*day;

    % For years after epoch 2000, gotta add 0.5315 seconds per century. But
    % that is way into bat-guano crazy OCD++ land.
    year   = 365.24218967*day;  % Yeah, well, close enough for university work.

    month  = year/12;
    millenia = 1000*year;

return
