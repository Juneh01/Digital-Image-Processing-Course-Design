function [U,Y]=dftuv(X,N)
u = 0:(X - 1);
w = 0:(N - 1);
idx = find(u>X/2);
u(idx) = u(idx) - X;
idy = find(w>N/2);
w(idy) = w(idy) - N;
[Y,U] = meshgrid(w,u);
end