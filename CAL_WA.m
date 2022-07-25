%Ahmed Mohamed Saad Hussein
%1190184
function sum = CAL_WA(l1,l2,l3,th1min,th1max,th2min,th2max,th3min,th3max)
sum = 0;
th1range = linspace(th1min , th1max , 100);
th2range = linspace(th2min , th2max , 100);
th3range = linspace(th3min , th3max , 100);

x=zeros(1,601);

y=zeros(1,601);

 
 
%  %222222222222222222
 

 z=0;
 k=1;
 for i = z+1 :z+length(th1range)
[x(i),y(i),~]=DKPM(l1,l2,l3,th1range(k),th2min,th3min);
k = k+1;

 end
 
 

% 555555555555555555555555555
 

 z=i;
 k=1;
 for i = z+1 :z+length(th2range)
[x(i),y(i),~]=DKPM(l1,l2,l3,th1max,th2range(k),th3min);
k = k+1;

 end
 

 
  %3333333333333333333
 
 z=i;
 k=1;
 for i = z+1 :z+length(th3range)
[x(i),y(i),~]=DKPM(l1,l2,l3,th1max,th2max,th3range(k));
k = k+1;

 end
 
 
 


 
 
 
 

 
 
  %44444444444444444444
%  pause(1);
 z=i;
 k=length(th1range);
 for i = z+1 :z+length(th1range)
[x(i),y(i),~]=DKPM(l1,l2,l3,th1range(k),th2max,th3max);
k = k-1;

 end   
 


 
 %6666666666666666666666


 z=i;
 k=length(th2range);
 for i = z+1 :z+length(th2range)
[x(i),y(i),~]=DKPM(l1,l2,l3,th1min,th2range(k),th3max);
k = k-1;

 end   

%11111111111111111111111

z=i;
 k=length(th3range);
 for i = z+1 :z+length(th3range)
[x(i),y(i),~]=DKPM(l1,l2,l3,th1min,th2min,th3range(k));
k = k-1;
 end   
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 

         
         for i = 1:length(x)-1
             sum = sum + ((x(i+1)+x(i))*(y(i+1)-y(i)));
         end
         sum = 0.5*sum;
                        
end            