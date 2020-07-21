%--------------------------------------------------------------------------------
% Show how much memory is being used by Matlab.  Note the bizarre dereferencing
% required to get a numerical vector array instead of a comma-separated list.
%
% Matlab has a built-in function called (surprise, surprise) "memory", but it
% gives error message when using it from Unix. However, it does provide more
% info, like how much memory is available as well as how much is being used. The
% error message in Linux is
%
%       >> memory
%       ??? Error using ==> memory
%       Function MEMORY is not available on this platform.
%
% If an output argument is provided, it is loaded with the number of Gbytes in
% current use. Primarily this is to display the memory used, not return it.
%--------------------------------------------------------------------------------

function g = memuse()
    s = evalin('base', 'whos');
    byteme     = [s(:).bytes];
    totalbytes = sum(byteme);
    kbytes     = totalbytes/1024;
    Megabytes  = totalbytes/1024^2;
    Gigabytes  = totalbytes/1024^3;

    if nargout > 0
        g = Gigabytes;
    end
    
    disp(sprintf('\nCurrent memory usage: %g bytes ',  totalbytes))
    
    % Use larger units if number of bytes is large. Only do this if the measure
    % in those units is positive and more than 1
    if (floor(kbytes) > 1)
        disp(sprintf('                    = %g kbytes',    kbytes))
    end
    
    if (floor(Megabytes) > 1)
        disp(sprintf('                    = %g Megabytes', Megabytes))
    end
    
    if (floor(Gigabytes) > 1)
        disp(sprintf('                    = %g Gigabytes', Gigabytes))
    end
    
return
