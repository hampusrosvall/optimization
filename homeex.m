%% Minimizing 1 - lambda exp(-lambda) using golden section ex 2.1 a)

% Initializing interval of uncertainty [0,1]

alpha = (sqrt(5) - 1)*0.5; 
a = 0; 
b = 2; 
n_iter = 4; 
lambda = a + (1-alpha) * (b - a);
my = a + alpha * (b - a);

figure(1)
x = linspace(0,5,500); 
y = 1 - x.*exp(-x); 
plot(x,y)

% Graph is decreasing for increasing values x

while n_iter > 0
    % Calculate function in lamba and my 
    % if F(lambda) < F(my) then the new interval is [a, my]
    % my_k+1 = lambda_k
    % if F(lambda) > F(my) then the newi nterval is [lambda, b]
    % lamba_k+1 = my_k
    
    F_lambda = 1 - lambda * exp(-lambda);
    F_my = 1 - my * exp(-my); 
    
    if F_lambda < F_my 
        b = my; 
        my = lambda; 
        lambda = a + (1-alpha) * (b - a);
    end
    if F_lambda > F_my
        a = lambda; 
        lambda = my; 
        my = a + alpha * (b - a);
    end
    fprintf('I = [%f, %f] \n lambda = %f, my = %f \n F_lambda = %f, F_my = %f\n', a, b, lambda, my, F_lambda, F_my);
    n_iter = n_iter - 1; 
end

%% Exercise 2.3 a) 



% Initializing

alpha = (sqrt(5) - 1)*0.5; 
a = -1; 
b = 1; 
n_iter = 5; 
lambda = a + (1-alpha) * (b - a);
my = a + alpha * (b - a);

% Plotting the function F(lambda) = exp(-lambda) + lambda^2

x = linspace(-5,5,500); 
y = exp(-x) + x.^2; 

figure(1)
plot(x,y)

% Seems to be minimum at zero

while n_iter > 0
    F_lambda = exp(-lambda) + lambda^2;
    F_my = exp(-my) + my^2; 
    
    if F_lambda < F_my 
        b = my; 
        my = lambda; 
        lambda = a + (1-alpha) * (b - a);
    end
    
    if F_lambda > F_my
        a = lambda; 
        lambda = my; 
        my = a + alpha * (b - a);
    end
    
    fprintf('I = [%f, %f] \n lambda = %f, my = %f \n F_lambda = %f, F_my = %f\n', a, b, lambda, my, F_lambda, F_my);
    n_iter = n_iter - 1;  
end

%% Exercise 2.3 b) 

clear all
clc

eps = 0.01;
n_iter = 5; 
a = -1; 
b = 1; 

while n_iter > 0
   lambda = (a + b)/2 - eps; 
   my = (a + b)/2 + eps; 
   F_lambda = exp(-lambda) + lambda^2;
   F_my = exp(-my) + my^2;  
   
   if F_lambda > F_my
       a = lambda; 
   else
       b = my;
   end
   n_iter = n_iter - 1; 
   fprintf(' I = [%f, %f] \n lambda = %f, my = %f \n F_lambda = %f, F_my = %f\n', a, b, lambda, my, F_lambda, F_my);
   disp('=========         =========       =========       =========       =========');
end

%% Excercise 2.4 c) 

% Plotting F(lambda)

x = linspace(-2.5,-1,500); 
y = ((4 + x).^3 + (5 - 2*x)).^2 + 2 * (-3*x - 4).^4; 
plot(x,y)

% Seems to be a minimum around -1.75. Carrying out five golden search iter

alpha = (sqrt(5) - 1)*0.5; 
a = -2; 
b = 2; 
n_iter = 5; 
lambda = a + (1-alpha) * (b - a);
my = a + alpha * (b - a);

while n_iter > 0
    F_lambda = ((4 + lambda).^3 + (5 - 2*lambda)).^2 + 2 * (-3*lambda - 4).^4;
    F_my = ((4 + my).^3 + (5 - 2*my)).^2 + 2 * (-3*my - 4).^4;
    
    if F_lambda > F_my
        a = lambda; 
        lambda = my; 
        my = a + alpha * (b - a);
    else
        b = my; 
        my = lambda; 
        lambda = a + (1-alpha) * (b - a);
    end
    n_iter = n_iter - 1; 
    fprintf(' I = [%f, %f] \n lambda = %f, my = %f \n F_lambda = %f, F_my = %f\n', a, b, lambda, my, F_lambda, F_my);
end

%% Excercise 2.6 a)

% Plotting the function
x = linspace(-1,1,500); 
y = exp(-x) + x.^2; 
plot(x,y)

n_iter = 0; 

% Initialize variables
lambda_prev = intmin; 
lambda = 1; 

while (abs(lambda - lambda_prev) > 10e-3 || n_iter > 10)
    lambda_prev = lambda; 
    lambda = lambda - (2 * lambda - exp(-lambda))/(2 + exp(-lambda));
    n_iter = n_iter + 1; 
    fprintf(' Number of iterations: %f \n lambda_k+1 = %f \n lambda_k = %f \n', n_iter, lambda, lambda_prev);
end

%% Excercise 2.6 b) Bisection method 

% F'(lambda) = 2lambda - exp(-lambda) 

x = linspace(-10,10,500);
y = 2*x - exp(-x); 
plot(x,y) 

n_iter = 5; 
a = -1; 
b = 1; 

while n_iter > 0
   midPoint = (a + b)/2; 
   
   if (2*midPoint - exp(-midPoint) > 0)
       b = midPoint; 
   else
       a = midPoint; 
   end 
   n_iter = n_iter - 1; 
end

