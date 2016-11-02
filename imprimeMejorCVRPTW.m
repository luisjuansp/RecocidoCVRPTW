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


fprintf('  f(')
if length(mejor.x)>1
   fprintf('%7.3f,',mejor.x(1:length(mejor.x)-1))
end
fprintf('%7.3f)=%9.4f',mejor.x(length(mejor.x)),mejor.f)

if length(varargin)>=1
   fprintf(' f(')
   if length(actual.x)>1
     fprintf('%7.3f,',actual.x(1:length(actual.x)-1))
   end
   fprintf('%7.3f)=%9.4f',actual.x(length(actual.x)),actual.f)
end

if length(varargin)>=2
   fprintf(' intentos=%d',varargin{2})
end

if length(varargin)>=3
   fprintf(' c=%f',varargin{3});
end

fprintf('\n')