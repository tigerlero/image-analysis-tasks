%in image
image=rgb2gray(imread('a','jpg')); %read image

%sobel, edge detection
bw = edge(image,'sobel'); %sobel
figure,imshow(bw); %show image

%roberts, edge detection
bw = edge(image,'roberts'); %roberts
figure,imshow(bw); %show image

%prewitt, edge detection
bw = edge(image,'prewitt'); %prewitt
figure,imshow(bw); %show image

%kirsch, edge detection
filt1=[5 5 5;-3 0 -3;-3 -3 -3];
filt2=[-3 -3 5;-3 0 5;-3 -3 -3];
filt3=[-3 5 5;-3 0 5;-3 -3 5];
filt4=[-3 -3 -3;-3 0 5;-3 5 5];
filt5=[-3 -3 -3;-3 0 -3;5 5 5];
filt6=[-3 -3 -3;5 0 -3;5 5 -3];
filt7=[5 -3 -3;5 0 -3;5 -3 -3];
filt8=[5 5 -3;5 0 -3;-3 -3 -3];

[n,m]= size(image);
xx= 2:m-1;
yy= 2:n-1;

fim1 = conv2(image,filt1,'same');
fim2 = conv2(image,filt2,'same');
fim3 = conv2(image,filt3,'same');
fim4 = conv2(image,filt4,'same');
fim5 = conv2(image,filt5,'same');
fim6 = conv2(image,filt6,'same');
fim7 = conv2(image,filt7,'same');
fim8 = conv2(image,filt8,'same');

ind=int32(round([abs(fim1(:)) abs(fim2(:)) abs(fim3(:)) abs(fim4(:)) abs(fim5(:)) abs(fim6(:)) abs(fim7(:)) abs(fim8(:))]'));
imo= reshape(max(ind),n,m);
%if < 3
thresh= 2* mean(mean( imo(yy,xx) )) ;
%end

imout= imo >= thresh ;
xpeak= imo(yy,xx-1) <= imo(yy,xx) & imo(yy,xx) > imo(yy,xx+1) ;
ypeak= imo(yy-1,xx) <= imo(yy,xx) & imo(yy,xx) > imo(yy+1,xx) ;
imout(yy,xx)= imout(yy,xx) & ( xpeak | ypeak );

%out image
figure,imshow(imout) %show image