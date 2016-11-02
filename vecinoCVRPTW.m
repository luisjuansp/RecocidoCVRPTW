function v = vecinoCVRPTW(varargin)

persistent d C

if(length(varargin)>1)
    d = varargin{2};
    C = varargin{3};
    return
endif

u = varargin{1};

v = u;

i = floor(rand * length(u)) + 1; #camino primario a cambiar
do
j = floor(rand * length(u)) + 1; #camino secundario
until(i != j)

change = rand * 3;
if (true)
    #paso de cliente
    ii = floor(rand * (length(u{i}) - 2)) + 2; #cliente a dar
    jj = floor(rand * (length(u{j}) - 1)) + 1; #lugar donde poner
    v{j} = [u{j}(1:jj) u{i}(ii) u{j}(jj + 1:length(u{j}))];
    v{i}(ii) = [];
    if (length(v{i}) <= 2)
        v(i) = [];
    endif
elseif (change > 1)
    #intercambio de cliente
 
else
    #cambio de orden
 
endif

%%Checar que la ruta sea valida de peso
%ruta = v{i};
%cap = sum(d(v{i}));
%while (cap > C)
%    dem = 0;
%    limite = length(ruta);
%    %Checar en donde rompe el limite
%    for n = 1:length(ruta)
%        dem = dem + d(ruta(n));
%        if (dem > C)
%            limite = n;
%            break;
%        endif
%    endfor
%    %Dividir lla ruta en dos
%    %Crear la nueva ruta y meterla a la solucion
%    rutax = [ruta(1:limite - 1) 1];
%    indRutax = length(sol) + 1;
%    sol{indRutax} = rutax;
%    cap(indRutax) = sum(d(rutax));
%    ruta = [1 ruta(1:limite - 1)];
%    for ind = 2:length(rutax)
%        j = rutax(ind);
%        i = rutax(ind - 1);
%        if ind < length(rutax)
%            b(j) = max(e(j), b(i) + s(i) + D(i, j));
%            costo = costo + D(i, j);
%        else
%            term(indRutax) = max(e(j), b(i) + s(i) + D(i, j));
%        endif
%    endfor
%endwhile