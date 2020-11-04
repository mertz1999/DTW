function [table_out,road_out] = go_table(road,table,orginal,norginal)
    % --- this function is used to calculate next road for comleting all road map
    % --- it change the road map for you 
    
    road_out = road;
    
    % --- get the last postion
    last  = road(end,1:end);
    table_out = table;
    i = last(1);
    j = last(2);
    
    % --- for make decision we need next Neighbors but if they are not
    % calculated before
    if (table_out(i+1,j) == -1)
        table_out = dist_table(i+1,j,table_out,orginal,norginal);
    end

    if (table_out(i+1,j+1) == -1)
        table_out = dist_table(i+1,j+1,table_out,orginal,norginal);
    end

    if (table_out(i,j+1) == -1)
        table_out = dist_table(i,j+1,table_out,orginal,norginal);
    end

    
    % --- find minimum distance and push it`s Coordinates to road map
    [~,min_index] = min([table_out(i+1,j) , table_out(i+1,j+1) , table_out(i,j+1)]);
    if(min_index == 1)
        road_out = [road;[i+1,j]];
    elseif(min_index == 2)
        road_out = [road;[i+1,j+1]];
    elseif(min_index == 3)
        road_out = [road;[i,j+1]];
    end
    
end
