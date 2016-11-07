function v = restriccionesCVRPTW(v, i, d, C, e, s, Dist, l)

b = zeros(length(e), 1); 
for nRuta=1:length(v)
   ruta = v{nRuta};
   for ind=2:length(ruta) - 1
      jj = ruta(ind);
      ii = ruta(ind-1);
      b(jj) = max(e(jj),b(ii)+s(ii)+Dist(ii,jj));
    endfor  
endfor

ruta = v{i};
cap = sum(d(ruta));

for ind = flip(2:(length(ruta)-1))
  if(b(ruta(ind)) > l(ruta(ind)))
    aa = b(ruta(ind));
    bb = l(ruta(ind));
    v{length(v) + 1} = [1 ruta(ind) 1];
    ruta(ind) = [];
    v{i} = ruta;
  endif
endfor

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
    ruta = [1 ruta(limite:end)];
    cap = sum(d(ruta));
    v{i} = ruta;
endwhile

%c = sum(b<=l);