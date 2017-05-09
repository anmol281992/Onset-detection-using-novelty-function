% Anmol Monga : N18513543
clear all;
filepath = '/Users/compume/Documents/MATLAB/audio_content/assignment2_folder/sounds2/female_short.wav';
win_size = 1024;
hop_size = 512;
w_c = 4;
medfilt_len = 10; 
offset = 0.03;
figure(1);
create_novelty_plots(filepath, win_size, hop_size,w_c, medfilt_len, offset);
%%
clear all;
filepath = '/Users/compume/Documents/MATLAB/audio_content/assignment2_folder/sounds2/PianoDebussy.wav';
win_size = 1024;
hop_size = 512;
w_c = 4;
medfilt_len = 10; 
offset = 0.03;
figure(2);
create_novelty_plots(filepath, win_size, hop_size,w_c, medfilt_len, offset);
%%
clear all;
filepath = '/Users/compume/Documents/MATLAB/audio_content/assignment2_folder/sounds2/sewing_machine_short.wav';
win_size = 1024;
hop_size = 512;
w_c = 4;
medfilt_len = 10; 
offset = 0.03;
figure(3);
create_novelty_plots(filepath, win_size, hop_size,w_c, medfilt_len, offset);
