tic
% --- getting Inpurs 
orginal = [0 1 1 2 3 4 3 2 1 1];
norginal = [1 2 3 4 3 2 1 1 1 2];

% --- define hole table
size_i = length(orginal);
size_j = length(norginal);

% --- road map
road = [[2 2]];

% --- insert 0 to each list
orginal = [0 orginal];
norginal = [0 norginal];

% --- make -1 table and make each first row and col to Inf
table = -1*ones(size_i+2,size_j+2);
table(1,1:size_j+2) = inf;
table(1:size_i+2,1) = inf;
table(1:size_i+2,1) = inf;
table(size_i+2,1:size_j+2) = inf;
table(1:size_i+2,size_j+2) = inf;
table(size_i+1,size_j+1) = 0;

% --- for first time make find (2,2) for table
table(2,2) = abs(orginal(2) - norginal(2));

% --- define a loop to find road map from start to end
while (1)
    [table,road] = go_table(road,table,orginal,norginal);
    if road(end,1:end) == [size_i+1,size_j+1]
        break
    end
end






