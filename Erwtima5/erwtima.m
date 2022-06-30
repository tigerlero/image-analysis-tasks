function [centroids]=test()
 
Image = imread('a1','jpg');
figure, title('Original Image'),imshow(Image);
Image=~im2bw(Image);
centroids=apply(Image);
centroids
 
 
J = imresize(Image, 0.5);
figure,title('Original-Resized'),imshow(Image);
Image=~im2bw(J);
centroids=apply(Image);
centroids


Image = imread('a2','jpg');
figure, imshow(Image);
Image=~im2bw(Image);
centroids=apply(Image);
centroids


Image = imread('a3','jpg');
figure, imshow(Image);
Image=~im2bw(Image);
centroids=apply(Image);
centroids

 
Image = imread('a4','jpg');
figure, imshow(Image);
Image=~im2bw(Image);
centroids=apply(Image);
centroids
