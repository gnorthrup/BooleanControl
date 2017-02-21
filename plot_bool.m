function [  ] = plot_bool( nodestates, start, stop, name, nodenames, lightnodes)
% produces a clean, readible, plot of a boolean model from start to end
    %apply an offset so that each node can be read individually
    offset = .05;
    nodestates = nodestates(:,start:stop);
    nodestates(lightnodes,:) = [];
    for i = 1:size(nodestates, 1) / 2
        nodestates(2*i - 1,:) = nodestates(2*i - 1,:) + offset*i;
        nodestates(2*i,:) = nodestates(2*i,:) - offset*i;
    end
    %plot nodes
    figure;
    hold all;
    for i = 1:size(nodestates,1)
        plot(nodestates(i,:));
    end
    title(name);
    legend(nodenames);
    yticks([0 1])
    hold off;
end

