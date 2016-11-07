function vecino = vecinoCVRPTW(varargin)

persistent d C e l s Dist

if(length(varargin)>1)
    d = varargin{2};
    C = varargin{3};
    e = varargin{4};
    l = varargin{5};
    s = varargin{6};
    Dist = varargin{7};
    return
endif

u = varargin{1}.rutas;

v = u;

i = floor(rand * length(u)) + 1; #camino primario a cambiar
do
  j = floor(rand * length(u)) + 1; #camino secundario
until(i != j)

change = floor(rand * 3);
removed = false;
if (change == 0)
    #paso de cliente
    ii = floor(rand * (length(u{i}) - 2)) + 2; #cliente a dar
    jj = floor(rand * (length(u{j}) - 1)) + 1; #lugar donde poner
    v{j} = [u{j}(1:jj) u{i}(ii) u{j}(jj + 1:length(u{j}))];
    v{i}(ii) = [];
    if (length(v{i}) <= 2)
        v(i) = [];
        removed = true;
        if(j>i)
            j = j -1;
        endif
    endif
elseif (change == 1)
    #intercambio de clientes
    ii1 = floor(rand * (length(u{i}) - 2)) + 2;#primera posicion de la ruta 1
    ii2 = floor(rand * (length(u{i}) - ii1)) + ii1;#segunda posicion de la ruta 1
    jj1 = floor(rand * (length(u{j}) - 2)) + 2;#primera posicion de la ruta 2
    jj2 = floor(rand * (length(u{j}) - jj1)) + jj1;#primera posicion de la ruta 2
    v{i} = [u{i}(1:ii1 - 1) u{j}(jj1:jj2) u{i}(ii2 + 1:length(u{i}))];
    v{j} = [u{j}(1:jj1 - 1) u{i}(ii1:ii2) u{j}(jj2 + 1:length(u{j}))];
else 
    #cambio de orden
    if (length(u{i}) > 4)'
      ruta1 = v{i};
      ii1 = floor(rand * (length(u{i}) - 3)) + 2;#primera posicion de la ruta 1
      ii2 = floor(rand * (length(u{i}) - (ii1 + 1))) + ii1;#segunda posicion de la ruta 1
      ii3 = floor(rand * (length(u{i}) - (ii2 + 1))) + ii2 + 1;#tercera posicion de la ruta 3
      ii4 = floor(rand * (length(u{i}) - (ii3 + 1))) + ii3;#cuarta posicion de la ruta 
      v{i} = [u{i}(1:ii1 - 1) u{i}(ii3:ii4) u{i}(ii2 + 1:ii3 - 1) u{i}(ii1:ii2) u{i}(ii4 + 1:length(u{i}))];
      ruta1 = v{i};
      padpad = 0;
    endif
endif



%Checar que la ruta  i sea valida
if(!removed)
  v = restriccionesCVRPTW(v, i, d, C, e, s, Dist, l);
endif

%Checar que la ruta j sea valida
v = restriccionesCVRPTW(v, j, d, C, e, s, Dist, l);

vecino.rutas = v;