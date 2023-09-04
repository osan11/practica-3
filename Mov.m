function dx=Mov(t,x)
%---------definición de los parametros-----------%
m1 = 290;
m2 = 59;
b1 = 1000;
k1 = 16182;
k2 = 19000;
f = 0;
z1 = 0.05*sin(0.5*pi*t);
z2 = 0.05*sin(20*pi*t);
%------------------------------------------------%
dx = zeros(4,1);
%-----------definición de las matrices-----------%
M = [m1  0; 0  m2];
C = [b1  -b1; -b1  b1];
G = [k1 -k1; -k1 (k1+k2)];
U = [1 0; -1 k2];
%-----definición de la dinamica del sistema------%
dx(1) = x(3);
dx(2) = x(4);
dx(3:4) = M\(-C*[x(3); x(4)] - G*[x(1); x(2)] + U*[f; z1]);
%------------------------------------------------%