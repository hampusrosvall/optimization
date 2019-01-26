function [ output_args ] = gaussnewton(phi,t,y,start,tol,use_linesearch,printout,plotout)

nbr=0;  
h=1e-8; 

r=@(x) phi(x,t)-y; 
r2=@(x) sum((phi(x,t)-y).^2); 

J = [zeros(1,length(start))]'; 
for i=1:length(start) 
    J(i) = ( r2(start(i) + h) - r2(start(i) + h) ) / 2*h;
end

