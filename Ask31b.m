hold on

for i= 1:59
     
     if y_cap(i)==1 %ι
         plot(x(i,2),x(i,1),'b+') 
         
       
     else           %ο
         plot(x(i,2),x(i,1),'ro')
     end

end

x1min = min(x(1:59,1));  %Min τιμή των δεδομένων x1
x1max = max(x(1:59,1));  %Max τιμή των δεδομένων x1


x2min = (-w(1)*x1min-w(3))/w(2);   %Min τιμή των δεδομένων x2
x2max = (-w(1)*x1max-w(3))/w(2);   %Max τιμή των δεδομένων x2
x2=[x2max x2min];
x1=[x1max 0];

plot(x2,x1);
hold off





