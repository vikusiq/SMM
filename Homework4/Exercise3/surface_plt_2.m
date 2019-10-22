% plotting of surface of the function f(x1, x2) = (x1 - 1 )sq + (x2-1)sq 
clear; clc;
x1 = linspace(-1, 2, 200);
x2 = x1;
x3 = x1;
gamma = 10;

[X1, X2, X3] = meshgrid(x1, x2, x3);
Y = (1/2.*X1.^2 + gamma/2 .* X2.^2 + gamma.^2/2 * X3.^2) - (X1 + X2 + X3);

surf(X1, X2, X3, Y);
colorbar

shading flat
shading interp
figure;
contour(X1,X2, X3,Y,20); % or last argument can be an vector with desired values(in order to show values of the function in these points)
figure;
contourf(X1,X2,X3,Y,20); % or last argument can be an vector with desired values(in order to show values of the function in these points)

%[x,y] = meshgrid(-2:.2:2, -2:.2:2);
%z = x .* exp(-x.^2 - y.^2);
%[px,py] = gradient(z,.2,.2);
%contour(z), hold on, quiver(px,py), hold off