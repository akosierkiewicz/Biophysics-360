
N = 5;
trials = 50;
i = 1;
amount_of_trials = 20;
average_times = zeros(1,amount_of_trials);

while N < 101
    average_time =  boarding_first(N,trials);
    average_times(i) = mean(average_time);
    N = N + 5;
    i = i +1;
end

average_times

N2 = 5:5:100;
%plot(N2, average_times,'LineWidth', 2, N2, 0.5*N2+0.5,'LineWidth', 2)
plot(N2, 0.5*N2+0.5, N2, average_times, 'LineWidth', 2)
xlabel("N Passengers")
ylabel("Average t")
title("Average Boarding Time with N Amount of Passengers")
legend('Theoretical Value', 'Data');


