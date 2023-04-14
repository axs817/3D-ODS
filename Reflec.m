function [Teff] = Reflec(n1,n2,theta)

% This function calculates the reflection at the interface of n1 and n2
% with the light going in at an angle of theta (in degrees) from the normal
% It assumes non-polarized light and calculates the reflections of S and P
% polarized light waves and calculates the transmission from the average
% reflection of S and P waves.

Rs=((n1*cosd(theta)-n2*sqrt(1-(n1*sind(theta)/n2)^2))/(n1*cosd(theta)+n2*sqrt(1-(n1*sind(theta)/n2)^2)))^2;
Rp=((n1*sqrt(1-(n1*sind(theta)/n2)^2)-n2*cosd(theta))/(n1*sqrt(1-(n1*sind(theta)/n2)^2)+n2*cosd(theta)))^2;
Teff=1-1/2*(Rs+Rp);

end
