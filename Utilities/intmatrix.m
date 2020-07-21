function A = intmatrix(m,n)
%-----------------------------------------------------------------------
% Create an m x n matrix with random 2-digit integers for its elements.
% Since randi produces only positive integers, map the interval [1,99]
% to [-99,99] by subtracting 50 and multiplying by 2.
%-----------------------------------------------------------------------
    if (nargin < 1) 
        disp('intmatrix() requires at least one input, a positive integer');
        A = [];
    end

    if (nargin < 2) 
        n = m;
    end

    A = 2*(randi(99, m, n) - 50);

