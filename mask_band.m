function [mask] = mask_band(n,type, p)
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
                        mask(step*p + i, step*p +j)=1;
                    end
                end
            end
            
            %fix the rest positions
            mask(n-r+1:n,n-r+1:n) = 1;
        otherwise
            return
    end   
end
