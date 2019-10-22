clear;
clc;

x1 = linspace(-2, 2, 100);
x2 = x1;

[X1, X2] = meshgrid(x1, x2);
Y = 100.*((X2 - X1.^2).^2) + (1 - X1).^2;

figure(1);
surf(X1, X2, Y)
colorbar
title('Rosenbrock surface')
hold on
plot3(1,1,5,'m.','markersize',30)
hold off

shading flat
shading interp
figure(2);
contour(x1,x2,Y); % or last argument can be an vector with desired values(in order to show values of the function in these points)
title('Rosenbrock level courves')

figure(3);
contourf(x1,x2,Y,20); % or last argument can be an vector with desired values(in order to show values of the function in these points)
title('Rosenbrock surface')


figure(4)
plot3(X1, X2, Y)



