function f = fcnObjTSP(varargin)

% f = fcnObjTSP(distancias)
% Carga una matriz de distancias.
%
% f = fcnObjTSP(ruta)
% Eval�a una ruta a partir de la matriz de distancias.
%
% f = fcnObjTSP
% Borra la matriz de distancias.
%
% % See also: vecinoTSP, tablaTSP, plotTSP

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
persistent distancias

if isempty(varargin)
   clear distancias
else
   [n,m] = size(varargin{1});
   if n==m
      % Inicializar matriz de distancias
      distancias = varargin{1};
   else
      ruta = varargin{1};
      n = length(ruta);
      % Inicializar con distancia de �ltima a primera ciudad
      f = distancias(ruta(n), ruta(1));
      for i=2:n
         % Sumar distancia entre ciudad i y ciudad i-1
         f = f + distancias(ruta(i-1), ruta(i));
      end
   end
end
