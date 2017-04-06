function output = func_erosion(inputA, inputB)
    a_size = size(inputA);
    b_size = size(inputB);
    
    w_pad = floor(b_size(1)/2);
    h_pad = floor(b_size(2)/2);
    output = zeros(a_size);
    
    for i = w_pad+1 : a_size(1)-w_pad
        for j = h_pad+1 : a_size(2)-h_pad
            a_mask = inputA(i-w_pad:i+w_pad, j-h_pad:j+h_pad);
            masked = a_mask - inputB;
            nonnegative_num = 0;
            if masked(:) ~= -1
                nonnegative_num = 1;
            end
            if nonnegative_num == 1
                output(i,j) = 1;
            end
        end
    end
end