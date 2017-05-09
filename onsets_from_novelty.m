% Anmol Monga : N18513543
function [onset_a, onset_t, n_t_smoothed, thresh] = onsets_from_novelty(n_t, t, fs, w_c, medfilt_len, offset)
w_c = 2*w_c/fs;
[b,a] = butter(1,w_c);
x1 = filtfilt(b,a,n_t);
n_t_smoothed = (x1 - min(x1))/(max(x1)-min(x1));
thresh = medfilt1(n_t_smoothed,medfilt_len)+offset;
xa = n_t_smoothed - thresh;
xa = (abs(xa) + xa) / 2;
[onset,loc] = findpeaks(xa);
onset_a = n_t_smoothed(loc);
onset_t = loc/fs;
end
