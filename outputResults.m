%==========================================================================
% function outputResults(filename,G,C,F,R,T)
% 
% Takes output arguments from getValidUserInput, computeReactions, and
% solveTruss in order to output a table of the calculated reactions and
% internal forces at each node and of each member
%
% Input Arguments:
% filename is the name of the file you're working with, to be used for
% titling
% G is an N x 2 matrix, describes the geometry of the truss
% C is an M x 2 matrix, describes the start and end nodes of the members
% F is an N x 2 matrix, describes the external forces acting on the truss
% R is an N x 2 matrix, describes the reactions computed by computeReactions
% T is an M x 1 matrix, describes the forces acting on each member
%
% Output Arguments:
% None
%
% Authors: Group I
%   Owen Haberstroh (haber297@umn.edu)
%   Lily Wilkerson (wilke541@umn.edu)
%   Evan Stearns (stear149@umn.edu)
%
% Version: Dec. 3, 2025
%==========================================================================
function outputResults(filename,G,C,F,R,T)
fprintf('\n')
fprintf('------------------------------------------------------------------------------------\n')
fprintf('  Node     X-Coord      Y-Coord      X-Force      Y-Force       X-Reac       Y-Reac\n');
fprintf('------------------------------------------------------------------------------------\n')

N = size(G,1);

for n = 1:N
    fprintf( '%4d %12.2f %12.2f %12.2f %12.2f %12.2f %12.2f\n', n, G(n,1), G(n,2), F(n,1), F(n,2), R(n,1), R(n,2) );
end

fprintf('\n')
fprintf('------------------------------------------\n')
fprintf(' Member   Start     End       Force \n');
fprintf('------------------------------------------\n')

M = 2*N-3;

for m = 1:M
    fprintf( '%4d %8d %8d %12.2f \n', m, C(m,1), C(m,2), T(m,1));
end
end




