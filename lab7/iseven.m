function I = iseven(num)
%UNTITLED2 �� �Լ��� ��� ���� ��ġ
%   �ڼ��� ���� ��ġ]

if ~isnumeric(num)
    error('input value A must be a numeric array');
end



I = (num/2 == floor(num/2));

end

