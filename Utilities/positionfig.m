function fighandle = positionfig()
%-----------------------------------------------------------------------------------
%
% Return the handle to a new figure, positioned by the array figurepositions. This
% thing uses a persistent named "N6dAgR5UGpDDyGpaqXmlAqVaN2Pvlr". If that causes
% name collisions, rename it to something like shigpitp4u290olzfl31i (the name of
% the first dog I ever had. But he never came when I called him anyway). You might
% also rename it as NEXTPOSITION, a la CPP conventions. When more than
% number_of_figure_positions are opened, the positions are recycled so you'll still
% get windows that overlay each other.
% 
% One of many weaknesses of this is that N6dAgR5UGpDDyGpaqXmlAqVaN2Pvlr is not reset
% when a figure is closed. Plots are still opened without overlapping each other,
% but the "first" one will start in a different place in the cycle. BFHD. The length
% of this function is for various ways I want to tile the figures, what monitor
% set up is being used (1, 2, or 3 monitors), and the size of each monitor.
% 
%--------
% Usage: 
%--------
% Where a figure is opened, via something like 
%           figure;
% instead use
%           positionfig;
% If a handle to the figure is needed, this function handily handles handles.
% E.g., replace
%         bigstick = figure;
% with
%         bigstick = positionfig;
%
%----------------------
% Not always available:
%----------------------
% If you run on multiple machines and sometimes have positionfig and sometimes
% don't, use the exist() function to detect this. Viz., 
%
% if exist('positionfig.m')
%     positionfig
% else
%     figure
% end 
% 
%
%------------------------------------------
% Initial setting of the figure positions:
%------------------------------------------
% Beware that this function is set for the machines and setups I routinely use
% at home and elsewhere. Unless you have the same monitor setups that I have,
% customize the positions for yourself. The function setup_positionfig.m
% will help with that, you just need to edit how many unique window positions
% to define, run it, then grab the n x 4 array it creates and define 
% figurepositions below with it. Also beware that if you use a figure position
% outside the actual capabilities of your monitor, Matlab will create the figure
% in a location you cannot see or access using a mouse. 
%
% Some projects I work on have different numbers of figure windows needed, and
% of different sizes and aspect ratios. This is why there are so many commented
% out settings for the array figurepositions. 
%
% tl;dr: don't use this function without settting the values in figurepositions for
% your own system of windows and monitors.
%
%---------------
% Randall Bramley
% Department of Computer Science
% Indiana University, Bloomington
%------------------------
% Started: Back when Hannibal started raising a big stink in Italy, what with        
%    the elephant dumplings on the roads (which, of course, all went to Rome)    
% Modified: Tue 27 Mar 2012, 02:25 PM added the justreturn Boolean
% Modified: Fri 06 Jul 2012, 09:28 AM to use getenv('HOST')
% Modified: Fri 27 Jul 2012, 12:40 PM to make N6dAgR5UGpDDyGpaqXmlAqVaN2Pvlr persistent instead
%   of global
% Modified: Tue 13 Jan 2015, 10:02 AM for notes about exist()
% Last Modified: Tue 15 Jan 2019, 04:50 PM 
%-----------------------------------------------------------------------------------

    %--------------------------------------------------------------------------
    % Set justreturn to true to get default Matlab behaviour. Useful when
    % running on a foreign platform and you don't want to ship over all of
    % your precious Matlab files. Or when distributing code to students et al.
    %--------------------------------------------------------------------------
    justreturn = true;

    if justreturn
        fhandle = figure; 
        if (nargout > 0)
            fighandle = fhandle;
        end
        return
    end

    %----------------------------------------------------------------------------
    % Automate finding the hostname. First initialize the machine list to false
    %----------------------------------------------------------------------------
    behemoth = false;
    coris    = false;
    charis   = false;
    rama     = false;
    toshita  = false;

    %--------------------------------------------------------------------------------
    % The system call
    %       [whocares, hname] = system('hostname');
    % gets the hostname. However, the display host determines screen real estate 
    % and disposition, not the host that Matlab is running on. X server calls
    % can also provide that information, but using them makes this function even 
    % less portable than it already is. Hard as that is to believe.
    %--------------------------------------------------------------------------------
    hname = getenv('HOST');
    if isempty(hname) 
        fhandle = figure; 
        if (nargout > 0)
            fighandle = fhandle;
        end
        return
    else
        switch lower(hname)
            case {'toshita', 'toshita.cs.indiana.edu'}
                toshita = true; 
            case {'rama', 'rama.cs.indiana.edu'}
                rama  = true; 
            case {'coris', 'coris.cs.indiana.edu'}
                coris = true ;
            case {'charis', 'charis.cs.indiana.edu'}
                charis = true; 
            case {'behemoth', 'behemoth.cs.indiana.edu'}
                behemoth = true; 
            otherwise
                fhandle = figure; 
                if (nargout > 0)
                    fighandle = fhandle;
                end
                return
        end
    end

    persistent N6dAgR5UGpDDyGpaqXmlAqVaN2Pvlr
    if isempty(N6dAgR5UGpDDyGpaqXmlAqVaN2Pvlr)
        N6dAgR5UGpDDyGpaqXmlAqVaN2Pvlr = 1;
    end
    
    %-------------------------------------------------------------------------------
    % The first four figures tile the second monitor, the next two are on the RHS of
    % the first monitor. Addendum, 15 Apr 2011: this also works on longly, and that
    % includes running remotely on a server like silo and displaying the results
    % back on longly. Whoo-hooh!
    %-------------------------------------------------------------------------------
    
    if (charis || coris)
        %-----------------------
        % 1 big one on the left
        %-----------------------
        % figurepositions = [...
        %   70 285 1560 800
        % ];

        %-----------------------------
        % 6, 4 on left and 2 on right
        %-----------------------------
        figurepositions = [...
          21         605         917         515
          20           3         917         515
         953         605         917         515
         951           2         917         515
        1933         406        1188         660
        1928           6        1188         660
        ];

        %-------------------------------
        % 8, 6 on left and 2 on right
        %-------------------------------
        % figurepositions = [...
        %    5         706         560         420
        %  573         706         560         420
        % 1141         706         539         420
        %    5         199         560         420
        %  575         200         556         420
        % 1139         200         538         420
        % 1937         612         560         420
        % 1942          26         560         420
        % ];
    end

    if ( rama || toshita )
        % First set: some overlap to get larger plots 
%       figurepositions = [...
%              20   412   560   412
%             623   404   560   420
%             119    18   560   420
%             752    19   560   420
%             ];
        % Second set: no overlap 
        figurepositions = [...
            21   481   634   343
           687   483   708   341
            18     5   630   389
           694     6   705   382
            ];
    end

    if (behemoth)
        figurepositions = [...
            21   481   634   343
           687   483   708   341
            18     5   630   389
           694     6   705   382
            ];
    end

    number_of_figure_positions = size(figurepositions, 1);
    fhandle = figure; 
    set(fhandle, 'Position', figurepositions(N6dAgR5UGpDDyGpaqXmlAqVaN2Pvlr,:));
    N6dAgR5UGpDDyGpaqXmlAqVaN2Pvlr = ...
        1 + mod(N6dAgR5UGpDDyGpaqXmlAqVaN2Pvlr, number_of_figure_positions);

    if (nargout > 0)
        fighandle = fhandle;
    end

return
