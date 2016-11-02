% Minimización usando RS

c0 = 150;
p.cadIntAcep = 300;
p.cadInt = 500;
p.maxCad = 3;
p.frecImp = 30;
p.alfa = 0.9999;
p.variarC = 0;
%p.x0 = [0 0]';
p.x0 = [0 0 0 0]';
p.FcnObj = @f2;         %funcion objetivo
p.FcnVec = @vecino;     %funcion de vecindad
p.Imp = @imprime;       %funcion de impresion
p.min = 1;

% cadIntAcep: longitud de cadena en intentos aceptados
% cadInt: longitud m�xima de cadena en intentos
% maxCad: n�mero m�ximo de cadena de Markov sin mejora
% frecImp: frecuencia de impresi�n de mejor encontrado
% x0: estado inicial
% FcnObj: funci�n objetivo
% FcnVec: funci�n de vecindad
% Imp: funci�n de impresi�n de estado
% variarC: bandera que indica si se var�a la temperatura dentro de las cadenas de Markov (default = 0)
% alfa: constante para disminuir la temperatura
% beta: raz�n de aumento de temperatura en c�lculo de temperatura inicial
% minRazAcep: m�nima raz�n de aceptaci�n para c�lculo de temperatura inicial
% min: bandera que indica si se est� minimizando (default = 1)

%Inicializar funcion de vecindad
%vecino([-512 512; -512 512],[5 5]');
vecino([-500 500; -500 500; -500 500; -500 500],[5 5 5 5]');

%res = recocido(p,c0);
curva = plotRecocido(p,20,c0);

%clf
%subplot(4,1,1)
%plot(res.intentos,res.uf,'.g',...
%      res.intentos,res.f,'-b')
%%axis([0 max(res.intentos) 0 200])
%xlabel('intentos')
%ylabel('mejor encontrado')
%subplot(4,1,2)
%plot(res.intentos,res.c,'.-r')
%axis([0 max(res.intentos) 0 max(res.c)])
%xlabel('intentos')
%ylabel('c')
%subplot(4,1,3)
%plot(res.ux(:,1),res.ux(:,2),'.g',...
%   res.x,res.x,'.-b')
%grid on
%axis([-10 10 -10 10])
%xlabel('x')
%ylabel('y')
%subplot(4,1,4)
%plot(curva.X,curva.prom,'-g',...
%      curva.X,curva.prom + curva.desv,'-r',...
%      curva.X,curva.prom - curva.desv,'-b')
%xlabel('intentos')
%ylabel('mejor encontrado')
%pause(0.01)