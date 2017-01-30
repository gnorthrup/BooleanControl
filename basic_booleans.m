%This is supposed to be an implementation of a simple, 4 node, boolean
%network

clear all
close all

NUMNODES = 4;
NUMSTEPS = 10;

nodes = zeros(NUMNODES,NUMSTEPS); %initialize matrix to track node states

for i=1:NUMNODES
    randstate = round(rand);
    nodes(i,1) = [randstate]; %set random starting conditions 
end 


transM = zeros(4);

