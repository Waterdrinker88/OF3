%Nicholas Archon, nga425
%COE 347 Introduction to Computational Fluid Dynamics
%OF3 Q4
clc;clear;close all;

p1 = 1; %atm
gamma = 1.4;
M1 = 3; 

term1 = (gamma-1)/2; 
term2 = gamma/(gamma-1);
p01 = p1*(1+term1*M1^2)^2

p02p01 = 0.32834388; 
p02 = p02p01*p01