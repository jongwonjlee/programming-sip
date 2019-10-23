array = [];
addpath('img_data');
tic;
for i=1:40
    filename = cat(2,'strip_image_2_',num2str(i),'.jpg');
    new_img = imread(filename);
    array = cat(2, array, new_img);
    %array = [array new_img];
end

imshow(array);
clear;

toc;