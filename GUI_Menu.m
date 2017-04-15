function varargout = GUI_Menu(varargin)
% GUI_MENU MATLAB code for GUI_Menu.fig
%      GUI_MENU, by itself, creates a new GUI_MENU or raises the existing
%      singleton*.
%
%      H = GUI_MENU returns the handle to a new GUI_MENU or the handle to
%      the existing singleton*.
%
%      GUI_MENU('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_MENU.M with the given input arguments.
%
%      GUI_MENU('Property','Value',...) creates a new GUI_MENU or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_Menu_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_Menu_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_Menu

% Last Modified by GUIDE v2.5 15-Apr-2017 18:01:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_Menu_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_Menu_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before GUI_Menu is made visible.
function GUI_Menu_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_Menu (see VARARGIN)

% Choose default command line output for GUI_Menu
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_Menu wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_Menu_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function userName_Callback(hObject, eventdata, handles)
% hObject    handle to userName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of userName as text
%        str2double(get(hObject,'String')) returns contents of userName as a double

UI = get (handles.userName, 'String');
a= char(UI);
assignin('base', 'name', a);
% set(handles.text4, 'String', UI);


% --- Executes during object creation, after setting all properties.
function userName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to userName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

assignin ('base', 'CamType',1);
assignin ('base', 'name', []);


% --- Executes on button press in Test_PCA.
function Test_PCA_Callback(hObject, eventdata, handles)
% hObject    handle to Test_PCA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Test_PCA
evalin('base','TestPCA')


% --- Executes on button press in Test_MoodPCA.
function Test_MoodPCA_Callback(hObject, eventdata, handles)
% hObject    handle to Test_MoodPCA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Test_MoodPCA
evalin('base','TestMoodPCA')

% --- Executes on button press in Test_HogFeatures.
function Test_HogFeatures_Callback(hObject, eventdata, handles)
% hObject    handle to Test_HogFeatures (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Test_HogFeatures

evalin('base','TestHOGG')

% --- Executes on button press in Test_TogetherForever.
function Test_TogetherForever_Callback(hObject, eventdata, handles)
% hObject    handle to Test_TogetherForever (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Test_TogetherForever
evalin('base','TestTogetherForever')

% --- Executes during object creation, after setting all properties.
function Test_PCA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Test_PCA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function Test_MoodPCA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Test_MoodPCA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function Test_HogFeatures_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Test_HogFeatures (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function Test_TogetherForever_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Test_TogetherForever (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in clearWorkspace.
function clearWorkspace_Callback(hObject, eventdata, handles)
% hObject    handle to clearWorkspace (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
evalin( 'base', 'clearvars -except name CamType' )


% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close (GUI_Menu)

% --- Executes during object creation, after setting all properties.
function clearWorkspace_CreateFcn(hObject, eventdata, handles)
% hObject    handle to clearWorkspace (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function exit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on selection change in webCamChoice.
function webCamChoice_Callback(hObject, eventdata, handles)
% hObject    handle to webCamChoice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns webCamChoice contents as cell array
%        contents{get(hObject,'Value')} returns selected item from webCamChoice
choice = get(hObject, 'Value');
assignin('base', 'CamType',choice)



% --- Executes during object creation, after setting all properties.
function webCamChoice_CreateFcn(hObject, eventdata, handles)
% hObject    handle to webCamChoice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
