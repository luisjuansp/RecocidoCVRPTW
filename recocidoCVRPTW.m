%% Problema de CVRPTW

dir = '/home/lsanchez/Documents/Inteligencia Computacional/Software/Recocido/PSolomon';
fname = 'rc106'; % archivo de datos
[nc, x, y, d, e, l, s, numeroVehiculos, capacidad] = getDataCVRPTW(dir, fname);

costoVRP(nc, x, y, d, e, l, s, capacidad);

u = {};
u.rutas = cell;
for i = 2:length(nc)
    u.rutas{i - 1} = [1 (nc(i) + 1) 1];
end


vecinoCVRPTW("init", d, capacidad);

%while (length(u) > 13)
%    do
%      u = vecinoCVRPTW(u);
%    until(costoVRP(u)>costoVRP(v))
%    u = v;
%endwhile

% cadIntAcep: longitud de cadena en intentos aceptados
% cadInt: longitud m�xima de cadena en intentos
% maxCad: n�mero m�ximo de cadena de Markov sin mejora
% frecImp: frecuencia de impresi�n de mejor encontrado
% x0: estado inicial
% FcnObj: funci�n objetivo
% FcnVec: funci�n de vecindad
% Imp: funci�n de impresi�n de estado
% variarC: bandera que indica si se var�a la temperatura dentro de las cadenas de Markov (default = 0)
% alfa: constante para disminuir la temperatura
% beta: raz�n de aumento de temperatura en c�lculo de temperatura inicial
% minRazAcep: m�nima raz�n de aceptaci�n para c�lculo de temperatura inicial
% min: bandera que indica si se est� minimizando (default = 1)


c0 = 150;
p.cadIntAcep = 300;
p.cadInt = 500;
p.maxCad = 3;
p.frecImp = 30;
p.alfa = 0.9999;
p.variarC = 0;
p.x0 = u;
p.FcnObj = @costoVRP;         %funcion objetivo
p.FcnVec = @vecinoCVRPTW;     %funcion de vecindad
p.Imp = @imprimeMejorCVRPTW;       %funcion de impresion
p.min = 1;

res = recocido(p,c0);

graficaCVRPTW(res.x(end), fname, nc, x, y);
imprimeCVRPTW(res.x(end), nc, l, d, e, capacidad);