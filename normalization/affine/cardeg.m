function [ r ] = cardeg( A,B,C )

C = [A(1,1) B(1,2)];
a = pdist2(B,C);
b = pdist2(C,A);
c = pdist2(B,A);
r =acos((b^2+c^2-a^2 )/(2*b*c) );
r = rad2deg(r);
r = 90 - r;
[a b] =  max([A(1,2), B(1,2)]);
if b == 1
    r = -r;
end    
end

