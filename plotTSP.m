function plotTSP(ruta, coordenadas, s, varargin)

% plotTSP(ruta, coordenadas, s, bandera=0)
%
% Grafica una ruta de TSP a partir de sus coordenadas. La bandera
% especifica la forma en que se enumeran las ciudades:
%    0: no se enumeran
%    1: se enumeran por el orden visitado
%    2: se enumeran con los número originales
%
% % See also: vecinoTSP, FcnObjTSP, tablaTSP

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

if length(varargin)>=1
   bandera = varargin{1};
else
   bandera = 1;
end

n = length(ruta);
xy = [];
for i=1:n
   xy = [xy;coordenadas(ruta(i),:)];
end
xy = [xy; xy(1,:)];
axis([0 1 0 1])
if bandera==0
   plot(xy(:,1),xy(:,2),s)
   axis([0 1 0 1])
end
if bandera==1
   % Etiquetar ciudades por orden visitado
   plot(xy(:,1),xy(:,2),s,...
      xy(:,1),xy(:,2),'.r',...
      xy(1,1),xy(1,2),'ok',...
      xy(2,1),xy(2,2),'sb')
   axis([0 1 0 1])
   for i=1:n
      text(coordenadas(ruta(i),1)+0.01,coordenadas(ruta(i),2),...
         sprintf('%d',i), 'FontSize', 8)
   end
end
if bandera==2
   % Etiquetar ciudades con número original
   plot(xy(:,1),xy(:,2),s,...
      xy(:,1),xy(:,2),'.r',...
      xy(1,1),xy(1,2),'ok',...
      xy(2,1),xy(2,2),'sb')
   axis([0 1 0 1])
   for i=1:n
      text(coordenadas(ruta(i),1)+0.01,coordenadas(ruta(i),2),...
         sprintf('%d',ruta(i)), 'FontSize', 8)
   end
end

