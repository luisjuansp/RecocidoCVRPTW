function vecinoEntero(varargin)

% v = vecinoEntero(x)
% vecinoEntero(lim,tamVecindad)
%
% Regresa el v el vecino del vector x de longitud n, donde lim es una 
% matriz nx2 de los valores mínimos y máximos que puede tomar v, y 
% tamVecindad es un vector nx1 de los tamaños de vecindad, y x es un
% vector de enteros
%
% Se also: recocido

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

persistent lim tamVecindad

if length(varargin)==1
   xMin = lim(:,1);
   xMax = lim(:,2);
   x = varargin{1};
   x = x+tamVecindad*2.*(rand(size(x))-0.5);
   x = x.*~(x>xMax) + xMax.*(x>xMax);
   v = x.*~(x<xMin) + xMin.*(x<xMin);
elseif length(varargin)>=2
   fprintf('Fijando límites y tamaño de vecindad en vecino\n')
   lim = varargin{1};
   tamVecindad = varargin{2};
end

