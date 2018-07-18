function freqGraph = obtainFourierDomain(FrameRate,disSignal)
%OBTAINFOURIERDOMAIN Obtains framerate information and displacement signal.
%Then the function transforms this displacement signal in the time domain
%to a signal in the frequency domain.

T = 1/FrameRate; %How long for one sample
[L, ~] = size(disSignal); %how many frames?
t = (0:L-1)*T;

S = disSignal;

plot(1000*t(1:50),S(1:50))
title('Signal')
xlabel('t (milliseconds)')
ylabel('S(t)')

Y = fft(S);

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = FrameRate*(0:(L/2))/L;

P1(1:3) = 0;

plot(f,P1) 
title('Single-Sided Amplitude Spectrum of S(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')

end

