function imprimeMejorCVRPTW(mejor,varargin)

% imprime(mejor)
% imprime(mejor, actual)
% imprime(mejor, actual, intentos)
% imprime(mejor, actual, intentos, c)
%
% Imprime el mejor encontrado (y el actual) de una corrida de recocido.
%
% See also: recocido

%*****************************************************************
%*                                                               *
%*   Recocido: Una implemetaci�n de recocido simulado en MATLAB  *
%*                                                               *
%*   Copyright (c) Derechos Reservados                           *
%*   Manuel Valenzuela Rend�n                                    *
%*   valenzuela@itesm.mx                                         *
%*   http://homepages.mty.itesm.mx/valenzuela                    *
%*                                                               *
%*   Departamento de Mecatr�nica y Automatizaci�n                *
%*   Tecnol�gico de Monterrey, Campus Monterrey                  *
%*   Monterrey, N.L., M�xico                                     *
%*                                                               *
%*****************************************************************

if length(varargin)>=1
   actual = varargin{1};
end


printf('  f(')
printf('%i)=%9.4f',length(mejor.x(length(mejor.x)).rutas),mejor.f)

if length(varargin)==0
  graficaCVRPTW(mejor.x);
  imprimeCVRPTW(mejor.x);
end

if length(varargin)>=1
   printf(' f(')
   printf('%i)=%9.4f',length(actual.x(length(actual.x)).rutas),actual.f)
end

if length(varargin)>=2
   printf(' intentos=%d',varargin{2})
end

if length(varargin)>=3
   printf(' c=%f',varargin{3});
end

printf('\n')
fflush(stdout);