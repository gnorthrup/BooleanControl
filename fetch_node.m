classdef fetch_node 
    %The recursion base for tree evaluation
    %   Ty Adam for figuring out this implementation
    
    properties
        signal_delay
        node
    end
    
    methods
        function leaf = fetch_node(s,n) %constructor
            leaf.signal_delay = s;
            leaf.node = n;
        end
        function f = eval(self, t, m) %evaluation
            if t - self.signal_delay >= 1
                f = m(self.node, t - self.signal_delay);
            else
                f = m(self.node, 1);
            end
        end
    end
    
end

