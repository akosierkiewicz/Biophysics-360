

N = 4;
trials = 100;
i = 1;
amount_of_trials = 48;
average_times = zeros(1,amount_of_trials);

while N < 101
    second_order = boarding_second(N,trials);
    average_times(i) = mean(second_order);
    N = N + 2;
    i = i +1;
end

average_times

N2 = 4:2:100;
%plot(N2, average_times,'LineWidth', 2, N2, 0.5*N2+0.5,'LineWidth', 2)
plot(N2, 0.95*N2.^0.69, N2, average_times, 'LineWidth', 2)
xlabel("N Passengers","FontSize",14)
ylabel("Average t","FontSize",14)
title("Average Boarding Time with N Amount of Passengers","FontSize", 15)
legend('Theoretical Value', 'Data');


N2 = 4:2:100;
%plot(N2, average_times,'LineWidth', 2, N2, 0.5*N2+0.5,'LineWidth', 2)
plot(log(N2), log(N2)*0.6371+0.1147, log(N2), log(average_times), 'LineWidth', 2)
xlabel("log(N Passengers)","FontSize",14)
ylabel("log(Average t)","FontSize",14)
title("Average Boarding Time with N Amount of Passengers","FontSize",15)
legend('Line of Best Fit', 'Data');

polyfit(log(N2), log(average_times), 1)


