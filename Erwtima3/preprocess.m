function prepimg=preprocess(Image,d)
[m n]=size(Image);
prepimg=double(Image);
for j=1:d:m
if j+d-1>m
break;
end
for i=1:d:n
if i+d-1>n
break;
end
prepimg(j:j+d-1,i:i+d-1)=prepimg(j:j+d-1,i:i+d-1)- mean(mean(prepimg(j:j+d-1,i:i+d-1)));
end
end