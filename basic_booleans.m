%This is an implementation of a simple, 4 node, boolean
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

%initialize fetch nodes and eval trees
fetch1 = fetch_node(0, 1);
fetch2 = fetch_node(0, 2);
fetch3 = fetch_node(0, 3);
fetch4 = fetch_node(0, 4);

eval1 = eval_tree(gatetype.NOT, fetch4);
eval2 = eval_tree(gatetype.AND, fetch1, fetch4);
eval3 = eval_tree(gatetype.ID, fetch1);
eval4 = eval_tree(gatetype.OR, fetch3, eval_tree(gatetype.NOT, fetch2));

eval_array = [eval1,eval2,eval3,eval4];

%populate nodestates according to evaluation rules
for i=2:NUMSTEPS
    for j=1:NUMNODES
        nodestates(j,i) = eval_array(j).eval(i-1, nodestates);
    end
end

disp(nodestates)

%for i=1:NUMNODES
    