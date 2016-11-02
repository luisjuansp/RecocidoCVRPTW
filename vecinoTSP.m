function [vecino,n1,n2] = vecinoTSP(ruta)

% [vecino,n1,n2] = vecinoTSP(ruta)
%
% Regresa un vecino de una ruta mediante inversi�n. Regresa los puntos 
% n1 y n2 sobre los que se hizo la inversi�n.
%
% See also: tablaTSP, FcnObjTSP, plotTSP

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

n = length(ruta);
% Se obtienen dos ciudades para hacer la inversion
m1 = floor(rand*n)+1;
m2 = mod(floor(rand*(n-1))+m1, n)+1;
n1 = min([m1 m2]);
n2 = max([m1 m2]);

% Realiza la inversion de la ciudad en posici�n n1 
% a la ciudad en posici�n n2
vecino = ruta;
vecino(n1:n2) = ruta(n2:-1:n1);
