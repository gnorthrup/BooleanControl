clear all
close all

NUMNODES = 9;
NUMSTEPS = 2000;
t_on = 24;
t_off = 24;

nodestates = zeros(NUMNODES, NUMSTEPS + 1);

%Node Order
%LHY
%TOC1
%X
%Y
%L1
%L2
%L3
%L4
%PRR

%t=[0,11,14,0,16,10,9,12,2,2,1,6];


t = [6,13,16,2,10,7,12,10,0,6,0,8]; %photoperiod exper. delays shifted
%t = [5,12,15,1,9,6,11,9,0,5,0,7];
%t = t*2;

LHYeval = eval_tree(gatetype.AND, eval_tree(gatetype.AND, ...
    eval_tree(gatetype.NOT, fetch_node(t(8),9)), fetch_node(t(3),3)), fetch_node(t(9),5));
TOC1eval = eval_tree(gatetype.AND, eval_tree(gatetype.NOT, fetch_node(t(1),1)), fetch_node(t(6),4));
Xeval = eval_tree(gatetype.ID, fetch_node(t(2),2));
Yeval = eval_tree(gatetype.AND, eval_tree(gatetype.AND, eval_tree(gatetype.NOT, fetch_node(t(4),1))...
    ,eval_tree(gatetype.NOT, fetch_node(t(5),2))), eval_tree(gatetype.OR, fetch_node(t(10),6), fetch_node(t(11),7)));
L1eval = eval_tree(gatetype.ID, light_node(t_on, t_off));
L2eval = eval_tree(gatetype.ID, light_node(t_on, t_off));
L3eval = eval_tree(gatetype.ID, light_node(t_on, t_off));
L4eval = eval_tree(gatetype.ID, light_node(t_on, t_off));
PRReval = eval_tree(gatetype.AND, fetch_node(t(7),1), fetch_node(t(12),8));


eval_array = [LHYeval, TOC1eval, Xeval, Yeval, L1eval, L2eval, L3eval, L4eval, PRReval];

for i=2:NUMSTEPS
    for j=1:NUMNODES
        nodestates(j,i) = eval_array(j).eval(i-1, nodestates);
    end
end

plot_bool(nodestates, 1500, 2000, 'trying to do a thing', ...
    {'LHY', 'TOC1', 'X', 'Y', 'PRR', 'Day','Night'}, [5,6,7,8])

disp('done')