function [  ] = plot_bool( nodestates, start, stop, name, nodenames, lightnodes)
% produces a clean, readible, plot of a boolean model from start to end
    %apply an offset so that each node can be read individually
    offset = .025;
   % nodestates = nodestates(:,start:stop);
    lightstates = nodestates(lightnodes(1),:);
    lightstates2 = nodestates(lightnodes(2),:);
    nodestates(lightnodes,:) = [];
    for i = 1:size(nodestates, 1) / 2
        nodestates(2*i - 1,:) = nodestates(2*i - 1,:) + offset*i;
        nodestates(2*i,:) = nodestates(2*i,:) - offset*i;
    end
    
    lighton = ones(2,size(nodestates,2))* 0.5;
    lighton2 = ones(2,size(nodestates,2))*.45;
    lighton(1,:) = 1:size(nodestates,2);
    lighton2(1,:) = 1:size(nodestates,2);
    
    lightoff = lighton(:,lightstates == 0);
    lighton = lighton(:, lightstates == 1);
    lightoff2 = lighton2(:,lightstates2 == 0);
    lighton2 = lighton2(:,lightstates2 == 1);
        
    %plot nodes
    
    figure;
    hold all;
    for i = 1:size(nodestates,1)
        plot(nodestates(i,:));
    end
    scatter(lighton(1,:),lighton(2,:),[],'y','filled')
    scatter(lightoff(1,:),lightoff(2,:),[],'k','filled')
    scatter(lighton2(1,:),lighton2(2,:),[],'y','filled')
    scatter(lightoff2(1,:),lightoff2(2,:),[],'k','filled')
    title(name);
    legend(nodenames);
    yticks([0 1])
    xlim([start stop]);
    xlabel('timestep (half hour)');
    ylabel('off/on');
    hold off;
end

