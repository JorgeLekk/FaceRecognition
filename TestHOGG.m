%% Test HOGFEATURES
% TestHoGG in order to recognize you from a new snap, usig HOGFeatures
% a pool of photos will be used to train a classifier in order to recognize
% your face from a new snap



% Uncomment to do this test apart
% clc
% clear
% close all
% name = []

%% WebCam setup
% This is commented because it was chosen at GUI_Menu
%     1 para la webCam normal
%     2 para la webCam de mi tablet
%             CamType=1;

% Load EmojiDatabase for results
    emoji1 = imread('Emojis/1.png');
    emoji2 = imread('Emojis/4.png');

%% Name Verification
name;
if isempty(name) == 1
    name = inputdlg('Introduzca su nombre por favor: ','Bienvenido');
end
%% To see if its necessary to do new snaps

Snap_folder =0;
 answer1 = BoxMenu ('Menu', 'Do you want new snaps?');
            
        if answer1 == 1  
            choice = questdlg('Number of New Photos?', ...
        'New Snap Pool','6','9', 'fix');
        % Handle response
            switch choice
                case '6'
                    rmdir('HOGGTest/Repositorio/You','s');
                    disp([choice ' snaps chosen!'])
                    num = 6;
                case '9'
                    rmdir('HOGGTest/Repositorio/You','s');
                    disp([choice ' snaps chosen'])
                    num = 9;
            end
            mkdir('HOGGTest/Repositorio/You');
            Snap_folder = 'HOGGTest/Repositorio/You';
 

            for i=1:num
                uiwait(msgbox('Let`s snap', 'Be Smart plz','warn','modal'));
               [~, IFaces, bboxes] = Snapshot (CamType);
               I = HOGFeatures(IFaces, bboxes);
               I=ReSize(I);
               imwrite(I,['Foto_', num2str(i),'.jpg']);
               movefile(strcat('Foto_', num2str(i),'.jpg'),Snap_folder);
                
            end
        end
        
        
        if answer1 == 2
            rmdir('HOGGTest/Repositorio/You','s');
            mkdir('HOGGTest/Repositorio/You');
            % Choose the folder with photos to train 
            uiwait(msgbox('Choose "Prueba Folder" PLZ', 'Be Smart plz','warn','modal'));
            disp('Selección de Repositorio de tus fotos, sugerencia "Prueba"');
            folder_name = uigetdir('HOGGTest/Prueba','selecciona el repositorio');
            Snap_folder = 'HOGGTest/Repositorio/You';
            
        end
        
        
%  Se sale del programa        
        if answer1 == 0
           GUI_Menu
           return; 
        end
        
        close all
 
%% Create the imageSet and copying 

 if answer1 == 2
        MeDatabase = imageSet(folder_name,'recursive');
        % Convertimos todas las fotos al mismo tamaño y creamos una copia en el
        % directorio que se ha elegido
        for i=1:MeDatabase.Count
            % Lectura de la imagen
            I = read(MeDatabase(1),i);
            [Img] = ReSize (I);
            imwrite(Img,['Foto_', num2str(i),'.jpg']);
            movefile(strcat('Foto_', num2str(i),'.jpg'),Snap_folder);
        end
        
 elseif answer1 == 1
     MeDatabase = imageSet(Snap_folder, 'recursive');
     Img = read(MeDatabase(1),1);
 end

%% Show a montage of the training photos
FaceDatabase = imageSet(Snap_folder, 'recursive');
figure;
montage(FaceDatabase.ImageLocation);
title('Images of YOU');

%% Sacamos las HOGFeatures para entrenarlas
TrainingDatabase = imageSet('HOGGTest/Repositorio','recursive');
featureCount =1;
for i=1:size(TrainingDatabase,2) % Para contar los 41 Folders
     for j = 1:TrainingDatabase(i).Count
        trainingFeatures(featureCount,:) = extractHOGFeatures(read(TrainingDatabase(i),j));
        trainingLabel{featureCount} = TrainingDatabase(i).Description;    
        featureCount = featureCount + 1;
    end
    personIndex{i} = TrainingDatabase(i).Description;
end

%% Creating class using fitcecoc
faceClassifier = fitcecoc(trainingFeatures,trainingLabel);

%% Classify new IMG

NotFinished = false;

while ~NotFinished 
    pause (3)
    [I, IFaces, bboxes] = Snapshot (CamType);

    %% HOG Features from image
    [Icrop, hogFeature1, visualization1] = HOGFeatures (IFaces, bboxes);
    %% testing the classifier
    personLabel = predict (faceClassifier, hogFeature1);
    value = char(personLabel);
    
% Configuration of msgbox
%     h= msgbox(personLabel,'And the result is...');
%     set(h, 'position', [100 440 400 100]); %makes box bigger
%     ah = get( h, 'CurrentAxes' );
%     ch = get( ah, 'Children' );
%     set( ch, 'FontSize', 20 ); %makes text bigger
    
    
    %% Show Matlab GUI
    close all
    run GUI_HogFeatures.m
    pause (10)

        %% Decimos si queremos terminar de hacer pruebas
        answer3 = BoxMenu ('Menu', 'Let''s take a new picture to compare?');    

        switch answer3
        case 1
            NotFinished = false;
        case 2
            close all
            uiwait(msgbox('Bye byeeeeee', 'Haleluyaaa','warn','modal'));
            NotFinished = true;
            close (GUI_HogFeatures)
            GUI_Menu
            return;
        case 0
            close all
            uiwait(msgbox('Bye byeeeeee', 'Haleluyaaa','warn','modal'));
            NotFinished = true;
            close (GUI_HogFeatures)
            GUI_Menu
            return;
        end

end
