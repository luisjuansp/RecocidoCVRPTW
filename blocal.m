function r = blocal(p, varargin)

% r = blocal(p)
% r = blocal(p, semilla)
%
% Realiza búsqueda local. El parámetro p debe ser una estructura con los
% siguientes campos:
%          maxIntentos: número máximo de intentos sin mejora
%        frecImpresion: frecuencia de impresión de mejor encontrado
%             xInicial: estado inicial
%          FcnObjetivo: función objetivo
%          FcnVecindad: función de vecindad
%              Imprime: función de impresión de estado
%
% See also: plotblocal, recocido, plotRecocido

%*****************************************************************
%*                                                               *
%*   Recocido: Una implemetación de recocido simulado en MATLAB  *
%*                                                               *
%*   Copyright (c) Derechos Reservados                           *
%*   Manuel Valenzuela Rendón                                    *
%*   valenzuela@itesm.mx                                         *
%*   http://homepages.mty.itesm.mx/valenzuela                    *
%*                                                               *
%*   Departamento de Mecatrónica y Automatización                *
%*   Tecnológico de Monterrey, Campus Monterrey                  *
%*   Monterrey, N.L., México                                     *
%*                                                               *
%*****************************************************************

global mejor params res intentos

% Utilizar la semilla si se proporciona
if length(varargin)>=1
   rand('seed', varargin{1});
end
  
params = p;
intentos = 0;
% Inicializar u con el punto x0, e inicializar mejor
u.x = params.x0;
u.f = feval(params.FcnObj,u.x);
mejor = u;
mejor.intentos = intentos;
% Inicializar res
res.x = u.x';
res.f = u.f;
res.intentos = intentos;
% Realizar la búsqueda local
BLocal(u);
% regresar resultado
r = res;

function u = EvaluaPunto(u)
%*******************************************
% Evalua un punto u y guarda su evaluacion *
%*******************************************
global mejor params res intentos
u.f = feval(params.FcnObj,u.x);
intentos = intentos + 1;
if (u.f < mejor.f)
   mejor = u;
   mejor.intentos = intentos;
end
if mod(intentos,params.frecImp)==0
   feval(params.Imp,mejor.x,mejor.f);
   fprintf('  intentos =%5d\n',intentos)
   res.x = [res.x; mejor.x'];
   res.f = [res.f; mejor.f]; 
   res.intentos = [res.intentos; intentos];
end

function b = AceptaIntento(u, v)
%*******************************************
% Regresa verdadero (1) si se debe aceptar *
% un punto nuevo v dado un punto viejo u   *
%*******************************************
b = v.f < u.f;

function uNueva = BLocal(u)
%***********************************
% Implementa un buscador local     *
% regresa el ultimo punto visitado *
%***********************************
global params
intentosSinMejora = 0;
while intentosSinMejora<params.maxInt
   v.x = feval(params.FcnVec,u.x);
   v = EvaluaPunto(v);
   if AceptaIntento(u,v)
      u = v;
      intentosSinMejora = 0;
   else
      intentosSinMejora = intentosSinMejora + 1;
   end
end
uNueva = u;

