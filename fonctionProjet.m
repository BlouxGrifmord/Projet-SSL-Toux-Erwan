function [xm,t,Xm,f]=fonctionProjet(fm,am,v0,B,M,T)
  
  pkg load signal;

  clc;
  close all;
  
  
  Bu=B/(2*M);
  k=2500;
  dt=1/B;
  t=0:dt:T-dt;
  t2=0:dt:T-2*dt;
  
  xm=cos(2*pi*fm*t + (k*am/v0)*sin(2*pi*v0*t));
##  On génère le signal donné
  
  xmcalc=hilbert(xm);
##  On génère le signal analytique associé au signal précedemment crée
  
  phi=unwrap(angle(xmcalc));
##  On calcule la phase de ce signal pour pouvoir obtenir la phase instantannée
  
  vmcalc=1/(2*pi) * diff(phi)/dt;
##  Formule de la phase instantannée (on dérive l'expression de la phase)
  
  vmth=fm+k*am*cos(2*pi*v0*t);
##  Formule théorique de la fréquence instantannée
  
  [Xm,f]=TransFourier(xm,t);
  figure()
  
  subplot(2,2,1)
  plot(t,xm)
  title('Signal xm(t)')
  
  subplot(2,2,2)
  plot(t2,vmcalc,t,vmth,'--')
  title('Fréquences instantannées')
  legend('fréquence instantannée estimée','fréquence instantannée théorique')
  
  
  subplot(2,2,3)
  plot(f,Xm)
  title('Transformée de Fourier de xm(t)')
  subplot(2,2,4)
  plot(f,Xm)
  xlim([-Bu Bu])
  title('Zoom sur la bande passante utile de Xm(f)')
  
  figure(2)
  plot(f,Xm)
          
  
  
end