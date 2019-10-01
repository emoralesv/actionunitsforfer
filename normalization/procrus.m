function [nl] = procrus( N,E )
nl.n = N;
[~, nl.e, ~] = procrustes(N,E);
end

