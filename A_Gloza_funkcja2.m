
function[Solution] = A_Gloza_funkcja2(Map,Start,Goal)
    [M, N] = size(Map);

    StartNode = sub2ind([M N], Start(2), Start(1));
    EndNode   = sub2ind([M N], Goal(2),   Goal(1));

    %koszt przebycia trajektorii
    koszt = double(Map)*M*N+1;

    %konwersja obrazu na graf w celu wyznaczenia trajektorii
    converted = A_Gloza_funkcja1(koszt);

    % Znalezienie najlepszej trajektorii
    %u¿yta funkcja domyœlnie u¿ywa algorytmu Dijkstra
    [dist, traj, pred] = graphshortestpath(converted, StartNode, EndNode);

    [y, x] = ind2sub([M N], traj);
    figure(1);
    imshow(Map)
    hold on
    plot(x, y, '-r', 'Linewidth', 1)

    Solution(:,1) = x;
    Solution(:,2) = y;
    
    index = length(Solution(:,1));
     if(Solution(index,1) == Goal(1) && Solution(index,2) == Goal(2))
              EndingCriterion = 1;
     end
end