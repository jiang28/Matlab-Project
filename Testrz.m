%---------------------------------------------------------------------------------
%
% Test driver for the remove_zeros() function. No claim of completeness is made
% for this tester. The last one just displays the input and output vectors for
% comparison, but does not explicitly give pass/fail for the test.
%
%-----------------
% Randall Bramley
% Department of Computer Science
% Indiana University, Bloomington
%------------------------
% Started: Tue 26 Mar 2013, 02:44 PM 
% Last Modified: Wed 27 Mar 2013, 09:45 AM 
%---------------------------------------------------------------------------------

a = -3:1:3;
y = remove_zeros(a);
shouldbe = [-3 -2 -1 1 2 3];
check = norm(y  - shouldbe);
if (check > eps)
    disp('Something wrong on first test')
else
    disp('First test hunky-dory')
end

% rand() will almost never give 0 but add eps to make sure.
n = 12;
x = eps+rand(1,n);
y = remove_zeros(x);
check = norm(y  - x);  % Since no zeros removed, should have y = x
if (check > eps)
    disp('Something wrong on second test')
else
    disp('Second test hunky-dory')
end

% What if x is empty?
y = remove_zeros([]);
if isempty(y)
    disp('Empty x test hunky-dory')
else
    disp('Empty x test failed')
end

% What if x is all zeros?
y = remove_zeros(zeros(1,127));
if isempty(y)
    disp('All zero x test hunky-dory')
else
    disp('All zero x test failed')
end

% Sprinkle in a few nans, and test what happens
a = -3:1:3;
a(2:4) = NaN
y = remove_zeros(a)

a = -3:1:3;
a(1) = NaN
y = remove_zeros(a)


