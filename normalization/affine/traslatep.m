function [ r ] = traslatep( landmarks,dx,dy )
% translates the landmarks points  "landmarks"  using dx and dy.
    
sm = [1 0 0;0 1 0;dx dy 1]; 
for i = 1: size(landmarks,1)
pt = [landmarks(i,:) 1];
scaled(i,:) = pt*sm;
end
r = scaled(:,1:2);
end

