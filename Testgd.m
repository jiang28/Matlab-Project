%---------------------------------------------------------------------------------
%
% Test driver for the getdata() function. The only thing it really checks for is
% if the file does not exist in the current directory.
%
% Although the variable errormsg (called y in this script) is required by the
% interface spec, the values it returns were not specified. This test driver 
% assumes
%
%   1. The empty string is returned if things seemed ok in getdata.m
%
%   2. If the data file does not exist or cannot be found, the errormsg starts
%       with the characters "No file named ". 
%
% Since those are not specified in the interface, your implementation may still
% be correct even if you don't choose those values for the returned error messages.  
% Change this test script to match your choices if you did differently. E.g., you
% might have chosen the string indicating no errors occurred to be
%   alrighty = 'Everything is about as well as one could wish or expect.';
% instead of the empty string. In that case this test script will flag getdata.m
% as being wrong, even if it isn't.
%
% This script uses the variable names
%       x -> input_data
%       y -> errormsg
%       f -> filename
% to save on typing. The function getdata.m uses the longer ones, but when 
% invoking the function, this script (or other functions and scripts) can use
% whatever names they want.
%
%-----------------
% Randall Bramley
% Department of Computer Science
% Indiana University, Bloomington
%------------------------
% Started: Tue 02 Apr 2013, 02:22 PM 
% Modified: Tue 02 Apr 2013, 03:54 PM to add in another test case
% Last Modified: Tue 02 Apr 2013, 06:09 PM 
%---------------------------------------------------------------------------------

% This is the only place that the string 'timings' should appear, when it is
% assigned to the character array variable corresponding to the variable called
% filename in getdata.m
f     = 'timings';
[x, y] = getdata(f);

%-------------------------------------------------------------------------------------
% An empty string is returned if everything is ok. I'v created a variable in case
% the message returned is changed to be something else in the future. If so, just
% change the definition of the variable alrighty to match the corresponding string.
%-------------------------------------------------------------------------------------
alrighty = '';

disp(' ')
display('=============================================================')
display('Test 1 for a file that should be in the current directory:')
if strcmpi(y, alrighty)
    display('The function getdata.m seems to be hunky-dory.')
else
    display('The function getdata.m is being cranky and foul-tempered; error message returned is:')
    display([' "' y '" '])
    display('Fix that. And stay off getdata.m''s lawn.')
end
display('=============================================================')

% Now test for a non-present file. I'm choosing a weird long name to make it
% unlikely that the file exists. If you do have a file with the name in variable f,
% then
%   1. Delete it or move it to some other directory 
%   2. and the word "weird" applies to you as well as the name of the file

f     = 'Viu8o3thoegItIA35Oa4hlahklephlAtiaf0';
[x,y] = getdata(f);

disp(' ')
display('===================================================================================')
display('Test 2 for a non-existing file:')
if strcmpi(y, alrighty)
    display('Something is wrong with getdata.m; it should return a nonempty error')
    display(['message for the file named ' f])
else
    display('The function getdata.m has returned the error message:')
    display([' "' y '" '])
    % Just check the first few characters in the error message
    if strncmp('No file named ', y, 14)
        disp('which seems to be a correct error message.')
    else
        disp('which seems to be an incorrect error message.')
    end
end
display('===================================================================================')
disp(' ')


