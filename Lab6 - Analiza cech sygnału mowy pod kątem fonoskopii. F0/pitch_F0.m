function pitch_F0_value = pitch_F0(vowel, signal_type, fs)
pitch_F0_value = mode(pitch(vowel(:,signal_type), fs, Method = "SRH", WindowLength = round(0.03*fs), OverlapLength = round(0.01*fs)));
%Aby ujednoznacznić wyniki, postanowiłem przyjąć wartość F0 jako modę wektora pitch - pozwala to osiągnąć zadowalające uśrednienie
end