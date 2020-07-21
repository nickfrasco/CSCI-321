%------------------------------------------------------------------------------------
% function azrotate(nviews, stride, pausetime, resize)
%
% This will rotate the current figure in the azimuth, by going through a fixed number
% of steps of size given by "stride". Also can take a pause time, but generally it's
% better to set it to zero and let drawnow's delays suffice.
%
% The Boolean resize will let the user resize the graphics windows first. Generally
% want to keep it set to false and just use the extant graphics window.
%------------------------------------------------------------------------------------

function azrotate(nviews, stride, pausetime, resize)

    h = gca; 

    % Handle any missing optional arguments
    if (nargin < 4); resize    = false;      end
    if (nargin < 3); pausetime = 0.0;        end
    if (nargin < 2); stride    = 1.0;        end
    if (nargin < 1); nviews    = 360/stride; end
    % 360/stride takes it around a full circle

    % Find out starting view
    [az, el] = view(h);

    if resize
        disp('Resize the graphics window as needed and then hit enter');
        pause
    end

    for k = 1:nviews
        az = az + stride;
        view(h, az, el);
        if (pausetime > 0)
            pause(pausetime);
        else
            drawnow;
        end
    end

return   
