function [ cars ] = caracterizarinterfaz( normalized_landmarks,car_type )
% Calls the correct mehtod for feature extraction
%
% normalized_landmarks = cell of normalized landmarks
% normalized_landmarks{i}.n = i'th neutral state
% normalized_landmarks{i}.e = i'th facial expression
%
% car_type = {1,2}
%   1 = average pooling, 2 = max pooling


switch car_type
    case 1
        for i = 1 : size(normalized_landmarks,1)
            cars(i,:) = caracterizaravg(normalized_landmarks{i}.n,normalized_landmarks{i}.e);
        end
    case 2
        for i = 1 : size(normalized_landmarks,1)
            cars(i,:) = caracterizarmax(normalized_landmarks{i}.n,normalized_landmarks{i}.e);
        end
end
end

