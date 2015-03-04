
% Read in the data in the file with the name given in the character string
% "filename". If the file cannot be read, return an empty array.

function [input_data, errormsg] = getdata(filename)

    % Start off assuming everything is going to work; reset errormsg before
    % returning if anything goes wrong.
    input_data = [];
    errormsg = '';

    %load filename;
    if (exist(filename, 'file'))
        % Do what is needed
        % Use load command to load the data if exist
        input_data=load(filename);
        
    else
        % Set errormsg followed by the name
        errormsg ='No file named ';
%         msg = fprintf('No file named %s',filename);
        disp([errormsg filename]);
        
    end
end
   

