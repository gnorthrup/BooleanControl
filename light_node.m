classdef light_node
    %This is a light node
    %   it makes light
    
    properties
        time_on
        time_off
        day
    end
    
    methods
        function light = light_node(t1, t2) %constructor
            light.time_on = t1;
            light.time_off = t2;
            light.day = t1+t2;
        end
        
        %eval function with same name so it can be called in same loop
        %block
        function f = eval(self, t, nodestates)
            f = mod(t, self.day) < self.time_on;
        end
    
    end
    
end

