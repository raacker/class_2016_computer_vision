function output = func_closing(inputA, inputB)
    dil = func_dilation(inputA, inputB);
    output = func_erosion(dil, inputB);
end