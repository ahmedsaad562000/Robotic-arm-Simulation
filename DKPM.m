%Ahmed Mohamed Saad Hussein
%1190184
function[x,y,phi]=DKPM(L1,L2,L3,Alpha1,Alpha2,Alpha3)
x=L1*cosd(Alpha1)+L2*cosd(Alpha1+Alpha2)+L3*cosd(Alpha1+Alpha2+Alpha3);
y=L1*sind(Alpha1)+L2*sind(Alpha1+Alpha2)+L3*sind(Alpha1+Alpha2+Alpha3);
phi=Alpha1+Alpha2+Alpha3;
end