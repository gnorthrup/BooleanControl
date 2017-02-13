classdef id_node < eval_tree
    %UNTITLED8 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        signal_delay
        node
    end
    
    methods
        function leaf = id_node(s,n)
            leaf.signal_delay = s;
            leaf.node = n;
%             leaf.gatetype = NaN;
%             leaf.child1 = NaN;
%             leaf.child2 = NaN;
        end
        function f = eval(self, t, m)
             f = m(self.node, t - self.signal_delay);
        end
    end
    
end

