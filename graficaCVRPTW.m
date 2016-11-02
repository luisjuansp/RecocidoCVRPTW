function graficaCVRPTW(rutas, fname, nc, x, y)

%% Gráfica de clientes
u = rutas.rutas;
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

[costo,b,cap,term] = costoVRP(rutas);
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
return
