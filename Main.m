%Ahmed Mohamed Saad Hussein
%1190184
clear
clc
choice = 7;
 fprintf('Welcome to 3-link arm Manipulator \n');
 
 % for I/O mode
 
% l1 = input('Enter length of first link in cm: ');
% l2 = input('Enter length of second link in cm: ');
% l3 = input('Enter length of third link in cm: ');
%    th1min = input('Enter min value of theta 1 in degrees: ');
%    th1max = input('Enter max value of theta 1 in degrees: ');
%    th2min= input('Enter min value of theta 2 in degrees: ');
%    th2max = input('Enter max value of theta 2 in degrees: ');
%    th3min= input('Enter min value of theta 3 in degrees: ');
%    th3max = input('Enter max value of theta 3 in degrees: ');

%for Testing
l1 = 6;
l2 = 4;
l3 = 3;
th1min = 0;
th1max = 90;
th2min = 0;
th2max =120;
th3min = 0;
th3max = 180;

errors = false;
while(1)
choice = input('\nChoose the mode: \n(1)DKPM \n(2)IKPM \n(3)DRAW Working Area without Animation \n(4)DRAW Working Area With Animation(takes time to animate)\n(5)Straight line trajectory between two points(x1 , y1) , (x2 , y2)\n(6)Calculate Working Area without Drawing(gives better results when angles are between (0 , 180))\n(7)Exit\n');

if(choice == 1) %DKPM
theta = inputdlg({'Theta 1','Theta 2','Theta 3'},...
    'Angles', [1 12; 1 12; 1 12]); 
th1 = str2double(theta{1});
th2 = str2double(theta{2});
th3 = str2double(theta{3});
if((th1 >th1max || th1<th1min)|| (th2 >th2max || th2<th2min)   || (th3 >th3max || th3<th3min)      )
    errors = true;
end
[x,y,~]=DKPM(l1,l2,l3,th1,th2,th3);
    x = round(x , 4);
    y= round(y , 4);
    fprintf('\nX = %.4f , Y = %.4f\n' , x ,y);
    if(errors == false)
        disp('This point belongs to the working area.');
    else
         disp('This point does not belong to the working area.');
    end
  errors = false;
  
  
  
elseif (choice == 2)%IKPM
INP = inputdlg({'X','Y','FY'},...
'IKPM', [1 12; 1 12; 1 12]); 
x = str2double(INP{1});
y = str2double(INP{2});
Alpha = str2double(INP{3});
[th1,th2,th3]=IKPM(l1,l2,l3,x,y,Alpha);

if((th1 >th1max || th1<th1min)|| (th2 >th2max || th2<th2min)   || (th3 >th3max || th3<th3min)      )
    errors = true;
end

fprintf('\nYour angles are theta1 = %.4f , theta2 = %.4f , theta3 = %.4f\n' , th1 , th2 , th3 );
 if(errors == false)
        disp('This point belongs to the working area.');
    else
         disp('This point does not belong to the working area.');
    end

errors = false;



elseif (choice == 3)%WA without animation

figure('Name','WA without animation','NumberTitle','off'); 
plot([-(l1+l2+l3+10) (l1+l2+l3+10)],[0 0],'k')
hold on
plot([0 0],[-(l1+l2+l3+10) (l1+l2+l3+10)],'k')
hold on
WADRAW(l1,l2,l3,th1min,th1max,th2min,th2max,th3min,th3max , 100);    
   sum = CAL_WA(l1,l2,l3,th1min,th1max,th2min,th2max,th3min,th3max);
   text(l1+l2+l3-4,-(l1+l2+l3-1),['WA = ' ,num2str(sum)]);
   hold on;
   
   
   
elseif (choice == 7) %exit
break;

elseif (choice == 6) %Calculating Working Area
   WA = CAL_WA(l1,l2,l3,th1min,th1max,th2min,th2max,th3min,th3max);
fprintf ('\nWorking area = %0.4f unitsquare\n',WA);

 elseif (choice == 5) %Straight Line Trajectory
INP = inputdlg({'X1','Y1','X2','Y3'},...
'Straight line trajectory', [1 12; 1 12; 1 12;1 12]); 
x1 = str2double(INP{1});
y1 = str2double(INP{2});
x2 = str2double(INP{3});
y2 = str2double(INP{4});
lineTraj(l1,l2,l3,th1max,th2max,th3max,th1min,th2min,th3min,x1,y1,x2,y2);
   sum = CAL_WA(l1,l2,l3,th1min,th1max,th2min,th2max,th3min,th3max);
   text(l1+l2+l3-4,-(l1+l2+l3-1),['WA = ' ,num2str(sum)]);
   hold on;      
   
   
   
elseif (choice == 4) %WA with animation
     
WAANIM(l1,l2,l3,th1min,th1max,th2min,th2max,th3min,th3max);    
   sum = CAL_WA(l1,l2,l3,th1min,th1max,th2min,th2max,th3min,th3max);
   text(l1+l2+l3-4,-(l1+l2+l3-1),['WA = ' ,num2str(sum)]);
   hold on;            
else %wrong input
   fprintf('\nWrong input\n'); 
end

end