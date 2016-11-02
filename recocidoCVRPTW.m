%% Problema de CVRPTW

dir = '/home/lsanchez/Documents/Inteligencia Computacional/Software/Recocido/PSolomon';
fname = 'rc106'; % archivo de datos
[nc, x, y, d, e, l, s, numeroVehiculos, capacidad] = getDataCVRPTW(dir, fname);

costoVRP(nc, x, y, d, e, l, s, capacidad);

u = {};
for i = 2:length(nc)
    u{i - 1} = [1 (nc(i) + 1) 1];
end

vecinoCVRPTW("init", d, capacidad);

while (length(u) > 13)
    do
      u = vecinoCVRPTW(u);
    until(costoVRP(u)>costoVRP(v))
    u = v;
endwhile

graficaCVRPTW(u, fname, nc, x, y);
imprimeCVRPTW(u, nc, l, d, e, capacidad);