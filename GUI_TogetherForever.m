function varargout = GUI_TogetherForever(varargin)
% GUI_TOGETHERFOREVER MATLAB code for GUI_TogetherForever.fig
%      GUI_TOGETHERFOREVER, by itself, creates a new GUI_TOGETHERFOREVER or raises the existing
%      singleton*.
%
%      H = GUI_TOGETHERFOREVER returns the handle to a new GUI_TOGETHERFOREVER or the handle to
%      the existing singleton*.
%
%      GUI_TOGETHERFOREVER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_TOGETHERFOREVER.M with the given input arguments.
%
%      GUI_TOGETHERFOREVER('Property','Value',...) creates a new GUI_TOGETHERFOREVER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_TogetherForever_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_TogetherForever_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_TogetherForever

% Last Modified by GUIDE v2.5 14-Apr-2017 20:03:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_TogetherForever_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_TogetherForever_OutputFcn, ...
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


% --- Executes just before GUI_TogetherForever is made visible.
function GUI_TogetherForever_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_TogetherForever (see VARARGIN)

% Choose default command line output for GUI_TogetherForever
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_TogetherForever wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_TogetherForever_OutputFcn(hObject, eventdata, handles) 
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

% Import images from workspace
I1 = evalin ('base', 'Icrop');
I2 = evalin ('base', 'Img.data{in}');
I3 = evalin ('base', 'Img.data{in2}');
% Import 'mood name' from workspace
mood1 = evalin ('base', 'Img.mood{in}');
mood2 = evalin ('base', 'Img.mood{in2}');
% Import emojis from workspace
emoji1 = evalin ('base', 'Img.emoji{in}');
emoji2 = evalin ('base', 'Img.emoji{in2}');
% Import other properties
diff = evalin ('base', 'diff2');
value = evalin ('base', 'value');
username = evalin ('base', 'name');

axes(handles.axes1)
imshow(I1)

switch value
        case 'You'
            % Eigen Results
                 if diff < 100
                    axes(handles.axes2)
                    imshow([I2, I3])
                    axes (handles.axes3)
                    imshow([emoji1, emoji2])
                    set(handles.text2, 'String', ['Your mood is...   ' mood1 '   and   ' mood2])
                    set(handles.text3, 'String', ['Welcome  '  username])
                else
                    axes(handles.axes2)
                    imshow(I2)
                    axes(handles.axes3)
                    imshow(emoji1)
                    set(handles.text2, 'String', ['Your mood is just... ' mood1])
                    set(handles.text3, 'String', ['Welcome  '  username])

                 end
    
        case 'NotYou'
            % Eigen Results
             if diff < 100
    %              Modificar
                axes(handles.axes2)
                imshow(emoji1)
                axes (handles.axes3)
                imshow(emoji2)
                set(handles.text2, 'String', ['but, your mood is...   ' mood1 '   and   ' mood2])
                set(handles.text3, 'String', ['You are not  '  username])
             else 
                axes(handles.axes2)
                imshow(emoji1)
                axes(handles.axes3)
                imshow(emoji1)
                set(handles.text2, 'String', ['but, your mood is just... ' mood1])
                set(handles.text3, 'String', ['You are not  '  username])
             end
        
end






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


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes during object creation, after setting all properties.
function text3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
