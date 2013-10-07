unit GraphicEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, ComCtrls;

type
  TformMain = class(TForm)
    frmSidePanel: TPanel;
    frmImage: TImage;
    btnRectangle: TSpeedButton;
    btnEllipse: TSpeedButton;
    btnLine: TSpeedButton;
    btnCustom: TSpeedButton;
    frmStatus: TStatusBar;
    procedure btnRectangleClick(Sender: TObject);
    procedure btnEllipseClick(Sender: TObject);
    procedure btnLineClick(Sender: TObject);
    procedure btnCustomClick(Sender: TObject);
    procedure frmImageMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure frmImageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure frmImageMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    mouseDownBtnPosX, mouseDownBtnPosY : Integer;
    currentShape : String;
  public
    { Public declarations }
  end;

var
  formMain: TformMain;

implementation

{$R *.dfm}

procedure TformMain.btnRectangleClick(Sender: TObject);
begin
  currentShape := 'Rectangle';
end;

procedure TformMain.btnEllipseClick(Sender: TObject);
begin
  currentShape := 'Ellipse';
end;

procedure TformMain.btnLineClick(Sender: TObject);
begin
  currentShape := 'Line';
end;

procedure TformMain.btnCustomClick(Sender: TObject);
begin
  currentShape := 'Custom';
end;

procedure TformMain.frmImageMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  frmStatus.Panels[1].Text := IntToStr(X) + 'x' + IntToStr(Y);
end;

procedure TformMain.frmImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  mouseDownBtnPosX := X;
  mouseDownBtnPosY := Y;
  
  frmStatus.Panels[0].Text := IntToStr(X) + 'x' + IntToStr(Y);
  
end;

procedure TformMain.frmImageMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var rX, rY, swapHelper : Integer;
begin
  frmStatus.Panels[2].Text := IntToStr(X) + 'x' + IntToStr(Y);

  if(currentShape = 'Rectangle') then
    frmImage.Canvas.Rectangle(mouseDownBtnPosX, mouseDownBtnPosY, X, Y)
  else if(currentShape = 'Ellipse') then
    frmImage.Canvas.Ellipse(mouseDownBtnPosX, mouseDownBtnPosY, X, Y)
  else if(currentShape = 'Line') then
  begin
    frmImage.Canvas.MoveTo(mouseDownBtnPosX, mouseDownBtnPosY);
    frmImage.Canvas.LineTo(X, Y);
  end
  else if(currentShape = 'Custom') then
    begin
      //Fix bug for drawing upside down the man
      if(mouseDownBtnPosX > X) then
      begin
         swapHelper := X;
         X := mouseDownBtnPosX;
         mouseDownBtnPosX := swapHelper;
      end;
      if(mouseDownBtnPosY > Y) then
      begin
         swapHelper := Y;
         Y := mouseDownBtnPosY;
         mouseDownBtnPosY := swapHelper;
      end;
      
      rX := X - mouseDownBtnPosX;
      rY := Y - mouseDownBtnPosY;
      frmImage.Canvas.Rectangle(mouseDownBtnPosX, mouseDownBtnPosY, X, Y);
      //Drawing Head
      frmImage.Canvas.Ellipse(mouseDownBtnPosX + round(rX * 1/3), mouseDownBtnPosY,
        mouseDownBtnPosX + round(rX * 2/3), mouseDownBtnPosY + round(rY * 1/4));
      //Drawing Eye
      //frmImage.Canvas.Ellipse(mouseDownBtnPosX + round(rX * 2/5), mouseDownBtnPosY + round(rY * 1/15),
       // X, Y);
      //Drawing Body
      frmImage.Canvas.MoveTo(mouseDownBtnPosX + round(rX * 1/2),
        mouseDownBtnPosY + round(rY * 1/4));
      frmImage.Canvas.LineTo(mouseDownBtnPosX + round(rX * 1/2),
        mouseDownBtnPosY + round(rY * 5/8));
      //Drawing Left Leg
      frmImage.Canvas.MoveTo(mouseDownBtnPosX + round(rX * 1/2),
        mouseDownBtnPosY + round(rY * 5/8));
      frmImage.Canvas.LineTo(mouseDownBtnPosX + round(rX * 1/4), Y);
      //Drawing Right Leg
      frmImage.Canvas.MoveTo(mouseDownBtnPosX + round(rX * 1/2),
        mouseDownBtnPosY + round(rY * 5/8));
      frmImage.Canvas.LineTo(mouseDownBtnPosX + round(rX * 3/4), Y);
      //Drawing Hands
      frmImage.Canvas.MoveTo(mouseDownBtnPosX, mouseDownBtnPosY + round(rY * 1/3));
      frmImage.Canvas.LineTo(X, mouseDownBtnPosY + round(rY * 1/3));
    end
end;

end.
