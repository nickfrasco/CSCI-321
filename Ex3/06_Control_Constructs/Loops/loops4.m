
clear all
% Loops can be nested, they just have to use different loop index variables.
% In the next example, I use i for the outer loop and j for the inner one.
% The loop that starts with "for j = 1:5" is executed 3 times, oncee for each
% value of i in the outter loop.
%
% To make clear when the value of i changes, I put in a disp() for it.

for i = 1:3
    disp(['---------------> i = ' num2str(i)])
    for j = 1:5
        A(i,j) = 10*i+j
    end
end

% This shows that A is built up one entry at a time, row by row. At the start,
% A is created as a 1 x 1 array since only A(1,1) is defined. Then it becomes
% 1 x 2 when A(1,2) is defined, ....
%
% It's better to have A created as a 3x5 from the start, even when its values
% are being filled in one-by-one. That can be done by putting
%       A = zeros(3,5);
% just before the first loop. Another ways is to reverse the index array entries
% for i and j to be 3:-1:1 and 5:-1:1. That will create the A(3,5) value first, so
% Matlab knows to allocate A to be of at least that size. Since it doesn't know
% what values go into the remaining 14 entries, it puts zeros there until the
% loops can fill it in.

% 
% Some ways of setting up arrays are more efficient than others. Suppose I 
% want to set up an n x n array G of all ones. Three ways of doing this are
%   1. use ones(n,n) since it's provided by Matlab
%   2. use a double nested loop to set up each element
%   3. first create G to be n x n of all zeros, then set each element to 1
% To see how fast each is, I start an internal clock in Matlab using "tic",
% and when the operation is done get the elapsed time using "toc".
n = 3000;

% 1. Use Matlab's built-in ones() function to set up the array
tic; G = ones(n); t_builtin = toc

% 2. Don't preallocate, and use loops to set the values
clear G
tic;
for i = 1:n
    for j = 1:n
        G(i,j) = 1;
    end
end
t_loops = toc


% 3. Preallocate G, and then use loops to set its values.
clear G
tic;
G = zeros(n);
for i = 1:n
    for j = 1:n
        G(i,j) = 1;
    end
end
t_preallocate = toc

% Beware: when you change one entry in an array and don't end the assignment
% statement with a semicolon, Matlab prints out the whole array, not just the
% single changed entry.
