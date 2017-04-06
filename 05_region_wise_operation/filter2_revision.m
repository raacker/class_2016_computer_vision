function result = filter2_revision(filter, x, opt)

mask_size = size(filter);
x_size = size(x);
wr = floor(mask_size(1)/2);
wc = floor(mask_size(2)/2);

if strcmp(opt,'zero')
   m_x = zeros(x_size(1)+ mask_size(1)-2, x_size(2)+ mask_size(2)-2);
   m_x(wr : 1 : x_size(1) + wr-1, wc : 1 : x_size(2) + wc-1) = x;
   
else if strcmp(opt,'mirror')
    m_x = [x(wr:-1:1,:); x; x(end:-1:end-(wr-1),:)];
    m_x = [m_x(:, wc:-1:1), m_x, m_x(:, end:-1:end-(wc-1))];
end
    
end

result = filter2(filter, m_x)
    