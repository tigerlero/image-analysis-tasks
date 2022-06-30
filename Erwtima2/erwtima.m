%tform make
kuklos = bsxfun(@(x,y)hypot(x-50,y-50)<50,1:100,(1:100).');
%tform ellipsi dimentions
tform = [1 0 0;0.6 1 0;0 0 1];
%tform shape 2D
tform = maketform('affine',tform);
%tform kyklos -> elispsi
elipsi = imtransform(kuklos,tform,'Size',size(kuklos));
%out images
figure,imshow(kuklos) %show kuklos
figure,imshow(elipsi) %show elipsi