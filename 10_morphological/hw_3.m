function hw_3()

A = magic(6);

b1 = [10,10,10;10,10,10;10,10,10];
b2 = [5,20,5;20,5,20;5,20,5];

func_dilation_gray(A, b1)
func_dilation_gray(A, b2)
func_erosion_gray(A, b1)
func_erosion_gray(A, b2)
end
