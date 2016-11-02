function imprimeTSP(varargin)

% imprimeTSP(coordenadas)
%    Carga coordenadas de las ciudades.

% imprimeTSP(mejor)
% imprimeTSP(mejor,actual)
% imprimeTSP(mejor,actual,intentos)
% imprimeTSP(mejor,actual,intentos,c)
%    Grafica mejor, actual, e imprime intentos y temperatura c.
%
% See also: vecinoTSP, FcnObjTSP, tablaTSP, plotTSP

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


persistent coordenadas

if isempty(varargin)
   clear coordenadas
   return
end
if isempty(coordenadas)
   coordenadas = varargin{1};
   return
end

mejor = varargin{1};
% graficar mejor
if length(varargin)>=2
   actual = varargin{2};
   % graficar actual
   plotTSP(actual.x,coordenadas,'g',0)
   text(0.3,-0.1,sprintf('Actual = %8.4f',actual.f))
   fprintf('Actual = %f ',actual.f)
   hold on
end
plotTSP(mejor.x,coordenadas,'b')
text(0,-0.1,sprintf('Mejor = %8.4f',mejor.f))
fprintf('Mejor = %f ',mejor.f)
if length(varargin)>=3
   intentos = varargin{3};
   text(0.825,-0.1,sprintf('Intentos = %d',intentos))
   fprintf(' intentos=%d',intentos)
end
if length(varargin)>=4
   c = varargin{4};
   text(0.525,-0.1,sprintf('c = %f',c))
   fprintf(' c=%f',c)
end
fprintf('\n')
hold off
pause(0.01)
