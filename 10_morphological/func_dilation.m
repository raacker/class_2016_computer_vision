function output = func_dilation(inputA, inputB)
    a_size = size(inputA);
    b_size = size(inputB);
    
    w_pad = floor(b_size(1)/2);
    h_pad = floor(b_size(2)/2);
    output = zeros(a_size(1) + (w_pad*2), a_size(2) + (h_pad*2));
    
    output(w_pad+1:a_size(1)+w_pad, h_pad+1:a_size(2)+h_pad) = inputA;
    
    for i = w_pad+1 : a_size(1)+w_pad
        for j = h_pad+1 : a_size(2)+h_pad
            if inputA(i-1,j-1) == 1
                output(i-w_pad:i+w_pad, j-h_pad:j+h_pad) = output(i-w_pad:i+w_pad, j-h_pad:j+h_pad) | inputB;
            end
        end
    end
    output = output(w_pad+1:a_size(1)+w_pad, h_pad+1:a_size(2)+h_pad);
end