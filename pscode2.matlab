# SAMPLE CODE (MATLAB)

function eraSieve(limit)
tic
sieve = [];
for n = 1:(limit)
    sieve(n) = 0;
end

p = 2;
for p = 4 : p : limit
    if sieve(p) == 0
        for i = p.*2:p:limit
            sieve(i) = 1;
        end
    end
end
    
    for p = 2 : p : limit
        if sieve(p) == 0
            display(p)
        end
    end
toc

function  atkinSieve(limit)
tic
    if limit > 2 
        a = 2;
        display(a);
    end
    
    if limit > 3 
        a = 3;
        display(a);
    end
        
    % initialize sieve with false
    sieve = [];
    for i = 1:(limit-1) 
        sieve(i) = 1;
    end
    
    % mark sieve(n) true if (4x^2 + y^2) has odd no. of sol
    % .... true if (3x^2 + y^2) has odd no. of sol 
    % .... true if (3x^2 - y^2) has odd no. of sol
    
    for x=1:(limit-1)
        y = 1;
        for y=y.*y:(limit-1)
            n = 4.*x.*x + y.*y;
            if n <= limit && (mod(n,12) == 1 || mod(n,12) == 5)
                sieve(n) = 0;
            end
            n = 3.*x.*x + y.*y;
            if n <= limit && mod(n,12) == 7
                sieve(n) = 0;
            end
            n = 3.*x.*x - y.*y;
            if  x > y &&n <= limit && mod(n, 12) == 11
                sieve(n) = 0;
            end
        end
    end
 
    %mark all multiples of squares as non-prime
    sieve(i) = 1;
    r = 5;
    for r = r.*r:(limit-1)
        if sieve(r) == 0
            for i = r.*r : r.*r : (limit - 1)
                sieve(i) = 1;
            end
        end
    end
  
  % print prime using sieve()
  for a=5:(limit-1)
      if sieve(a) == 0
          display(a)
      end
  end
  toc