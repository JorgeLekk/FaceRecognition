function [Img, IFaces, bboxes] = Snapshot (typeCam)
%% Function to take snaps with a webcam, TypeCam is the number of the webcam for your computer
% Finally you get the snap aht IFaces with bboxes (face located)

% Cam recognition
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
figure, imshow(IFaces), title('Detected faces');
Img = I;

end