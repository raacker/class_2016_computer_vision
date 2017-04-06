function [result, table_list, im_x, im_y] = jpeg_in(im, N, Q)

im = double(im) - 128;

im_size = size(im);

im_x = ceil(im_size(1)/8);
im_y = ceil(im_size(2)/8);

im_temp = zeros(im_x*8, im_y*8);
im_temp(1:im_size(1),1:im_size(2)) = im;

result = zeros(1,0);
table_list = cell((im_x)*(im_y),2);
table_size = 1;

for i = 1 : 8 : im_size(1)
    for j = 1 : 8 : im_size(2)
        block = im_temp(i:i+7,j:j+7);
        dct_block = DCT_2D(block);
        dct_Q_block = round(dct_block./(N*Q));
        zig = zigZag(dct_Q_block);
        zig = uint8(zig + 128);
        table = huffman_table(zig(1,:));
        
        encode_data = huffman_encoding(zig(1,:),table);
        table_list{table_size,1} = table;
        table_list{table_size,2} = length(encode_data);
        table_size = table_size+1;
        
        result = cat(2, result, encode_data);
    end
end

im_x = im_x*8;
im_y = im_y*8;


% % Make header
% result = zeros(1, 103);
% result(1,1) = uint8(hex2dec('FF'));
% result(1,2) = uint8(hex2dec('D8'));
% result(1,3) = uint8(hex2dec('FF'));
% result(1,4) = uint8(hex2dec('E0'));
% result(1,5:6) = [0,16];
% result(1,7:11) = uint8('JFIF0');
% result(1,12:20) = [1,1,0,0,1,0,1,0,0];
% result(1,21) = uint8(hex2dec('FF'));
% result(1,22) = uint8(hex2dec('DB'));
% result(1,23:26) = [0,67,0,0];
% result(1,27:90) = zigZag(Q);
% result(1,91) = uint8(hex2dec('FF'));
% result(1,92) = uint8(hex2dec('C0'));
% result(1,93:95) = [0,11,8];
% result(1,96) = uint8(im_size(1)/256);
% result(1,97) = uint8(mod(im_size(1),256));
% result(1,98) = uint8(im_size(2)/256);
% result(1,99) = uint8(mod(im_size(2),256));
% result(1,100:103) = [1,1,11,0];
% DC_COEFF = 0;
% base_index = 104;
% DC_COF_list = zeros(1, im_x*im_y);