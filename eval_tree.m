classdef eval_tree
    properties
        gatetype
        child1
        child2
        signal_delay
    end
    methods
        function tree = eval_tree(gt, sd, c1, c2)
            if nargin > 0
                tree.gatetype = gt;
                tree.signal_delay = sd;
                tree.child1 = c1;
            end
            if nargin > 3
                tree.child2 = c2;
            end
        end
        function f = eval(self, t, m)
            if(self.gatetype == gatetype.AND)
                f = and(eval(self.child2,t,m), eval(self.child1,t,m));
            elseif(self.gatetype == gatetype.OR)
                f = or(eval(self.child2,t,m), eval(self.child1,t,m));
            elseif(self.gatetype == gatetype.NOT)
                f = not(eval(self.child1,t,m));
            else
                f = m(self.child1, t - self.signal_delay);
            end
        end
    end   
end

