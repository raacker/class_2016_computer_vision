function result = jpeg_out(stream, table, N, Q, x, y)

result = zeros(x,y);
table_count = 1;


for i = 1 : 8 : x
    for j = 1 : 8 : y
        cur_table = table{table_count,1};
        length = table{table_count,2};
        table_count = table_count + 1;
        data = stream(1:length);
        stream(1:length) = [];
        decode_data = huffman_decoding(data, cur_table);
        decode_data = double(decode_data - 128);
        pad = zeros(1,64);
        s = size(decode_data);
        pad(1:s(2)) = decode_data;
        zig = izigZag(pad);
        zig_Q_block = zig.*(N*Q);
        zig_IDCT = IDCT_2D(zig_Q_block);
        zig_IDCT = round(zig_IDCT + 128);
        result(i:i+7, j:j+7) = uint8(zig_IDCT);
    end
end

result = uint8(result);