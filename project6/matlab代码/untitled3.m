function varargout = untitled3(varargin)
% UNTITLED3 MATLAB code for untitled3.fig
%      UNTITLED3, by itself, creates a new UNTITLED3 or raises the existing
%      singleton*.
%
%      H = UNTITLED3 returns the handle to a new UNTITLED3 or the handle to
%      the existing singleton*.
%
%      UNTITLED3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED3.M with the given input arguments.
%
%      UNTITLED3('Property','Value',...) creates a new UNTITLED3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled3

% Last Modified by GUIDE v2.5 29-Dec-2022 11:25:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled3_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled3_OutputFcn, ...
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


% --- Executes just before untitled3 is made visible.
function untitled3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled3 (see VARARGIN)

% Choose default command line output for untitled3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on mouse press over axes background.
function axes6_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
%菜单栏-文件-打开
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im; 
time_string = num2str(datestr(now,'yyyy-mm-dd-HH:MM:SS'));
[filename,pathname] = uigetfile({'*.*';'*.bmp';'*.tif';'*.png'},'选择图片'); 
str=[pathname filename]; 
im=imread(str);  %打开文件
set(handles.listbox3,'string',strvcat(get(handles.listbox3,'string'),[time_string,'>> 打开图片成功']));
axes(handles.axes5); 
imshow(im); 


% --------------------------------------------------------------------
%菜单栏-文件-保存
function Untitled_5_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global BW; %定义变量作为输出图像
time_string = num2str(datestr(now,'yyyy-mm-dd-HH:MM:SS'));
[filename,pathname,filterindex]=uiputfile({'*.bmp';'*.tif';'*.png'},'保存输出图片');
if filterindex==0
return  %如果取消操作，返回
else
str=[pathname filename]; 
axes(handles.axes6);  %输出图像
imwrite(BW,str);  %保存图片
set(handles.listbox3,'string',strvcat(get(handles.listbox3,'string'),[time_string,'>> 图片已保存']));
%将文件保存成功的信息记录与（log）
end


% --------------------------------------------------------------------
%菜单栏-文件-退出
function Untitled_6_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;
clear all;
close(gcf);


% --- Executes on selection change in popupmenu3.
%弹出式菜单
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3
contents = cellstr(get(hObject,'string'));
time_string = num2str(datestr(now,'yyyy-mm-dd-HH:MM:SS'));
item_index = get(hObject,'value');
set(handles.listbox3,'string',strvcat(get(handles.listbox3,'string'),[time_string,'>> ',contents{item_index}]));%记录当前图片
global im;
val=get(hObject,'Value');
switch contents{val}
    case 'lena.bmp'  
        im=imread('D:\Matlab R2021a\toolbox\images\imdata\源图像\lena.bmp');
        axes(handles.axes5); 
        imshow(im);  
     case'bank.bmp' 
        im=imread('D:\Matlab R2021a\toolbox\images\imdata\源图像\bank.bmp'); 
        axes(handles.axes5); 
        imshow(im);
    case'jet.bmp'
        im=imread('D:\Matlab R2021a\toolbox\images\imdata\源图像\jet.bmp'); 
        axes(handles.axes5); 
        imshow(im);
    case'rice.bmp'
        im=imread('D:\Matlab R2021a\toolbox\images\imdata\源图像\rice.bmp'); 
        axes(handles.axes5); 
        imshow(im);
    case'camera.bmp'
        im=imread('D:\Matlab R2021a\toolbox\images\imdata\源图像\camera.bmp'); 
        axes(handles.axes5); 
        imshow(im);
end


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
%操作面板-确定
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global BW;
axes(handles.axes6);%输出图像
imshow(BW);


% --------------------------------------------------------------------
%菜单栏-帮助-关于 功能：作者信息
function Untitled_15_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hObject = msgbox({'电子科技大学';'格拉斯哥学院';'曾俊皓';'2021190505037'},'关于作者','none','non-modal');
ht = findobj(hObject, 'Type', 'text');
set(ht, 'FontSize', 12, 'Unit', 'normal');
set(hObject, 'Position', [200 200 150 150]);%窗口位置


% --------------------------------------------------------------------
%菜单栏-处理-灰度调整
function Untitled_7_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global BW;
global im;
global x; 
BW = histeq(im,x);


% --- Executes when selected object is changed in uibuttongroup4.
%参数面板-灰度选择
function uibuttongroup4_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup4 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x;%定义全局变量灰度值参数x
x=2;%默认调整为二值图像
time_string = num2str(datestr(now,'yyyy-mm-dd-HH:MM:SS'));
switch get(eventdata.NewValue,'Tag')
    case 'radiobutton11'
        x=256;
        set(handles.listbox3,'string',strvcat(get(handles.listbox3,'string'),[time_string,'>> 灰度选择256']));
    case 'radiobutton12'
        x=128;
        set(handles.listbox3,'string',strvcat(get(handles.listbox3,'string'),[time_string,'>> 灰度选择128']));
    case 'radiobutton13'
        x=64;
        set(handles.listbox3,'string',strvcat(get(handles.listbox3,'string'),[time_string,'>> 灰度选择64']));
    case 'radiobutton14'
        x=32;
        set(handles.listbox3,'string',strvcat(get(handles.listbox3,'string'),[time_string,'>> 灰度选择32']));
    case 'radiobutton15'
        x=16;
        set(handles.listbox3,'string',strvcat(get(handles.listbox3,'string'),[time_string,'>> 灰度选择16']));
    case 'radiobutton16'
        x=8;
        set(handles.listbox3,'string',strvcat(get(handles.listbox3,'string'),[time_string,'>> 灰度选择8']));
    case 'radiobutton17' 
        x=4;
        set(handles.listbox3,'string',strvcat(get(handles.listbox3,'string'),[time_string,'>> 灰度选择4']));
    case 'radiobutton18'
        x=2;
        set(handles.listbox3,'string',strvcat(get(handles.listbox3,'string'),[time_string,'>> 灰度选择2']));
end


% --------------------------------------------------------------------
%菜单栏-处理-gaussian噪声叠加
function Untitled_10_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global BW;
global im;
global M;
global V;%函数参数
time_string = num2str(datestr(now,'yyyy-mm-dd-HH:MM:SS'));
M=str2num(get(handles.edit18,'String'));
V=str2num(get(handles.edit19,'String'));
BW = imnoise(im,'gaussian',M,V);
set(handles.listbox3,'string',strvcat(get(handles.listbox3,'string'),[time_string,'>> gaussian噪声']));


% --------------------------------------------------------------------
%菜单栏-处理-椒盐噪声叠加
function Untitled_12_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im;
global BW;
global d; %椒盐噪声参数
time_string = num2str(datestr(now,'yyyy-mm-dd-HH:MM:SS'));
d=str2num(get(handles.edit20,'String'));%传递参数
BW = imnoise(im,'salt & pepper',d);
set(handles.listbox3,'string',strvcat(get(handles.listbox3,'string'),[time_string,'>> salt&pepper噪声']));


% --------------------------------------------------------------------
%菜单栏-处理-speckle噪声叠加 
function Untitled_13_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im;
global BW;
global v;
time_string = num2str(datestr(now,'yyyy-mm-dd-HH:MM:SS'));
v=str2num(get(handles.edit21,'String'));
BW = imnoise(im,'speckle',v);
set(handles.listbox3,'string',strvcat(get(handles.listbox3,'string'),[time_string,'>> speckle噪声']));


%参数编辑框speckle参数v
function edit21_Callback(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit21 as text
%        str2double(get(hObject,'String')) returns contents of edit21 as a double
global v;
v=str2num(get(hObject,'String'));
if(isempty(v))
    set(hObject,'String','0.04');
end


% --- Executes during object creation, after setting all properties.
function edit21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%参数编辑框 椒盐噪声参数d
function edit20_Callback(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit20 as text
%        str2double(get(hObject,'String')) returns contents of edit20 as a double
global d;
d=str2num(get(hObject,'String'));
if(isempty(d))
    set(hObject,'String','0.05');
end


% --- Executes during object creation, after setting all properties.
function edit20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%参数编辑框 高斯噪声参数V
function edit19_Callback(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit19 as text
%        str2double(get(hObject,'String')) returns contents of edit19 as a double
global V;
V = str2num(get(hObject,'String'));
if(isempty(V))
    set(hObject,'String','0.01');
end


% --- Executes during object creation, after setting all properties.
function edit19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%参数编辑框 高斯噪声参数M
function edit18_Callback(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit18 as text
%        str2double(get(hObject,'String')) returns contents of edit18 as a double
global M;
M=str2num(get(hObject,'String'));
if(isempty(M))
    set(hObject,'String','0');
end



% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
%工具栏-打开文件 
function uipushtool1_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im;
time_string = num2str(datestr(now,'yyyy-mm-dd-HH:MM:SS'));
[filename,pathname] = uigetfile({'*.*';'*.bmp';'*.tif';'*.png'},'选择图片'); 
str=[pathname filename];  
im=imread(str); 
set(handles.listbox3,'string',strvcat(get(handles.listbox3,'string'),[time_string,'>> 图片打开成功']));
axes(handles.axes5); 
imshow(im);  


% --------------------------------------------------------------------
%工具栏-保存文件
function uipushtool2_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global BW;
time_string = num2str(datestr(now,'yyyy-mm-dd-HH:MM:SS'));
[filename,pathname,filterindex]=uiputfile({'*.bmp';'*.tif';'*.png'},'save picture');
if filterindex==0
return
else
str=[pathname filename];  
axes(handles.axes6);  
imwrite(BW,str);  %保存图片
set(handles.listbox3,'string',strvcat(get(handles.listbox3,'string'),[time_string,'>> 图片已保存']));
end


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
