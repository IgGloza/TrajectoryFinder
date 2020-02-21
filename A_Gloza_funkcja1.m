function graph = A_Gloza_funkcja1(Map)

%Traktujemy obraz jako graf. Ka¿dy piksel jest wêz³em s¹siaduj¹cym z 4
%pikselami.
%INPUT: 
%wejœcia: image- obraz o rozmiarze MxN, conn- po³¹czenie pixeli 4

%
%wyjœcia: graph - macierz [M*N]x[M*N], gdzie 'i' i 'j' s¹ indeksami pixela,
%w którym rozpoczynamy, a j docelowego. s jest kosztem przejœcia z i do j

%%
[M, N] = size(Map);
MxN = M*N;

%obliczanie kosztu. i-dotychczasowy pixel, j-pixel docelowy.

CostVec = reshape(Map, MxN, 1);%stack columns

%"rozproszenie" wartoœci wewn¹trz macierzy(obrazu

    %%%%%%%%%%%%
    % X  -1   X%
    %-M   []  X%
    % X   1   X%
    %%%%%%%%%%%%
graph = spdiags(repmat(CostVec,1,4), [-M -1 1 M], MxN, MxN);

%rozdzielenie rzêdów

%z góry do do³u
graph(sub2ind([MxN, MxN], (1:N-1)*M+1, (1:N-1)*M))     = inf;
%z do³u do góry
graph(sub2ind([MxN, MxN], (1:N-1)*M,   (1:N-1)*M + 1)) = inf;