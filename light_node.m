classdef light_node
    %This is a light node
    %   it makes light
    
    properties
        dawn
        dusk
    end
    
    methods
        function light = light_node(t1, t2) %constructor
            light.dawn = t1;
            light.dusk = t2;
        end
        
        %eval function with same name so it can be called in same loop
        %block
        function f = eval(self, t)
            f = and(self.dawn < mod(t, 24), mod(t,24) < self.dusk);
        end
    
    end
    
end

