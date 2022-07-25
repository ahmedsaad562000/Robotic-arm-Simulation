%Ahmed Mohamed Saad Hussein
%1190184
function WADRAW(l1,l2,l3,th1min,th1max,th2min,th2max,th3min,th3max ,sharpness) 



th1range = linspace(th1min , th1max , sharpness);
th2range = linspace(th2min , th2max , sharpness);
th3range = linspace(th3min , th3max , sharpness);
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
       
            l = l+1;
           end
       end
   end
pause (1);
plot(x3 , y3 , '.' ,'MarkerEdgeColor','b');
         ylim([-(l1+l2+l3+4), l1+l2+l3+4]);
            xlim([-(l1+l2+l3+4), l1+l2+l3+4]);
           
hold on;            
end
            