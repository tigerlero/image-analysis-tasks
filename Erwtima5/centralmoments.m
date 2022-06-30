
function muv = centralmoments (Image,u,v)

Image = double(Image);

Image = im2bw(Image);

[r,c] = find(Image==1); % get (r,c) of region's pixels

rbar = mean(r);

cbar = mean(c);

n = length(r);

momlist = zeros(n,1);

for i = 1 : n

momlist(i) = (r(i) - rbar)^u * (c(i) - cbar)^v;

end

muv = sum(momlist);

end