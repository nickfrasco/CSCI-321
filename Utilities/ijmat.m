% This function creates an m x n array with entries that make it easy to see
% what indices are needed to extract a given element, row, or column from it.
% The m x n array A has entries A(i,j) = 10*i + j. For m,n < 10, this means
% the first digit is the row number and the second is the column number.
%
% If m or n is 10 or larger, it takes more than 2 digits to contain a row or column
% number, so this function is not as useful for seeing indexing results. However, m
% and n can be any positive integers, so go hog wild if you want.
%
% If only one input argument is given, a square array is created. 
% If no input arguments are given, m = n = 8 is used.
%
% Indexing examples, assuming you start with B = ijmat(8):
%
%   B = ijmat(8)             % create an 8 x 8 ij-matrix
%   A = B(1:5,1:5)           % leading 5 x 5 principal submatrix of B
%   C = B(1:2:end, 2:2:end)  % all entries with odd row number and even col number
%   G = B([2 2 2], :)        % 3 x 8 array with row 2 of B duplicated 3 times
%   H = B(end:-1:1,end:-1:1) % reversal of B

%-----------------
% Randall Bramley
% Department of Computer Science
% Indiana University, Bloomington
%------------------------
% Started: Long, long ago, at a university near Urbana, IL.
% Modified: Mon 07 Aug 2017, 11:47 AM to allow rectangular matrices
% Modified: Fri 01 Dec 2017, 09:53 AM to use new ability to add row+col vectors
% Last Modified: Tue 26 Dec 2017, 07:11 PM 
%---------------------------------------------------------------------------------

function A = ijmat(m,n)

    % Set up an 8 x 8 array if m and n are not given as input arguments
    if (nargin < 1)  % nargin < 1 means that 0 input arguments were given
        m = 8;
    end

    % Set up a square matrix if only m is given as an input argument
    if (nargin < 2) % nargin < 2 means that 0 or 1 input arguments were given
        n = m;
    end

    % Earlier versions of Matlab did not allow adding a column vector of
    % length m to a row vector of length n, so both had to be expanded to
    % be m x n arrays by replicating the column vector n times and the
    % row vector m times before adding. More recent versions assume you
    % want that expansion done automatically. Version 9.0 is R2016a.
    if verLessThan('matlab','9.0')
        A = 10*[1:m]'*ones(1,n) + ones(m,1)*[1:n];
    else
        A = 10*[1:m]' + [1:n];
    end

%====================================================================================
% If you are new to Matlab, dissect the line that defines A to see what
% is being done. That is, break that line down into separate steps to see
% (e.g.,) why it has [1:n] in one place but [1:m]' in another. By leaving
% off the semicolon on the following lines, the results are displayed
% immediately.
%
% x1 = 10*[1:m]'
% x2 = ones(1,n)
% x3 = ones(m,1)
% x4 = [1:n]
% term1 = x1*x2    % First term in line 30 above
% term2 = x3*x4    % Second term
% A = term1 + term2
%
