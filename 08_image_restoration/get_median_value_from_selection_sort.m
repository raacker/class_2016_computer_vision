function output = get_median_value_from_selection_sort(input)

input_size = size(input);
total_size = input_size(1) * input_size(2);
result = zeros(1, total_size);

for i=1 : total_size
    result(1, i) = input(i);
end

for i=1 : total_size-1
    min_index = i;
    
    for j=i : total_size
        if result(min_index) > result(j)
           min_index = j;
        end
    end
    
    temp = result(i);
    result(i) = result(min_index);
    result(min_index) = temp;
end

output = result(1, round(total_size/2));
