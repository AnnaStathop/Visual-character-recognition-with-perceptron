function [y_cap_val]=Ask31c(x_val,w)

data_val=xlsread('C:\Users\gepap\Desktop\ΑΝΝΑ\ΥΠΟΛΟΓΙΣΤΙΚΗ ΝΟΗΜΟΣΥΝΗ\erg3\O_I_validation.xlsx');

p=ones(length(data_val),1);
x_val=data_val(1:29,2:3);   %δεδομένα x1 και x2
x_new=[x_val p];   
y_val=data_val(1:29,4);
Y=x_new*w;
y_cap_val=sign(Y);  %προβλέψεις κλάσης 

diff=y_cap_val-y_val;  %διαφορά πρόβλεψης με πραγματική τιμή
cnt=0;
for j=1:length(diff)
    if diff(j)==0
        cnt=cnt+1;
    end
    percentage=length(diff)/cnt*100; %υπολογισμός ποσοστού
end
        
hold on
for i= 1:29
     if y_cap_val(i)==1
         plot(x_val(i,2),x_val(i,1),'b+')
     else 
         plot(x_val(i,2),x_val(i,1),'ro')
     end
end
C = confusionmat(y_cap_val,y_val)
x1min_new = min(x_new(1:29,1));  %Min τιμή των δεδομένων x1
x1max_new = max(x_new(1:29,1));  %Max τιμή των δεδομένων x1

x2min_new = (-w(1)*x1min_new-w(3))/w(2);   %Min τιμή των δεδομένων x2
x2max_new = (-w(1)*x1max_new-w(3))/w(2);   %Max τιμή των δεδομένων x2

x2_new=[x2max_new x2min_new];
x1_new=[x1max_new 0];

plot(x2_new,x1_new);
hold off
end
 

