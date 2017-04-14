function varargout = GUI_MoodPCA(varargin)
% GUI_MOODPCA MATLAB code for GUI_MoodPCA.fig
%      GUI_MOODPCA, by itself, creates a new GUI_MOODPCA or raises the existing
%      singleton*.
%
%      H = GUI_MOODPCA returns the handle to a new GUI_MOODPCA or the handle to
%      the existing singleton*.
%
%      GUI_MOODPCA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_MOODPCA.M with the given input arguments.
%
%      GUI_MOODPCA('Property','Value',...) creates a new GUI_MOODPCA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_MoodPCA_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_MoodPCA_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_MoodPCA

% Last Modified by GUIDE v2.5 14-Apr-2017 19:39:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_MoodPCA_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_MoodPCA_OutputFcn, ...
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


% --- Executes just before GUI_MoodPCA is made visible.
function GUI_MoodPCA_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_MoodPCA (see VARARGIN)

% Choose default command line output for GUI_MoodPCA
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_MoodPCA wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_MoodPCA_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I1 = evalin ('base', 'Icrop');
I2 = evalin ('base', 'Img.data{in}');
I3 = evalin ('base', 'Img.data{in2}');
mood1 = evalin ('base', 'Img.mood{in}');
mood2 = evalin ('base', 'Img.mood{in2}');
emoji1 = evalin ('base', 'Img.emoji{in}');
emoji2 = evalin ('base', 'Img.emoji{in2}');
diff = evalin ('base', 'diff2');

axes(handles.axes1)
imshow(I1)
    if diff < 100
        axes(handles.axes2)
        imshow([I2, I3])
        axes (handles.axes3)
        imshow([emoji1, emoji2])
        set(handles.text2, 'String', ['Your mood is...   ' mood1 '   and   ' mood2])
    else
        axes(handles.axes2)
        imshow(I2)
        axes(handles.axes3)
        imshow(emoji1)
        set(handles.text2, 'String', ['Your mood is just... ' mood1])
        
    end





% --- Executes during object creation, after setting all properties.
function text2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2


% --- Executes during object creation, after setting all properties.
function axes3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: place code in OpeningFcn to populate axes3
