function apply_chain_code
 
 
%in image
 I=imread('a','bmp'); %read image

%convert
I=rgb2gray(I); %convert to grayscale

%edge detection
BW=edge(I,'canny'); %edge canny detection

%producing  binary image
BW1=bwareaopen(BW,35); %removes from a binary image all connected components (objects) that have fewer than P=35 pixels

%producing binary image
L=bwlabel(BW1);%returns a matrix L,of the same size as BW, containing labels for the connected objects(here 8) in BW.
 
figure;
subplot(221);
imshow(I)
xlabel('Step 1 - Input Gray Image');
axis equal;
subplot(222);
imshow(BW)
xlabel('Step2 - Canny Edge Filter');
axis equal;
subplot(223);
imagesc(BW1)
xlabel('Step3 - Remove conne-comp smaller than 35 Pixel');
axis equal;
subplot(224);
imagesc(L)
xlabel('Step4 - Return conn-comp larger than 35 Pixel');
axis equal;

%---------------------------
figure;imshow(BW);
hold on;
 
%--------Do chain code------
k=max(max(L));
 
for i=1:k %foreach i
    [xc,yc]=find(L==i);
    cc=chain_code(L,xc(1),yc(1)); %chain code
    dcc=dif_chain_code(cc); %differential chain code
    plot(xc(1),yc(1),'-.r*');xlabel('Start point');
        
    disp(sprintf('\n??????? ????????:')); cc
    disp(sprintf('\n?????????? ??????? ????????:')); dcc
    disp(sprintf('\n----------------------------'));
    clear cc dcc;
end;