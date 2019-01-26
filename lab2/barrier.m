function [ beta ] = barrier( X )
% Problem 1
%gk = [-1 -1; 1 -1; -1 0; 1 2] * X + [2; 0; 0; -6]; 
%beta = -sum(1./gk); 

% % Problem 2 
% gk = [-1 3; 1 -3; -1 -2; 3 5; -eye(2)] * X + [-12; -2; 2; -34; 0; 0]; 
% beta = -sum(1./gk);
% 
% % Problem 3
% gk = [1 3 2; 1 1 1; 3 5 3; -eye(3)] * X + [-30; -24; -60; zeros(3,1)];
% beta = -sum(1./gk); 
% 
% % Problem 3 (dual case) 
gk = [1 4 3; 3 4 5; 2 4 3; eye(3)] * X + [2; 4; 3; zeros(3,1)]; 
% beta = -sum(1./gk); 

if any(gk > 0) 
    beta = 10e50; 
else
    beta = -sum(1./gk);
end


end

