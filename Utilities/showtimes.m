%------------------------------------------------------------------------------------
% For a given time in seconds, convert to other units and print them out. The number
% of seconds is always printed, but larger time units are only printed if they are 1
% or over the corresponding unit. Avoids useless stuff like 1.73e-8 millenia being
% printed. If the input secs is negative, this will do the conversion for abs(secs).
%
% This uses the function TimeUnits.m, so make sure it is available as well.
%
% Example: to see how much time a million seconds corresponds to in human terms,
%
% >> showtimes(1e6) 
%
% --------------------------------------------
% Time = 1000000.0000  seconds
%      = 16666.6667    minutes
%      = 277.7778     hours
%      = 11.5741       days
%      = 1.6534        weeks
%--------------------------------------------
%
% The number of months, years, etc are not printed since a 1e6 seconds is less than
% one month.
%
%-----------------
% Randall Bramley
% Department of Computer Science
% Indiana University, Bloomington
%------------------------
% Started: Wed 03 Oct 2012, 11:13 AM 
% Modified: Mon 14 Jul 2014, 06:06 PM 
% Modified: Mon 02 Feb 2015, 02:06 PM for negative times
% Last Modified: Mon 25 Jul 2016, 10:49 AM 
%------------------------------------------------------------------------------------

function showtimes(secs);
    % Added to handle case when user enters a negative number. Usually would just
    % set mult = sign(secs) but 
    if (secs < 0)
        mult = -1;
        secs = abs(secs);
    else
        mult = 1;
    end

    most      = TimeUnits(secs);
    minutes   = most(1);
    hours     = most(2);
    days      = most(3);
    weeks     = most(4);
    months    = most(5);
    years     = most(6);
    centuries = most(7);
    millenia  = most(8);
    
    disp(sprintf('\n--------------------------------------------'));
    disp(sprintf('Time = %8.4f  seconds', mult*secs));
    if (floor(minutes) > 0)
        disp(sprintf('     = %3.4f    minutes', mult*minutes));
    end
    if (floor(hours) > 0)
        disp(sprintf('     = %3.4f     hours'  , mult*hours));
    end
    if (floor(days) > 0)
        disp(sprintf('     = %3.4f       days', mult*days));
    end
    if (floor(weeks) > 0)
        disp(sprintf('     = %3.4f        weeks', mult*weeks));
    end
    if (floor(months) > 0)
        disp(sprintf('     = %3.4f        months', mult*months));
    end
    if (floor(years) > 0)
        disp(sprintf('     = %3.4f         years', mult*years));
    end
    if (floor(centuries) > 0)
        disp(sprintf('     = %3.4f      centuries', mult*centuries));
    end
    if (floor(millenia) > 0)
        disp(sprintf('     = %3.4f      millenia', mult*millenia));
    end
    disp(sprintf('--------------------------------------------\n'));
    
return
