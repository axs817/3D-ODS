% Program to calculate the temperature profiles at each layer for a ML film
% You can change the parameters in the simulation settings to simulate it
% for variety of different parameters
clear all
%% Simulation Settings %%
tic
Px = 2; % Size of a pixel in nm
wt = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]; %Loading of the dye in active layer in %
MW = 310.352; % Mol weight of the dye in g/mol
t=50; % thickness of the active layer in nm
Sz=500; % Size of the frame to simulate
Tp=5; % Pulse width in ns
I0=[100,200,300,400,500,600,700,800,900,1000]; % Laser intensity in mW
Abs=81168; %Absorption coefficient at illumination wavelength in 1/M-cm
laser=405; %Illumination laser wavelength in nm
em=683; %Emission fluoresence wavelength in nm
band = laser - em; % calculating emission band
QY = 0.043 ; % Fl quantum yeild
NA = 0.9 ; % Numerical Aperture of the objective lens
wid = 0.51*laser/NA ; %Width of the Gaussian illumination in nm
centerxy=Sz/2;%center px
Cp=2.10; %Heat capacity of Active Layer polymer in J/g/K
rhom=1.07; %density of the Active polymer in g/cm3
kappa=0.193; %Thermal conductivity of Active polymer in W/m/K
T0=273.15; %Room Temp in Kelvin
Tth=(wid*10^-7)^2*rhom*Cp/(kappa/100)/10^-9; %Calculating Thermal Diffusion Time
alpha=100; %stretch for error function.
Tempth=740; %Threshold temperature in K
Tempth2=383; %Glass transition temp begining
na = 1.57; %refractive index of the active layer
nb = 1.37; %refractive index of the buffer layer
N = 256; % Total number of layers


%Calculate Angles:
theta = asind(NA); % Angle of incidence of the light at the first buffer layer

for m = 1:numel(wt)
    wt1=wt(m);
    Conc = (wt1*rhom)/(0.1*MW); % concentration of the dye in polymer film - in moles/L or Molar
    for l = 1:numel(I0)
        Itemp=I0(l);
        fprintf('now working on %d percent dye loading at %d mW power\n',wt1,Itemp);
        for k = 1:N
            IatN(k)=IntenatN(na,nb,k,t,Abs,Conc,theta,Itemp);
            Bl(k).Bleaching=PhotoTherm(Conc,Px,t,Sz,IatN(k),Tp,Abs,QY,laser,em,wid,Cp,rhom,kappa,alpha,Tempth,Tempth2);
            bl(m).maxbleaching(l,k)=Bl(k).Bleaching(Sz/2,Sz/2);
        end
        toc
    end
end
toc
