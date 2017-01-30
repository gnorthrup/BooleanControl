classdef node
    properties
        gatetype
        child1
        child2
    end
    methods
        function f = eval(v)
            if(gatetype == AND)
                f = and(eval(child2), eval(child1))
            else(gatetype == OR)
                f = or(eval(child2), eval(child1))
            else(gatetype == NOT)
                f = not(eval(child1))
            else
                f = v(child1)
            end
        end
    end
end

classdef gatetype
    enumeration
        AND, OR, NOT, IDENTITY
    end
end
