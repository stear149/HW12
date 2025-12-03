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