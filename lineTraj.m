%Ahmed Mohamed Saad Hussein
%1190184
function  lineTraj(l1,l2,l3,th1max,th2max,th3max,th1min,th2min,th3min,x1,y1,x2,y2)
figure('Name','WA without animation','NumberTitle','off'); 
WADRAW(l1,l2,l3,th1min,th1max,th2min,th2max,th3min,th3max , 50);  
 
ang=0:.1:2*pi;
xp=.5*cos(ang);
yp=.5*sin(ang);
plot([x1 x2],[y1 y2],'k')
s=(x1-x2)/.1;
sy=(y2-y1)/s;
c=0;

disp('Angles')
disp('(   th1    ,    th2    ,   th3   )');    
for i=x1:-.1:x2
 
[dr(1),dr(2),dr(3)]=IKPM2(l1,l2,l3,i,y1+c*sy,180);

c=c+1;
if(rem(c,5)==0)
fprintf('(%.4f  ,  %.4f  ,  %.4f)\n' , dr(1),dr(2),dr(3));
 
  plot(l1*cosd(dr(1))+xp,l1*sind(dr(1))+yp,'r')
   hold on
    plot((l1*cosd(dr(1))+l2*cosd(dr(2)+dr(1)))+xp,(l1*sind(dr(1))+l2*sind(dr(2)+dr(1)))+yp,'r')
    hold on
    plot((l1*cosd(dr(1))+l2*cosd(dr(2)+dr(1))+l3*cosd(dr(1)+dr(2)+dr(3)))+xp,(l1*sind(dr(1))+l2*sind(dr(2)+dr(1))+l3*sind(dr(1)+dr(2)+dr(3)))+yp,'k','MarkerFaceColor','k','MarkerSize',10,'MarkerEdgeColor','k','LineWidth',5)
    hold on
   plot([0 (l1)*cosd(dr(1))],[0 (l1)*sind(dr(1))],'k','LineWidth',2)
   hold on
      plot([(l1)*cosd(dr(1)) (l1)*cosd(dr(1))+l2*cosd(dr(1)+dr(2))],[(l1)*sind(dr(1)) (l1)*sind(dr(1))+l2*sind(dr(1)+dr(2))],'k','LineWidth',2)
  hold on
   plot([(l1)*cosd(dr(1))+l2*cosd(dr(1)+dr(2)) (l1)*cosd(dr(1))+l2*cosd(dr(1)+dr(2))+l3*cosd(dr(1)+dr(2)+dr(3))],[(l1)*sind(dr(1))+l2*sind(dr(1)+dr(2)) (l1)*sind(dr(1))+l2*sind(dr(1)+dr(2))+l3*sind(dr(1)+dr(2)+dr(3))],'k','LineWidth',2)
  hold on;
pause(0.00000001);
    plot(l1*cosd(dr(1))+xp,l1*sind(dr(1))+yp,'w')
    hold on
   plot((l1*cosd(dr(1))+l2*cosd(dr(2)+dr(1)))+xp,(l1*sind(dr(1))+l2*sind(dr(2)+dr(1)))+yp,'w')
    hold on
    plot((l1*cosd(dr(1))+l2*cosd(dr(2)+dr(1))+l3*cosd(dr(1)+dr(2)+dr(3)))+xp,(l1*sind(dr(1))+l2*sind(dr(2)+dr(1))+l3*sind(dr(1)+dr(2)+dr(3)))+yp,'w','MarkerFaceColor','k','MarkerSize',10,'MarkerEdgeColor','k','LineWidth',5)
    hold on
 plot([0 (l1)*cosd(dr(1))],[0 (l1)*sind(dr(1))],'w','LineWidth',2)
   hold on
      plot([(l1)*cosd(dr(1)) (l1)*cosd(dr(1))+l2*cosd(dr(1)+dr(2))],[(l1)*sind(dr(1)) (l1)*sind(dr(1))+l2*sind(dr(1)+dr(2))],'w','LineWidth',2)
  hold on
   plot([(l1)*cosd(dr(1))+l2*cosd(dr(1)+dr(2)) (l1)*cosd(dr(1))+l2*cosd(dr(1)+dr(2))+l3*cosd(dr(1)+dr(2)+dr(3))],[(l1)*sind(dr(1))+l2*sind(dr(1)+dr(2)) (l1)*sind(dr(1))+l2*sind(dr(1)+dr(2))+l3*sind(dr(1)+dr(2)+dr(3))],'w','LineWidth',2)
  hold on
WADRAW(l1,l2,l3,th1min,th1max,th2min,th2max,th3min,th3max , 50);  
    plot([x1 x2],[y1 y2],'g');
    end
end
plot([-(l1+l2+l3+4) (l1+l2+l3+4)],[0 0],'k')
hold on
plot([0 0],[-(l1+l2+l3+4) (l1+l2+l3+4)],'k')
hold on
WADRAW(l1,l2,l3,th1min,th1max,th2min,th2max,th3min,th3max , 50);  
end