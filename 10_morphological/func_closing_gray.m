function output = func_closing_gray(inputA, inputB)

dil = func_dilation_gray(inputA, inputB);
output = func_erosion_gray(dil, inputB);

end