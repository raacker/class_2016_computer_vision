function hw_3()

x = [20,20,20,10,10,10,10,10,10;
     20,20,20,20,20,20,20,20,10;
     20,20,20,10,10,10,10,20,10;
     20,20,10,10,10,10,10,20,10;
     20,10,10,10,10,10,10,20,10;
     10,10,10,10,20,10,10,20,10;
     10,10,10,10,10,10,10,10,10;
     20,10,20,20,10,10,10,20,20;
     20,10,10,20,10,10,20,10,20];

 filter_b = [0,-1,-1; 1,0,-1; 1,1,0];
 filter_d = [-1,-2,-1; -1,2,-1; -1,2,-1];
 filter_e = [-1,-1,-1; -1,8,-1; -1,-1,-1];
 filter_g = [-1,0,1; -1,0,1; -1,0,1];
 
figure,
subplot(2,2,1), imshow(uint8(filter2_revision(filter_b, x, 'zero')));
subplot(2,2,2), imshow(uint8(filter2_revision(filter_d, x, 'zero')));
subplot(2,2,3), imshow(uint8(filter2_revision(filter_e, x, 'zero')));
subplot(2,2,4), imshow(uint8(filter2_revision(filter_g, x, 'zero')));
