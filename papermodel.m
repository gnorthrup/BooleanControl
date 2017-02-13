%this file implements the model from the fall quarter paper.

clear all
close all

NUMNODES = 7;
NUMSTEPS = 1000;
t_dawn = 6;
t_dusk = 18;

nodestates = zeros(NUMNODES, NUMSTEPS + 1);

IDlight1
