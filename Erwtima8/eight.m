I = imread('image2.png');
[centersD, radiiD, metricD] = imfindcircles(J,[20 25],'ObjectPolarity','dark','Sensitivity',0.92,'Method','twostage');
hold on
viscircles(centersD, radiiD,'EdgeColor','b');
hold off
 centers = cat(1,centersD,centersB);
 radii = cat(1,radiiD,radiiB);
R = zeros(s);
C = zeros(s);
for i = 1:length(radii)
    A0 = pi*radii(i)^2;
    AR = (2*radii(i))^2;
    R(i) = A0/AR;
    %circularity measure
    A = A0;
    P = 4*(2*radii(i));
    C(i) = P^2/A;
end