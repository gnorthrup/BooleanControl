classdef light_node
    %This is a light node
    %   it makes light
    
    properties
        time_on
        time_off
        day
        stop
    end
    
    methods
        function light = light_node(t1, t2, stop) %constructor
            light.time_on = t1;
            light.time_off = t2;
            light.day = t1+t2;
            light.stop = Inf;
            if nargin > 2
                light.stop = stop;
            end
        end
        
        %eval function with same name so it can be called in same loop
        %block
        function f = eval(self, t, nodestates)
            if t < self.stop
                f = mod(t, self.day) < self.time_on;
            else
                f = 0;
            end
        end
    
    end
    
end

