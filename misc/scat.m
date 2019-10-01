function [ an ] = scat( face,face2 )
% Interface to plot two sets of facial landmarks in the same figure
if ~exist('face2','var')
  gscatter(face(:,1),face(:,2));
else
    an = 0;
    a(1:size(face,1)) = 1;
    a(size(face,1)+1:size(face,1)*2) = 2;
    gscatter([face(:,1) ;face2(:,1)],[face(:,2); face2(:,2)],a); 
    axis([-0 450 -450 250 ]);
legend('off')
end

end

