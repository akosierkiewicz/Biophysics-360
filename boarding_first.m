function [average_time] = boarding_first(N,trials)
%N = 5;
t = 1;
n = N
i = 0;
average_time = zeros(1,trials);
while i < trials

    order = randperm(n);
    while n > 1
        if order(n) < order(n - 1)
            t = t+1;
        
    %else
         %remove last one from array
        % order(end) = [];
         %t = t+1;
        end

    n = n - 1;

    end
    i = i+1;
    average_time(i) = t;
    n = N
    t = 1;
end

average_time

