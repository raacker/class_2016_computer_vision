function output = func_dilation_gray(inputA, inputB)
    a_size = size(inputA);
    b_size = size(inputB);
    
    w_pad = floor(b_size(1)/2);
    h_pad = floor(b_size(2)/2);
    temp = ones(a_size(1) + (w_pad*2), a_size(2) + (h_pad*2)).*-256;
    
    temp(w_pad+1:a_size(1)+w_pad, h_pad+1:a_size(2)+h_pad) = inputA;
    
    output = inputA;
    
    for i = w_pad+1 : a_size(1)+w_pad
        for j = h_pad+1 : a_size(2)+h_pad
            value = max(max((temp(i-w_pad:i+w_pad, j-h_pad:j+h_pad) + inputB)));
            if value > 255
                value = 255;
            end
            output(i-w_pad,j-h_pad) = value;
        end
    end

end