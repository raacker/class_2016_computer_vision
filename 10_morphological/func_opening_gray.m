function output = func_opening_gray(inputA, inputB)

ero = func_erosion_gray(inputA, inputB);
output = func_dilation_gray(ero, inputB);

end