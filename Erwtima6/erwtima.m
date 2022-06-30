function erwtima

%shape a b c
[a,b,c] = sphere(40);
figure,surf(a,b,c);

z=[a b c];
[dx, dy] = gradient(z);
tilt = atan2(-dy, -dx);
grad = sqrt(dx.^2 + dy.^2)+eps;
slant =  atan(grad);
figure,needleplotst(slant,tilt,5,2), axis('off')