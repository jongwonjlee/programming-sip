array = [];
addpath('img_data');

for i=1:40
    filename = cat(2,'strip_image_1_',num2str(i),'.jpg');
    new_img = imread(filename);
    array = cat(1, array, new_img);
end

imshow(array);

clear;