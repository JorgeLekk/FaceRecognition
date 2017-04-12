function [Img]=ToDoSnap(typeCam)
%%Funnción take a picture from a webcam and crop it

C=webcamlist;
cam=webcam(C{typeCam});
preview(cam);
NotYet = false;

% Create the face detector object.
faceDetector = vision.CascadeObjectDetector;
% Create the point tracker object.
pointTracker = vision.PointTracker('MaxBidirectionalError', 2);
while ~NotYet
    pause(2);
    I = snapshot(cam);
    disp('Tooking a snapshot. checking to find a face ....')
    bboxes = step(faceDetector, I);
    if ~isempty(bboxes)
        disp('A wild Face Appeared!!');
        IFaces = insertObjectAnnotation(I, 'rectangle', bboxes, 'Face');
        figure; 
        imshow(IFaces), title('Detected faces');
        answer = BoxMenu ('Menu', 'Do you want this shot?');
        switch answer
            case 1
                NotYet = true;
                break;
            case 2
                NotYet = false;
            case 0
                NotYet = true;
                break;

        end
        close all
    end
    disp('no face detected D: , repeating...');
end
closePreview(cam);
clear('cam');
IFaces = insertObjectAnnotation(I, 'rectangle', bboxes, 'Face');

% Parte que recorta la foto
for i = 1:size(bboxes,1)
    J= imcrop(IFaces,bboxes(i,:));
end
[rows columns numberOfColorChannels] = size(J);
if numberOfColorChannels > 1
    I = rgb2gray (J);
end

end