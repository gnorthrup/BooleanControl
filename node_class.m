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
        function f = eval(self, v)
            if(self.gatetype == gatetype.AND)
                f = and(eval(self.child2,v), eval(self.child1,v));
            elseif(self.gatetype == gatetype.OR)
                f = or(eval(self.child2,v), eval(self.child1,v));
            elseif(self.gatetype == gatetype.NOT)
                f = not(eval(self.child1,v));
            else
                f = v(self.child1);
            end
        end
    end   
end

