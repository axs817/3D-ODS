function [Bleaching] = PhotoTherm(Conc,Px,t,Sz,IatN,Tp,Abs,QY,laser,em,wid,Cp,rhom,kappa,alpha,Tempth,Tempth2)

%%Constants
Na=6.023*10^23; % Avogadro's Number
T0=300; %Room Temp in Kelvin
centerxy=Sz/2; %center px
band=laser-em; % calculating emission band
Tth=(wid*10^-7)^2*rhom*Cp/(kappa/100)/10^-9; %Calculating Thermal Diffusion Time

%%constructing Initial FL frame
Numb0=Conc*10^(-24)*Na*Px^2*t; %Number of molecules in each pixel
frame0=zeros(1000)+Numb0; %Constructing the intial frame with Numb0 molecules per pixel.


%%Temperature Frame

for i = 1:Sz
    for j = 1:Sz
        r=(Px)*sqrt((i-centerxy)^2+(j-centerxy)^2);
        dTemp(i,j)=((IatN/1000)*(Tp*10^-9)*(Abs*Conc*t*10^-7)*(1-QY*laser/band)/(pi^2*(wid*10^-7)^2*(t*10^-7)*Cp*rhom)*exp(-r^2/(2*wid^2)))*(erf((-Tp+Tth)/alpha)+1)/2;
    end
end

for i = 1:Sz
    for j = 1:Sz
        Temp(i,j)=T0+dTemp(i,j);
    end
end



if Tempth2<T0
    Tempth2=T0;
else
end

for i = 1:Sz
    for j = 1:Sz
        if Temp(i,j)>Tempth
            Tempframe1(i,j)=0;
        elseif Temp(i,j)<Tempth2
            Tempframe1(i,j)=1;
        else
            Tempframe1(i,j)=((Temp(i,j)-Tempth)/(Tempth2-Tempth));  
         end
    end
end

for i = 1:Sz
    for j = 1:Sz
        eta=0.99+(0.01)*randn;
%             eta=1;
        frame1(i,j)=frame0(i,j)*Tempframe1(i,j)*eta;
        framenew(i,j)=frame1(i,j)/frame0(i,j);
    end
end


for i = 1:Sz
    for j = 1:Sz
        Bleaching(i,j)=(frame0(i,j)-frame1(i,j))/frame0(i,j)*100;
    end
end
imagesc(framenew,[0,1])
end
