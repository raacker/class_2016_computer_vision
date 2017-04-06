function output = func_opening(inputA, inputB)
    ero = func_erosion(inputA, inputB);
    output = func_dilation(ero, inputB);
end