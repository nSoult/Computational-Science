function [mask] = mask_band(n,type, p, q)
mask=ones(n,n);
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
            disp('3');
            error("We need 4 parameters for block triangular matrix.");
        case 4
%             mask = zeros(p,p);
            
            k = floor(p/q);
            r = mod(p,q);
            
            for step=0:k-1
                for i=1:q
                    for j=1:q
                        mask(step*q + i, step*q +j)=1;
                    end
                end
            end
            
            %fix the rest positions
            mask(p-r +1:p,p-r+1:p) = 1;
        otherwise
            return
    end

    
end
