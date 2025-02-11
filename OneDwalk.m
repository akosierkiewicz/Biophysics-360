function [position] = OneDwalk(n,p)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

i = 0;
position = 0;
 
while i < n 
    if p < rand
        position = position - 1;


    else
        position = position + 1;
       
   
    end
i  = i + 1;

end

end


