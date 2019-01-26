% Test 1: use x=[0;0], d=[1;0] 
% Test 2: use x=[0;0], d=[0;1]

x = [0;0]; d = [1;0]; 
[lambda, itr] = linesearch(@test_func, x, d);
F = test_func(x +lambda *d)

%% 

[t, y] = data1; 
gaussnewton(@phi1,t,y,[0;0],0.1,1,1,1);