%-------------------------------------------------------------------------------
% function cmaps = colormaps(whichkind)
%
% Listing of the pre-defined colormaps. Useful if you want to loop over all of 
% them, or some subset. You can specify a particular type using the categories
%
%    'physical' : ones that seem to do well for surfaces corresponding to 
%                   physical objects, e.g., a magnetic field or thermal isoline
%    'lsd'      : the 60's are back, and as tasteless as they were 50 years ago
%    'boring'   : variations on white, gray, black
%    'all'      : well, duh. All of them.
%
% Default is 'all' and the same holds for unrecognized specifications. These
% are only the pre-defined colormaps; you can set up your own as RGB triplets.
% The colormap names are returned as a cell array.
%
% Matlab's default colormap (when one is not specified) is 'parula'. I have 
% no idea where the name came from. Some twit or warbler, no doubt.
%
% WARNING: Matlab has a built-in function called "colormap". So don't miss
% the s on the end of this function.
%-------------------------------------------------------------------------------

function cmaps = colormaps(whichkind)

    gripe_and_grumble = false;

    if (nargin < 1)
        whichkind = 'whole_megillah';
    end

    % For the totally hopeless types who can't figure out types 
    if ~ischar(whichkind)
        if gripe_and_grumble
            disp(' ')
            disp('You need to learn how to read ... and then do so.')
            disp('The argument to colormaps() must be a character, but ')
            disp('you passed in ')
            disp(whichkind)
            disp(' ')
        end
        whichkind = 'all';
    end

    allcmaps = {'autumn', ... 
                'bone', ... 
                'colorcube', ... 
                'cool', ... 
                'copper', ... 
                'flag', ... 
                'gray', ... 
                'hot', ... 
                'hsv', ... 
                'jet', ...  
                'lines', ... 
                'parula', ... 
                'pink', ... 
                'prism', ... 
                'spring', ... 
                'summer', ...
                'vga', ... 
                'white', ... 
                'winter'};

    % I don't like upper case letters, they make me exert myself and 
    % use the shift key.
    switch lower(strtrim(whichkind))

        case {'a', 'all', 'whole', 'whole_megillah'}
            cmaps = allcmaps;

        case{'p', 'unbusy', 'physical'}
            cmaps = { ...
            'hsv', ... 
            'hot', ... 
            'copper', ... 
            'jet', ... 
            'cool', ... 
            'autumn', ... 
            'spring', ... 
            'winter', ...
            'summer', ...
            'parula'};      % the default setting

        case {'l', 'psychedelia', 'lsd', 'psycho'}
            cmaps = { ...
            'colorcube', ... 
            'vga', ... 
            'prism', ... 
            'lines', ... 
            'flag'};

        case {'b', 'bw', 'boring', 'get_a_life', 'this_place_needs_painting'}
            cmaps = { ...
            'gray', ... 
            'bone', ... 
            'copper', ... 
            'pink', ... 
            'white'};

        otherwise
            if gripe_and_grumble
            disp('I have no idea what you want, and in no way can I read the mind');
            disp('of someone who lacks the basic hardware required.');
            disp('Come back when you get a second neuron and a synapse to it. In the');
            disp('meantime, I''m setting (with disgust) the returned colormaps type to "all".');
            end
            cmaps = allcmaps;
    end

