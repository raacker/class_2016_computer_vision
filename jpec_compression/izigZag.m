function out = izigZag(input)
%Zigzag scanning
%By Ketul Shah and Sagar Shah
%Nirma University
im = zeros(8,8);
t=0;
l=size(im);
sum=l(2)*l(1);  %calculating the M*N
for d=2:sum
 c=rem(d,2);  %checking whether even or odd
    for i=1:l(1)
        for j=1:l(2)
            if((i+j)==d)
                t=t+1;
                if(c==0)
                    im(j,d-j) = input(t);
                else          
                    im(d-j,j) = input(t);
                end
             end    
         end
     end
end
out = im;
end