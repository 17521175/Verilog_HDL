%  Read the image file
a = imread('baitap1_nhieu.jpg');
img = a(:);
% Create file and wirte to txt
file = fopen('ImageHex.txt', 'wt');
fprintf(file,'%02x\n', img);
fclose(file);