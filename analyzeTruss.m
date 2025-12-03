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