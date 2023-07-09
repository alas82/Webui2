program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes,windows,webui
  { you can add units after this };
var
  window: size_t;
  MyStringList: TStringList;
  tmpstream: TResourceStream;
  content: PChar;
  counter: integer;

{$R *.res}

begin
  window := webui_new_window;
  try
    tmpStream := TResourceStream.Create(HInstance, '1', RT_HTML);
    MyStringList := TStringList.Create;
    MyStringList.LoadFromStream(tmpStream);
    content := PChar(MyStringList.Text);

  finally
    tmpstream.Free;
     MyStringList.Free;
  end;


  webui_show(window, content);
  //webui_bind(window, 'Button1click', @EventHandler);

  webui_wait;
end.

