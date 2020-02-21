function graph = A_Gloza_funkcja1(Map)

%Traktujemy obraz jako graf. Ka�dy piksel jest w�z�em s�siaduj�cym z 4
%pikselami.
%INPUT: 
%wej�cia: image- obraz o rozmiarze MxN, conn- po��czenie pixeli 4

%
%wyj�cia: graph - macierz [M*N]x[M*N], gdzie 'i' i 'j' s� indeksami pixela,
%w kt�rym rozpoczynamy, a j docelowego. s jest kosztem przej�cia z i do j

%%
[M, N] = size(Map);
MxN = M*N;

%obliczanie kosztu. i-dotychczasowy pixel, j-pixel docelowy.

CostVec = reshape(Map, MxN, 1);%stack columns

%"rozproszenie" warto�ci wewn�trz macierzy(obrazu

    %%%%%%%%%%%%
    % X  -1   X%
    %-M   []  X%
    % X   1   X%
    %%%%%%%%%%%%
graph = spdiags(repmat(CostVec,1,4), [-M -1 1 M], MxN, MxN);

%rozdzielenie rz�d�w

%z g�ry do do�u
graph(sub2ind([MxN, MxN], (1:N-1)*M+1, (1:N-1)*M))     = inf;
%z do�u do g�ry
graph(sub2ind([MxN, MxN], (1:N-1)*M,   (1:N-1)*M + 1)) = inf;