%----------------------------------------------------------------------------
% Enlarge axes by percentage pct. Keeps data from being invisible from being
% overlaid on the x/y axes. Default percentage to increase the axes is 3%,
% and the default axis to use is the current plot's (AKA "gca" in M-speak).
%
% Beware: this is not fully debugged, and in particular may foul up on
% log plots. It also doesn't work on 3D plots. Be my guest if you want to
% fix it.
%
%----------------------------------------------------------------------------

function enlargeaxis(plothandle, pct)

    % Boolean for printing out progress and debug info
    holdforth = false;

    % Handle the optional arguments being fed in  
    if (nargin > 1)
        slop = pct;
    else
        slop = 3;
    end
    if (nargin > 0)
        curraxes = plothandle;
    else
        curraxes = gca;
    end

    % Convert slop to a value
    slop       = slop/100;
    
    % Get the limits on current x and y axes, and save them as olda(1:4);
    a    = axis(curraxes);
    olda = a;

    if holdforth
        disp(sprintf('\n'));
        disp(sprintf('enlargeaxis:       slop = %6.2f', slop));
        disp(sprintf('enlargeaxis: entry axis is [xmin xmax ymin ymax] = [%6.3e  %6.3e  %6.3e %6.3e]', olda));
    end

    % xmin  
    if (a(1) == 0)
        a(1) = -slop*olda(2);
    else
        a(1) = (1 - sign(olda(1))*slop)*olda(1);
    end

    % xmax  
    if (a(2) == 0)
        a(2) =  -slop*olda(1);
    else
        a(2) = (1 + sign(olda(2))*slop)*olda(2);
    end

    % ymin  
    if (a(3) == 0)
        a(3) =  -slop*olda(4);
    else
        a(3) = (1 - sign(olda(3))*slop)*olda(3);
    end

    % ymax
    if (a(4) == 0)
        a(4) =  -slop*olda(3);
    else
        a(4) = (1 + sign(olda(4))*slop)*olda(4);
    end
    
    if holdforth
        disp(sprintf('enlargeaxis: reset axis is [xmin xmax ymin ymax] = [%6.3e  %6.3e  %6.3e %6.3e]', a));
        disp(sprintf('\n'));
    end
    axis(curraxes, a);

return
