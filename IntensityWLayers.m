% To create a intensity plot with thickness for a given NA, dye
% concentration, thickness and properties of active layer/buffer layer.

Conc = 20; % concentration of the dye in polymer film - in moles/L or Molar
ta=10; % thickness of the active layer in nm
na=1.46; % refractive index of the active layer at the laser wavelength
nb=1.52; % refractive index of the buffer layer at the laser wavelength 
tb=500; % thickness of the buffer layer in nm
I0=1; % Incident Laser intensity in mW
Abs=1588; %Absorption coefficient at illumination wavelength in 1/M-cm
laser=405; %Illumination laser wavelength in nm
NA=0.9; % Numerical aperture of the objective lens


theta=asind(NA);

N=256; % Number of active layers in the ML Film.

for i = 1:N
    I(i)=IntenatN(na,nb,i,ta,Abs,Conc,theta,I0);
end

