function varargout = editor(varargin)
% EDITOR MATLAB code for editor.fig
%      EDITOR, by itself, creates a new EDITOR or raises the existing
%      singleton*.
%
%      H = EDITOR returns the handle to a new EDITOR or the handle to
%      the existing singleton*.
%
%      EDITOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EDITOR.M with the given input arguments.
%
%      EDITOR('Property','Value',...) creates a new EDITOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before editor_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to editor_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help editor

% Last Modified by GUIDE v2.5 08-Nov-2016 02:53:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @editor_OpeningFcn, ...
                   'gui_OutputFcn',  @editor_OutputFcn, ...
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


% --- Executes just before editor is made visible.
function editor_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to editor (see VARARGIN)

% Choose default command line output for editor
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
axes(handles.img);
axis off;
axes(handles.color);
% UIWAIT makes editor wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = editor_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function cambiarcolor_Callback(hObject, eventdata, handles)
global a;
%[fil col dim]=size(a);
%b=im2double();
R=get(handles.slider_rojo,'value');
G=get(handles.slider_verde,'value');
B=get(handles.slider_azul,'value');

set(handles.color,'Color',[R G B]); 
% hObject    handle to cambiarcolor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on slider movement.





function slider_rojo_Callback(hObject, eventdata, handles)
scroll=get(handles.slider_rojo,'Value')*100;
set(handles.txtrojo,'String',scroll);
cambiarcolor_Callback(hObject, eventdata, handles)
% hObject    handle to slider_rojo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider_rojo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_rojo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_verde_Callback(hObject, eventdata, handles)
scroll=get(handles.slider_verde,'Value')*100;
set(handles.txtverde,'String',scroll);
cambiarcolor_Callback(hObject, eventdata, handles)
% hObject    handle to slider_verde (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider_verde_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_verde (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_azul_Callback(hObject, eventdata, handles)
scroll=get(handles.slider_azul,'Value')*100;
set(handles.txtazul,'String',scroll);
cambiarcolor_Callback(hObject, eventdata, handles)
% hObject    handle to slider_azul (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider_azul_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_azul (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in btnaplicar.
function btnaplicar_Callback(hObject, eventdata, handles)
global a;
[fil col dim]=size(a);
b=im2double(a);
R=get(handles.slider_rojo,'value');
G=get(handles.slider_verde,'value');
B=get(handles.slider_azul,'value');
for i=1:fil
    for j=1:col
        if(b(i,j,1)==0)&&(b(i,j,2)==0)&&(b(i,j,3)==0)
            b(i,j,1)=R;
            b(i,j,2)=G;
            b(i,j,3)=B;
        end
    end
end
c=im2uint8(b);
axes(handles.img);
imshow(c);
% hObject    handle to btnaplicar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function mnuOP_Callback(hObject, eventdata, handles)
% hObject    handle to mnuOP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function mnuAbrir_Callback(hObject, eventdata, handles)
global a;
[Archivo Ruta]=uigetfile({'*.jpg';'*.bmp';'*.png';'*.gif'},'Abrir Imagen');
if isequal(Archivo,0)
    return
else
    a=imread(strcat(Ruta,Archivo));
    axes(handles.img);
    imshow(a);
end
% hObject    handle to mnuAbrir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function mnuNuevo_Callback(hObject, eventdata, handles)
axes(handles.img); 
cla;
% hObject    handle to mnuNuevo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function mnuGuardar_Callback(hObject, eventdata, handles)
global a;
    [Archivo Ruta]=uiputfile({'*.jpg';'*.bmp';'*.png';'*.gif'},'Guardar Imagen');
    if isequal(Archivo,0)
        msgbox('Usted no guardó imagen','Mensaje');
        return
    else
        imwrite(a,strcat(Ruta,Archivo));
        msgbox('GUARDADO CON EXITO','Mensaje');
    end
% hObject    handle to mnuGuardar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function mnuSalir_Callback(hObject, eventdata, handles)
opc=questdlg('¿Desea salir del programa?','SALIR','Si','No','No'); 
if strcmp(opc,'No')
   return;  
end
clear,clc,close all 
% hObject    handle to mnuSalir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
