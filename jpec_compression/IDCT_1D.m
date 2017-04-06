function result = IDCT_1D(im)

im_size = size(im);
result = zeros(im_size);

for u=0 : im_size(2)-1
    sum = 0;
   
   for x=0 : im_size(2)-1

       if x == 0
           C = (1 / sqrt(im_size(2)));
       else
           C = sqrt(2 / im_size(2));
       end
       
       sum = sum + ((cos((((2 * u) + 1) * x * pi)/(im_size(2)*2)) * im(1,x+1) * C));
   end
   result(1,u+1) = sum;
end