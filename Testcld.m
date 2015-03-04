%---------------------------------------------------------------------------------
%
% Small test driver for the cleanup_data function. Some of the tests require
% actually looking at the results to see if it succeeded or failed. More tests will
% help, especially ones that involve small quantities like eps = 2.2204e-16 or so.
%
%-----------------
% Randall Bramley
% Department of Computer Science
% Indiana University, Bloomington
%------------------------
% Started: Tue 26 Mar 2013, 02:44 PM 
% Last Modified: Wed 27 Mar 2013, 10:15 AM 
%---------------------------------------------------------------------------------

% To draw a line between output of different tests ...
separator = '=============================================================================';
disp(separator);

m = 11;
n = 9;
z = linspace(-2,2,n)

% Test 0
% Try a vector with two entries equal to somevalue:
somevalue = pi/sqrt(2);
minval = somevalue;
maxval = somevalue;
disp(['Testing minval = ' num2str(minval) ' and maxval = '  num2str(maxval)])
z = [somevalue -pi eps -eps 0 71.9 somevalue 900 3+pi]
cud = cleanup_data(z,minval,maxval)
disp(separator);

% Test 1
minval = [];
maxval = [];
disp(['Testing minval = ' num2str(minval) ' and maxval = '  num2str(maxval)])
cud = cleanup_data(z,minval,maxval)
check = norm(cud-z);
if (check > eps)
    disp('error in minval = maxval = [] case')
else
    disp('minval = maxval = [] case is OK')
end
disp(separator);

% Test 2
minval = -1;
maxval =  1;
cud = cleanup_data(z,minval,maxval);
disp(['Testing minval = ' num2str(minval) ' and maxval = '  num2str(maxval)])
z = linspace(-2,2,n)
cud = cleanup_data(z,minval,maxval)
disp(separator);

% Test 3
disp(['Testing minval = ' num2str(minval) ' and maxval = '  num2str(maxval)])
disp('with a random vector:')
z = randn(1,m)
cud = cleanup_data(z,minval,maxval)
disp(separator);

% Test 4
minval = -inf;
maxval =  1;
cud = cleanup_data(z,minval,maxval);
disp(['Testing minval = ' num2str(minval) ' and maxval = '  num2str(maxval)])
disp('with a random vector:')
z = randn(1,m)
cud = cleanup_data(z,minval,maxval)
disp(separator);

% Test 5
minval = -1;
maxval =  inf;
cud = cleanup_data(z,minval,maxval);
disp(['Testing minval = ' num2str(minval) ' and maxval = '  num2str(maxval)])
disp('with a random vector:')
z = randn(1,m)
cud = cleanup_data(z,minval,maxval)
disp(separator);

% Test 6
minval =  1;
maxval = -1;
cud = cleanup_data(z,minval,maxval);
disp(['Testing minval = ' num2str(minval) ' and maxval = '  num2str(maxval)])
cud = cleanup_data(z,minval,maxval);
if isempty(cud)
    disp('Case of minval > maxval is ok')
else
    disp('Case of minval > maxval is NOT ok')
end
disp(separator);

% Test 7
minval =  inf;
maxval = -inf;
cud = cleanup_data(z,minval,maxval);
disp(['Testing minval = ' num2str(minval) ' and maxval = '  num2str(maxval)])
cud = cleanup_data(z,minval,maxval);
if isempty(cud)
    disp('Case of minval = inf > maxval = -inf is ok')
else
    disp('Case of minval = inf > maxval = -inf is NOT ok')
end
disp(separator);

% Test 8: try some NaNs added to the cooking pot
minval = -1;
maxval =  1;
disp(['Testing NaNs with minval = ' num2str(minval) ' and maxval = '  num2str(maxval)])
z = linspace(-2,2,n);
z(1) = NaN;
z(3) = NaN
cud = cleanup_data(z,minval,maxval)
disp(separator);

% Test 9: try something really different
disp('next test is for z = randn(n); guess what happens here')
minval = -1;
maxval =  1;
z = randn(n)
disp(['Testing with minval = ' num2str(minval) ' and maxval = '  num2str(maxval)])
cud = cleanup_data(z,minval,maxval)
disp(separator);

