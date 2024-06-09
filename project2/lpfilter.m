function [g,F] = lpfilter(f,type)
f = im2double(f);
PQ = 2*(size(f));
F = fft2(f,PQ(1),PQ(2));
[U,V] = dftuv(PQ(1),PQ(2));
D = sqrt(U.^2+V.^2);
D0 = 0.05*PQ(2);
H = 0;
switch (type)
    case 'ideal'
        H = double(D<=D0);
    case 'btw'
        H = 1./(1+(D./D0).^(2*5));
    case 'gaussian'
        H = exp(-(D.^2)./(2*(D0^2)));
    otherwise
        'unkown filte type.';
end


G = H.*F;
g = real(ifft2(G));
g = g(1:size(f,1),1:size(f,2));
end