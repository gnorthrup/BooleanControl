%This file define the evaluation tree class used to evaluate the state of a
%node at a time step, given an array of node states

classdef eval_tree
    properties
        gatetype
        child1
        child2
    end
    methods
        function tree = eval_tree(gt, c1, c2) %constructor
            if nargin > 0
                tree.gatetype = gt;
                tree.child1 = c1;
            end
            if nargin > 2
                tree.child2 = c2;
            end
        end
        function f = eval(self, t, m) %recursive function to resolve logic gates
            if(self.gatetype == gatetype.AND)
                f = and(eval(self.child2,t,m), eval(self.child1,t,m));
            elseif(self.gatetype == gatetype.OR)
                f = or(eval(self.child2,t,m), eval(self.child1,t,m));
            elseif(self.gatetype == gatetype.NOT)
                f = not(eval(self.child1,t,m));
            else
                f = eval(self.child1,t,m);
            end
        end
    end   
end

