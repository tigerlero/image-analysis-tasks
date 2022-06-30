function Laws()
%tables
L5=[1,4,6,4,1];
E5=[-1,-2,0,2,1];
S5=[-1,0,2,0,-1];
R5=[1,-4,6,-4,1];

%table1'*table2
L5E5=L5'*E5;
E5L5=E5'*L5;
L5R5=L5'*R5;
R5L5=R5'*L5;
E5S5=E5'*S5;
S5E5=S5'*E5;
S5S5=S5'*S5;
R5R5=R5'*R5;
L5S5=L5'*S5;
S5L5=S5'*L5;
E5E5=E5'*E5;
E5R5=E5'*R5;
R5E5=R5'*E5;
S5R5=S5'*R5;
R5S5=R5'*S5;

%in image
Image=imread('a', 'gif');
subplot(4,4,1);
imshow(Image);
d=5;
%window width
X=preprocess(Image, d);
for kernel = 1:15
 disp(kernel);
 %show to the command window.
 switch kernel
 %create the fk variable
  case 1
  fk = conv2(double(X),double(L5E5));
  case 2
  fk = conv2(double(X),double(E5L5));
  case 3
  fk = conv2(double(X),double(L5R5));
  case 4
  fk = conv2(double(X),double(R5L5));
  case 5
  fk = conv2(double(X),double(S5S5));
  case 6
  fk = conv2(double(X),double(R5R5));
  case 7
  fk = conv2(double(X),double(L5S5));
  case 8
  fk = conv2(double(X),double(S5L5));
  case 9
  fk = conv2(double(X),double(E5E5));
  case 10
  fk = conv2(double(X),double(E5R5));
  case 11
  fk = conv2(double(X),double(R5E5));
  case 12
  fk = conv2(double(X),double(S5R5));
  case 13
  fk = conv2(double(X),double(R5S5));
  case 14
  fk = conv2(double(X),double(E5S5));
  case 15
  fk = conv2(double(X),double(S5E5));
 end
 
 %calculate texture energy maps & (m,n)dimensions
 [m n] = size(fk); %fk calculate
 energyMap = gif(fk, m, n); %gif calculate

 %show images
 subplot(4, 4, kernel + 1); %add the array[]
 imshow(energyMap, []); %show image

end
return;