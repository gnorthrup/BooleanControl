classdef node_class
    properties
        gatetype
        child1
        child2
        %signal_delay
    end
    methods
        function f = eval(self, v)
            if(self.gatetype == AND)
                f = and(eval(self.child2), eval(self.child1));
            else if(self.gatetype == OR)
                f = or(eval(self.child2), eval(self.child1));
            else if(self.gatetype == NOT)
                f = not(eval(self.child1));
            else
                f = v(self.child1);
            end
        end
    end
        end
    end
end

