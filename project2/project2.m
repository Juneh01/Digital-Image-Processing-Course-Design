Original = imread('D:\Matlab R2021a\examples\images\data\deleteAll.gif');
X1 = imnoise(Original, 'salt & pepper',0.1);
X2 = imnoise(Original, 'gaussian',0,0.1);
X3 = imnoise(Original, 'poisson');
X4 = imnoise(Original, 'speckle');

[g1,~] = lpfilter(X1, 'gaussian');
[g2,~] = lpfilter(X2, 'btw');
[g3,~] = lpfilter(X3, 'ideal');

[h1,~] = lpfilter(X1, 'gaussian');
[h2,~] = lpfilter(X2, 'btw');
[h3,~] = lpfilter(X3, 'ideal');

[i1,~] = lpfilter(X1, 'gaussian');
[i2,~] = lpfilter(X2, 'btw');
[i3,~] = lpfilter(X3, 'ideal');

[j1,~] = lpfilter(X1, 'gaussian');
[j2,~] = lpfilter(X2, 'btw');
[j3,~] = lpfilter(X3, 'ideal');

figure, imshow(Original)
set(figure(1),'NumberTitle', 'off', 'Name','Original');

figure;
set(figure(2),'NumberTitle', 'off', 'Name','Noise&gaussian-filter');
subplot(2,4,1);imshow(X1,[]);title('salt&pepper noise');
subplot(2,4,2);imshow(X2,[]);title('gaussian noise');
subplot(2,4,3);imshow(X3,[]);title('poission noise');
subplot(2,4,4);imshow(X4,[]);title('speckle noise');
subplot(2,4,5);imshow(g1,[]);title('lowpass-guassian');
subplot(2,4,6);imshow(h1,[]);title('lowpass-guassian');
subplot(2,4,7);imshow(i1,[]);title('lowpass-guassian');
subplot(2,4,8);imshow(j1,[]);title('lowpass-guassian');

figure;
set(figure(3),'NumberTitle', 'off', 'Name','Noise&btw-filter');
subplot(2,4,1);imshow(X1,[]);title('salt&pepper noise');
subplot(2,4,2);imshow(X2,[]);title('gaussian noise');
subplot(2,4,3);imshow(X3,[]);title('poission noise');
subplot(2,4,4);imshow(X4,[]);title('speckle noise');
subplot(2,4,5);imshow(g2,[]);title('lowpass-btw');
subplot(2,4,6);imshow(h2,[]);title('lowpass-btw');
subplot(2,4,7);imshow(i2,[]);title('lowpass-btw');
subplot(2,4,8);imshow(j2,[]);title('lowpass-btw');

figure;
set(figure(4),'NumberTitle', 'off', 'Name','ideal-filter');
subplot(2,4,1);imshow(X1,[]);title('salt&pepper noise');
subplot(2,4,2);imshow(X2,[]);title('gaussian noise');
subplot(2,4,3);imshow(X3,[]);title('poission noise');
subplot(2,4,4);imshow(X4,[]);title('speckle noise');
subplot(2,4,5);imshow(g3,[]);title('lowpass-ideal');
subplot(2,4,6);imshow(h3,[]);title('lowpass-ideal');
subplot(2,4,7);imshow(i3,[]);title('lowpass-ideal');
subplot(2,4,8);imshow(j3,[]);title('lowpass-ideal');



