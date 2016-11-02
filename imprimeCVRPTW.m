function imprimeCVRPTW(rutas, nc, l, d, e, capacidad)

u = rutas.rutas;
[costo,b,cap,term] = costoVRP(rutas);

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