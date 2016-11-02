%% Recocido simulado
% Este script muestra el uso del programa recocido y plotRecocido.


%% Optimización de f1

% Se deben cargar los parámetros en una estuctura que debe tener 
% exactamente los siguiente parámetros.
f1 = @(x) x(1)^2 + x(2)^2;
% imprime2 = @(u,m) ...
%    fprintf('f(%5.2f,%5.2f)=%8.4f f(%5.2f,%5.2f)=%8.4f',...
%            u.x(1),u.x(2),u.f,m.x(1),m.x(2),u.f);
p.cadIntAcep = 40;
p.cadInt = 80;
p.maxCad = 1;
p.frecImp = 5;
p.alfa = 0.80;
p.beta = 1.2;
p.minRazAcep = 0.90;
p.variarC = 0;
p.x0 = [10 -10]';
p.FcnObj = f1;         % función objetivo
p.FcnVec = @vecino;    % función de vecindad
p.Imp = @imprime;      % función de impresión
p.min = 1;

% Inicializar función de vecindad
vecino([-10 10;-10 10],[0.2 0.2]');

res = recocido(p,10);
% Ahora hacemos animación de los resultados
for i=1:length(res.intentos)
   clf
   subplot(3,1,1)
   plot(res.intentos(1:i),res.uf(1:i),'.g',...
      res.intentos(1:i),res.f(1:i),'-b')
   axis([0 max(res.intentos) 0 200])
   xlabel('intentos')
   ylabel('mejor encontrado')
   subplot(3,1,2)
   plot(res.intentos(1:i),res.c(1:i),'.-r')
   axis([0 max(res.intentos) 0 max(res.c)])
   xlabel('intentos')
   ylabel('c')
   subplot(3,1,3)
   plot(res.ux(1:i,1),res.ux(1:i,2),'.g',...
      res.x(1:i,1),res.x(1:i,2),'.-b')
   grid on
   axis([-10 10 -10 10])
   xlabel('x')
   ylabel('y')
   pause(0.01)
end


%% Curva de mejor encontrado para f1
% Obtenemos la curva de mejor encontrado para f1.
clf
p.frecImp = 10;
[x,prom,desv] = plotRecocido(p,20);


%% Optimización de f2

f2 = @(x) cos(sqrt(80*x)).*exp(-x/12.5);

p.alfa = 0.8;
p.beta = 1.2;
p.minRazAcep = 0.90;
p.variarC = 0;
p.x0 = 8;
p.cadIntAcep = 100;
p.cadInt = 200;
p.frecImp = 5;
p.FcnObj = f2;          % función objetivo
p.FcnVec = @vecino;     % función de vecindad
p.Imp = @imprime;       % función de impresión
p.maxCad = 2;
p.min = 1;

% Inicializar función de vecindad
vecino([0 10],1.5);


res = recocido(p,1);
% Ahora hacemos animación de los resultados
t = linspace(-0.1,10,200);
for i=1:length(res.intentos)
   clf
   subplot(3,1,1)
   plot(res.intentos(1:i),res.f(1:i),'-b')
   axis([0 max(res.intentos) -1 0.25])
   xlabel('intentos')
   ylabel('mejor encontrado')
   subplot(3,1,2)
   plot(res.intentos(1:i),res.c(1:i),'.-r')
   axis([0 max(res.intentos) 0 max(res.c)])
   xlabel('intentos')
   ylabel('c')
   subplot(3,1,3)
   plot(t,f2(t),'g',...
        res.x(i),f2(res.x(i)),'or',...
        res.ux(i),f2(res.ux(i)),'xk')
   axis([-0.1 10 -1.1 1.1])
   xlabel('intentos')
   ylabel('x')
   pause(0.01)
end

%% Curva de mejor encontrado para f2
% Obtenemos la curva de mejor encontrado para f2.
clf
p.frecImp = 50;
[x,prom,desv] = plotRecocido(p,20);


%% Maximización de f2

f2 = @(x) cos(sqrt(80*x)).*exp(-x/12.5);

p.alfa = 0.8;
p.beta = 1.2;
p.minRazAcep = 0.90;
p.variarC = 0;
p.x0 = 8;
p.cadIntAcep = 100;
p.cadInt = 200;
p.frecImp = 5;
p.FcnObj = f2;          % función objetivo
p.FcnVec = @vecino;     % función de vecindad
p.Imp = @imprime;       % función de impresión
p.maxCad = 2;
p.min = 0;

% Inicializar función de vecindad
vecino([0 10],1.5);


res = recocido(p,1);
% Ahora hacemos animación de los resultados
t = linspace(-0.1,10,200);
for i=1:length(res.intentos)
   clf
   subplot(3,1,1)
   plot(res.intentos(1:i),res.f(1:i),'-b')
   axis([0 max(res.intentos) -1 0.25])
   xlabel('intentos')
   ylabel('mejor encontrado')
   subplot(3,1,2)
   plot(res.intentos(1:i),res.c(1:i),'.-r')
   axis([0 max(res.intentos) 0 max(res.c)])
   xlabel('intentos')
   ylabel('c')
   subplot(3,1,3)
   plot(t,f2(t),'g',...
        res.x(i),f2(res.x(i)),'or',...
        res.ux(i),f2(res.ux(i)),'xk')
   axis([-0.1 10 -1.1 1.1])
   xlabel('intentos')
   ylabel('x')
   pause(0.01)
end


%% Vendedor viajero
% Ahora mostramos la aplicación de recocido simulado al problema del
% vendedor viajero (TSP por sus siglas en inglés).
N = 70;
coordenadas = rand(N,2);             % coordenadas aleatorias de ciudades
distancias = tablaTSP(coordenadas);  % se calcula la matriz de distancias
fcnObjTSP(distancias);               % se carga la matriz de distancias
ruta0 = randperm(N)';                % se genera una ruta inicial aleatoria
clf
plotTSP(ruta0,coordenadas,'b')

%% Optimización de vendedor viajero

p.alfa = 0.8;
p.beta = 1.05;
p.minRazAcep = 0.95;
p.variarC = 0;
p.x0 = ruta0;
p.cadIntAcep = 50;
p.cadInt = 800;
p.frecImp = 40;
p.FcnObj = @fcnObjTSP;    % función objetivo
p.FcnVec = @vecinoTSP;    % función de vecindad
p.Imp = @imprimeTSP;      % función de impresión
p.maxCad = 3;
p.min = 1;

imprimeTSP                % borrar coordendas
imprimeTSP(coordenadas)   % cargar coordendas
res = recocido(p,1);
int = length(res.intentos);
plotTSP(res.x(int,:),coordenadas,'b',2)
text(0,-0.1,sprintf('Mejor = %f',res.f(int)))
text(0.825,-0.1,sprintf('Intentos = %d',res.intentos(int)))
fprintf('%d ',res.x(int,:))
fprintf('\n')


%% Curva de mejor encontrado para vendedor viajero
% Obtenemos la curva de mejor encontrado para TSP.
clf
p.frecImp = 200;
[x,prom,desv] = plotRecocido(p,20,1);

