%% Data for the mdoels

% Relation between class numbers and a facial expressions
emo = {'angry','contemptuous','disgusted','fearful','happy','sad','surprised','neutral'};
% Used action units
all = [1 2 4 5 7 9 12 14 15 20 23 24 25];

% Used action units for fuzzy models.

reglas{1} = [4 23 24];   %anger
reglas{2} = [14 25];     %contemp
reglas{3} = [4 7 9];     %disgust
reglas{4} = [1 25 27];   %fear
reglas{5} = [1 12 25];   %happy
reglas{6} = [1 4 15 25]; %sadness
reglas{7} = [1 2 25 27]; %surprise




