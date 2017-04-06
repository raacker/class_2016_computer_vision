function output = huffman_encoding(im, huffman_table)
    encode_data = '';
    im_size = size(im);
   % index = 2;
    output = zeros(1, im_size(1));
    
   % output(1) = im_size(1);
    index = 1;
    for i=1 : im_size(1)
        for j=1 : im_size(2)
            if im(i,j) == 255
                encode_data = strcat(encode_data, searchInHuffmanTable(huffman_table, 256));
            else
                encode_data = strcat(encode_data, searchInHuffmanTable(huffman_table, im(i,j)+1));
            end
            
            while length(encode_data) > 8
                output(index) = uint8(bin2dec(encode_data(1:8)));
                index = index + 1;
                encode_data(1:8) = [];
            end
        end
    end
    
    if ~isempty(encode_data)
        output(index) = uint8(bin2dec(encode_data(1:length(encode_data))));
        output(index+1) = uint8(length(encode_data));
    end
end

function output = searchInHuffmanTable(table, index)
    table_size = size(table);
    for x = 1 : table_size(2)
        record = table{x};
        if record{1} == index
            output = char(record{2});
            break;
        end
    end
end