function A = lloyds_adjacency_matrix(xy, rc)
%{
Let "n" be the number of agents.

--- Inputs ---
xy: n by 2 array holding position data for agents
    e.g., xy(j,2) is the y coordinate for agent-j

rc: radius of communication (scalar) used by all agents

--- Outputs ---
A:  n by n adjacency matrix
    e.g., if A(i,j) = 1, then agent-i receives a signal from agent-j
          if A(i,j) = 0, then agent-i receives NO signal from agent-j
%}

% Initialize the all-zero matrix and number of agents
    n = size(xy, 1);
    A = zeros(n,n);

    for i = 1:n
        for j = 1:n
            % Euclidain Distance 
            distance = sqrt((xy(i,1) - xy(j,1))^2 + (xy(i,2) - xy(j,2))^2);
            if distance < rc
                A(i, j) = 1; 
            end
        end
    end
end