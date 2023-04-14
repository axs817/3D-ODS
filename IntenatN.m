function [IatN] = IntenatN(na,nb,N,t,Abs,Conc,theta,I0)
% Initialize the intensity at the start of layer stack (in air)
CurrI=I0;

%Intialize the angles
theta2=asind(sind(theta)/nb);
theta3=asind(sind(theta)/na);

%Calculate the intensity after reflection from the topmost buffer layer
temp=Reflec(1,nb,theta);
CurrI=CurrI*temp;

for i=1:(N-1)
    %Reflection at the buffer-active layer interface
    temp=Reflec(nb,na,theta2);
    CurrI=CurrI*temp;
    %Absorption at the active-layer
    temp=absorb(Abs,Conc,theta3,t);
    CurrI=CurrI*temp;
    %Reflection at the active-buffer layer interface
    temp=Reflec(na,nb,theta3);
    CurrI=CurrI*temp;
end

%Reflection from the Nth buffer-active layer interface
temp=Reflec(nb,na,theta2);
CurrI=CurrI*temp;

IatN=CurrI;
