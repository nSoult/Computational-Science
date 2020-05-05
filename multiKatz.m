function [flag,X] = multiKatz(A, alpha,mth, pcg_parameters)
% Author: N. SOULTANIS , AM: 1054319, Date: 17/1/2020
alpha_len = length(alpha); % megethos mhtrwou geitniasis
e = ones(length(A),1); % dianusma monadwn

if isequal(mth, 'pcg')
    error = pcg_parameters{1};% error
    max_iterations = pcg_parameters{2};% max iterations
    for i=1:alpha_len
        [X(:,i),flag(i)] = pcg(eye(length(A)) - alpha(i)*A', e, error, max_iterations);% pcg
    end
    
elseif isequal(mth, 'direct')
    for i = 1:alpha_len
        X(:,i) = (eye(length(A)) - alpha(i)*A')*e;% solution
    end
else
    error("Invalid Input");
end
end