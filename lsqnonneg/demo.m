%% This file was only created so I could view lsqnonneg function in the debug environment

clear all

C = rand(5,5);
d = rand(5,1);

x = lsqnonneg(C, d)
