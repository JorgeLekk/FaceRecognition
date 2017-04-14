%% Test HOGFEATURES
% TestHoGG in order to recognize you from a new snap, usig HOGFeatures
% a pool of photos will be used to train a classifier in order to recognize
% your face from a new snap



clc
clear
close all

%% To see if its necessary to do new snaps

Snap_folder =0;
 answer1 = BoxMenu ('Menu', 'Do you want new snaps?');
            
        if answer1 == 1  
            choice = questdlg('Number of New Photos?', ...
        'New Snap Pool','6','9', 'fix');
        % Handle response
            switch choice
                case '6'
                    disp([choice ' snaps chosen!'])
                    num = 6;
                case '9'
                    disp([choice ' snaps chosen'])
                    num = 9;
            end
            
            Snap_folder = 'HOGGTest/Repositorio/Me';
 
%     Elegir el tipo de webCam 
%     1 para la webCam normal
%     2 para la webCam de mi tablet
            CamType=1;
            for i=1:num
               [Img, IFaces, bboxes] = Snapshot (CamType);
               I = HOGFeatures;
%                Añadidas las otras lineas para ver si funciona
%                I=ToDoSnap(CamType);
               I=ReSize(I);
               imwrite(I,['Foto_', num2str(i),'.jpg']);
               movefile(strcat('Foto_', num2str(i),'.jpg'),Snap_folder);
                
            end
        end
        
        
        if answer1 == 2
            % Seleccionamos el Repositorio de Fotos a Entrenar
            uiwait(msgbox('Choose "Prueba Folder" PLZ', 'Be Smart plz','warn','modal'));
            disp('Selección de Repositorio de tus fotos, sugerencia "Prueba"');
            folder_name = uigetdir('HOGGTest/Prueba','selecciona el repositorio');
            Snap_folder = 'HOGGTest/Repositorio/Me';
            
        end
        
        
%  Se sale del programa        
        if answer1 == 0
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

%% Se crea el clasificador usando fitcecoc
faceClassifier = fitcecoc(trainingFeatures,trainingLabel);

% Para el final
%% Elegir el tipo de webCam 
%     1 para la webCam normal
%     2 para la webCam de mi tablet
CamType=1;

NotFinished = false;

while ~NotFinished 
    pause (3)
    [I, IFaces, bboxes] = Snapshot (CamType);

    %% Sacamos las HOGFeatures de la foto
    [Icrop, hogFeature1, visualization1] = HOGFeatures (IFaces, bboxes);
    %% Probamos si funciona el clasificador
    personLabel = predict (faceClassifier, hogFeature1);
    
% Configuration of msgbox
%     h= msgbox(personLabel,'And the result is...');
%     set(h, 'position', [100 440 400 100]); %makes box bigger
%     ah = get( h, 'CurrentAxes' );
%     ch = get( ah, 'Children' );
%     set( ch, 'FontSize', 20 ); %makes text bigger
    
    
    %% Show Matlab GUI
    close all
    run GUI_HogFeatures.m
    pause (5)

        %% Decimos si queremos terminar de hacer pruebas
        answer3 = BoxMenu ('Menu', 'Do you want More Snaps?');    

        switch answer3
        case 1
            NotFinished = false;
        case 2
            close all
            uiwait(msgbox('Bye byeeeeee', 'Haleluyaaa','warn','modal'));
            NotFinished = true;
            close (GUI_HogFeatures)
            return;
        case 0
            close all
            uiwait(msgbox('Bye byeeeeee', 'Haleluyaaa','warn','modal'));
            NotFinished = true;
            close (GUI_HogFeatures)
            return;
        end

end
