function [lower, upper] = chol_btr(in, block_size)
% Author: N. SOULTANIS , AM: 1054319, Date: 16/1/2020
input_size = size(in);
if input_size(1) ~= input_size(2)
    error('Matrix is not square');
end
in_len = input_size(1);
upper = zeros(in_len);
rest = mod(in_len,block_size); % upoloipo, ean den einai akribws ta block
i=1;
while(i <= in_len/block_size)
    block = find_block(i);
    upper(block, block) = chol(in(block, block),'upper'); % d
    upper(block, i*block_size+1:end) = upper(block, block)\in(block, i*block_size+1:end); %solution = U\d
    i=i+1;
end

if(rest > 0)
        upper(i+rest,i+rest) = chol(in(i+rest,i+rest));
        upper(rest, i*rest+1:end) = upper(rest, rest)\in(rest, i*rest+1:end); %solution = U\d
end
    function [block] = find_block(index)
        block = (index-1)*block_size+1 : index*block_size;
    end
lower = upper';
end