%deep map
function needleplotst(slant, tilt, len, spacing)

%spacing of niddles
lw = 15;

%paint of niddles
s_slant = slant(1:spacing:end, 1:spacing:end);
s_tilt = tilt(1:spacing:end, 1:spacing:end);
[s_rows, s_cols] = size(s_slant);
projlen = len*sin(s_slant);

%size of niddles
dx = projlen.*cos(s_tilt);
dy = projlen.*sin(s_tilt);
clf

for r = 1:s_rows
 for c = 1:s_cols
  x = (c-1)*spacing+1;
  y = (r-1)*spacing+1;
  plot(x,y,'r.'); hold on
  line([x x+dx(r,c)],[y y+dy(r,c)],'color',[1 1 0],'linewidth',lw);
 end
end

axis('equal')
hold('off')
