%  Origin Image
imshow('baitap1_nhieu.jpg');               
%  Open the txt file
fid = fopen('CleanImage.txt', 'r');
% Scann the txt file
img = fscanf(fid, '%02x');
% Close the txt file
fclose(fid);
% restore the image
outImg = reshape(img,[554 430 3]);
figure, imshow(uint8(outImg),[]);