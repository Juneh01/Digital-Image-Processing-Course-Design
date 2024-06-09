P = imread('rice.png');
imshow(P);
title('Origin');
figure;
se = strel('disk',10);
P2 = imtophat(P,se);
imshow(P2);
title('after');