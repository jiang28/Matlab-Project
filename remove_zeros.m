
% For a given array x, return the possibly empty vector y which is x but with all
% values equal to zero removed.  E.g., if x = [ 8 -2.1 0 0 7], the function should
% return y = [ 8 -2.1 7]. If x has only zero values, return y = [], an empty array.
% If x is empty, so should y be. If x does not have any entries equal to 0, then 
% return y = x.

function  y = remove_zeros(x)
     y = x(x~=0);
     
end



