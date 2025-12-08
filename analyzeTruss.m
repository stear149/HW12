%==========================================================================
% function [R,T] = analyzeTruss()
% 
% This function takes information provided by computeReactions and
% solveTruss and uses outputResults, drawExternalLoads, and drawTruss to
% provide the user with a table of internal forces and external reactions
% as well as figures that display the truss and information.
% 
% Input Arguments:
% None
% 
% Output Arguments:
% R is an N x 2 matrix, describes the computed reactions
% T is an M x 1 matrix, describes the forces acting on each member
% 
% Authors: Group I
%   Owen Haberstroh (haber297@umn.edu)
%   Lily Wilkerson (wilke541@umn.edu)
%   Evan Stearns (stear149@umn.edu)
%
% Version: Dec. 3, 2025
%==========================================================================
function [R,T] = analyzeTruss()
    % use input
    [filename, G, C, F, np, ns] = getValidUserInput();

    tic
    
    % comput reaction
    [R] = computeReactions(G,F,np,ns);
    % solve truss
    [T] = solveTruss(G,C,F,R);
    % output as table
    outputResults(filename,G,C,F,R,T)

    % Draw Const
    %set radius and font size
    radius = (mean(pdist(G)))/40;
    fontsize = min(radius^(1/4),.025);

    %set titles and draw the figures
    [~, baseName, ext] = fileparts(filename);
    loadTitle = [baseName, ext];
    trussTitle = baseName;

    % draw loads on nodes
    drawExternalLoads(G, F, R, loadTitle, radius, fontsize);


    % draw truss showing solved truss
    drawTruss(G, C, T, trussTitle, radius, fontsize);

    toc

end
