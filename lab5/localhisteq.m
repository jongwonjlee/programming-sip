
%Hint: One approach is to write a function that uses the results of projects 3.1 and 3.2.  This will result in a simpler solution.  However, the function will be on the order of five times slower than a function that computes the local histogram once and then updates it as the local window moves throughout the image, one pixel displacement at a time.  The idea is that the new histogram, h¬¬_new, is equal to the to the old histogram, h_old, plus the histogram of data added as the window is moved, h_datain, minus the histogram of the data that moved out of the window as a result of moving the window, h_dataout. That is: h_new = h_old + h_datain  h_dataout. In addition to being faster  important advantage of this implementation is that it is self-contained. Note that the histograms h_datain and h_dataout are normalized by the factor equal to the total number of pixels, mn, in order to be consistent with the fact that the area of histograms  h_new and h_old must be 1.0.  Your code will be simplified if you use functions cumsum and tofloat. Keep in mind that only the intensity level of the center of the neighborhood needs to be mapped at each location of the window. 
%SOLUTION 1. Using a simpler (but slower running) approach. 

function g = localhisteq(f, m, n)
%LOCALHISTEQ1 Local histogram equalization.
%   G = LOCALHISTEQ1(F, M, N) performs local histogram equalization
%   on input image F using a window of (odd) size M-by-N to produce
%   the processed image, G. To handle border effects, image F is 
%   extended by using the symmetric option in function padarray. 
%   The amount of extension is determined by the dimensions of the 
%   local window. If M and N are omitted, they default to
%   3. If N is omitted, it defaults to M. Both must be odd.
%
%   This function accepts input images of class uint8, uint16, or
%   double. However, all computations are done using 8-bit intensity
%   values to speed-up computations. If F is of class double its
%   values should be in the range [0 1]. The class of the output
%   image is the same as the class of the input.

%   Copyright 2009 R. C. Gonzalez, R. E. Woods, & S. L. Eddins
%   For use with Digital Image Processing Using MATLAB, 2nd ed.
%   Gatesmark Publishing, 2009.
%   $Revision: 1.1 $  $Date: 2009/03/15 00:17:24 $

% This implementation is the most straightforward of the solutions, 
% but it runs about 2 times slower than a similar implementation that
% maps only the center point of each neighborhood (localhisteq2), and
% about 6 times slower than the implementation in localhisteq3. An external, 
% external, general-purpose histogram equalization function and mapping 
% function are required.

% Preliminaries.
if nargin == 1
   m = 3; n = 3
elseif nargin == 2
   n = m;
end
if ~(round(m/2) ~= m/2) | ~(round(n/2) ~= n/2)
   error('The dimensions of the neighborhood must be odd')
end

%[f, revertclass] = im2uint8((f)); %Work with 8-bit accuracy.

% Extend the borders of the input image.
[R C] = size(f); % For use later.
f = padarray(f, [m n], 'symmetric', 'both');

% Move the window from pixel to pixel and histogram equalize at 
% each location.
xg = 0;
den = m*n;
for x = (m + 1)/2 + 1 : R + (m + 1)/2
   xg = xg + 1;
   yg = 0;
   for y = (n + 1)/2 + 1 : C + (n + 1)/2
      yg = yg + 1;
      subimage = f(x:x + m - 1, y:y + n - 1);
      h = histeq(subimage); % Can also use imhist, but watch the scaling.
      % Pick the value in the center of the equalized subimage. Function
      % histeq contains the necessary mapping function.
      g(xg, yg) = h((m + 1)/2, (n + 1)/2);
   end
end

% Convert back to the class of the input.
g = g;
