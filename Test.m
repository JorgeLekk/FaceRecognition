%% Mother File
% Here is run the 4 different options of this program
% A -> TestPCA for finding yourself from 6 o 9 photos of different people
%       using PCA Eigenfaces
% B -> TestHoGG in order to recognize you from a new snap, usig HOGFeatures
% C -> TestMoodPCA in order to identify your "mood" from a new snap using
%       PCA Eigenfaces
% D -> TestTogetherForever in order to mix both, this will recognize you
%       from a new snap and identify your "mood" from that one.
% E -> Exit the program
% 


clc
clear
close all

%% Chosing the Test

choice = questdlg('Do you want to find YOURSELF of Knowing if YOU are YOU?', ...
	'Choosing Test', ...
	'Find Myself','Knowing if I am ME','I wanna run away from this!!', 'fix');
% Handle response
switch choice
    case 'Find Myself'
        disp([choice ' he he he The game has begun!'])
        answer = 1;
       
        choice = questdlg('Find YOURSELF or KNOWING YOUR MOOD?', ...
        'He he he', ...
        'Find Myself','Please, tell me my mood','I really wanna run away from this!!', 'fix');
        
        switch choice
            case 'Find Myself'
                answer =1;
                disp([choice ' Really... an epic mistake...'])
            case 'Please, tell me my mood'
                disp([choice ' Let큦 see the failure'])
                answer = 3;
            case 'I really wanna run away from this!!'
                disp([choice ' Lucky Guy...'])
                answer = 0;
         end
        
        
    case 'Knowing if I am ME'
        disp([choice ' Maybe this has beed an epic mistake...'])
        answer = 2;       
    case 'I wanna run away from this!!'
        disp([choice ' Lucky Guy...'])
        answer = 0;
end

if answer == 1
    run 'TestPCA'
    
elseif answer == 2
    run 'TestHOGG.m'
    
elseif answer == 3
    choice = questdlg('Find YOURSELF or KNOWING YOUR MOOD?', ...
        'He he he', ...
        'Tell me my mood plz','Let큦 discover if I am Me and Guess my MOOD','I really wanna run away from this!!', 'fix');
        
        switch choice
            case 'Tell me my mood plz'
                run 'TestMoodPCA.m'
                disp([choice ' Really... an epic mistake...'])
            case 'Let큦 discover if I am Me and Guess my MOOD'
                disp([choice ' Let큦 see the failure'])
                run 'TestTogetherForever.m';
            case 'I really wanna run away from this!!'
                disp([choice ' Lucky Guy...'])
                answer = 0;
         end
    

    
    
elseif answer == 0
    h= msgbox('You are a jerk but at the same time a smart guy' ,'And the conclusion is that...');
    set(h, 'position', [100 400 400 70]); %makes box bigger
    ah = get( h, 'CurrentAxes' );
    ch = get( ah, 'Children' );
    set( ch, 'FontSize', 15 ); %makes text bigger
    return;
end