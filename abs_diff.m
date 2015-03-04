
% Return a vector b with the absolute values of the differences in the vector a.
% The diff() function requires a to be of length at least 2, so test for that.
% If a is empty or has only one entry, set b to an empty array. 

function b = abs_diff(a)

    if((length(a)<2)||(isempty(a)))
        %when a is empty of only has one entry
        b = [];
        %set b to an empty array
        return
    end
    if(length(a)>=2)
        %when length is greater or equal to 2
        dfa=diff(a);  
        %take the difference between each element in the vector
        b=abs(dfa);   
        %absolute value of dfa and return the value of b
    end
end

