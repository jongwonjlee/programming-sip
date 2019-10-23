function H = imcircle2(R,M,N)

yc = floor(M/2);
xc = floor(N/2);

if R < 1
    error('Parameter R should be an integer larger than 1');
elseif R > min(xc,yc)
    error('Circle should be smaller than the array size');
end

% xvec = [1:M]-xc;
% yvec = [1:N]-yc;
% 
% [X,Y] = meshgrid(yvec, xvec);
% H = floor(((X.^2 + Y.^2 - R^2) +R)/(2*R));
% 
% H = H+1;
% H(H~=1) = 0;
% 
% H = logical(H);

y = [1:M];
x = [1:N];

[X, Y] = meshgrid(x,y);

Result = (X-xc).^2 + (Y-yc).^2 - R^2;
%H1 = Result < R;
%H2 = -R < Result;
%H = H1 & H2;
H = (Result < R) & (-R < Result);

end

