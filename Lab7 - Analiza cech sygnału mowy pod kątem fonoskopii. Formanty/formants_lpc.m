function [formants] = formants_lpc(signal, fs)
A = lpc(signal, 6); % oczekuję 2 formantów, zatem zgodnie z dokumentacją 2 * 2 + 2 = 6;
rts = roots(A);

rts = rts(imag(rts)>=0);
angz = atan2(imag(rts),real(rts));

[frqs,indices] = sort(angz.*(fs/(2*pi)));
bw = -1/2*(fs/(2*pi))*log(abs(rts(indices)));


formants = zeros(length(frqs));
nn = 1;
for kk = 1:length(frqs)
    if (frqs(kk) > 90 && bw(kk) < 400)
        formants(nn) = frqs(kk);
        nn = nn+1;
    end
end


