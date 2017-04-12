%% Test PCA EIGENFACES
% TestPCA for finding yourself from 6 o 9 photos of different people
%       using PCA Eigenfaces

% Preparing
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
                    M = 6;
                case '9'
                    disp([choice ' snaps chosen'])
                    M = 9;
            end
            Snap_folder = 'PCATest/Training';
 
%     Elegir el tipo de webCam 
%     1 para la webCam normal
%     2 para la webCam de mi tablet
            CamType=1;
            for i=1:M
                
               I=ToDoSnap(CamType);
               I=ReSize(I);
               imwrite(I,['Foto_', num2str(i),'.jpg']);
               movefile(strcat('Foto_', num2str(i),'.jpg'),Snap_folder);
                
            end
            TrainingPCA = imageSet(Snap_folder,'recursive');
        end
        
        
        if answer1 == 2
            % Snaps should be at "PCATest/SavedTraining"
            uiwait(msgbox('Photos have to be at "PCATest/SavedTraining" ', 'WARNING','warn','modal'));
            Snap_folder = 'PCATest/SavedTraining';
            TrainingPCA = imageSet(Snap_folder,'recursive');
        end
        
        
%   Se sale del programa        
        if answer1 == 0
           return; 
        end
        
        close all


% TrainingPCA = imageSet('PCATest/Training','recursive');
dim= size(read(TrainingPCA(1),1),1); % 224  ; % image size
M=TrainingPCA.Count; %9 o 6;        % number faces

for i=1:M
    
    Img.data{i} = read(TrainingPCA(1),i); %Creating an structure with pixel data

end
save classFile Img;



% Beggining
% clc
% clear
% close all
load classFile;
% ScreenSize to plot
scrsz = get(0,'ScreenSize');    
ancho = scrsz(3);               
alto = scrsz (4);
ancho = round (ancho/3);
alto = round (alto/2)-40;
    % Chosing CamType 
%     1 para la webCam normal
%     2 para la webCam de mi tablet
CamType=1;



% TrainingPCA = imageSet('PCATest','recursive');
num=TrainingPCA.Count;
dim=size(read(TrainingPCA(1),1),1);
   
    
if num==9
    z= [ Img.data{1}  Img.data{2}    Img.data{3}; Img.data{4}     Img.data{5}  Img.data{6};...
        Img.data{7} Img.data{8} Img.data{9}];
    figure(1),imshow(z,'Initialmagnification','fit');title('Faces')
end

if num==6
    z= [ Img.data{1}  Img.data{2}    Img.data{3}; Img.data{4}     Img.data{5}  Img.data{6}];
    figure(1),imshow(z,'Initialmagnification','fit');title('Faces')
end


%% Compute Mean
averageImg=zeros(dim);
for i=1:num
    Img.data{i} = im2single(Img.data{i});
    averageImg   = averageImg  + (1/num)*Img.data{i};
end

figure(2),imshow(averageImg,'Initialmagnification','fit');title('average')

%% Normalize (removing mean)
for i=1:num
    Img.dataAvg{i}  = Img.data{i} -averageImg;
end

if num == 9
    z  = [ Img.dataAvg{1}  Img.dataAvg{2}   Img.dataAvg{3}  ; Img.dataAvg{4}     Img.dataAvg{5}  Img.dataAvg{6};...
        Img.dataAvg{7}     Img.dataAvg{8}  Img.dataAvg{9}];
    figure(3),imshow(z,'Initialmagnification','fit');title('z average')
end

if num == 6
    z  = [ Img.dataAvg{1}  Img.dataAvg{2}   Img.dataAvg{3}  ; Img.dataAvg{4}     Img.dataAvg{5}  Img.dataAvg{6}];
    figure(3),imshow(z,'Initialmagnification','fit');title('z average')
end

%% Calc Eigenvectors
% Cenerate A = [ img1(:)  img2(:) ...  imgM(:) ]; calculo de los autovectores
A = zeros(dim*dim,num);% (N*N)*num   2500*4
for i=1:num
    A(:,i) = Img.dataAvg{i}(:);
end
% Covariance matrix small dimension (transposed)
Cov_mat = A'*A;
figure(4),imagesc(Cov_mat);title('covariance')

%% Eigenvectros  in small dimension
[ Eigvec_V, Eigval_D ]  = eig(Cov_mat);% v num*num e num*num only diagonal 4 eigen values
% eigan face in large dimension  A*Eigvec_V is eigen vector of Clarge
Large_V = A*Eigvec_V;% 2500*num*num*num  =2500 *num
% reshape to eigen face
Eigenfaces=[];
for i=1:num
    c_arr  = Large_V(:,i);
    Eigenfaces{i} = reshape(c_arr,dim,dim);
end
diag_eigval=diag(Eigval_D);
[xc,xci]=sort(diag_eigval,'descend');% largest eigenval

if num == 6
    z  = [ Eigenfaces{xci(1)}  Eigenfaces{xci(2)}   Eigenfaces{xci(3)} ; Eigenfaces{xci(4)}     Eigenfaces{xci(5)}   Eigenfaces{xci(6)}];
    figure(5),imshow(z,'Initialmagnification','fit');title('Eigenfaces')
end

if num == 9
    z  = [ Eigenfaces{xci(1)}  Eigenfaces{xci(2)}   Eigenfaces{xci(3)} ; Eigenfaces{xci(4)}     Eigenfaces{xci(5)}   Eigenfaces{xci(6)};...
       Eigenfaces{xci(7)}  Eigenfaces{xci(8)}   Eigenfaces{xci(9)} ];
    figure(5),imshow(z,'Initialmagnification','fit');title('Eigenfaces')
end
%% Weights
nsel=M% select  eigen faces
for img_num=1:num  % image number
  for i=1:nsel   % eigen face for coeff number
    img_weight(img_num,i) =   sum(A(:,img_num).* Eigenfaces{xci(i)}(:)) ;
  end
end

%% Classify new IMG  

NotFinished = false;

while ~NotFinished 

    answer2 = BoxMenu ('Let�s trying to find Yourself','Do you want a new picture?');

        switch answer2
            case 1
              [I, IFaces, bboxes] = Snapshot (CamType);
              Icrop = HOGFeatures (IFaces, bboxes);
              testFace = Icrop;
            case 2
               uiwait(msgbox('Then, choose one :)', 'He he he','warn','modal'));
               [file, location] = uigetfile ('*jpg') ;
               I = imread(strcat(location,file));
               % Image proccesing
               faceDetector = vision.CascadeObjectDetector;
               bboxes = step(faceDetector, I);
               IFaces = insertObjectAnnotation(I, 'rectangle', bboxes, 'Face');
               Icrop = HOGFeatures(IFaces,bboxes);
               testFace = Icrop;
               
            case 0
              close all
              uiwait(msgbox('Bye byeeeeee', 'Haleluyaaa','warn','modal')); 
              return;  
                
        end 

testFace = imresize(testFace,[dim dim]);
testFace   =  im2single(testFace);
figure(6), imshow(testFace,'Initialmagnification','fit'); title('Test Face')
Average_face = testFace(:)-averageImg(:); % normilized face
for(i=1:nsel)
  face_weight(i)  =  sum(Average_face.* Eigenfaces{xci(i)}(:)) ;
end

% compute distance
for img_num=1:num  
    face_sumcur=0;
    for(i=1:nsel)
        face_sumcur = face_sumcur + (face_weight(i) -img_weight(img_num,i)).^2;
    end
    diffWeights(img_num) =   sqrt( face_sumcur);
end
[val in]=min(diffWeights);
diffWeights  =diffWeights.'
figure('Position', [2*ancho 10 ancho alto]), imshow(Img.data{in}),title(['You are THIS ONE']);
end