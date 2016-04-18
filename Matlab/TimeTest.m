function varargout = TimeTest(varargin)
% TIMETEST MATLAB code for TimeTest.fig
%      TIMETEST, by itself, creates a new TIMETEST or raises the existing
%      singleton*.
%
%      H = TIMETEST returns the handle to a new TIMETEST or the handle to
%      the existing singleton*.
%
%      TIMETEST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TIMETEST.M with the given input arguments.
%
%      TIMETEST('Property','Value',...) creates a new TIMETEST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TimeTest_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TimeTest_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TimeTest

% Last Modified by GUIDE v2.5 16-Sep-2015 22:31:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TimeTest_OpeningFcn, ...
                   'gui_OutputFcn',  @TimeTest_OutputFcn, ...
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


% --- Executes just before TimeTest is made visible.
function TimeTest_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TimeTest (see VARARGIN)

% Choose default command line output for TimeTest
handles.output = hObject;

handles.hTimer = timer;
set(handles.hTimer, 'ExecutionMode','fixedrate','Period',1,...
    'TimerFcn',{@dispnow,handles});
start(handles.hTimer);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TimeTest wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TimeTest_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function dispnow(hObject, eventdata, handles)
set(handles.dispTime,'String',datestr(now));
