function varargout = serial_aq(varargin)
% SERIAL_AQ MATLAB code for serial_aq.fig
%      SERIAL_AQ, by itself, creates a new SERIAL_AQ or raises the existing
%      singleton*.
%
%      H = SERIAL_AQ returns the handle to a new SERIAL_AQ or the handle to
%      the existing singleton*.
%
%      SERIAL_AQ('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SERIAL_AQ.M with the given input arguments.
%
%      SERIAL_AQ('Property','Value',...) creates a new SERIAL_AQ or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before serial_aq_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to serial_aq_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help serial_aq

% Last Modified by GUIDE v2.5 19-Oct-2019 21:48:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @serial_aq_OpeningFcn, ...
                   'gui_OutputFcn',  @serial_aq_OutputFcn, ...
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


function  open_serial_CreateFcn(hObject, eventdata, handles)


function  axes_CreateFcn(hObject, eventdata, handles)

% --- Executes just before serial_aq is made visible.
function serial_aq_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to serial_aq (see VARARGIN)

% Choose default command line output for serial_aq
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
%% 已接收的字符串
% strRec = '';
%% 将这参数作为应用数据（全局变量），存入窗口对象内
% setappdata(hObject,'strRec',strRec);

% UIWAIT makes serial_aq wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = serial_aq_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in com.
function com_Callback(hObject, eventdata, handles)
% hObject    handle to com (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns com contents as cell array
%        contents{get(hObject,'Value')} returns selected item from com


% --- Executes during object creation, after setting all properties.
function com_CreateFcn(hObject, eventdata, handles)
% hObject    handle to com (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in baudrate.
function baudrate_Callback(hObject, eventdata, handles)
% hObject    handle to baudrate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns baudrate contents as cell array
%        contents{get(hObject,'Value')} returns selected item from baudrate


% --- Executes during object creation, after setting all properties.
function baudrate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to baudrate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in data_bit.
function data_bit_Callback(hObject, eventdata, handles)
% hObject    handle to data_bit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns data_bit contents as cell array
%        contents{get(hObject,'Value')} returns selected item from data_bit


% --- Executes during object creation, after setting all properties.
function data_bit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to data_bit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in stop_bit.
function stop_bit_Callback(hObject, eventdata, handles)
% hObject    handle to stop_bit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns stop_bit contents as cell array
%        contents{get(hObject,'Value')} returns selected item from stop_bit


% --- Executes during object creation, after setting all properties.
function stop_bit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to stop_bit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in open_serial.
function open_serial_Callback(hObject, eventdata, handles)
%   【打开/关闭串口】按钮的回调函数
%% 定义一些全局变量并初始化
    global XData; %定义一全局变量，坐标轴X轴的数据
    global YData1;%坐标轴IMU_MAGX的数据
    global YData2;%坐标轴IMU_MAGY的数据
    global YData3;%坐标轴IMU_MAGZ的数据
    global Xlim;%坐标轴X轴的范围
    global L1;%用来存储IMU_MAGX线的句柄
    global L2;%用来存储IMU_MAGY线的句柄
    global L3;%用来存储IMU_MAGZ线的句柄
    global Checkbox_x;%用来判定是否选中了IMU_MAGX复选框
    global Checkbox_y;%用来判定是否选中了IMU_MAGY复选框
    global Checkbox_z;%用来判定是否选中了IMU_MAGZ复选框
    Checkbox_x = 0;%初始化为未选中
    Checkbox_y = 0;
    Checkbox_z = 0;
    XData = 0;%初始化坐标轴的数据为0
    YData1 = 0;
    YData2 = 0;
    YData3 = 0;
    Xlim = 0;

%    打开串口，并初始化相关参数
%% 若按下【打开串口】按钮，打开串口
    if get(hObject,'value')
%% 获取串口的端口名
    com_n = sprintf('com%d', get(handles.com, 'value'));
    
%% 获取波特率
    rates = [9600 38400 115200];
    baud_rate = rates(get(handles.baudrate, 'value'));
%% 获取校验位设置
    switch get(handles.jiaoyan, 'value')
        case 1
            jiaoyan = 'none';
        case 2
            jiaoyan = 'odd';
        case 3
            jiaoyan = 'even';
    end
%% 获取数据位个数
    data_bits = 5 + get(handles.data_bit, 'value');
%% 获取停止位个数
    stop_bits = get(handles.stop_bit, 'value');
%% 创建串口对象
    scom = serial(com_n);
%% 配置串口属性，指定其回调函数
scom.DataTerminalReady='off';
scom.ReadAsyncMode='continuous';
scom.BytesAvailableFcnCount= 1;   

set(scom,'BaudRate', 9600,'DataBits',8,'StopBits',1,'Parity','none','FlowControl','none');  
set(scom,'BytesAvailableFcnMode','Terminator'); %设置中断触发方式  % 数据回车“\n”进入回调函数
set(scom,'Terminator','LF');
% k=s.status
scom.BytesAvailableFcn = {@instrcallback,handles};       %引用回调函数event  
    
    
    

%% 将串口对象的句柄作为用户数据，存入窗口对象
    set(handles.figure1, 'UserData', scom);
%% 尝试打开串口
    try
        fopen(scom);  %打开串口
    catch   % 若串口打开失败，提示“串口不可获得！”
        msgbox('串口不可获得！');
        set(hObject, 'value', 0);  %弹起本按钮 
        return;
    end
%% 能够打开串口后，设定绘图的相关属性
    if get(handles.checkbox1,'value')
        Checkbox_x = 1;
        L1 = plot(handles.axes,Xlim,YData1,'r*');
        hold on;
    end
    if get(handles.checkbox2,'value')
        Checkbox_y = 1;
        L2 = plot(handles.axes,Xlim,YData2,'b+');
        hold on;
    end
    if get(handles.checkbox3,'value')
         Checkbox_z = 1;
        L3 = plot(handles.axes,Xlim,YData3,'m-');
          drawnow  
    end
    set(handles.axes,'XLim',[Xlim  Xlim+100],'YLim',[20 +60]);%设定坐标轴的范围
    grid on; %绘出网格
%% 设定其它按钮的属性
    set(handles.pause_start,'enable','on');
    set(hObject,'string','关闭串口');
    set(handles.lamb,'backgroundcolor','g');
 else %若关闭串口 
%% 删除line对象
    Linehandle = get(gca,'children');%获取坐标轴的子对象的句柄
    delete(Linehandle);
%% 停止并删除串口对象
    scoms = instrfind;
    fclose(scoms);
    delete(scoms);
    set(hObject,'string','打开串口');
    set(handles.lamb,'backgroundcolor','r');
    set(handles.pause_start,'enable','off');
    set(handles.pause_start,'string','暂停显示');
    set(handles.pause_start,'value',0);
   
end




function instrcallback(s,event,handles)%   串口的BytesAvailableFcn回调函数
%INSTRCALLBACK Display event information for the event.
%
%   INSTRCALLBACK(OBJ, EVENT) displays a message which contains the 
%   type of the event, the time of the event and the name of the
%   object which caused the event to occur.  
%
%   If an error event occurs, the error message is also displayed.  
%   If a pin event occurs, the pin that changed value and the pin 
%   value is also displayed. 
%
%   INSTRCALLBACK is an example callback function. Use this callback 
%   function as a template for writing your own callback function.
%
%   Example:
%       s = serial('COM1');
%       set(s, 'OutputEmptyFcn', {'instrcallback'});
%       fopen(s);
%       fprintf(s, '*IDN?', 'async');
%       idn = fscanf(s);
%       fclose(s);
%       delete(s);
%

%   MP 2-24-00
%   Copyright 1999-2011 The MathWorks, Inc. 
%   $Revision: 1.1.6.2 $  $Date: 2011/05/13 18:06:14 $


switch nargin
case 0
   error(message('instrument:instrument:instrcallback:invalidSyntaxArgv'));
case 1
   error(message('instrument:instrument:instrcallback:invalidSyntax'));
case 2
   if ~isa(s, 'instrument') || ~isa(event, 'struct')
      error(message('instrument:instrument:instrcallback:invalidSyntax'));
   end   
   if ~(isfield(event, 'Type') && isfield(event, 'Data'))
      error(message('instrument:instrument:instrcallback:invalidSyntax'));
   end
end  

% Determine the type of event.
EventType = event.Type;

% Determine the time of the error event.
EventData = event.Data;
EventDataTime = EventData.AbsTime;
   
% Create a display indicating the type of event, the time of the event and
% the name of the object.
name = get(s, 'Name');
fprintf([EventType ' event occurred at ' datestr(EventDataTime,13),...
	' for the object: ' name '.\n']);

% Display the error string.
if strcmpi(EventType, 'error')
	fprintf([EventData.Message '\n']);
end

% Display the pinstatus information.
if strcmpi(EventType, 'pinstatus')
    fprintf([EventData.Pin ' is ''' EventData.PinValue '''.\n']);
end

% Display the trigger line information.
if strcmpi(EventType, 'trigger')
    fprintf(['The trigger line is ' EventData.TriggerLine '.\n']);
end

% Display the datagram information.
if strcmpi(EventType, 'datagramreceived')
    fprintf([num2str(EventData.DatagramLength) ' bytes were ',...
            'received from address ' EventData.DatagramAddress,...
            ', port ' num2str(EventData.DatagramPort) '.\n']);
end

% Display the configured value information.
if strcmpi(EventType, 'confirmation')
    fprintf([EventData.PropertyName ' was configured to ' num2str(EventData.ConfiguredValue) '.\n']);
     
    
end  










%% 定义一些全局变量
    global XData;
    global YData1;
    global YData2;
    global YData3;
    global Xlim;
    global L1;
    global L2;
    global L3;
    global Checkbox_x;
    global Checkbox_y;
    global Checkbox_z;
%% 每运行一次本函数X轴的数据+1
    Xlim = Xlim+1;
    XData =[XData Xlim];

%% 接收串口发送过来的数据（这里有时会出现BUG，具体原因不详）
    outdata = fscanf(s);%接收串口发来的ASII数据，串口发过来的数据是字符串“IMU_MAGX IMU_MAGY IMU_MAGZ ”
    YData = str2num(outdata);%将字符串转化成数值类型
    YData1 = [YData1 YData(:,1)];%存储IMU_MAGX的数据
    YData2 = [YData2 YData(:,2)];%存储IMU_MAGY的数据
    YData3 = [YData3 YData(:,3)];%存储IMU_MAGZ的数据
    
    
%% 限定坐标轴X Y的数组长度不能超过500，防止数据过多时易导致内存消耗过大卡死
    if (length(XData)) > 500
        XData = XData(:,2:end);%数组长度一旦超过500就丢弃第1列的值
    end
    if (length(YData1)) > 500
        YData1 = YData1(:,2:end);
    end
    if (length(YData2)) > 500
        YData2 = YData2(:,2:end);
    end
    if (length(YData3)) > 500
        YData3 = YData3(:,2:end);
    end
    
    
     if (~get(handles.pause_start,'value'))%如果点击了暂停显示，是停止更新坐标轴范围
         
             if get(handles.checkbox1,'value')
             t1=YData(:,1);
              set(handles.xx,'backgroundcolor','g');
             else
             t1=-10;   
             set(handles.xx,'backgroundcolor','w');
             end
             
              if get(handles.checkbox2,'value')
             t2=YData(:,2);
             set(handles.yy,'backgroundcolor','b');
             else
             t2=-10;    
              set(handles.yy,'backgroundcolor','w');
              end
 
             if get(handles.checkbox3,'value')
             set(handles.zz,'backgroundcolor','r');
             t3=YData(:,3);
             else
             t3=-10;    
              set(handles.zz,'backgroundcolor','w');
              end
    
    set(handles.axes,'XLim',[Xlim-100 Xlim+50],'YLim',[20  60]);
    plot(handles.axes,Xlim,t1,'g*',Xlim,t2+10,'bx',Xlim,t3+20,'r+');
     end         

%% 更新坐标轴范围
%% 通过判定勾选的复选框的值来更新相应Y轴坐标的数据
if (~get(handles.pause_start,'value'))%如果点击了暂停显示，是停止更新Y轴的数据
    if Checkbox_x
        set(L1,'XData',Xlim,'YData',YData(:,1));
    end
    if Checkbox_y
        set(L2,'XData',Xlim,'YData',YData(:,2)+10);
    end
    if Checkbox_z
        set(L3,'XData',Xlim,'YData',YData(:,3)+20);
    end
end
%% 求出Y轴数据的最小最大值
    min_1 = min(YData1(:));
    min_2 = min(YData2(:));
    min_3 = min(YData3(:));
    max_1 = max(YData1(:));
    max_2 = max(YData2(:));
    max_3 = max(YData3(:));
%% 通过判定复选框的勾选值来采用相应的最小最大值，并求出整个Y轴数据的最小最大值
    if Checkbox_x && Checkbox_y && Checkbox_z
        min_array = [min_1 min_2 min_3];
        max_array = [max_1 max_2 max_3];
    elseif Checkbox_x && Checkbox_y
        min_array = [min_1 min_2];
        max_array = [max_1 max_2]; 
    elseif Checkbox_y && Checkbox_z
        min_array = [min_2 min_3];
        max_array = [max_2 max_3]; 
    elseif Checkbox_x
        min_array = min_1;
        max_array = max_1;
    elseif Checkbox_y
        min_array = min_2;
        max_array = max_2;
    elseif Checkbox_z
        min_array = min_3;
        max_array = max_3;
    else
        min_array = -2 + 0.2;
        max_array = 2 + 0.2;
    end
        min_all = min(min_array);
        max_all = max(max_array);
        


%% 将数值数据格式化成字符串
    IMU_MAGX = sprintf('%f',YData(:,1));
    IMU_MAGY = sprintf('%f',YData(:,2)+8);
    IMU_MAGZ = sprintf('%f',YData(:,3)+20);

%% 显示接收的字符串

if (~get(handles.pause_start,'value'))
    set(handles.display_x,'string',IMU_MAGX);
    set(handles.display_y,'string',IMU_MAGY);
    set(handles.display_z,'string',IMU_MAGZ);
end


% --- Executes on button press in lamb.
function lamb_Callback(hObject, eventdata, handles)
% hObject    handle to lamb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function display_Callback(hObject, eventdata, handles)
% hObject    handle to display (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of display as text
%        str2double(get(hObject,'String')) returns contents of display as a double


% --- Executes during object creation, after setting all properties.
function display_CreateFcn(hObject, eventdata, handles)
% hObject    handle to display (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in jiaoyan.
function jiaoyan_Callback(hObject, eventdata, handles)
% hObject    handle to jiaoyan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns jiaoyan contents as cell array
%        contents{get(hObject,'Value')} returns selected item from jiaoyan


% --- Executes during object creation, after setting all properties.
function jiaoyan_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jiaoyan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in clear_display.
function clear_display_Callback(hObject, eventdata, handles)
% hObject    handle to clear_display (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display_x,'string','');
set(handles.display_y,'string','');
set(handles.display_z,'string','');



function display_x_Callback(hObject, eventdata, handles)
% hObject    handle to display_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of display_x as text
%        str2double(get(hObject,'String')) returns contents of display_x as a double


% --- Executes during object creation, after setting all properties.
function display_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to display_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function display_y_Callback(hObject, eventdata, handles)
% hObject    handle to display_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of display_y as text
%        str2double(get(hObject,'String')) returns contents of display_y as a double


% --- Executes during object creation, after setting all properties.
function display_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to display_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function display_z_Callback(hObject, eventdata, handles)
% hObject    handle to display_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of display_z as text
%        str2double(get(hObject,'String')) returns contents of display_z as a double


% --- Executes during object creation, after setting all properties.
function display_z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to display_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3


% --- Executes on button press in pause_start.
function pause_start_Callback(hObject, eventdata, handles)
% 用来暂停显示数据和图形
if get(hObject,'value')
    set(hObject,'string','继续显示');
else
    set(hObject,'string','暂停显示');
end

% hObject    handle to pause_start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of pause_start



% --- Executes during object creation, after setting all properties.
function axes6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
imshow(imread('sia.jpg'));
% Hint: place code in OpeningFcn to populate axes6


% --- Executes during object creation, after setting all properties.
function axes7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
imshow(imread('sic.jpg'));
% Hint: place code in OpeningFcn to populate axes7


% --- Executes during object creation, after setting all properties.
function lamb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lamb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in xx.
function xx_Callback(hObject, eventdata, handles)
% hObject    handle to xx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in yy.
function yy_Callback(hObject, eventdata, handles)
% hObject    handle to yy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in zz.
function zz_Callback(hObject, eventdata, handles)
% hObject    handle to zz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
