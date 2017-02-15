classdef fetch_node 
    %UNTITLED8 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        signal_delay
        node
    end
    
    methods
        function leaf = fetch_node(s,n)
            leaf.signal_delay = s;
            leaf.node = n;
        end
        function f = eval(self, t, m)
             f = m(self.node, t - self.signal_delay);
        end
    end
    
end

