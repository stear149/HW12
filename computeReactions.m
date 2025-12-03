function [R] = computeReactions(G,F,np,ns)
    
    dx = G(:,1)-G(np,1);
    dy = G(:,2)-G(np,2);
    N = size(G,1);
    
    R = zeros(N,2); % Initialize the reaction matrix
    R(ns,2) = ( dot(F(:,1),dy) - dot(F(:,2),dx) )/dx(ns);
    R(np,:) = -sum(F + R);


end