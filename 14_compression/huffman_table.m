function output = huffman_table(im)

[x,y] = imhist(im);
x_size = size(x);
intensity = x./(x_size(1)^2);

huffarray = dlnode();

for i=1 : x_size
    huffarray(i) = dlnode(intensity(i), i-1);
end

huffarray = sort_all_dlnode(huffarray);

huffarray = delete_zero(huffarray);

huffarray = build_huffman_tree(huffarray);

huffman_root = huffarray(1);

%table = zeros(1, x_size(1));
table = cell(1,256);
table = build_huffman_table(huffman_root, table, '');

output = table;
end

function output = delete_zero(huffarray)
    len = length(huffarray);
    for i=1 : len
        if huffarray(1).Data == 0
            huffarray(1) = [];
        else
           break;
        end
    end
    output = huffarray;
end

function output = build_huffman_tree(huffarray)
    while length(huffarray) ~= 1
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
    end
    output = huffarray;
end

function output = build_huffman_table(huffnode, table, code)
    if huffnode.Pixel ~= -1
        table(huffnode.Pixel+1) = {code};
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
