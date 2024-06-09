# Digital-Image-Processing-Course-Design
This is: Course Design of DIP at UESTC

## Project 1: Adjust the grey release resolution of the images to and display them in the same figure window.

The grey release level resolution (color scale) is the number of grey release levels that can be distinguished in an image. The grey release level measures the intensity of the light radiation value projected on the sensor. As the grey release level resolution of the image decreases, the number of colors contained in the image will decrease. Matlab provides a histeq function to change the grey release of the image, which is called by J = histeq (I, n). J is the transformed image, I is the input image, and n is the transformed grey release value.
According to the question, to adjust the grey release level resolution of the image to 128, 64, 32, 16, 8, 4, 2, you can adjust the value of n to the above value to output the image. It can also be implemented through code steps through the steps taught in the class. Then use the subplot command to put different grey release images into the same figure for comparison.

![image](https://github.com/Juneh01/Digital-Image-Processing-Course-Design/blob/main/%E7%BB%93%E6%9E%9C/%E5%9B%BE%E7%89%87%201.png)

## Project 2: Superimpose different types of noise on the image and design a frequency domain low-pass filter to remove it.

The low-pass filter is based on the convolution theorem, and the convolution of the function can be obtained by computing the inverse transformation of the product of the Fourier transform function. First, to superimpose different types of noise in the input image, you can call the imnoise function in matlab, which is realized by J = imnoise (I, type), where J is the image after superimposing noise, I is the input image, and the types are as follows: Gaussian, Localvar, Poisson, salt & pepper, speckle. Different types correspond to different noise effects. In the process of operation, the Fourier transform needs to be filled with 0 correctly. First, the filling parameters are calculated, and then the Fourier transform is performed using the filling parameters. The transfer function H (x, y) is generated according to different types, and then multiplied by the Fourier transform. Finally, the real part of the Fourier transform is taken. The code implementation is divided into three parts: 1. The main function 2. The low-pass filter function 3. Implement a two-dimensional array

![image](https://github.com/Juneh01/Digital-Image-Processing-Course-Design/blob/main/%E7%BB%93%E6%9E%9C/%E5%9B%BE%E7%89%87%202.png)
![image](https://github.com/Juneh01/Digital-Image-Processing-Course-Design/blob/main/%E7%BB%93%E6%9E%9C/%E5%9B%BE%E7%89%87%203.png)
![image](https://github.com/Juneh01/Digital-Image-Processing-Course-Design/blob/main/%E7%BB%93%E6%9E%9C/%E5%9B%BE%E7%89%87%204.png)
![image](https://github.com/Juneh01/Digital-Image-Processing-Course-Design/blob/main/%E7%BB%93%E6%9E%9C/%E5%9B%BE%E7%89%87%205.png)

## Project 3: An example is given to illustrate the application of top hat transform in image shadow correction. (The source image is "rice.bmp")

Top-hat transform is used for bright objects on a dark background to correct the effects of uneven lighting. When the lighting of an image is uneven, if the image is converted to a binary image, the dark background of the converted image will be lost due to the difference in background light. After using top-hat transform, bright spots with high grey release values relative to the surrounding areas of the image will be removed, while other areas will not have much impact.
In the implementation, Matlab provides imtophat for image processing, so the implementation of this topic is relatively simple.

![image](https://github.com/Juneh01/Digital-Image-Processing-Course-Design/blob/main/%E7%BB%93%E6%9E%9C/%E5%9B%BE%E7%89%87%206.png)
![image](https://github.com/Juneh01/Digital-Image-Processing-Course-Design/blob/main/%E7%BB%93%E6%9E%9C/%E5%9B%BE%E7%89%87%207.png)
![image]()

## Project 4: The Hough transform is used to detect straight lines in the image, and a series of constraints related to the transformation process (minimum length of line segments, etc.) can be superimposed by themselves. (The source image is "bank.bmp")

The Hough transform is a method of connecting edge pixels to form a closed boundary using the global characteristics of an image. It can conveniently get boundary curves and connect discontinuous pixel edge points. The main advantage of the Hough transform is that it is less affected by curve noise and refraction. The Hough transform can be used to directly detect certain objects with known shapes, such as straight lines. The general procedure for detecting straight lines in an image using the Hough transform is: First binarize the image, then perform edge detection, then apply the Hough transform to the result of edge detection, and finally obtain the result of line detection. For simplicity, the algorithm focuses on the Hough transform of the image, that is, the input image is a binary edge map. The algorithm steps are as follows: 1. Read in a 256-level grey release image 2. Determine the size of the Hough transform accumulator and allocate memory according to the image size 3. Transform the Hough image and save the result in the Hough transform accumulator 4. Set the threshold, according to the threshold size, delete the accumulated value from the Hough transform accumulator Points below the threshold are considered to not correspond to a line in the image area 5. Find the point with the highest accumulated value in the Hough transform accumulator, record the point and set its field to zero, continue searching and recording the next point with the highest accumulated value until all accumulated values in the accumulator are equal to zero 6. The recorded point corresponds to the line identified in the image 7. Draw a straight line according to the recorded point

![image](https://github.com/Juneh01/Digital-Image-Processing-Course-Design/blob/main/%E7%BB%93%E6%9E%9C/%E5%9B%BE%E7%89%87%208.png)

## Project 5: Perform threshold segmentation operation on the image and count the properties of each area block, and then mark the center and outer rectangle of each area. (Tip: If there are too many area blocks after segmentation, it is recommended to use the bwareaopen function under Matlab to filter out some area blocks)

Image segmentation is the technique and process of dividing an image into a series of specific regions with unique characteristics, which constitute objects of interest. It is an important step in the transition from image processing to image analysis. Existing image segmentation methods are divided into the following categories: threshold-based segmentation methods, region-based segmentation methods, edge-based segmentation methods, and theory-based segmentation methods. From a mathematical point of view, image segmentation is the process of dividing a digital image into regions that do not overlap. The process of image segmentation is also a process of marking, i.e. pixels belonging to the same region are given the same number.
In image processing, sometimes the research focuses on a certain part of the image. In order to identify and analyze the target, it is necessary to extract and delineate a region of interest, from which the target can be further utilized, for example by feature extraction and parameter measurement; Image segmentation is the technology and process of dividing the image into several specific regions, each region has its own characteristics, and extracting the target, the features of which can be grey release, color, texture, etc. The target can correspond to one region or several regions. After image segmentation, the generated target can be used in fields such as semantic image recognition, image retrieval, etc.

![image](https://github.com/Juneh01/Digital-Image-Processing-Course-Design/blob/main/%E7%BB%93%E6%9E%9C/%E5%9B%BE%E7%89%87%209.png)

## Project 6: Design a simple Matlab GUI interface program, which requires it to have the following functions: ① Open the file name setting dialog box when opening and saving images; ② When the entry in the drop-down menu is selected, the current selection is recorded in real time in the list box; ③ Interactive input of relevant parameters is realized through the edit box; ④ Display the input image and the processed result on the corresponding coordinate axis; ⑤ Contains toolbar and menu bar, when the component components under it are selected, corresponding image processing behavior must occur; ④ Modify the "Name" attribute of the figure window to its own name and student number; 0006 Compile the designed GUI program into an executable file in the form of ".exe".

GUI: Graphical user interface (Graphical User Interface, referred to as GUI, also known as graphical user interface) refers to the computer operation user interface displayed graphically. It is required to design a simple Matlab GUI interface, which can be entered into the GUIDE editor by using the guide command. The implementation of GUI on matlab is divided into an interface that directly interacts with the user and a callback code that realizes the interactive function. According to the requirements, design and use the image processing method of the previous subject knowledge (three kinds of noise, grey release transformation) to establish a simple GUI for image processing.

Designed GUI interface:
![image](https://github.com/Juneh01/Digital-Image-Processing-Course-Design/blob/main/%E7%BB%93%E6%9E%9C/%E5%9B%BE%E7%89%87%2010.png)

Drop-down menu to select the picture to be processed, or you can click "Open" to import the picture.
Name, name and student number in the upper left corner, record the operation in the fact record column
![image](https://github.com/Juneh01/Digital-Image-Processing-Course-Design/blob/main/%E7%BB%93%E6%9E%9C/%E5%9B%BE%E7%89%87%2011.png)

Superimposed Gaussian Noise
![image](https://github.com/Juneh01/Digital-Image-Processing-Course-Design/blob/main/%E7%BB%93%E6%9E%9C/%E5%9B%BE%E7%89%87%2012.png)

Superimposed Speckle Noise
![image](https://github.com/Juneh01/Digital-Image-Processing-Course-Design/blob/main/%E7%BB%93%E6%9E%9C/%E5%9B%BE%E7%89%87%2014.png)

Switch grey release level to 2
![image](https://github.com/Juneh01/Digital-Image-Processing-Course-Design/blob/main/%E7%BB%93%E6%9E%9C/%E5%9B%BE%E7%89%87%2015.png)

Switch grey release level to 64
![image](https://github.com/Juneh01/Digital-Image-Processing-Course-Design/blob/main/%E7%BB%93%E6%9E%9C/%E5%9B%BE%E7%89%87%2016.png)

Object Browser
![image](https://github.com/Juneh01/Digital-Image-Processing-Course-Design/blob/main/%E7%BB%93%E6%9E%9C/%E5%9B%BE%E7%89%87%2017.png)


