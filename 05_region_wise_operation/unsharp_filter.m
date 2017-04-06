function f2 = unsharp_filter()

f = fspecial('average');

k = 0.3;
fi = zeros(3); fi(2,2)=1;
f2 = (fi - k*f) / (1-k);
