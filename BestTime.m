clear all; clc;
filename = 'timings';
[z, errormsg] = getdata(filename)
while(length(z)>2)
   c=remove_zeros(z);
   z=abs_diff(c)
   len=length(z)
   minimal=min(z)
end

