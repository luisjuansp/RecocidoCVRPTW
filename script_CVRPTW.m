%% Problema de CVRPTW

%% Entrada de datos

dirIni = pwd;
dir = '/home/lsanchez/Documents/Inteligencia Computacional/Software/Recocido/PSolomon';
cd(dir)

% Leo datos del problema
fname = 'rc106';                % archivo de datos
fileID = fopen(strcat(fname,'.txt'));
C = textscan(fileID,'%n %n %n %n %n %n %n','Delimiter',' ', 'TreatAsEmpty',{'RC106','VEHICLE', 'NUMBER     CAPACITY', 'CUSTOMER', 'CUST NO.  XCOORD.    YCOORD.     DEMAND  READY TIME   DUE DATE   SERVICE TIME'});
fclose(fileID);
A = cell2mat(C);
numeroVehiculos = A(1, 6);
capacidad = A(1, 7);
A = A(4:size(A,1),:);


%A.data = A.data(1:45,:); % recorte

nc = A(:,1); % número de cliente
x = A(:,2); % coordenada x 
y = A(:,3); % coordenada y
d = A(:,4); % demanda
e = A(:,5); % ready time
l = A(:,6); % due date
s = A(:,7); % service time

fprintf('Problema %5s, Capacidad=%d, Número max de vehículos=%d\n',fname,capacidad,numeroVehiculos)

% Leer datos de la solución
fid = fopen(strcat(fname,'_sol.txt'));
AA = textscan(fid,'%s');
fclose(fid);
BB = AA{1};
nRutas = str2num(BB{3});
u = {};
for i=1:nRutas
   tmp = BB{3+i};
   tmp = textscan(tmp,'%n', 'Delimiter', '-');
   t = tmp{1}'+1;
   u{i} = [1 t(1:end-1) 1];
end


% Regreso al directorio original
cd(dirIni)


%% Gráfica de clientes

delta = -0.5;
clf
dg = 5;
plot(x(1),y(1),'sr',x(2:end),y(2:end),'ob','MarkerSize',12)
xlim([min(x)-dg max(x)+dg])
ylim([min(y)-dg max(y)+dg])
legend('     almacen','      clientes','Location','BestOutside')
xlabel('x')
ylabel('y')
title(sprintf('distribucion de clientes VRP: %s',fname))
hold on
for i=1:length(x)
   text(x(i)+delta,y(i)+delta,sprintf('%2d',nc(i)),'FontSize',8)
end
hold off


%% Gráfica y evaluación de una solución u

costoVRP(nc,x,y,d,e,l,s,capacidad)
[costo,b,cap,term] = costoVRP(u);
delta = 0.5;
clf
colores = {'m','r','b','k','g'};
formas = {'.','o','x','+','s','d','v','^','p','<','>','h'};
nformas = length(formas);
ncolores = length(colores);
plot(x(1),y(1),'sb', 'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',10)
xlim([min(x)-dg max(x)+dg])
ylim([min(y)-dg max(y)+dg])
xlabel('x')
ylabel('y')
title(sprintf('VRP-%s, %d clientes, costo=%f, %d rutas',fname,length(nc)-1,costo,length(u)))
hold on
leg = {};
leg{1} = '     almacen';
for i=1:length(u)
   str = sprintf('%c-%c',formas{mod(i,nformas)+1},colores{mod(i,ncolores)+1});
   plot(x(u{i}),y(u{i}),str,'MarkerSize',6)
   leg{i+1} = sprintf('%2d: (%d) %3d',i,length(u{i})-2,cap(i));
end
plot(x(1),y(1),'sb', 'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',10)
legend(leg,'Location','BestOutside')
for i=1:length(x)
   text(x(i)+delta,y(i)+delta,sprintf('%2d',nc(i)),'FontSize',8)
end
hold off


%% Tabulación de solución 

fprintf('\n')
fprintf('  Costo total: %f\n',costo)
fprintf('Tiempo máximo: %f\n',max(term))
fprintf('    Capacidad: %d\n',capacidad)
fprintf('Rutas:\n')
for i=1:length(u)
   
   
   
   fprintf('%3d: (%2d)',i,length(u{i})-2)
   fprintf(' [term=%5.2f,cap=%3d] ',term(i),cap(i))
   fprintf(' %d',nc(u{i}(2:end-1)))
   fprintf('\n')
end
fprintf('\n')

%% Tabulación de clientes procesados

r = zeros(size(e));
for i=2:length(r)
   for j=1:length(u)
      if ~isempty(find(i==u{j},1))
         r(i) = j;
         break
      end
   end
end
cond1 = e<=b; % atender después de ready time
cond2 = b<=l; % atender antes de due date
fprintf('\n')
fprintf(' nc     d       e       b       l   e<=b   b<=l  ruta\n')
for i=2:length(nc)
   fprintf('%3d: %4d %7.0f %7.0f %7.0f %5d %6d %5d\n',...
      nc(i),d(i),e(i),b(i),l(i),cond1(i),cond2(i),r(i))
end



%%