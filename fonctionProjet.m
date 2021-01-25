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
##  On g�n�re le signal donn�
  
  xmcalc=hilbert(xm);
##  On g�n�re le signal analytique associ� au signal pr�cedemment cr�e
  
  phi=unwrap(angle(xmcalc));
##  On calcule la phase de ce signal pour pouvoir obtenir la phase instantann�e
  
  vmcalc=1/(2*pi) * diff(phi)/dt;
##  Formule de la phase instantann�e (on d�rive l'expression de la phase)
  
  vmth=fm+k*am*cos(2*pi*v0*t);
##  Formule th�orique de la fr�quence instantann�e
  
  [Xm,f]=TransFourier(xm,t);
  figure()
  
  subplot(2,2,1)
  plot(t,xm)
  title('Signal xm(t)')
  
  subplot(2,2,2)
  plot(t2,vmcalc,t,vmth,'--')
  title('Fr�quences instantann�es')
  legend('fr�quence instantann�e estim�e','fr�quence instantann�e th�orique')
  
  
  subplot(2,2,3)
  plot(f,Xm)
  title('Transform�e de Fourier de xm(t)')
  subplot(2,2,4)
  plot(f,Xm)
  xlim([-Bu Bu])
  title('Zoom sur la bande passante utile de Xm(f)')
  
  figure(2)
  plot(f,Xm)
          
  
  
end