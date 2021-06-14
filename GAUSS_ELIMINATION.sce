//Solving system of linear equation by gauss elimination method
clc
function[x]=gausselimination1(A)
 [nA,mA]=size(A)
 //disp("this is the augmented matrix:")
 //disp(A)
 n=nA;
 for i=1:n-1
     for k=2:n
         if A(i,i)==0
             temp=A(i,:)
             A(i,:)=A(k,:)
             A(k,:)=temp
          end;
      end;
     for j=i+1:n
          A(j,:)=A(j,:)-(A(j,i)/A(i,i))*A(i,:)
      end;
 end;
 x(n)=A(n,n+1)/A(n,n);
 //disp("this is the answer:")
 for i=n-1:-1:1
     s=0
     for k=i+1:n
         s=s+A(i,k)*x(k);
      end;
   x(i)=(A(i,n+1)-s)/A(i,i);
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
x=gausselimination1(A)
disp("This is the answer")
[n,m]=size(x)
for i=1:n
    printf("\tx(%d)=%f\n",i,x(i))
end;
