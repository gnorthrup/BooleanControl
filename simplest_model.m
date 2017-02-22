clear all
close all

NUMNODES = 3;
NUMSTEPS = 200;
t_dawn = 12;
t_dusk = 36;

nodestates = zeros(NUMNODES, NUMSTEPS + 1);

t = [5, 6.5, 7.5];
t = t*2;

italics = eval_tree(gatetype.OR, eval_tree(gatetype.NOT, fetch_node(t(2),2)), fetch_node(t(3),3))
bold = eval_tree(gatetype.ID,fetch_node(t(1),1));
L1 = eval_tree(gatetype.ID, light_node(t_dawn, t_dusk));

eval_array = [italics, bold, L1];

for i=2:NUMSTEPS
    for j=1:NUMNODES
        nodestates(j,i) = eval_array(j).eval(i-1, nodestates);
    end
end

plot_bool(nodestates, 1, 200, 'the simplest model', ...
    {'italics', 'bold', 'L1'}, [3])
