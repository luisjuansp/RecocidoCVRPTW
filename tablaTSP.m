function distancias = tablaTSP(coordenadas)

% distancias = tablaTSP(coordenadas)
%
% Obtiene matriz de distancias entre ciudades dadas una matriz de
% coordenadas.
%
% See also: vecinoTSP, FcnObjTSP, plotTSP

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

[nCiudades,nx] = size(coordenadas);
if nx ~= 2,
   error('coordenadas debe ser una matriz (nCiudades) x 2')
end
distancias = zeros(nCiudades);
for i=1:nCiudades,
   for j=i: nCiudades,
      distancias(i,j) = ...
         sqrt( (coordenadas(i,1)-coordenadas(j,1))^2 + ...
         (coordenadas(i,2)-coordenadas(j,2))^2);
      distancias(j,i) = distancias(i,j);
   end
end 

