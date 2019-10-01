function [ ls ] = affine( X,Y,reference)
% Affine transformations to perform the normalization of the landmarks
%
% X = landmarks points of the neutral state
% Y = landmarks points of the facial expression
% reference = points of the eyes canthus used as reference to perform the
% normalizacion
%
mn = min(X(:,2));
X(:,2) = X(:,2)- mn;
 mn = min(Y(:,2));
Y(:,2) = Y(:,2)-mn;
mx = min( max(X(:,2)), max(Y(:,2)));
X(:,2) = X(:,2) / mx;
Y(:,2) = Y(:,2) / mx;

%scat(X,Y);

mn =min(X(:,1));
X(:,1) =  X(:,1)- mn;
mn = min(Y(:,1));
Y(:,1) =  Y(:,1)- mn;
mx = max( X(:,1));
X(:,1) = X(:,1) / mx;
Y(:,1) = Y(:,1) / mx;
%scat(X,Y);
spn = mean( X(reference,:));
spe = mean(Y(reference,:));
dx = spn(:,1) - spe(:,1);
dy = spn(:,2) - spe(:,2);
Y = traslatep(Y,dx,dy);
 if Y(9,2) < 0 
    X = traslatep(X,0, Y(9,2) * -1);
    Y = traslatep(Y,0, Y(9,2) * -1);
 end
%scat(X,Y);
 ls.n = X;
 ls.e = Y;
end

