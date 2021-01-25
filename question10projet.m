am = 1;
v0 = 500;
B = 48000;
M = 4;
T = 0.02;

f1 = 3000;
f2 = 9000;
f3 = 15000;
f4 =21000;

[x1,t,X1,f]=fonctionProjet(f1,am,v0,B,M,T);
[x2,t,X2,f]=fonctionProjet(f2,am,v0,B,M,T);
[x3,t,X3,f]=fonctionProjet(f3,am,v0,B,M,T);
[x4,t,X4,f]=fonctionProjet(f4,am,v0,B,M,T);

xsomme = x1 + x2 + x3 + x4;
[Xsomme,f] = TransFourier(xsomme,t);
figure()

subplot(231)
plot(f,X1)
title('Transformée de Fourier du signal X1')

subplot(232)
plot(f,X2)
title('Transformée de Fourier du signal X2')

subplot(233)
plot(f,X3)
title('Transformée de Fourier du signal X3')

subplot(234)
plot(f,X4)
title('Transformée de Fourier du signal X4')

subplot(235)
plot(f,Xsomme)
title('Transformée de Fourier de la somme des signaux')

