function  s = tinhN(n,m)
    s = 0;
    x = nargin;
    if x == 1
        for i=1:n
        s = s + i; 
        end
    
    elseif x == 2 
        if mod(m,2) ~=0 
            for i =1:2:n
                s = s+i;
            end
        elseif mod(m,2) == 0
            for i=0:2:n
                s = s+i;
            end
            s = s+ 1;
        end
    end
end