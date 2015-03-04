%---------------------------------------------------------------------------------
%
% Test driver for the abs_diff function. No claim of completeness is made
% for it. Some of the tests just print out the input and output vectors lined
% up, and rely on user eyeballing them. Since the output vector b is one shorter
% than the input vector, the visual line-up pads out the shorter one with 
% +/-inf or NaNs. 
%
%-----------------
% Randall Bramley
% Department of Computer Science
% Indiana University, Bloomington
%------------------------
% Started: Tue 26 Mar 2013, 02:44 PM 
% Last Modified: Wed 27 Mar 2013, 09:51 AM 
%---------------------------------------------------------------------------------

n = 12;  % A vector length that can be eyeballed

% Simple case; should return a vector of all ones:
a1 = 1:n;
b1 = abs_diff(a1);
check1 = norm(b1 - ones(1,length(a1)-1));
if (check1 > eps)
    disp(['Failed first test, check1 = ' num2str(check1)])
    return
else
    disp('OK for vector of integers 1:12')
end 

% Even simpler case; should return a vector of all zeros:
b2 = abs_diff(b1);
check2 = norm(b2);
if (check2 > eps)
    disp(['Failed second test, check2 = ' num2str(check2)])
    return
else
    disp('OK for vector of all ones')
end 

% A non-monotonic case:
n = 4;
a3 = linspace(-3,3,n);
a3 = [a3 a3(end:-1:1)];
b3 = abs_diff(a3);
% View the two aligned on top of each other, but put an infinity on the end since
% b is one element shorter than a. 
[a3;[ b3 inf ]]
disp('hit enter to continue')
pause

% Try some NaNs for breakfast ...
n = 7;
a4 = randn(1,n);
a4(2) = NaN;
a4(n) = NaN;
b4 = abs_diff(a4);
[a4;[ b4 inf ]]

% ... and some infs for lunch 
n = 12;
a5 = randn(1,n);
a5(1)    =  inf;
a5(n-1)  = -inf;
b5 = abs_diff(a5);
% Use NaN to fill out the b vector, since testing infs.
[a5;[ b5 NaN ]]

% Now try an empty matrix 
b6 = abs_diff([]);
if isempty(b6)
    disp('Awl OK for empty input')
else
    disp('Not OK for empty input')
end

% For a vector of length 1
b7 = abs_diff([pi/3]);
if isempty(b7)
    disp('Awl OK for input of length 1')
else
    disp('Not OK for input of length 1')
end
