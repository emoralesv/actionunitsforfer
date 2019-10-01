function [ scaled ] = scalep( landmarks,scale )
% scales the landmarks points  "landmarks"  "scale" times
%
%
%
sm = [scale 0 0;0 scale 0;0 0 1]; 
for i = 1: size(landmarks,1)
pt = [landmarks(i,:) 1];
scaled(i,:) = pt*sm;
end
scaled = scaled(:,1:2);
end

