function varargout = MuitiGuiDateSon(varargin)
% MUITIGUIDATESON MATLAB code for MuitiGuiDateSon.fig
%      MUITIGUIDATESON, by itself, creates a new MUITIGUIDATESON or raises the existing
%      singleton*.
%
%      H = MUITIGUIDATESON returns the handle to a new MUITIGUIDATESON or the handle to
%      the existing singleton*.
%
%      MUITIGUIDATESON('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MUITIGUIDATESON.M with the given input arguments.
%
%      MUITIGUIDATESON('Property','Value',...) creates a new MUITIGUIDATESON or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MuitiGuiDateSon_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MuitiGuiDateSon_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MuitiGuiDateSon

% Last Modified by GUIDE v2.5 25-Sep-2015 18:35:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MuitiGuiDateSon_OpeningFcn, ...
                   'gui_OutputFcn',  @MuitiGuiDateSon_OutputFcn, ...
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


% --- Executes just before MuitiGuiDateSon is made visible.
function MuitiGuiDateSon_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MuitiGuiDateSon (see VARARGIN)

% Choose default command line output for MuitiGuiDateSon
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MuitiGuiDateSon wait for user response (see UIRESUME)
%uiwait(handles.figB);


% --- Outputs from this function are returned to the command line.
function varargout = MuitiGuiDateSon_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
%varargout{1} = handles.output;
uiwait(gcf);
tmp =getappdata(0,'settings');
varargout{1}=tmp;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

spec_data.length = 20;
spec_data.weight = 200;
setappdata(0,'settings',spec_data);
%uiresume(handles.figB);
