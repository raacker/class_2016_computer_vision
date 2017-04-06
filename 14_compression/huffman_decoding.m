function output = huffman_decoding(huffman_encoded_data, table)
    output = zeros(1, length(huffman_encoded_data));
    decode_data = '';
    
    length_array = cellfun('length', table);
    length_array = sort(length_array);
    for i=1 : length(length_array)
        if length_array(1) == 0
            length_array(1) = [];
        else
            break;
        end
    end
    min_length = length_array(1);
    
    im_x = huffman_encoded_data(1);
    huffman_encoded_data(1) = [];
    
    index = 1;
    while length(huffman_encoded_data) > 2
        decode_data = strcat(decode_data, dec2bin(huffman_encoded_data(1), 8));
        huffman_encoded_data(1) = [];
        
        bit_place = min_length;
        while length(decode_data) > bit_place
            table_found = 0;
            for j=1 : length(table)
                if strcmp(table(j), decode_data(1 : bit_place))
                    output(index) = uint8(j-1);
                    index = index + 1;
                    decode_data(1:bit_place) = [];
                    bit_place = min_length;
                    table_found = 1;
                    break;
                end
            end
            if ~table_found
                bit_place = bit_place + 1;
            end
        end
        
    end
        
    if ~isempty(huffman_encoded_data)
        decode_data = strcat(decode_data, dec2bin(huffman_encoded_data(1), huffman_encoded_data(2)));
    end
    
    bit_place = min_length;
    while length(decode_data) >= bit_place
        table_found = 0;
        for j=1 : length(table)
            if strcmp(table(j), decode_data(1 : bit_place))
                output(index) = uint8(j-1);
                index = index + 1;
                decode_data(1:bit_place) = [];
                bit_place = min_length;
                table_found = 1;
                break;
            end
        end
        if ~table_found
            bit_place = bit_place + 1;
        end
    end
    output = reshape(output, [], im_x);
    output = output';
end