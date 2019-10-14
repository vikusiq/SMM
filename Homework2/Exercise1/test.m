A = ones(5,5);
B = ones(5,5);
C = sum_matrix(A,B);


x = 0:0.1:2*pi;
y = sin(x);

plot(x,y, 'db')
hold on
plot(x, cos(x), 'dr')
title('Lab 2')

xlabel('x axys')

legend('sin', 'cos')


