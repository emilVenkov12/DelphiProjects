program ProjectGraphicEditor;

uses
  Forms,
  GraphicEditor in 'GraphicEditor.pas' {formMain};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TformMain, formMain);
  Application.Run;
end.
