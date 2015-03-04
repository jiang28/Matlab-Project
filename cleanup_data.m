%
% Return in cud the vector z
% with all values less than or equal to minval removed, and all
% values greater than or equal to maxval removed.
% If minval = maxval, return in cud only entries in z exactly equal to minval.
% If minval > maxval, return an empty array.
% If the function is called with maxval = inf, just deletes values less than minval.
% If the function is called with minval = -inf, just deletes values greater than maxval.
% If both minval = -inf and maxval = inf, just return the vector x.
%
function cud = cleanup_data(z,minval,maxval)

    % First take care of the really easy case where z is empty
    cud = z;
    if (isempty(z))
        cud=[];
        return; 
    end
    
    if(minval<maxval)
        %if minval<maxval, remove all entries smaller than min and greater
        %than max
        z(z<minval)=[];
        z(z>maxval)=[];
        cud=z;
        return;
    end
    
    if(minval==maxval)
       z(z~=minval)=[];
       cud=z;
       return; 
    end
    
    if(minval>maxval)
        cud=[];
        return;
    end
    
    if((minval == -Inf)&(maxval == Inf))
        return;
    end
    
    if(maxval == inf)
        z(z<minval)=[];
        cud=z;
        return;
    end
    
    if(minval == -inf)
        z(z>maxval)=[];
        cud=z;
        return;
    end
end