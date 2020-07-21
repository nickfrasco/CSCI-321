% 
% Example invocations of TimeUnits() and showtimes()
%
% secs = (1.5e6)*3600;   % 1.5 million hours

secs = 1.0e6;   % 1 million seconds

% First extract specific unit measures
weeks   = TimeUnits(secs, 'weeks')
months  = TimeUnits(secs, 'months')
years   = TimeUnits(secs, 'years')

% next show all units with >= 1 of the units
showtimes(secs)

% How long before a 61 year old reaches 2 billion secs old
y = 61;
s = y*365.24*24*3600;
left = 2e9 - s;
showtimes(left);
