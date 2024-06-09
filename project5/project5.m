clc;
clear all;
f=figure('NumberTitle','off','Name','OTSU','Menubar','none','Color','w');
a=axes('Parent',f);
I=imread('D:\Matlab R2021a\toolbox\images\imdata\coins.png');
level=graythresh(I);
BW=im2bw(I,level);
subplot(1,2,1);
imshow(I);
title('input image');
subplot(1,2,2);
imshow(BW);
title('output image')

[B,L] = bwboundaries(BW,4);
figure;
imshow(label2rgb(L,@jet,[.5 .5 .5]));
hold on;
for n = 1:length(B)
    boundary = B{n};
    plot(boundary(:,2),boundary(:,1),'w','LineWidth',2);
end

stats = regionprops(L,'Area','Centroid');
for n = 1:length(B)
    boundary = B{n};
    centroid = stats(n).Centroid;
    plot(centroid(1),centroid(2),'ko');
    goalboundary = boundary;
    x = min(goalboundary,[],1);
    y = max(goalboundary,[],1);
    rectangle('Position',[x(2) x(1) y(2)-x(2) y(1)-x(1)], 'EdgeColor','r','LineWidth',2);
end
