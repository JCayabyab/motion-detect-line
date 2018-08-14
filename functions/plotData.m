function plotData(disSignal,freqSignal)
%PLOTDATA Summary of this function goes here
%   Detailed explanation goes here

figure('Name', 'Video Output', 'Position', [50 200 1500 500]);

subplot(1,2,1);

plot(disSignal(:,1),disSignal(:,2))
title('Displacement of Edge vs Time');
xlabel('Time (seconds)')
ylabel('Displacement')

subplot(1,2,2);

plot(freqSignal(:,1),freqSignal(:,2))
title('Single-Sided Amplitude Spectrum of S(t)')
xlabel('f (Hz)')
ylabel('Amplitude, S(f)')

end

