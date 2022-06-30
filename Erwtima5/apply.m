function [vec]=apply(Image)

area = bwarea(Image);
  
u11 = centralmoments(Image,1,1) / (area^2); 
 

u20 = centralmoments(Image,2,0) / (area^2);
u02 = centralmoments(Image,0,2) / (area^2);


u30 = centralmoments(Image,3,0) / (area^2.5); 
u03 = centralmoments(Image,0,3) / (area^2.5);
u21 = centralmoments(Image,2,1) / (area^2.5);
u12 = centralmoments(Image,1,2) / (area^2.5);
 

h1 = u20 + u02;
h2 = (u20-u02)^2 + 4*u11^2;
h3 = (u30-3*u12)^2 + (u03-3*u21)^2;
h4 = (u30+u12)^2 + (u03+u21)^2;
h5 = (u30-3*u12)*(u30+u12)*((u30+u12)^2-3*(u03+u21)^2) ...
    + (3*u21-u03)*(u03+u21)*(3*(u30+u12)^2 - (u03+u21)^2);
h6 = (u20-u02)*((u30+u12)^2-(u03+u21)^2) + 4*u11*(u30+u12)*(u03+u21);
h7 = (3*u21-u03)*(u30+u12)*((u30+u12)^2-3*(u03+u21)^2) ...
    - (u30-3*u12)*(u03+u21)*(3*(u30+u12)^2 - (u03+u21)^2);
 
  
vec = [h1,h2*100,h3*100,h4*10^3,h5*10^5,h6*10^4,h7*10^5];   
disp(vec)
