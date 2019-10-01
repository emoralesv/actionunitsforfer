function [ car ] = caracterizaravg( X,Y )
% Feature extraction method using average pooling.
%
% X = set of coordinates of the neutral state
% Y = set of coordinates of the facial expression representation.

[a,b] = params();
load shape.mat
hip = zeros(68,1);
ang = zeros(68,1);
cari = zeros(size(a,2),1);
ar = zeros(size(shape,1),1);
car2=zeros(size(b,2),1);
dx = Y(:,1) - X(:,1);
dy = Y(:,2) - X(:,2);
for ii = 1 : 68
    hip(ii) = sqrt((dx(ii)^2 + dy(ii)^2));
    an = puntos(dx(ii),dy(ii));
 
    ang(ii) =  an;
end
for ii = 1 : size(a,2)
    cari((ii*2) -1) = mean(hip(a{ii}));
    cari((ii*2)) = mean(ang(a{ii}));
end

  for ii = 1 : size(shape,1)
     ar(ii) = polyarea(Y(shape(ii,:),1),Y(shape(ii,:),2)) - polyarea(X(shape(ii,:),1),X(shape(ii,:),2));
 end
 for ii = 1 : size(b,2)
     car2(ii) = sum(ar(b{ii}));
 end
car(1,:) = [cari',car2'];

end

