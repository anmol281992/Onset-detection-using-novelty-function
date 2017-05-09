% Anmol Monga : N18513543
function [n_t_sf, t_sf, fs_sf] = compute_novelty_sf(x_t, t, fs, win_size, hop_size)
windows = hamming(win_size);
overlap = win_size - hop_size;
y = spectrogram(x_t,windows,overlap,512);
y1 = abs(y);
y1 = padarray(y1,[0 1],0,'pre');
y1 = diff(y1,2);
y1 = (y1+abs(y1))/2;
n_t_sf= 1/257*sum(y1,1);
fs_sf = fs/hop_size;
t_sf = [0:(length(n_t_sf)-1)]/fs_sf;

end