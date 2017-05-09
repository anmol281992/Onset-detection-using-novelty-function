% Anmol Monga : N18513543
function [n_t_le, t_le, fs_le] = compute_novelty_le(x_t, t, fs, win_size, hop_size)
x = padarray(x_t,[0 win_size/2],'replicate','both');
overlap = win_size - hop_size;
Y = buffer(x,win_size,overlap,'nodelay');
[n,m] = size(Y);
w = hamming(win_size);
W = repmat(w,1,m);
Y = (Y.^2).*W;
n_t_le = sum(Y)/(win_size);
fs_le = fs/hop_size;
t_le = [0:m-1]./(fs_le);
n_t_le = diff([log(n_t_le(1)) log(n_t_le)]);
end