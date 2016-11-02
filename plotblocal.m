function [X,prom,desv] = plotblocal(p,n,varargin)
% [x,prom,desv] = plotblocal(n,p)
% [x,prom,desv] = plotblocal(n,p,semilla)
%
% Llama repetidamente a blocal(p) para generar una curva
% de mejor encontrado.
%          n: numero de corridas
%          p: parámetros para blocal
%    semilla: semilla del generador de numeros aleatorios
%
% See also: blocal, recocido, plotRecocido

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
   semilla = varargin{1};
else
   semilla = sum(100*clock);
end
fprintf('\n*** Iniciando corrida #1 ***\n')
res = blocal(p,semilla);
X = res.intentos;
Y = res.f;
nx = length(X);
for i=2:n
fprintf('\n*** Iniciando corrida #%d ***\n', i)
   res = blocal(p);
   mx = length(res.intentos);
   if mx < nx
      res.f = [res.f; res.f(mx)*ones(nx-mx,1)];
   end
   if mx > nx
      X = res.intentos;
      Y = [Y; ones(mx-nx,1)*Y(nx,:)];
      nx = mx;
   end
   Y = [Y res.f];
end
prom = mean(Y,2);
desv = std(Y,0,2);
plot(X,prom+desv,X,prom,'.-',X,prom-desv)
xlabel('intentos')
ylabel('f(x)')
legend('promedio+desv est','promedio','promedio-desv est','Location','Best')
obj = p.FcnObj;
if isa(obj,'function_handle')
   obj = func2str(obj);
end
title(['curva de mejor encontrado para la función "',obj,'"'])


