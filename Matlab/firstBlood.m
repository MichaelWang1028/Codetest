function varargout = firstBlood(varargin)
% FIRSTBLOOD MATLAB code for firstBlood.fig
%      FIRSTBLOOD, by itself, creates a new FIRSTBLOOD or raises the existing
%      singleton*.
%
%      H = FIRSTBLOOD returns the handle to a new FIRSTBLOOD or the handle to
%      the existing singleton*.
%
%      FIRSTBLOOD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FIRSTBLOOD.M with the given input arguments.
%
%      FIRSTBLOOD('Property','Value',...) creates a new FIRSTBLOOD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before firstBlood_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to firstBlood_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help firstBlood

% Last Modified by GUIDE v2.5 17-Sep-2015 15:43:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;  
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @firstBlood_OpeningFcn, ...
                   'gui_OutputFcn',  @firstBlood_OutputFcn, ...
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


% --- Executes just before firstBlood is made visible.
function firstBlood_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to firstBlood (see VARARGIN)

% Choose default command line output for firstBlood
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes firstBlood wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = firstBlood_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in btnDraw.
function btnDraw_Callback(hObject, eventdata, handles)
% hObject    handle to btnDraw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%绘制三维曲面
hsurfc=surf(peaks(30),'FaceColor','blue');
%保存三维曲面的句柄
handles.hsurface=hsurfc;
guidata(hObject,handles);
%设置相应的文本显示当前色彩数值
set(handles.txtRed,'String','Red:0');
set(handles.txtGreen,'String','Green:0');
set(handles.txtBlue,'String','Blue:1');


% --- Executes on button press in btnChangeColor.
function btnChangeColor_Callback(hObject, eventdata, handles)
% hObject    handle to btnChangeColor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%修改曲面色彩
%获取曲面的句柄
hsurf = handles.hsurface;
%hsurf=findobj(gcf,'Type','Surface');
%生成随机的色彩
newColor = rand(1,3);
handles.newColor = newColor;
set(handles.sliderRedColor,'Value',newColor(1)); 
set(handles.sliderGreenColor,'Value',newColor(2)); 
set(handles.sliderBlueColor,'Value',newColor(3)); 
guidata(hObject,handles);
set(hsurf,'FaceColor',newColor);%Setfacecolorofsurface
%设置相应的文本显示当前色彩数值
set(handles.txtRed,'String',  ['Red:   ',num2str(newColor(1))]);
set(handles.txtGreen,'String',['Green:',num2str(newColor(2))]);
set(handles.txtBlue,'String', ['Blue:  ' ,num2str(newColor(3))]);



% --- Executes on slider movement.
function sliderRedColor_Callback(hObject, eventdata, handles)
% hObject    handle to sliderRedColor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
% 修改曲面的边缘色彩
% 获取对象句柄
hsurf = handles.hsurface;
%hsurf = findobj(gcf,'Type','Surface'); % Get handle to surface
% 获取滚动条当前的数值
newRed = get(hObject,'Value'); % Get new color from slider
% 设置新的色彩数值
%currentColor= rand(1,3); % Assign value to first element of HSV
handles.newColor(1) = newRed;
guidata(hObject,handles);
set(handles.txtRed,'String',  ['Red:   ',num2str(handles.newColor(1))]);
set(handles.hsurface,'FaceColor',handles.newColor);%Setfacecolorofsurface


% --- Executes during object creation, after setting all properties.
function sliderRedColor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderRedColor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
usewhitebg=1;
if usewhitebg
	set(hObject,'BackgroundColor',[.9,.9,.9]);
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



% --------------------------------------------------------------------
function CleartheAxes_Callback(hObject, eventdata, handles)
% hObject    handle to CleartheAxes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function haha_Callback(hObject, eventdata, handles)
% hObject    handle to haha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function en_Callback(hObject, eventdata, handles)
% hObject    handle to en (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla;

% --------------------------------------------------------------------
function enenen_Callback(hObject, eventdata, handles)
% hObject    handle to enenen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function sliderGreenColor_Callback(hObject, eventdata, handles)
% hObject    handle to sliderGreenColor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
hsurf = handles.hsurface;
%hsurf = findobj(gcf,'Type','Surface'); % Get handle to surface
% 获取滚动条当前的数值
newGreen = get(hObject,'Value'); % Get new color from slider
% 设置新的色彩数值
%currentColor= rand(1,3); % Assign value to first element of HSV
handles.newColor(2) = newGreen;
set(handles.txtGreen,'String',['Green:',num2str(handles.newColor(2))]);
set(handles.hsurface,'FaceColor',handles.newColor);%Setfacecolorofsurface
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function sliderGreenColor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderGreenColor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderBlueColor_Callback(hObject, eventdata, handles)
% hObject    handle to sliderBlueColor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
hsurf = handles.hsurface;
%hsurf = findobj(gcf,'Type','Surface'); % Get handle to surface
% 获取滚动条当前的数值
newBlue = get(hObject,'Value'); % Get new color from slider
% 设置新的色彩数值
%currentColor= rand(1,3); % Assign value to first element of HSV
handles.newColor(3) = newBlue;
guidata(hObject,handles);
set(handles.txtBlue,'String',['Blue:',num2str(handles.newColor(3))]);
set(handles.hsurface,'FaceColor',handles.newColor);%Setfacecolorofsurface


% --- Executes during object creation, after setting all properties.
function sliderBlueColor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderBlueColor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
