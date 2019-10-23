function w = GenerateLaplacian(num)
%   num should be an odd number!
w = ones(num, num);
w((num+1)/2,(num+1)/2) = -num^2 + 1;
end

