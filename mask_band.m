function [mask] = mask_band(n,type, p)
% Author: N. SOULTANIS , AM: 1054319, Date: 10/1/2020
mask=ones(n);
if type=='band'
    disp('Type is band')
    switch nargin
        case 3
            disp('Only 3 arguments')
            for i=1:n
                for j=1:n
                    if (j<i-p)
                        mask(i,j)=0;
                    end
                    if(j>i+p)
                        mask(i,j)=0;
                    end
                end
                
            end
            
        case 4
            disp('Only 4 arguments')
            for i=1:n
                for j=1:n
                    if (j<i-p)
                        mask(i,j)=0;
                    end
                    if(j>i+q)
                        mask(i,j)=0;
                    end
                end
                
            end
        otherwise
            return
    end
    
end
if type == 'btdr'
    mask = zeros(n,n);
    disp('btdr matrix generated');
    switch nargin
        case 3
            k = floor(n/p);
            r = mod(n,p);
            
            for step=0:k-1
                for i=1:p
                    for j=1:p
                        mem(step*p + i, step*p +j) = 1;
                        mask(step*p + i+p, step*p +j)=1;
                    end
                end
            end
            temp = mask(1:end-p,1:end);
            mask = temp + mem + temp';
            
            otherwise
            return
    end
    
    
end
