% --- distanse function
function [table_out] = dist_table(i,j,table,orginal,norginal)
    table_out = table;
    d = abs(orginal(i)-norginal(j));
    if (table_out(i,j-1)) == -1
        table_out = dist_table(i,j-1,table_out,orginal,norginal);
    end

    if (table_out(i-1,j-1)) == -1
        table_out = dist_table(i-1,j-1,table_out,orginal,norginal);
    end

    if (table_out(i-1,j)) == -1
        table_out = dist_table(i-1,j,table_out,orginal,norginal);
    end
    
    table_out(i,j) = d + min([table_out(i-1,j) , table_out(i-1,j-1) , table_out(i,j-1)]);
end
