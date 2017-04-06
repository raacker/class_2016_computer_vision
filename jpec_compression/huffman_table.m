function output = huffman_table(im)

[x,y] = imhist(im);
x_size = size(x);
im_size = size(im);
intensity = x./(im_size(1) * im_size(2));

sorted = sort(intensity, 'descend');
arr_size = 0;
for i = 1 : x_size(1)
    if sorted(i,1) == 0
        break;
    end
    arr_size = arr_size + 1;
end

huffarray = dlnode();

arr_count = 1;
arr_set = [];   
for i=1 : im_size(2)
    isDuplicated = 0;
    for j = 1 : length(arr_set)
        if arr_set(j) == (im(1,i)+1);
            isDuplicated = 1;
            break;
        end
    end
    if isDuplicated == 0
        huffarray(arr_count) = dlnode(intensity(im(1,i)+1), im(1,i));
        arr_set(arr_count) = (im(1,i)+1);
    
        arr_count = arr_count + 1;
    end
end

table = cell(1,arr_size);

if length(im) == 0
    output = table;
elseif length(im) == 1
    table{1} = {im+1, '1'}; 
    output = table;
else
    
huffarray = sort_all_dlnode(huffarray);

huffarray = build_huffman_tree(huffarray);

huffman_root = huffarray(1);

global table_size;
table_size = 1;

table = build_huffman_table(huffman_root, table, '11');

output = table;
end
end

function output = delete_zero(huffarray)
    len = length(huffarray);
    index = 0;
    for i=1 : len
        if huffarray(i).Data == 0
            index = i;
        else
            if index >= 1
                huffarray(1:index) = [];
            end
            break;
        end
    end
    output = huffarray;
end

function output = build_huffman_tree(huffarray)
    while length(huffarray) >= 2
        first = huffarray(1);
        second = huffarray(2);
        newnode = dlnode(first.Data + second.Data, -1);
        if(first.Data > second.Data)  
            insertLeft(newnode, first);
            insertRight(newnode, second);
        else
            insertLeft(newnode, second);
            insertRight(newnode, first);
        end
        
        huffarray(1) = [];
        huffarray(1) = [];
        huffarray(length(huffarray)+1) = newnode;

        huffarray = sort_other_node(huffarray);
        output = huffarray;
    end
    output = huffarray;
end

function output = build_huffman_table(huffnode, table, code)
    global table_size;
    if huffnode.Pixel ~= -1
        table{table_size} = {huffnode.Pixel+1, code};
        table_size = table_size+1;
    else
        if ~isempty(huffnode.left)
            table = build_huffman_table(huffnode.left, table, strcat(code, '0'));
        end
        if ~isempty(huffnode.right)
            table = build_huffman_table(huffnode.right, table, strcat(code, '1'));
        end
    end
    output = table;
end

function output = sort_other_node(huffarray)
    len = length(huffarray);
    i = len;
    while i ~= 1
        if huffarray(i-1).Data < huffarray(len).Data
            break;
        end
        i = i - 1;
    end
    
    temp = huffarray(len);
    huffarray(i+1:len) = huffarray(i:len-1);
    huffarray(i) = temp;
    output = huffarray;
end

function output = sort_all_dlnode(huffarray)
    len = length(huffarray);
    for m=1 : len
        index = m;
        for k=m : len-1
            if huffarray(index).Data > huffarray(k+1).Data
                index = k+1;
            end
        end
        temp = huffarray(m);
        huffarray(m) = huffarray(index);
        huffarray(index) = temp;
    end
    output = huffarray;
    
    
end
