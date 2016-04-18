function varargout = MouseFcn(varargin)
% MOUSEFCN MATLAB code for MouseFcn.fig
%      MOUSEFCN, by itself, creates a new MOUSEFCN or raises the existing
%      singleton*.
%
%      H = MOUSEFCN returns the handle to a new MOUSEFCN or the handle to
%      the existing singleton*.
%
%      MOUSEFCN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MOUSEFCN.M with the given input arguments.
%
%      MOUSEFCN('Property','Value',...) creates a new MOUSEFCN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MouseFcn_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MouseFcn_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MouseFcn

% Last Modified by GUIDE v2.5 17-Sep-2015 10:25:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MouseFcn_OpeningFcn, ...
                   'gui_OutputFcn',  @MouseFcn_OutputFcn, ...
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


% --- Executes just before MouseFcn is made visible.
function MouseFcn_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MouseFcn (see VARARGIN)

% Choose default command line output for MouseFcn
handles.output = hObject;
global  ButtonDown position;
ButtonDown = 0;position = [0 0 0;0 0 0];
set(handles.axes1,'XLim',[-1 1],'YLim',[-1 1]);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MouseFcn wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MouseFcn_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global ButtonDown position;

if strcmp(get(gcf,'SelectionType'),'normal')
  
  position = get(handles.axes1, 'CurrentPoint');
  ButtonDown = 1;
end 

 
% --- Executes on mouse motion over figure - except title and menu. 
function figure1_WindowButtonMotionFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ButtonDown position;  
if ButtonDown == 1
    pos = get(handles.axes1, 'CurrentPoint');
    line([position(1,1), pos(1,1)],[position(1,2),pos(1,2)]); 
    position = pos; 
end     

  

% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonUpFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ButtonDown ;
 ButtonDown = 0;
% warndlg('Are you sure?','·¨¿Ë','Modal')
