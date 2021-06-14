clc;clear
N=input("enter the number of bits:")
n=input("enter bit sequence(in a single row matrix format):")
pw=input("enter pulse widht(in msec):")
printf(" 1.for unipolar NRZ \n 2.for unipolar RZ \n 3.for polar NRZ \n 4.for polar RZ \n 5.for bipolar NRZ \n 6.for bipolar RZ \n\t")
typ=input("Enter choice:")

select typ
case 1    //unipolar NRZ
    for m=1:N // Mapping of input bit matrix 
        if n(m)==1 then nn(m)=1
        else nn(m)=0
        end;
    end;
    i=1
    t=[0:pw:N]'
    for j=1:length(t) //plotting y for values of t
        if t(j)<=i then y(j)=nn(i)
        else y(j)=nn(i);i=i+1
        end;
    end;
    clf  // clearing graphic window
    plot2d(t,y,5,rect=[0,-2,N,2]) //Plotting t vs y
    a=gca()  //Getting current axes
    a.x_location="origin" //Setting X-axis at origin
    
case 2    //unipolar RZ
    for m=1:N  // Mapping of input bit matrix 
        if n(m)==1 then nn(m)=1
        else nn(m)=0
        end;
    end;
     i=1;a=0;b=0.5
     t=[0:pw:N]'
     for j=1:length(t) //plotting y for values of t
         if t(j)>=a && t(j)<=b then y(j)=nn(i) 
         elseif t(j)>b && t(j)<=i then y(j)=0     
         else i=i+1; y(j)=nn(i); a=a+1; b=b+1
         end;
     end;
    plot2d(t,y,5,rect=[0,-2,N,2])
    a=gca()
    a.x_location="origin"
    
case 3    //polar NRZ
    for m=1:N // Mapping of input bit matrix 
        if n(m)==1
            nn(m)=1
        else
            nn(m)=-1
        end;
    end;
    i=1
    t=[0:pw:N]'
    for j=1:length(t)  //plotting y for values of t
        if t(j)<=i
            y(j)=nn(i)
        else
            y(j)=nn(i)
            i=i+1
        end;
    end;
    clf
    plot2d(t,y,5,rect=[0,-2,N,2])
    a=gca()
    a.x_location="origin"
    
case 4    //polar RZ
    for m=1:N  // Mapping of input bit matrix 
        if n(m)==1 then nn(m)=1
        else nn(m)=-1
        end;
    end;
     i=1;a=0;b=0.5
     t=[0:pw:N]'
     for j=1:length(t)  //plotting y for values of t
         if t(j)>=a && t(j)<=b then y(j)=nn(i) 
         elseif t(j)>b && t(j)<=i then y(j)=0     
         else i=i+1; y(j)=nn(i); a=a+1; b=b+1
         end;
     end;
    plot2d(t,y,5,rect=[0,-2,N,2])
    a=gca()
    a.x_location="origin"
    
case 5    //bipolar NRZ
    f=1
     for m=1:N  // Mapping of input bit matrix 
        if n(m)==1
            if f==1 then nn(m)=1;f=-1
            else nn(m)=-1;f=1
            end;
        else
            nn(m)=0
        end;
    end;
    i=1
    t=[0:pw:N]'
    for j=1:length(t)  //plotting y for values of t
        if t(j)<=i
            y(j)=nn(i)
        else
            y(j)=nn(i)
            i=i+1
        end;
    end;
    clf
    plot2d(t,y,5,rect=[0,-2,N,2])
    a=gca()
    a.x_location="origin"
    
case 6    //bipolar RZ  
    f=1
     for m=1:N  // Mapping of input bit matrix 
        if n(m)==1
            if f==1 then nn(m)=1;f=-1
            else nn(m)=-1;f=1
            end;
        else
            nn(m)=0
        end;
    end;
    i=1;a=0;b=0.5
    t=[0:pw:N]'
    for j=1:length(t)  //plotting y for values of t
         if t(j)>=a && t(j)<=b then y(j)=nn(i) 
         elseif t(j)>b && t(j)<=i then y(j)=0     
         else i=i+1;y(j)=nn(i); a=a+1; b=b+1
         end;
    end;
    clf
    plot2d(t,y,5,rect=[0,-2,N,2])
    a=gca()
    a.x_location="origin"
    
else
    disp('INVALID CHOICE!!!')
end;
