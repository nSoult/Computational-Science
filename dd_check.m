function [dflag, discrC, discrR] = dd_check(A)
% Author: N. SOULTANIS , AM: 1054319, Date: 8/1/2020

[rows, cols] = size(A);
dflag = 1;
discrR = Inf;
discrC = Inf;

for i = 1:rows
    sum = 0;
    for j = 1:cols
        if j == i % skip diag
            continue;
        else
            sum = sum + abs(A(i, j));
        end
    end
    temp = abs(A(i, i)) - sum;
    
    if temp < discrR
        discrR = temp;
    end
end


for i = 1:cols
    sum = 0;
    for j = 1:rows
        if j == i % skip diag
            continue;
        else
            sum = sum + abs(A(j, i));
        end
    end
    temp = abs(A(i, i)) - sum;
    if temp < discrC
        discrC = temp;
    end
end
% returning correct values
if discrR < 0
    dflag = 0;
    discrR = 0;
end
if discrC < 0
    dflag = 0;
    discrC = 0;
end
