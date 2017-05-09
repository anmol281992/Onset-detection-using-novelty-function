% Anmol Monga : N18513543
function []= create_novelty_plots(filepath, win_size, hop_size,w_c, medfilt_len, offset)
[x_t,fs] = audioread(filepath);
t = [0:(length(x_t(:,1))-1)]/fs;

%figure(1)
subplot(3,1,1)
plot(t,x_t(:,1)');
xlabel('time');
title('waveform');

[n_t_le, t_le, fs_le] = compute_novelty_le(x_t(:,1)', t, fs, win_size, hop_size);
n_t = n_t_le;


[onset_a_le, onset_t_le, n_t_smoothed_le, thresh_le] = onsets_from_novelty(n_t, t_le, fs_le, w_c, medfilt_len, offset);
subplot(3,1,2)
%figure(2)
hold on
plot(t_le,n_t_le,'r');
plot(t_le,n_t_smoothed_le,'k');
plot(t_le,thresh_le,':b');
plot(onset_t_le,onset_a_le,'ko');
legend('Novelty function','smoothed novelty function','adaptive threshold','Onset detected');

xlabel('time');
title('log energy derivative novelty function');

hold off

[n_t_sf, t_sf, fs_sf] = compute_novelty_sf(x_t(:,1)', t, fs, win_size, hop_size);
n_t = n_t_sf;



[onset_a_sf, onset_t_sf, n_t_smoothed_sf, thresh_sf] = onsets_from_novelty(n_t, t_sf, fs_sf, w_c, medfilt_len, offset);
subplot(3,1,3)
hold on
plot(t_sf,n_t_sf,'r');
plot(t_sf,n_t_smoothed_sf,'k');
plot(t_sf,thresh_sf,':b');
plot(onset_t_sf,onset_a_sf,'ko');
xlabel('time');
legend('Novelty function','smoothed novelty function','adaptive threshold','Onset detected');
title('rectified spectral flux novelty function');
hold off

end
