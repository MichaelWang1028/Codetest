function varargout = guiDesign(varargin)
% GUIDESIGN MATLAB code for guiDesign.fig
%      GUIDESIGN, by itself, creates a new GUIDESIGN or raises the existing
%      singleton*.
%
%      H = GUIDESIGN returns the handle to a new GUIDESIGN or the handle to
%      the existing singleton*.
%
%      GUIDESIGN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIDESIGN.M with the given input arguments.
%
%      GUIDESIGN('Property','Value',...) creates a new GUIDESIGN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guiDesign_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guiDesign_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guiDesign

% Last Modified by GUIDE v2.5 16-Sep-2015 22:11:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guiDesign_OpeningFcn, ...
                   'gui_OutputFcn',  @guiDesign_OutputFcn, ...
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


% --- Executes just before guiDesign is made visible.
function guiDesign_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guiDesign (see VARARGIN)

% Choose default command line output for guiDesign
handles.output = hObject;
set(handles.figure1,'Name','逗逼就是你');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes guiDesign wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = guiDesign_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function enen_Callback(hObject, eventdata, handles)
% hObject    handle to enen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function hContexMenu_Callback(hObject, eventdata, handles)
% hObject    handle to hContexMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function hContexMenu2_Callback(hObject, eventdata, handles)
% hObject    handle to hContexMenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_8_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function a_Callback(hObject, eventdata, handles)
% hObject    handle to a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.figure1,'Name','逗逼就是你...');
set(handles.figure1,'UIContextMenu',handles.hContexMenu2);


% --------------------------------------------------------------------
function e_Callback(hObject, eventdata, handles)
% hObject    handle to e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
