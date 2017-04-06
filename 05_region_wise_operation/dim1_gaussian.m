function result = dim1_gaussian(filter, sigma)

[x] = -floor(filter/2) : floor(filter/2);

on_filter = (1/((sqrt(2*pi)*sigma)))*exp((-(x.^2)) / (2*(sigma^2)));

on_filter = on_filter / sum(on_filter(:));

result = on_filter.';
