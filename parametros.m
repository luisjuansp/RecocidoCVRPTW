% Estructura de datos de los parámetros que se deben pasar a blocal y a
% recocido
%
% blocal
%       maxInt: número máximo de intentos sin mejora para terminar
%      frecImp: frecuencia de impresión de mejor encontrado
%           x0: estado inicial
%       FcnObj: función objetivo
%       FcnVec: función de vecindad
%       FcnImp: función de impresión de estado
%
% recocido
%   cadIntAcep: longitud de cadena en intentos aceptados
%       cadInt: longitud máxima de cadena en intentos
%       maxCad: número máximo de cadena de Markov sin mejora
%      frecImp: frecuencia de impresión de mejor encontrado
%           x0: estado inicial
%       FcnObj: función objetivo
%       FcnVec: función de vecindad
%       FcnImp: función de impresión de estado
%      variarC: bandera que indica si se varía la temperatura dentro de
%               las cadenas de Markov (default = 0)
%         alfa: razón de disminución de temperatura entre cadenas
%         beta: razón de aumento de temperatura en cálculo de temperatura
%               inicial
%   minRazAcep: mínima razón de aceptación para cálculo de temperatura
%               inicial
%          min: bandera que indica si se está minimizando (default = 1)

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

