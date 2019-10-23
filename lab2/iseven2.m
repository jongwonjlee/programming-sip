function I = iseven2(A)
%UNTITLED2 이 함수의 요약 설명 위치
%   자세한 설명 위치]

if ~isnumeric(A)
    error('input value A must be a numeric array');
end

A(A/2 == floor(A/2)) = 1;
%A(A/2 ~= floor(A/2)) = 0;

I = logical(A);

end

