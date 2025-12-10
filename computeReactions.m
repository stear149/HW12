%==========================================================================
% function [R] = computeReactions(G,F,np,ns)
%
% This function takes the output arguments from getValidUserInput and uses
% them to calculate the reactions at the nodes specified by the user.
%
% Input Arguments:
%   G is an N x 2 matrix, describes the geometry of the truss
%   F is an N x 2 matrix, describes the external forces acting on the truss
%   np is the primary node, as specified by the user
%   ns is the secondary node, as specified by the user
%
% Output Argument:
%   R is an N x 2 matrix, describes the computed reactions
%
% Authors: Group I
%   Owen Haberstroh (haber297@umn.edu)
%   Lily Wilkerson (wilke541@umn.edu)
%   Evan Stearns (stear149@umn.edu)
%
% Version: Dec. 3, 2025
%==========================================================================
function [R] = computeReactions(G,F,np,ns)
    
    dx = G(:,1)-G(np,1);
    dy = G(:,2)-G(np,2);
    N = size(G,1);
    
    R = zeros(N,2); % Initialize the reaction matrix
    R(ns,2) = ( dot(F(:,1),dy) - dot(F(:,2),dx) )/dx(ns);
    R(np,:) = -sum(F + R);


end
