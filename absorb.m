function [Ta] = absorb(Abs,Conc,theta,t)

% This function calculates the amount of light absorbed by an active layer
% of thickness t (in nm) when the light is incident on it at an angle of
% theta (in degrees). Abs is the Absorption coefficient at illumination
% wavelength in 1/M-cm. conc is the molar concentration of the dye in polymer
% films in moles/L

Ta=10^(-Abs*Conc*t*10^(-7)/sind(theta));

end