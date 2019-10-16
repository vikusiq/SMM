% plotting of surface of the function f(x1, x2) = (x1 - 1 )sq + (x2-1)sq 
x = linspace(-1, 2, 60);
y = x;


[X, Y] = meshgrid(x,y);
%Z = (X-1).^2 + (Y - 1).^2;
Z= 100*(Y - X.^2).^2 + (1 - X).^2;

surf(X, Y, Z)
colorbar

shading flat
shading interp
figure;
contour(X,Y,Z, 20); % or last argument can be an vector with desired values(in order to show values of the function in these points)
figure;
contourf(X,Y,Z, 20); % or last argument can be an vector with desired values(in order to show values of the function in these points)


[x,y] = meshgrid(-2:.2:2, -2:.2:2);
z = x .* exp(-x.^2 - y.^2);
[px,py] = gradient(z,.2,.2);
contour(z), hold on, quiver(px,py), hold off