%作者：徐志豪-科电俱乐部-苏州城市学院
%禁止商用2022.11.8
function varargout = TimeKeDian(varargin)
% TIMEKEDIAN MATLAB code for TimeKeDian.fig
%      TIMEKEDIAN, by itself, creates a new TIMEKEDIAN or raises the existing
%      singleton*.
%
%      H = TIMEKEDIAN returns the handle to a new TIMEKEDIAN or the handle to
%      the existing singleton*.
%
%      TIMEKEDIAN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TIMEKEDIAN.M with the given input arguments.
%
%      TIMEKEDIAN('Property','Value',...) creates a new TIMEKEDIAN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TimeKeDian_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TimeKeDian_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TimeKeDian

% Last Modified by GUIDE v2.5 21-Jun-2022 20:44:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TimeKeDian_OpeningFcn, ...
                   'gui_OutputFcn',  @TimeKeDian_OutputFcn, ...
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


% --- Executes just before TimeKeDian is made visible.
function TimeKeDian_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TimeKeDian (see VARARGIN)
global  NOWnum  
% Choose default command line output for TimeKeDian
NOWnum  =  0;

delete(timerfind);   
timer_id = timer;
timer_id.StartDelay = 1.0;
timer_id.Period = 0.001;
% 周期性执行,fixedSpacing模式
timer_id.ExecutionMode = 'fixedSpacing';
timer_id.TimerFcn = {@timer_handler,handles};
handles.timer_id = timer_id;
guidata(hObject, handles);
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TimeKeDian wait for user response (see UIRESUME)
% uiwait(handles.figure1);
function timer_handler(obj,event,handles)
global   TIME
        t = toc; str = KeDian_time(TIME + t); 
        set(handles.edit2,'string',str); 
        %pause(0.01); 
        


        


% --- Outputs from this function are returned to the command line.
function varargout = TimeKeDian_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
global  TIME  PAUflag   STOPFLAG   
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
PAUflag    = 0;
STOPFLAG   = 0;
TIME       = 0;
KeDian_time_main(handles,1);


function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stop(timerfind);
global  TIME  PAUflag   STOPFLAG time_flag  NOWnum  ; 
time_flag  = 0; 
PAUflag    = 0;
STOPFLAG   = 0;
TIME       = 0;
NOWnum     = 1;
str = KeDian_time(TIME);
set(handles.edit2,'string',str);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.listbox1,'string','成绩统计：');

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
time_str  = get(handles.edit2,'string');
liststr   = get(handles.listbox1,'string');
liststr   = cellstr(liststr);
assignin('base','M1',liststr)
Teamname  = get(handles.edit1,'string');
Ttstr     = strcat(Teamname,':');
Ttstr     = strcat(Ttstr,time_str);
assignin('base','M2',Ttstr)
Ttstr = sprintf('%s',Ttstr);
assignin('base','M3',Ttstr)
liststr{end + 1} = Ttstr;
set(handles.listbox1,'string',liststr);


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global   timeflag  STOPFLAG
STOPFLAG = 0;
stop(timerfind);
delete(timerfind);  
timeflag = 0;
close all;

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global   STOPFLAG
STOPFLAG = 0;
stop(timerfind); 
KeDian_time_main(handles,2);
%     STOPFLAG = 0; time_flag = 0;
%     PAUflag = 0; t = toc; TIME = TIME + t;
%      str = KeDian_time(TIME);
%      assignin('base','s',STOPFLAG)
%      set(handles.edit2,'string',str);

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
KeDian_time_main(handles,1);
% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global  scom   NOWnum TIME  PAUflag   STOPFLAG  OBJnum fir_flag;
baud = [4800,9600,14400,115200,128000,200000,460800];
handles.botelv=baud(get(handles.popupmenu3,'value'));
%set(handles.list1, 'String', handles.botelv);
guidata(hObject,handles);
duankouhao  = get(handles.popupmenu2,'value');
% duankouhao  = sprintf('%s',duankouhao{1,1});
% % assignin('base','M1',duankouhao)
%  set(handles.list1,'string',duankouhao);
 handles.com = strcat('COM',num2str(duankouhao));
 guidata(hObject,handles);
% handles.com = duankouhao;
%  set(handles.list1,'string',handles.com);
% duankouhao = sprintf(duankouhao);
try
    scom = serial(handles.com);
    %set(handles.list1, 'String', handles.com);
    scom.BaudRate = handles.botelv;
    scom.InputBufferSize  = 1024000 ;
    scom.OutputBufferSize = 1024000 ;
    scom.ReadAsyncMode    =  'continuous';
    scom.Parity           = 'none';
    scom.StopBits         =  1;
    scom.DataBits         =  8;
    %“LF（换行符）” 和“CR(回车符)”
    scom.Terminator       = 'CR';
    scom.FlowControl      = 'none';
    scom.timeout          = 0.1;
    scom.BytesAvailableFcnMode = 'byte';   %terminator
    scom.BytesAvailableFcnCount = 1;%一字节触发,handles,handles
    scom.BytesAvailableFcn      = {@myReceiveCallback,handles};      % 定义中断响应函数对象  
    handles.scom  =  scom ;
    guidata(hObject,handles);
    %NOWnum  =  0;
    PAUflag    = 0;
    STOPFLAG   = 0;
    TIME       = 0;
    fir_flag   = 1;
    NOWnum     = 1;
    OBJnum     = get(handles.edit3,'string');
    OBJnum     = str2double(OBJnum);
    %OBJnum     = OBJnum ;
    assignin('base','M5',OBJnum)
    fopen(scom);   %打开串口 
    
    set(gco,'string','打开串口');
    hs  = msgbox(['打开',handles.com,'成功']);
     ht = findobj(hs, 'Type', 'text');
      set(ht, 'FontSize', 10, 'Unit', 'normal');
        waitfor(hs);
        %KeDian_time_main(handles,1);
   catch 
           hs = msgbox('打开串口失败');
           ht = findobj(hs, 'Type', 'text');
      set(ht, 'FontSize', 10, 'Unit', 'normal');
        waitfor(hs);
end

function myReceiveCallback(obj,event,handles)
global     NOWnum    OBJnum  fir_flag  STOPFLAG;
%buffstr = fscanf(scom); scom   % 接收数据并显示（无分号）  
%STOPFLAG = 0;
if OBJnum ==  NOWnum
%     t = toc;
%     str = KeDian_time(t);    
%      set(handles.edit2,'string',str);
  pushbutton10_Callback(obj,event, handles);
  pushbutton6_Callback(obj,event, handles);
end
 if fir_flag 
  %NOWnum      = NOWnum +1;
  assignin('base','M4',NOWnum)
  %set(handles.edit1,'string',NOWnum);
  %tic;
  fir_flag = 0;
  KeDian_time_main(handles,1);
  assignin('base','M6',fir_flag)
 else
     NOWnum     = NOWnum +1;
    assignin('base','M4',NOWnum)
   % set(handles.edit1,'string',NOWnum);
 end 
    


function str = KeDian_time(t) 
 
hrs = floor(t/3600); 
min = floor(t/60 - 60*hrs); 
sec = t - 60*(min + 60*hrs); 
if hrs < 10 
  h = sprintf('0%1.0f:', hrs); 
else 
  h = sprintf('%1.0f:', hrs); 
end 
if min < 10 
  m = sprintf('0%1.0f:', min); 
else 
  m = sprintf('%1.0f:', min); 
end 
if sec < 9.9995 
  s = sprintf('0%1.3f', sec); 
else 
  s = sprintf('%1.3f', sec); 
end 
str = [h m s]; 
% assignin('base','M1',str)
% fprintf(str)


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global   timeflag  STOPFLAG
STOPFLAG = 0;
timeflag = 0;
close all;


function KeDian_time_main(handles,to_flag)  
global  TIME  PAUflag   STOPFLAG   
   switch  to_flag
       case 1
          if PAUflag
             t = toc;        
          TIME = TIME + t; 
             tic; 
           else 
             tic; 
             start(handles.timer_id);
           end 
         STOPFLAG = 1;
         PAUflag  = 0;
%      while STOPFLAG 
%         t = toc; str = KeDian_time(TIME + t); 
%         set(handles.edit2,'string',str); 
%         drawnow
%         pause(0.01); 
%         
%      end
       case 2
      t = toc; PAUflag = 0;  TIME = TIME + t;
     str = KeDian_time(TIME);    
     set(handles.edit2,'string',str);
   end


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
        guidata(hObject,handles); 
        stopasync(handles.scom); 
        fclose(handles.scom);
        delete(handles.scom);
        clear handles.scom;
                set(gco,'string','关闭串口');
                hs = msgbox(['关闭',handles.com,'成功']);
                ht = findobj(hs, 'Type', 'text');
                set(ht, 'FontSize', 10, 'Unit', 'normal');
                waitfor(hs);
catch  
    set(gco,'string','关闭串口');
                hs = msgbox(['关闭失败或者未开启']);
                ht = findobj(hs, 'Type', 'text');
                set(ht, 'FontSize', 10, 'Unit', 'normal');
                waitfor(hs);
end


function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
