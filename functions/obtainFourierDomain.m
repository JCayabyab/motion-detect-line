function freqGraph = obtainFourierDomain(FrameRate,disSignal)
%OBTAINFOURIERDOMAIN Obtains framerate information and displacement signal.
%Then the function transforms this displacement signal in the time domain
%to a signal in the frequency domain.

T = 1/FrameRate; %How long for one sample
[L, ~] = size(disSignal); %how many frames?
%t = (0:L-1)*T;

S = disSignal;

Y = fft(S(:,2));

P2 = abs(Y/L);
P1 = P2(1:floor(L/2)+1);
P1(2:end-1) = 2*P1(2:end-1);
f = FrameRate*(0:floor(L/2))/L;
f = f';

%Uncomment this line to attentuate frequencies that are near zero:
%P1(1:3) = 0;

freqGraph = zeros(floor(L/2)+1, 2);
freqGraph(:,2) = P1;
freqGraph(:,1) = f;

end

