function I = isinteger2(A)

if ~isnumeric(A)
    error('input value A must be a numeric array');
end

A(A == floor(A)) = 1;
%A(A ~= floor(A)) = 0;

I = logical(A);

end

