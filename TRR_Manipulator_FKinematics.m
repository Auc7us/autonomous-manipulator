len1= input('length1: '); %length of T
len2= input('length2: '); %length of R1
len3= input('length3: '); %lenght of R2

ang1= input('angle1: '); %angle of T (radial)
ang2= input('angle2: '); %angle of R1 wrt base plane
ang3= input('angle3: '); %angle of R2 wrt to R1



%%%%%%%%%%%%%%%%%%%%%% MANIPULATOR ORIENTATION in 3D %%%%%%%%%%%%%%%%%%%%%%

setA=[0; 0; 0];
setB=[0 ;0 ;len1];
setC=[ len2*cosd(ang2)*cosd(ang1); len2*cosd(ang2)*sind(ang1); len1+ len2*sind(ang2)];
len4=len2*cosd(ang2)+len3*cosd(ang2+ang3);
setD=[len4*cosd(ang1); len4*sind(ang1); len1+len2*sind(ang2)+len3*sind(ang2+ang3)];
hold on
grid on;
axis('square')


line([setA(1),setB(1)],[setA(2),setB(2)],[setA(3),setB(3)],'color', 'blue')  %T
line([setB(1),setC(1)],[setB(2),setC(2)],[setB(3),setC(3)],'color', 'green') %R1
line([setC(1),setD(1)],[setC(2),setD(2)],[setC(3),setD(3)],'color', 'red')   %R2



%%%%%%%%%%%% POINTS ACCESSIBLE to END EFFECTOR - POINT CLOUD %%%%%%%%%%%%%%

for c=0:10:60            %start:step:end sweep angles for T
    for a=0:10:90        %start:step:end sweep angles for R1
       for b= 0:5:45    %start:step:end sweep angles for R2
           len4=len2*cosd(a)+len3*cosd(a+b);
           setD=[len4*cosd(c); len4*sind(c); len1+len2*sind(a)+len3*sind(a+b)];
           plot3(setD(1),setD(2),setD(3),'r+')
       end
       
    end
end
