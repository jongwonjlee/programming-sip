function I = iseven(num)
%UNTITLED2 이 함수의 요약 설명 위치
%   자세한 설명 위치]

if ~isnumeric(num)
    error('input value A must be a numeric array');
end



I = (num/2 == floor(num/2));

end

