function ek=gif(fk,m,n)
for i=8:m-7
for j=8:n-7
ek(i,j)=sum(sum(abs(fk(i-7:i+7,j-7:j+7))));
end
end