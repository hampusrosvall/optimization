function [ lambda, No_of_iter] = linesearch( func, x, d )
%LINESEARCHB Summary of this function goes here
%   Detailed explanation goes here

No_of_iter = 0; 
max_iter = 1000; 
F = @(lambda) func(x + lambda*d);
dF = @(h) ( F(h) - F(0) )/h; 
lambda = 1; 
alpha = 2; 
epsilon = 0.5; 
eps = max(abs(F(0))*10^-6, 10^-6); 
k = 1e-4; 
% Hitta my i rätt storleksordning (för att hitta en bra approximation av
% derivatan) 

while isnan(F(lambda)) || isinf(F(lambda)) || F(lambda) > F(0) && No_of_iter < max_iter
    lambda = lambda/alpha; 
    No_of_iter = No_of_iter + 1; 
end

while F(lambda) < ( F(0) + eps ) && No_of_iter < max_iter
    lambda = lambda * alpha; 
    No_of_iter = No_of_iter + 1; 
end

h = lambda * k; 

% Kontrollera F' 
if dF(h) > 0 
    T = @(lambda) F(0);
else 
    T = @(lambda) F(0) + epsilon * lambda * dF(h);
end

% case (10)
while ( F(lambda) > T(lambda) ) && No_of_iter < max_iter
    lambda = lambda/alpha; 
    No_of_iter = No_of_iter + 1; 
end

% case (11) 
while( (F(alpha * lambda) < T(alpha * lambda) ) && No_of_iter < max_iter )
    lambda = lambda * alpha; 
    No_of_iter = No_of_iter + 1;
end 

end 

