classdef light
    %This is a light node
    %   it makes light
    
    properties
        dusk
        dawn
    end
    
    methods
        function f = eval(self, t)
            f = self.dawn < mod(t, 24) < self.dusk;
        end
    
    end
    
end

