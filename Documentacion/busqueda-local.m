%% Búsqueda local
% Este script muestra el uso del programa blocal.


%% Funciones objetivo
% Primero defino unas funciones objetivo para poder jugar con ellas.  Estas 
% funciones están siendo definidas en línea, pero también se podrían 
% definir cada una en un archivo m.
f0 = @(x) x^2;
f1 = @(x) x(1)^2 + x(2)^2;
f2 = @(x) cos(sqrt(10*x)).*exp(-x/100);

%% Función de vecindad
% Se definen vecindades para 1 y 2 dimensiones. De nuebo, estas funciones
% se podrían definir en archivos m.
vecindad1 = @(x) x+0.1*(rand()-0.5);
vecindad2 = @(x) x+0.1*(rand(2,1)-0.5);

%% Imprime x
% Se definen funciones para imprimir un punto para 1 y 2 dimensiones. Para
% caso más complejos se pueden definir en archivos m.
imprime1 = @(x,f) fprintf('f(%5.2f)=%8.4f',x,f);
imprime2 = @(x,f) fprintf('f(%5.2f,%5.2f)=%8.4f',x(1),x(2),f);


%% Parámetros
% Se deben cargar los parámetros en una estuctura que debe tener 
% exactamente los siguiente parámetros.

p.maxInt = 30;        % Número máximo de intentos sin mejora para terminar
p.frecImp = 10;       % frecuencia de impresión
p.x0 = 10;            % punto inicial, este debe cambiar según el problema
p.FcnObj = f0;        % función objetivo
p.FcnVec = vecindad1; % función de vecindad
p.Imp = imprime1;     % función de impresión

%% Optimización de f0
% Primero, minimizamos la función f0.

res = blocal(p);
% Ahora hacemos animación de los resultados
for i=1:length(res.intentos)
   clf
   subplot(2,1,1)
   plot(res.intentos(1:i),res.f(1:i))
   axis([0 max(res.intentos) 0 100])
   xlabel('intentos')
   ylabel('mejor encontrado')
   subplot(2,1,2)
   plot(res.intentos(1:i),res.x(1:i),'or')
   axis([0 max(res.intentos) -10 10])
   xlabel('intentos')
   ylabel('x')
   pause(0.01)
end

%% Curva de mejor encontrado para f0
% Obtenemos la curva de mejor encontrado para f0.
clf
[x,prom,desv] = plotblocal(p,10);

%% Optimización de f1
% Ahora, minimizamos la función f1.

% Cambiamos la función objetivo, la función de vecindad, y la de impresión.
p.FcnObj = f1;    
p.FcnVec = vecindad2;
p.Imp = imprime2;
% Cambiamos el punto inicial
p.x0 = [10 10]';
res = blocal(p);
% Hacemos animación de los resultados
for i=1:length(res.intentos)
   clf
   subplot(2,1,1)
   plot(res.intentos(1:i),res.f(1:i))
   axis([0 max(res.intentos) 0 200])
   xlabel('intentos')
   ylabel('mejor encontrado')
   subplot(2,1,2)
   plot(res.x(1:i,1),res.x(1:i,2),'-r')
   axis([-10 10 -10 10])
   xlabel('x')
   ylabel('y')
   pause(0.01)
end

%% Curva de mejor encontrado para f1
% Obtenemos la curva de mejor encontrado para f1.
clf
[x,prom,desv] = plotblocal(p,10);

%% Optimización de f2
% Minimizamos la función f2.

% Cambiamos la función objetivo, la función de vecindad, y la de impresión.
p.FcnObj = f2;
p.FcnVec = vecindad1;
p.Imp = imprime1;
% Cambiamos el punto inicial
p.x0 = 4.5;
% Hacemos animación de los resultados
res = blocal(p);
for i=1:length(res.intentos)
   clf
   subplot(2,1,1)
   plot(res.intentos(1:i),res.f(1:i))
   axis([0 max(res.intentos) -1 1])
   xlabel('intentos')
   ylabel('mejor encontrado')
   subplot(2,1,2)
   plot(0:0.1:10,f2(0:0.1:10),'r',res.x(1:i),f2(res.x(1:i)),'xb')
   xlabel('intentos')
   ylabel('x')
   pause(0.01)
end

%% Curva de mejor encontrado para f2
% Obtenemos la curva de mejor encontrado para f2.
clf
[x,prom,desv] = plotblocal(p,10);

%% Optimización de cosexp
% Ahora optimizamos la función cosexp que se definió en un archivo m.
p.FcnObj = @cosexp; % nótese el uso de @
p.x0 = 50;
res = blocal(p);
% Hacemos animación de los resultados
for i=1:length(res.intentos)
   clf
   subplot(2,1,1)
   plot(res.intentos(1:i),res.f(1:i))
   axis([0 max(res.intentos) -1 1])
   xlabel('intentos')
   ylabel('mejor encontrado')
   subplot(2,1,2)
   plot(0:0.5:60,cosexp(0:0.5:60),'r',res.x(1:i),cosexp(res.x(1:i)),'xb')
   xlabel('intentos')
   ylabel('x')
   pause(0.01)
end

%% Curva de mejor encontrado para cosexp
% Obtenemos la curva de mejor encontrado para cosexp.
clf
[x,prom,desv] = plotblocal(p,10);

