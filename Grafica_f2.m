%% Grafica_f2
%
% M. Valenzuela
% 2016-09-08

% Este script produce la grafica de la funcion 1 del ejercicio 1
% Grafica de la funci�n 1
nDelta = 200;
delta = 512*2/(nDelta-1);

x1 = -512;
for i=1:nDelta
    x2 = -512;
    for j=1:nDelta
       Z(i,j) = f2([x1 x2]);
       x2 = x2 + delta;
    end
    x1 = x1 + delta;
end
X = -512:delta:512; 
Y = -512:delta:512; 
clf
mesh(X,Y,Z)
xlabel('x1')
ylabel('x2')
zlabel('f1(x1,x2)')