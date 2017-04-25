function [Img, hogFeature, visualization] = HOGFeatures (IFaces, bboxes)
% Function that extracts HOGFeatures from an image and plot the results
% this convert the image to grayscale




for i = 1:size(bboxes,1)
    J= imcrop(IFaces,bboxes(i,:));
%     Uncommen to show the image
   figure(3),subplot(2,2,i);imshow(J);
end

[rows columns numberOfColorChannels] = size(J);
if numberOfColorChannels > 1
    I = rgb2gray (J);
end
[I] = ReSize (I);
[hogFeature, visualization]=extractHOGFeatures(I);
% Uncommen to show the features
% figure;
% imshow(I);
% hold on;
% plot(visualization);
% figure;
% subplot(1,2,1);
% imshow(I);title('Main Face');
% subplot(1,2,2);
% plot(visualization);title('HoG Feature');
Img = I;


end