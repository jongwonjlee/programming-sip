function I = iseven2(A)
%UNTITLED2 �� �Լ��� ��� ���� ��ġ
%   �ڼ��� ���� ��ġ]

if ~isnumeric(A)
    error('input value A must be a numeric array');
end

A(A/2 == floor(A/2)) = 1;
%A(A/2 ~= floor(A/2)) = 0;

I = logical(A);

end

