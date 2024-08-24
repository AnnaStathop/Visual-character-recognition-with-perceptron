function [w,y_cap,counter]=Ask31a(x)
h=rand;     %τυχαία τιμή ρυθμού μάθησης
data=xlsread('C:\Users\gepap\Desktop\ΑΝΝΑ\ΥΠΟΛΟΓΙΣΤΙΚΗ ΝΟΗΜΟΣΥΝΗ\erg3\O_I_classification data.xlsx');

%βήμα 1
w=rand(3,1);  %τυχαίες αρχικές συνάψεις και πόλωση
%βήμα 2
k=ones(59,1);
X=data(1:59,2:3);
x=[X k];
y=data(1:59,4);

%βήμα 3
y_cap_1= sign(x(1,1:3)*w);      %πρόβλεψη για το 1ο δεδομένο
w=w+h*((y(1)-y_cap_1)*x(1,1:3)');  %διόρθωση του 1ου δεδομένου με Widrow-Hoff

%βήμα 4-5-6
y_cap=sign(x(1:59,1:3)*w);   %Όλες οι προβλέψεις για όλα τα δεδομένα
counter=0;
while not(isequal(y,y_cap))
for i=1:59
   y_cap(i)=sign(x(i,1:3)*w); 
   sfalma=(y(i)-y_cap(i));
   w=w+x(i,1:3)'*h*sfalma;
end
counter=counter+1;
end
end



