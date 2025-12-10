%==========================================================================
% function [T] = solveTruss(G,C,F,R)
%
% This function takes matrices output by getValidUserInput and
% computeReactions in order to calculate the internal forces of each member
%
% Input Arguments:
%   G is an N x 2 matrix, describes the geometry of the truss
%   C is an M x 2 matrix, describes the start and end nodes of the members
%   F is an N x 2 matrix, describes the external forces acting on the truss
%   R is an N x 2 matrix, describes the reactions computed by computeReactions
%
% Output Argument:
%   T is an M x 1 matrix, describes the forces acting on each member
%
% Authors: Group I
%   Owen Haberstroh (haber297@umn.edu)
%   Lily Wilkerson (wilke541@umn.edu)
%   Evan Stearns (stear149@umn.edu)
%
% Version: Dec. 3, 2025
%==========================================================================
function [T] = solveTruss(G,C,F,R)

    N = size(G,1);
    M = 2*N-3;

    D = G(C(:,2),:) - G(C(:,1),:);

    L = sqrt( diag(D * D') );

    Sx = zeros(N,M);
    Sy = zeros(N,M);

    for m = 1:M
        i = C(m,1);
        j = C(m,2);
        Sx(i,m) = D(m,1)/L(m);
        Sx(j,m) = -D(m,1)/L(m);
        Sy(i,m) = D(m,2)/L(m);
        Sy(j,m) = -D(m,2)/L(m);
    end

    A = [Sx;Sy];
    b = -[F(:,1)+R(:,1); F(:,2)+R(:,2)];
    T = A\b;
    T = round(T,5,"decimals");

end
