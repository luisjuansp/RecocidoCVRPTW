function res = f1(x)

% f1: función 1 del ejercicio 1
%
% M. Valenzuela
% 2016-09-08

res = (x(2)+47)*sin(sqrt(abs(x(2)+x(1)/2+47))) ...
    -x(1)*sin(sqrt(abs(x(1)-(x(2)+47))));
