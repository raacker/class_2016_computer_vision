function hw_2()
    circbw = imread('circbw.tif');
    circles = imread('circles.tif');
    circlesm = imread('circlesm.tif');
    
    rect = [1,1,1;1,1,1;1,1,1];
    cross = [1,0,1;0,1,0;1,0,1];
    
    circbw_dil_rect = func_dilation(circbw,rect);
    circbw_dil_cross = func_dilation(circbw,cross);
    circbw_ero_rect = func_erosion(circbw,rect);
    circbw_ero_cross = func_erosion(circbw,cross);
    circbw_open_rect = func_opening(circbw,rect);
    circbw_open_cross = func_opening(circbw,cross);
    circbw_close_rect = func_closing(circbw,rect);
    circbw_close_cross = func_closing(circbw,cross);
    
    figure('name', 'circbw'),
    subplot(2,4,1), imshow(circbw_dil_rect), title('circbw dilation rectangle')
    subplot(2,4,2), imshow(circbw_ero_rect), title('circbw erosion rectangle')
    subplot(2,4,3), imshow(circbw_open_rect), title('circbw opening rectangle')
    subplot(2,4,4), imshow(circbw_close_rect), title('circbw closing rectangle')
    subplot(2,4,5), imshow(circbw_dil_cross), title('circbw dilation cross')
    subplot(2,4,6), imshow(circbw_ero_cross), title('circbw erosion cross')
    subplot(2,4,7), imshow(circbw_open_cross), title('circbw opening cross')
    subplot(2,4,8), imshow(circbw_close_cross), title('circbw closing cross')
    
    
    circles_dil_rect = func_dilation(circles,rect);
    circles_dil_cross = func_dilation(circles,cross);
    circles_ero_rect = func_erosion(circles,rect);
    circles_ero_cross = func_erosion(circles,cross);
    circles_open_rect = func_opening(circles,rect);
    circles_open_cross = func_opening(circles,cross);
    circles_close_rect = func_closing(circles,rect);
    circles_close_cross = func_closing(circles,cross);
    
    figure('name', 'circles'),
    subplot(2,4,1), imshow(circles_dil_rect), title('circles dilation rectangle')
    subplot(2,4,2), imshow(circles_ero_rect), title('circles erosion rectangle')
    subplot(2,4,3), imshow(circles_open_rect), title('circles opening rectangle')
    subplot(2,4,4), imshow(circles_close_rect), title('circles closing rectangle')
    subplot(2,4,5), imshow(circles_dil_cross), title('circles dilation cross')
    subplot(2,4,6), imshow(circles_ero_cross), title('circles erosion cross')
    subplot(2,4,7), imshow(circles_open_cross), title('circles opening cross')
    subplot(2,4,8), imshow(circles_close_cross), title('circles closing cross')
    
    
    circlesm_dil_rect = func_dilation(circlesm,rect);
    circlesm_dil_cross = func_dilation(circlesm,cross);
    circlesm_ero_rect = func_erosion(circlesm,rect);
    circlesm_ero_cross = func_erosion(circlesm,cross);
    circlesm_open_rect = func_opening(circlesm,rect);
    circlesm_open_cross = func_opening(circlesm,cross);
    circlesm_close_rect = func_closing(circlesm,rect);
    circlesm_close_cross = func_closing(circlesm,cross);
    
    figure('name', 'circlesm'),
    subplot(2,4,1), imshow(circlesm_dil_rect), title('circlesm dilation rectangle')
    subplot(2,4,2), imshow(circlesm_ero_rect), title('circlesm erosion rectangle')
    subplot(2,4,3), imshow(circlesm_open_rect), title('circlesm opening rectangle')
    subplot(2,4,4), imshow(circlesm_close_rect), title('circlesm closing rectangle')
    subplot(2,4,5), imshow(circlesm_dil_cross), title('circlesm dilation cross')
    subplot(2,4,6), imshow(circlesm_ero_cross), title('circlesm erosion cross')
    subplot(2,4,7), imshow(circlesm_open_cross), title('circlesm opening cross')
    subplot(2,4,8), imshow(circlesm_close_cross), title('circlesm closing cross')
    
end