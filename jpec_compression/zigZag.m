function output = zigZag(im)
%Zigzag scanning
%By Ketul Shah and Sagar Shah
%Nirma University
t=0;
last_index = 0;
l=size(im);
sum=l(2)*l(1);  %calculating the M*N
new = zeros(1,(l(1) * l(2) + 1));
for d=2:sum
    c=rem(d,2);  %checking whether even or odd
    for i=1:l(1)
        for j=1:l(2)
            if((i+j)==d)
                t=t+1;
                if(c==0)
                    new(t)=im(j,d-j);
                    if(im(j,d-j) ~= 0)
                        %last_index = t+1;
                        last_index = t;
                    end
                else          
                    new(t)=im(d-j,j);
                    if(im(d-j,j) ~= 0)
                        %last_index = t+1;
                        last_index = t;
                    end
                end
             end    
         end
     end
end
%new(1, last_index+1) = eob.EOB;
%output = new(1, 1:last_index+1);
output = new;