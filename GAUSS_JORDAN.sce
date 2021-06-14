//Solving system of linear equation by gauss jordan method
clc
function[x]=gaussJordan(A)
 [nA,mA]=size(A)
 n=nA;
 for i=1:n-1
     for k=2:n   //This loop is for checking pivoting
         if A(i,i)==0
             temp=A(i,:)
             A(i,:)=A(k,:)
             A(k,:)=temp
          end;
      end;
     for j=i+1:n //making elements of lower side of major digonal=0
          A(j,:)=A(j,:)-(A(j,i)/A(i,i))*A(i,:)
      end;
 end;
 
 for i=n:-1:2  //making elements of upper side of major digonal=0
     for j=i-1:-1:1
         A(j,:)=A(j,:)-A(i,:)*(A(j,i)/A(i,i))
     end;
 end;
// disp('this is the final digonal matrix')
 //disp(A)
 for k=1:n
     x(k)=A(k,n+1)/A(k,k)
 end;
 endfunction

//Now execution for the given system of equation
//8x-3y+2z=20
//4x+11y-1z=33
//6x+3y+12z=36
A=[8,-3,2;4,11,-1;6,3,12]
disp("This is the given cofficient matrix (A)")
disp(A)
b=[20;33;36]
disp("This is the column (b) matrix")
disp(b)
A=[A,b]
x=gaussJordan(A)
disp("This is the answer")
[n,m]=size(x)
for i=1:n
    printf("\tx(%d)=%f\n",i,x(i))
end;
