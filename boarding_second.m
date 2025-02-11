function [second_order] = boarding_second(N,trials)
%N = 5;
t = 1;
n = N
i = 0;
second_order = zeros(1,trials);
while i < trials

   order = randperm(n)

    while n > 1
        if order(n) < order(n - 1) && order(n-1) ~= 0
            t = t+1;
            k = order(n) - 1;
            l = 1;
            while k > 0
                if n - l > 0
                    if order(n - l) < order(n)
                        order(n-l) = 0;
                    end
                    l = l + 1;
                end
                k = k - 1;
                end
                
        end
        n = n - 1;
    end

   
    i = i+1;
    second_order(i) = t;
    n = N
    t = 1;
end

second_order


