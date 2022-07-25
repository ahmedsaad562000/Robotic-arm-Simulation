%Ahmed Mohamed Saad Hussein
%1190184
function WAANIM(l1,l2,l3,th1min,th1max,th2min,th2max,th3min,th3max) 
figure('Name','WA with animation','NumberTitle','off'); 


th1range = linspace(th1min , th1max , 50);
th2range = linspace(th2min , th2max , 50);
th3range = linspace(th3min , th3max , 50);
ll = length(th1range)*length(th2range)*length(th3range);
x1 = zeros(1,ll);
x2 = x1;
x3 = x1;
y1 = x1;
y2 = x1;
y3 = x2;
l = 1;
for i = 1:length(th1range)
       for j = 1:length(th2range)
           for k = 1:length(th3range)
         x1(l) = l1*cosd(th1range(i)); 
         x2(l) = x1(l) + l2*cosd(th1range(i)+th2range(j)); 
         x3(l) = x2(l) + l3*cosd(th1range(i)+th2range(j) + th3range(k) );
         y1(l) = l1*sind(th1range(i));
         y2(l) = y1(l) + l2*sind(th1range(i)+th2range(j)) ;
         y3(l) = y2(l) + l3*sind(th1range(i)+th2range(j) + th3range(k) );
         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
          if rem(l,30) == 0
          plot([0 x1(l)],[0 y1(l)],[x1(l) x2(l)],[y1(l) y2(l)],[x2(l) x3(l)],[y2(l) y3(l)],'linewidth',2);
         
          ylim([-(l1+l2+l3+1), l1+l2+l3+1]);
             xlim([-(l1+l2+l3+1), l1+l2+l3+1]);
            pause (0.000001);

          
          end
         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            l = l+1;
           end
       end
   end
pause (1);
plot([-(l1+l2+l3+10) (l1+l2+l3+10)],[0 0],'k')
hold on
plot([0 0],[-(l1+l2+l3+10) (l1+l2+l3+10)],'k')
hold on
plot(x3 , y3 , '.' ,'MarkerEdgeColor','b');
         ylim([-(l1+l2+l3+1), l1+l2+l3+1]);
            xlim([-(l1+l2+l3+1), l1+l2+l3+1]);
hold on;            
end
            