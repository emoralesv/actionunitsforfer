function [ r ] = rotatep(landmarks, angle ,reference )
% rotates the landmarks points  "landmarks"  in "angle" degrees using as
% reference "reference"
%
%
%
%
angle = deg2rad(angle);
dx  = landmarks(reference,1);
dy = landmarks(reference,2);
p = traslatep(landmarks,-dx,-dy);


sm = [cos(angle) -sin(angle);sin(angle) cos(angle)];
for i = 1: size(landmarks,1)
    pt = p(i,1:2);
    scaled(i,:) = sm * pt';
end

r = traslatep(scaled,dx,dy);

end

