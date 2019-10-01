function [ ls ] = generatemodel( ls )
% Generate a neutral state model using the provided landmarks of the
% CK+ database and procrustes.
%
% ls = cell of landmarks
% ls{i}.n = i'th neutral state
% ls{i}.e = i'th facial expression (not used)
%

init = ls{randi(size(ls,2))}.n ;
for i = 1 : size(ls,2)
    [~, ls{i}.n, ~ ] = procrustes(init,ls{i}.n);
end
acum = 0;
for i = 1 : size(ls,2)
%scat(ls{i}.n);
acum = acum + ls{i}.n;
end
model = acum / size(ls,2);
for i = 1 : size(ls,2)
    ls{i}.n = model;
end

end

