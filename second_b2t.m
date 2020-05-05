function [X] = second_b2t (mask,b)
% Author: N. SOULTANIS , AM: 1054319, Date: 18/1/2020
X = tensor();
for i=1:size(mask,1)/b
    if i == 1
        temp(1:b,1:b) = mask(1:b,1:b);
        X(:,:,i,i) = temp(1:b,1:b);
    else
        temp(i*b-(b-1):i*b,i*b-(b-1):i*b) = mask(i*b-(b-1):i*b,i*b-(b-1):i*b);
        X(:,:,i,i) = temp(i*b-(b-1):i*b,i*b-(b-1):i*b);
    end
end