function res = f2(x)

% f1: función 1 del ejercicio 1
%
% M. Valenzuela
% 2016-09-08

d = 2;
temp = 0.0;
for i=1:d
    temp = temp + x(i)*sin(sqrt(abs(x(i))));
end

res = 418.9829*d - temp;