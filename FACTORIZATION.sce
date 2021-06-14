//Solving by LU decomposition method
clc
clear
function[x]=crout(A,b)
  [n,m]=size(A)
  L=zeros(A)
  U=zeros(A)
  for i=1:n
      L(i,1)=A(i,1)
      U(i,i)=1
  end;
  
  for j=2:n
     for k=2:n   //This loop is for checking pivoting
         if L(1,1)==0
             temp=L(1,:)
             L(1,:)=L(k,:)
             L(k,:)=temp
          end;
      end;
      U(1,j)=A(1,j)/L(1,1)
  end;
  
  for i=2:n
      for j=2:i
          L(i,j)=A(i,j)-L(i,1:j-1)*U(1:j-1,j)
       end;
      for j=i:n
          for k=1:n   //This loop is for checking pivoting
             if L(i,i)==0
               temp=L(i,:)
               L(i,:)=L(k,:)
               L(k,:)=temp
             end;
          end;
          U(i,j)=(A(i,j)-L(i,1:i-1)*U(1:i-1,j))/L(i,i)
      end;
  end;
  
  disp("This is the L matrix:")
  disp(L)
  disp("This is the U matrix:")
  disp(U)
  
  if isnan(det(L))|isnan(det(U))|isinf(det(L))|isinf(det(U)) then
      printf("This matrix Can not be factorized!!!!")
  else
      z=L^-1*b
      x=U^-1*z 
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
x=crout(A,b)
disp("This is the answer")
[n,m]=size(x)
for i=1:n
    printf("\tx(%d)=%f\n",i,x(i))
end;
