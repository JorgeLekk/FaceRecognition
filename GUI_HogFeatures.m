function varargout = GUI_HogFeatures(varargin)
% GUI_HOGFEATURES MATLAB code for GUI_HogFeatures.fig
%      GUI_HOGFEATURES, by itself, creates a new GUI_HOGFEATURES or raises the existing
%      singleton*.
%
%      H = GUI_HOGFEATURES returns the handle to a new GUI_HOGFEATURES or the handle to
%      the existing singleton*.
%
%      GUI_HOGFEATURES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_HOGFEATURES.M with the given input arguments.
%
%      GUI_HOGFEATURES('Property','Value',...) creates a new GUI_HOGFEATURES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_HogFeatures_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_HogFeatures_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_HogFeatures

% Last Modified by GUIDE v2.5 14-Apr-2017 13:49:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_HogFeatures_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_HogFeatures_OutputFcn, ...
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


% --- Executes just before GUI_HogFeatures is made visible.
function GUI_HogFeatures_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_HogFeatures (see VARARGIN)

% Choose default command line output for GUI_HogFeatures
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_HogFeatures wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_HogFeatures_OutputFcn(hObject, eventdata, handles) 
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

text = evalin('base', 'personLabel');
I1 = evalin ('base', 'Icrop');
I2 = evalin ('base', 'Img');


axes(handles.axes1)
imshow(I1)
axes(handles.axes2)
imshow(I2)

set(handles.text2, 'String', text)


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
