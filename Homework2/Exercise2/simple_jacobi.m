EPS = input('EPS = ');
n = input('n = ');
iter_max = input('iter_max = ');
test = 1;
a = zeros(n);

for i = 1:n
    for j = 1 : n
        
        fprintf('a(%g)(%g) = ',i,j );
        a(i,j) = input('');
    end;
end;

while (test == 1)
for i = 1 : n
    if (abs(a(i, i)) < EPS)
        fprintf('\nElement pe diagonala nul sau apropiat de zero');
        fprintf('\nRearanjeaza matricea');
        test = 1;
        break;
    else
        test = 0;
    end;
end;
end;

b = zeros(n , 1);

for i = 1:n
    fprintf('b(%g) = ');
    b(i) = input('');
end;

xn = zeros(n, 1);

for i = 1:n
    fprintf('xn(%g) = ');
    xn(i) = input(' ');
end;

nn =diag(diag(a));
p = nn - a;
g = inv(nn)*p;
valp = eig(g);
valp
rs = max(abs(valp));

fprintf('\nRaza spectrala matrice convergenta, rs = %g', rs);

if (rs < 1)
    fprintf('\nMatrice convergenta');
else
    fprintf('\nMatricea nu converge');
end;

vninf = 1;
nr_iter = 0;

while (vninf > EPS )
    nr_iter = nr_iter + 1;
    xv = zeros(n,1);
    xv = xn;
    
    for i = 1:n
        sum = 0;
        
        for j = 1:i-1
            sum = sum + a(i,j)* xv(j);
        end;
        
       
        for j = i+1:n
            sum = sum +a(i,j) * xv(j);
        end;
       
        xn(i) = (b(i) - sum )/ a(i,i);
        
    end;
    vninf = max(abs(xn - xv));
    nr_iter
    xn
end;

x = a\b
        

