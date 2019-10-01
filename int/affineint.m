function [ nl ] = affineint(ls,ref,normalization_type)
%
%
% ls = cell of landmarks
% ls{i}.n = i'th neutral state
% ls{i}.e = i'th facial expression
%
%
% ref = refrence landmarks points of the eyes canthus
%
%
% normalizationtype = {1,2,3,4}  
%   1 = without normalization, 2 = procrustes, 3 = in terms of the neutral
%   state 4 = maintaining aspect ratio of the neutral state
%

nl = cell(size(ls,2),1);
switch normalization_type
    case 1
        nl = ls';
    case 2 
        for i = 1 : size(ls,2)
           nl{i,1} =  procrus(ls{i}.n,ls{i}.e);
        end
    case 3
        for i = 1 : size(ls,2)
            nl{i,1} = affine(ls{i}.n,ls{i}.e,ref);
        end
    case 4
        for i = 1 : size(ls,2)
            nl{i,1} = affineescala(ls{i}.n,ls{i}.e,ref);
        end
end



end