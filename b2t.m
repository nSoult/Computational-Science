function [T] = b2t (A,block_size)
% Author: N. SOULTANIS , AM: 1054319, Date: 18/1/2020
    if(nargin<2)
        error("I need to know the block size");
    end
    T = tensor();
    for i=1:length(A)/block_size
        for j=1:length(A)/block_size
            T(:,:,i, j) = A(i * block_size - block_size + 1 : i * block_size, j * block_size - block_size + 1 : j * block_size);
        end
    end
end