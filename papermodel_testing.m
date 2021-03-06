%this file implements the model from the fall quarter paper.

clear all
close all

NUMNODES = 7;
NUMSTEPS = 2000;
t_on = 24;
t_off = 24;
t2_on = 40;
t2_off = 40;
%t_stop = 1600;

nodestates = zeros(NUMNODES, NUMSTEPS + 1);

%Node Order
%LHY
%TOC1
%X
%Y
%L1
%L2
%L3

%t = [1.5, 5.5, 6.5, 0, 7.5, 4, 0, 2.5, 1]; synthetic delays
%t = [3,6,7.5,0.5,6,4,1,0.5,0]; %photoperiod exper. delays

t = [5,11,14,0,11,7,1,0,0]; %photoperiod exper. delays shifted
%t = t*2;

LHYeval = eval_tree(gatetype.AND, fetch_node(t(3),3), fetch_node(t(7),5));
TOC1eval = eval_tree(gatetype.AND, eval_tree(gatetype.NOT, fetch_node(t(1),1)), fetch_node(t(6),4));
Xeval = eval_tree(gatetype.ID, fetch_node(t(2),2));
Yeval = eval_tree(gatetype.AND, eval_tree(gatetype.AND, eval_tree(gatetype.NOT, fetch_node(t(4),1))...
    ,eval_tree(gatetype.NOT, fetch_node(t(5),2))), eval_tree(gatetype.OR, fetch_node(t(8),6), fetch_node(t(9),7)));
L1eval = eval_tree(gatetype.ID, light_node(t_on, t_off));
L2eval = eval_tree(gatetype.ID, light_node(t2_on, t2_off));
L3eval = eval_tree(gatetype.ID, light_node(t2_on, t2_off));


eval_array = [LHYeval, TOC1eval, Xeval, Yeval, L1eval, L2eval, L3eval];

for i=2:NUMSTEPS
    for j=1:NUMNODES
        nodestates(j,i) = eval_array(j).eval(i-1, nodestates);
    end
end

plot_bool(nodestates, 1400, 2000, 'L1 12-12, L2&L3 20-20', ...
    {'LHY', 'TOC1', 'X', 'Y', 'Day','Night'}, [5,6,7])

disp('done')

t1 = 0;
t2 = 0;
waszero = false;
for k=500:NUMSTEPS
    if nodestates(1,k) == 0
        waszero = true;
    elseif waszero
        if t1 == 0
            t1 = k;
            waszero = false;
        else
            t2 = k;
            break
        end
    end
end
disp(t2-t1)
        
        