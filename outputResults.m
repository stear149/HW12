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




