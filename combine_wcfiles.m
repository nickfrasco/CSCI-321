% function [uwords, sumcounts]  = combine_wcfiles(dirname)
%--------------------------------------------------------------------------------------
% Read all of the word count files rooted in the directory whose name is in the
% character array dirname, and create a combined word count file named the same as the
% input directory dirname, but  with a ".wc" suffix extension. That file should have
% one line for each unique word that appears in any of the word count files, and the
% count it shows is the sum of counts over all of them.
%
% E.g., Suppose the directory named "global" has only two word count files. 
% The file a.wc contains
%   above 1
%   cloud 4
%   is 12
%   the 3
% while the word count file b.wc contains
%   ants 2
%   is 7
%   summer 1
%   the 5
%
% Then the resulting file named global.wc file should end up with
%   above 1
%   ants 2
%   cloud 4
%   is 19
%   summer 1
%   the 8
% although those 6 lines can be in any order.
%
%----------
% Outputs:
%----------
% uwords is a cell array with the global list of unique words. In the
% example above, uwords = {'above', 'ants', 'cloud', 'is', 'summer', 'the'}.
%
% sumcounts is the sum of the counts for each word. In the example above,
% sumcounts = [1 2 4 19 1 8].
%
% Note: this follows the same basic workflow as do_dict.m, but it keeps the counts
% instead of just the words. Also, it must compute the combined counts for each
% unique word.
%
%--------
% Notes:
%--------
% 1. This was done in class, so you just need to duplicate that work. 
% 2. The directory "global" has three files in it, a.wc, b.wc, and c.wc. The first
%    two are the same as the ones in the comments above, so you can use them for
%    developing and debugging this function. You will need to remove the third
%    file c.wc from that directory to match the comments above, however.
% 3. This uses the write_wordcounts.m function, and can use read_wordcounts.m which
%    should be available.
% 4. In class I showed how to think through this, and in particular wrote down what
%    I expected each of the arrays to hold for a small example. Do the same, because
%    if you cannot do it by hand for the small example files in directory "global",
%    then it is hopeless to try to do it in Matlab code.
% 5. For both the sort() and unique() functions, I had to get two output arguments
%    from them in order to apply the sort to the array allcounts, and to compute 
%    the sum of counts for the array sumcounts. 
%--------------------------------------------------------------------------------------

% Randall Bramley
% Dept of Computer Science
% Started: Wed 10 Apr 2019, 01:49 PM
% Last Modified: Thu 11 Apr 2019, 05:38 PM

function [uwords,sumcounts] = combine_wcfiles(dirname)


    % Get a list of all files in the specified directory
    all_files = getallfiles(dirname);
    
    % Initialize the required arrays to be empty. In case of error or all
    % empty files, this will provide the correct output arguments.
    uwords = {};
    sumcounts = [];

    % Initialize arrays that will have the combined words and counts
    % (including duplicates)
    allwords = {};
    allcounts = [];

    % Loop over all the files
    for j = 1:length(all_files)
        % Extract the j-th filename f from the list of all files...
        f = all_files{j};
        % If file f is a word count file, read it in and
        % append its data to uwords and allcounts. Viz.,
        if endsWith(f, '.wc')                               %   if the j-th filename ends in '*.wc',
            [w,wc] = read_wordcounts('f');                  %       [w, wc]   = read_wordcounts(...);
            allwords = { allwords; w(:) };                  %       append the array w to the array of allwords
            allcounts = [ allcounts; wc(:) ];               %       append the array wc to the array of allcounts
        end
    end
    
    disp(allwords)
    disp(allcounts)

    % Sort allwords into alphabetical order ...
    [allwords, sortIdx] = sort(allwords);
    % ... and be sure to sort the allcounts array to match the reordering of allwords
    allcounts = allcounts(sortIdx);
    
    
    % Now find the list of unique words in allwords, and the index where each word
    % first appears. Augment that index array K to append the number that is 1 more
    % than the number of words in the array allwords:
    unique_words = unique(allwords);
    
 
    for i = 1:length(unique_words)
        K = find(strcmp([unique_words{:}], unique_words(i)));
        allwords(K) = allwords + 1;
    end
    
    %[uw, k] = unique(allwords);
    %k = [k(:); length(uw)+1];
    
    
    % Now write out the dirname.wc file
    ok = write_wordcounts(allwords, sumcounts, dirname)
    
end


