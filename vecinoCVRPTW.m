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
elseif (false)
    #intercambio de clientes
    ii1 = floor(rand * (length(u{i}) - 2)) + 2;#primera posicion de la ruta 1
    ii2 = floor(rand * (length(u{i}) - ii1)) + ii1;#segunda posicion de la ruta 1
    jj1 = floor(rand * (length(u{j}) - 2)) + 2;#primera posicion de la ruta 2
    jj2 = floor(rand * (length(u{j}) - jj1)) + jj1;#primera posicion de la ruta 2
    v{i} = [u{i}(1:ii1 - 1) u{j}(jj1:jj2) u{i}(ii2 + 1:length(u{i}))];
    v{j} = [u{j}(1:jj1 - 1) u{i}(ii1:ii2) u{j}(jj2 + 1:length(u{j}))];
else 
    #cambio de orden
    if (length(u{i}) > 4)
      ii1 = floor(rand * (length(u{i}) - 3)) + 2;#primera posicion de la ruta 1
      ii2 = floor(rand * (length(u{i}) - (ii1 + 1))) + ii1;#segunda posicion de la ruta 1
      ii3 = floor(rand * (length(u{i}) - ii2 + 1)) + ii2 + 1;#tercera posicion de la ruta 3
      ii4 = floor(rand * (length(u{i}) - ii3)) + ii3;#cuarta posicion de la ruta 
      v{i} = [u{i}(1:ii1 - 1) u{i}(ii3:ii4) u{i}(ii2 + 1:ii3 - 1) u{i}(ii1:ii2) u{i}(ii4 + 1:length(u{i}))];
    endif
endif

%Checar que la ruta sea valida de peso
if(!removed)
  ruta = v{i};
  cap = sum(d(ruta));
  while (cap > C)
      dem = 0;
      limite = length(ruta);
      %Checar en donde rompe el limite
      for n = 1:length(ruta)
          dem = dem + d(ruta(n));
          if (dem > C)
              limite = n;
              break;
          endif
      endfor
      %Dividir lla ruta en dos
      %Crear la nueva ruta y meterla a la solucion
      rutax = [ruta(1:limite - 1) 1];
      v{length(v) + 1} = rutax;
      ruta = [1 ruta(1:limite - 1)];
      cap = sum(d(ruta));
  endwhile
endif

%Checar que la ruta sea valida de peso
ruta = v{j};
cap = sum(d(ruta));
while (cap > C)
    dem = 0;
    limite = length(ruta);
    %Checar en donde rompe el limite
    for n = 1:length(ruta)
        dem = dem + d(ruta(n));
        if (dem > C)
            limite = n;
            break;
        endif
    endfor
    %Dividir lla ruta en dos
    %Crear la nueva ruta y meterla a la solucion
    rutax = [ruta(1:limite - 1) 1];
    v{length(v) + 1} = rutax;
    ruta = [1 ruta(1:limite - 1)];
    cap = sum(d(ruta));
endwhile
