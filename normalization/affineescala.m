function [ ls ] = affineescala( X,Y,reference )
% Affine transformations to perform the normalization of the landmarks
% maintaining the aspect ratio of the neutral state
%
% X = landmarks points of the neutral state
% Y = landmarks points of the facial expression
% reference = points of the eyes canthus used as reference to perform the
% normalizacion

mnx1 =min(X(:,1)) ;
mny1 = min(Y(:,1));
mnx2 = min(X(:,2)) ;
mny2 = min(Y(:,2));
 
X(:,1) =  X(:,1)- mnx1;
Y(:,1) =  Y(:,1)- mny1;
X(:,2) = X(:,2)- mnx2;
Y(:,2) = Y(:,2)- mny2;
%scat(X,Y);


mx1 = max( X(:,1));
mx2 =max(X(:,2));
my1 =max(Y(:,1));
my2=max(Y(:,2));

x1 = (X(:,1) -( X(:,1) / mx1)) ;
x2 =( X(:,2) - (X(:,2) / mx2)) ;
x3 =(Y(:,1)   - (Y(:,1) / my1)) ;
x4 = (Y(:,2)   -  (Y(:,2) / my2));


X(:,1) = X(:,1) - x1;
X(:,2) = X(:,2) - x2;
Y(:,1) = Y(:,1) - x3;
Y(:,2) = Y(:,2) - x4;
%scat(X,Y);




fac = mx2/ mx1;
X(:,2) = X(:,2) * fac;
fac = my2/ my1;
Y(:,2) = Y(:,2) * fac;

%scat(X,Y);

spn = mean( X(reference,:));
spe = mean(Y(reference,:));
dx = (spe(:,1) - spn(:,1));
dy = (spe(:,2) - spn(:,2));

    X =  traslatep(X,dx,dy);

 %  scat(X,Y);
% axis([-0.5	1.5	-0.5 1.5]);
 ls.n = X;
 ls.e =Y;
end

