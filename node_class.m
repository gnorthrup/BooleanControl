classdef node_class
    properties
        gatetype
        child1
        child2
        %signal_delay
    end
    methods
        function node = node_class(gt, c1, c2)
            node.gatetype = gt;
            node.child1 = c1;
            node.child2 = c2;
        end
        function f = eval(self, t, m)
            if(self.gatetype == gatetype.AND)
                f = and(eval(self.child2,t,m), eval(self.child1,t,m));
            elseif(self.gatetype == gatetype.OR)
                f = or(eval(self.child2,t,m), eval(self.child1,t,m));
            elseif(self.gatetype == gatetype.NOT)
                f = not(eval(self.child1,t,m));
            else
                f = m(self.child1, t);
            end
        end
    end   
end

