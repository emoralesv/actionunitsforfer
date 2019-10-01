function [ rotation ] = puntos( dx,dy)
% Extract head rotation using the movement difference between the two
% points of the eyes canthus  or another references points
% dx = B(1) -  A(1);  differences of the landmarks in x 
% dy = B(2) - A(2);  differences of the landmarks in y

  
rotation = atan2d(dy,dx);

for i = 1 : size(rotation,1)
if rotation(i) < 0 
   rotation(i) = abs(rotation(i)) + 180; 
end

end
end

