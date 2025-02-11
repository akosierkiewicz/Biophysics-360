
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

nsteps = 100;
k = 1;
times = 21;
fwhms = zeros(1,times)
sqrtn = zeros(1,times)
while k < times


ntrials = 1000;

positions = zeros(1,ntrials);
i = 0;
j = 1;
%FWHMS =zeros(1,NMax - NInit / 100)

while i < ntrials
    position = OneDwalk(nsteps, 0.5);
    positions(j) = position;
    j = j+1;
    i = i +1;
end

bins = -nsteps-1:2:nsteps+1;
%disp(positions);
%hist(positions,bins)


% Bin the data according to the predefined edges:
Y = histcounts(positions, bins);
% Fit a normal distribution using the curve fitting tool:

binCenters = conv(bins, [0.5, 0.5], 'valid'); % moving average
[xData, yData] = prepareCurveData(binCenters, Y);
ft = fittype('gauss1');
fitresult = fit(xData, yData, ft);
%disp(fitresult); % optional
% Plot fit with data (optional)
%figure();
%histogram(positions, bins); hold on; grid on;
%plot(fitresult);

c = fitresult.c1;

fwhm = 2*sqrt(2*log(2))*c/sqrt(2)

fwhms(k) = fwhm;
sqrtn(k) = sqrt(nsteps)

nsteps = nsteps + 100;
k = k + 1;

end
disp(fwhms);
disp(sqrtn);


plot(sqrtn,fwhms, 'o');
title("Full Width at Half Mass Compared to Square Root of n")
ylabel("FWHM")
xlabel("sqrt(n)")







