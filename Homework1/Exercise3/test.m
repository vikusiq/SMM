clear
clc
p = 0; % Start at 0
i = 0;
while 1 == 1 % Infinite loop
   p = p + (4*((-1)^i))/(2*i + 1); % The Leibniz formula for pi: http://en.wikipedia.org/wiki/Leibniz_formula_for_pi
   fprintf('%7i Iterations: Pi is approximately equal to %1.16f...\n',i+1,p) % Display of the approximation after each iteration
   i = i + 1;
end