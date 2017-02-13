%This is supposed to be an implementation of a simple, 4 node, boolean
%network

clear all
close all

NUMNODES = 4;
NUMSTEPS = 10;

nodestates = zeros(NUMNODES,NUMSTEPS); %initialize matrix to track node states

for i=1:NUMNODES
    randstate = round(rand);
    nodestates(i,1) = [randstate]; %set random starting conditions 
end 

IDtree1 = eval_tree(gatetype.ID, 1);
IDtree2 = eval_tree(gatetype.ID, 2);
IDtree3 = eval_tree(gatetype.ID, 3);
IDtree4 = eval_tree(gatetype.ID, 4);

eval1 = eval_tree(gatetype.NOT, IDtree4);
eval2 = eval_tree(gatetype.AND, IDtree1, IDtree4);
eval3 = eval_tree(gatetype.ID, 1);
eval4 = eval_tree(gatetype.OR, IDtree3, eval_tree(gatetype.NOT, IDtree2));

eval_array = [eval1,eval2,eval3,eval4];

for i=2:NUMSTEPS
    for j=1:NUMNODES
        nodestates(j,i) = eval_array(j).eval(i-1, nodestates);
    end
end

