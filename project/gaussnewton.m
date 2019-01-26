function [ output_args ] = gaussnewton(phi,t,y,start,tol,use_linesearch, printout, plotout)

%Initialization of usefull values
max_iterations = 100; 
x_prev = 0;
x=start;
r=@(x) phi(x,t)-y; 
r2=@(x) sum((phi(x,t)-y).^2);
J=zeros(length(t),length(start));
h=1e-8; 
No_of_iter = 0; 

f = realmax; 
f_prev = 0;

fprintf('%12s %12s %12s %12s %12s %12s %12s %12s\n','iterations','x','step size','f(x)','max(abs(r))',' norm(grad)', 'ls iters','lambda');
while( abs(f-f_prev) > tol) && ( No_of_iter < max_iterations ) 
    % Creating Jacobian
    for j = 1:length(x)
        temp = zeros(length(x),1); 
        temp(j) = 1; 
        x_ph = x + h*temp;
        x_mh = x - h*temp;
        J(:, j) = ( r(x_ph) - r(x_mh) ) / 2*h;
    end
    
    %Solving the equality, accessing the descent direction
    d=J.'*J\(-J.')*r(x);
    
    % Checking for linesearch (maybe include No_of_iter here aswell) 
    if use_linesearch==1
        [lambda,itr]=linesearch(r2,x,d);
    else
         lambda=1;
    end 
    
    % Update values 
    x_prev = x; 
    f_prev = f; 
    x = x + lambda * d;
    f = r2(x); 
    No_of_iter = No_of_iter + 1; 
    
    if printout==1
        gradient = 2*J'*r(x);
        norm_grad = norm(gradient);
        gradient_d = gradient'*d/norm(d);
        max_abs_r = max(r(x));
        stepsize = norm(x-x_prev);
        fprintf('%12.0f %12.6f %12.6f %12.6f %12.6f %12.6f %12.0f %12.4f %12.6f\n',No_of_iter,x(1),stepsize,f,max_abs_r,norm_grad, itr,lambda);
        for k=2:length(start)
        fprintf('%25.6f\n',x(k)); 
        end
    end
    
end

if printout==1
    plot(t,y,'rx')
    hold on
    plot(t,phi(x,t),'LineWidth',1.2)
    title('Plot')
    xlabel('t')
    ylabel('y/phi(x,t)')
    legend({'given data', 'function with the least square error'},'Location','northeast')
end

end

