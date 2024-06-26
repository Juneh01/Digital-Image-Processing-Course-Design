clear all;
close all;
clc;
I = imread('D:\Matlab R2021a\toolbox\images\imdata\源图像\bank.bmp');
BW = im2bw(I);
BW = edge(BW,'canny');

[H,T,R] = hough(BW);
imshow(H, [],'XData', T,'YData', R ,'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
P = houghpeaks(H, 10 , 'threshold',ceil(0.3*max(H(:))));
x = T(P(:,2));
y = R(P(:,1));
plot(x,y,'s','color','white');
lines = houghlines(BW,T,R,P,'fillgap',5,'minlength',7);
figure,imshow(BW),hold on;
max_len = 0;

for k=1:length(lines)
    xy = [lines(k).point1;lines(k).point2];
    plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
    
    plot(xy(1,1),xy(1,2),'x','LineWidth',2, 'Color','yellow');
    plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
    
    len = norm(lines(k).point1 - lines(k).point2);
    Len(k) = len;
    if (len>max_len)
        max_len = len;
        xy_long = xy;
    end
end

plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','blue');

[L1, Index1]=max(Len(:));
Len(Index1)= 0;
[L2, Index2]=max(Len(:));

x1=[lines(Index1).point1(1), lines(Index1).point2(1)];
y1=[lines(Index1).point1(2), lines(Index1).point2(2)];
x2=[lines(Index2).point1(1), lines(Index2).point2(1)];
y2=[lines(Index2).point1(2), lines(Index2).point2(2)];

K1 = (lines(Index1).point1(2)-lines(Index1).point2(2))/(lines(Index1).point1(1)-lines(Index1).point2(1));
K2 = (lines(Index2).point1(2)-lines(Index2).point2(2))/(lines(Index2).point1(1)-lines(Index2).point2(1));

hold on;
[m,n] = size(BW);
BW1 = zeros(m,n);
b1 = y1(1) - K1*x1(1);
b2 = y2(1) - K2*x2(1);
for x= 1:n
    for y = 1:m
        if y==round(K1*x+b1)|y == round(K2*x+b2)
            BW1(y,x)=1;
        end
    end
end

for x = 1:n
    for y = 1:m
        if ceil(K1*x+b1)==ceil(K2*x+b2)
            y1 = round(K1*x+b1);
            BW1(1:y1-1,:)=0;
        end
    end
end

figure,imshow(BW1);
    




        
    
