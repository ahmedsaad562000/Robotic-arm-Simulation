%Ahmed Mohamed Saad Hussein
%1190184
function[th1,th2,th3]=IKPM(l1,l2,l3,X,Y,Alpha) 
    x = X - l3*cosd(Alpha);
    y = Y - l3*sind(Alpha);
    costh2 = ((x^2)+(y^2)-l1^2 - l2^2) / (2*l1*l2);
    th2 = acos(costh2);
    m1 = l1 + l2*cos(th2);
    m2 = l2*sin(th2);
    M = [m1 , -m2 ;m2 , m1 ];
    Minv = inv(M);
    Mth1 = Minv*[x ; y];
    th1 = atan2(Mth1(2) , Mth1(1));
    th1 = (th1*180)/pi;
    th2 = (th2*180)/pi;
    th1 = round(th1 , 4);
    th2 = round(th2 , 4);
    th3 = Alpha - th1-th2;
end