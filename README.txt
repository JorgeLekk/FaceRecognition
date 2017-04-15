Running GUI_Menu.m from Matlab Command Prompt
==============================================

Main Functions
	TestPCA.m 				-> Run this the test in order to find yourself from 6 o 9 photos of different people using PCA Eigenfaces
	TestMoodPCA.m 			-> Run this test in order to identify your "mood" from a new snap using PCA Eigenfaces
	TestHoGG.m				-> Run this test in order to recognize you from a new snap, usig HOGFeatures
	TestTogetherForever.m 	-> Run this in order to mix both (TestMoodPCA & TestHoGG), this will recognize you from a new snap and identify your "mood" from that one

								
								
*GUI_Menu* will manage all main functions but it is possible to run them separately without any problem


Main Figures:
	GUI_HogFeatures
	GUI_Menu
	GUI_MoodPCA
	GUI_PCA
	GUI_TogetherForever

Except GUI_Menu, the rest figures show the results of each test, GUI_Menu is the main interface and there will be
10 secs to "Show Results"



What is needed...
	For 'Find Myself' which is the same as TestPCA.m
		if you want more snaps, there is no problem but if dont, 
		it is needed 6 or 9 photos at 'PCATest/SavedTraining' folder of different people
		
	For 'Mood Checking' which is the same as TestMoodPCA.m
		if you want more snaps, there is no problem but if dont, 
		it is needed 6 or 9 photos at 'PCAMood/Pool' folder of the same person
		mood6 = {'Happy', 'Bored', 'Crazy', 'Angry', 'Sleepy', 'Sad'};
		mood9 = {'Happy', 'Bored', 'Crazy', 'Angry', 'Sleepy', 'Sad', 'Smart' , 'Thankful' , 'Weird'};
		this must be the order of the 'mood' photos
	
	For 'User Verification' which is the same as TestHoGG.m
		if you want more snaps, there is no problem but if dont, 
		it is needed 6 photos at 'HOGGTest/Prueba' folder of the same person
		
	For 'User Verification with Mood checking' which is the same as TestTogetherForever.m
		if you want more snaps, there is no problem but if dont, 
		it is needed 6 or 9 photos at 'PCAMood/Pool' folder of the same person
		mood6 = {'Happy', 'Bored', 'Crazy', 'Angry', 'Sleepy', 'Sad'};
		mood9 = {'Happy', 'Bored', 'Crazy', 'Angry', 'Sleepy', 'Sad', 'Smart' , 'Thankful' , 'Weird'};
		this must be the 'mood' photos order
		
		
Other functions
	BoxMenu.m
	HOGFeatures.m
	Snapshot.m
	ReSize.m