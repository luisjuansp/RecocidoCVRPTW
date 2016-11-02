% Estructura de datos de los par�metros que se deben pasar a blocal y a
% recocido
%
% blocal
%       maxInt: n�mero m�ximo de intentos sin mejora para terminar
%      frecImp: frecuencia de impresi�n de mejor encontrado
%           x0: estado inicial
%       FcnObj: funci�n objetivo
%       FcnVec: funci�n de vecindad
%       FcnImp: funci�n de impresi�n de estado
%
% recocido
%   cadIntAcep: longitud de cadena en intentos aceptados
%       cadInt: longitud m�xima de cadena en intentos
%       maxCad: n�mero m�ximo de cadena de Markov sin mejora
%      frecImp: frecuencia de impresi�n de mejor encontrado
%           x0: estado inicial
%       FcnObj: funci�n objetivo
%       FcnVec: funci�n de vecindad
%       FcnImp: funci�n de impresi�n de estado
%      variarC: bandera que indica si se var�a la temperatura dentro de
%               las cadenas de Markov (default = 0)
%         alfa: raz�n de disminuci�n de temperatura entre cadenas
%         beta: raz�n de aumento de temperatura en c�lculo de temperatura
%               inicial
%   minRazAcep: m�nima raz�n de aceptaci�n para c�lculo de temperatura
%               inicial
%          min: bandera que indica si se est� minimizando (default = 1)

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

