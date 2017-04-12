function [Img] = ReSize (I)
% This Function just resize the image to a dim stablished, 
dim= [224,224];

I = imresize(I, dim);
Img = I;


end