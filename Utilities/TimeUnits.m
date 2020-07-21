%------------------------------------------------------------------------------
%function outvals = TimeUnits(secs, units)
% Given a time in number of seconds, return the equivalent time in minutes,
% hours, ..., years. Use an optional argument 'units' to get just a single
% conversion. Units are given as a string, and can take darn near any 
% abbreviation commonly used. See the case switch statements below for allowed
% unit names.
%
% Use the function showtimes to print out multiple units.
%
% Example usage:
%   Msecs2days  = TimeUnits(1e6, 'days');
%   disp(['One million seconds = ', num2str(Msecs2days), ' days'])
%   Gsecs2year  = TimeUnits(1e9, 'y');
%------------------------------------------------------------------------------
function outvals = TimeUnits(secs, units)

    sy = 31556925.9747;  % average seconds in a SI year, accounting for leap thingies
    sidereal_day = 23.934461223;  % hours in a day (relative to stars)

    outvals = []; % Initializes outvals in case error is encountered.

    if (nargin < 1); return; end

    minutes   = secs/60;
    hours     = minutes/60;
    days      = hours/24;
    weeks     = days/7;
    years     = secs/sy;
    months    = 12*years;
    centuries = years/100;
    millenia  = centuries/10;
    % sapience  = millenia/50;
    % Megayears = years/1e6;

    % If the user did not specify what unit to use, return all of them
    if (nargin < 2)
        units = 'all';
    end
    
    if ~ischar(units)  % Whatever you are asking for, I have no idea
        outvals = 0;
        return
    end
    
    tidy = strtrim(lower(units));

    switch tidy

        case {'all', 'total', 'whole'}
            outvals = [ minutes hours days weeks months years centuries millenia ];

        case {'m', 'min', 'mins', 'minute', 'minutes'}
            outvals = minutes;
            
        case {'h', 'hour', 'hr', 'hrs', 'hours'}
            outvals = hours;
    
        case {'d', 'day', 'days'}
            outvals = days;
    
        case {'w', 'week', 'weeks', 'wk'}
            outvals = weeks;
    
        case {'mon', 'mons', 'month', 'months'}
            outvals = months;
    
        case {'year', 'yr', 'years', 'yrs', 'y'}
            outvals = years;

        case {'centuries', 'c', 'century', 'cs' }
            outvals = centuries;

        case {'mil', 'millenia'}
            outvals = millenia;
    
        otherwise
            outvals = [ minutes hours days weeks months years centuries millenia ];
    end

return
