object formMain: TformMain
  Left = 192
  Top = 119
  Width = 696
  Height = 480
  Caption = 'Graphic Editor'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object frmImage: TImage
    Left = 140
    Top = 0
    Width = 548
    Height = 431
    Align = alClient
    OnMouseDown = frmImageMouseDown
    OnMouseMove = frmImageMouseMove
    OnMouseUp = frmImageMouseUp
  end
  object frmSidePanel: TPanel
    Left = 0
    Top = 0
    Width = 140
    Height = 431
    Align = alLeft
    TabOrder = 0
    object btnRectangle: TSpeedButton
      Left = 15
      Top = 15
      Width = 41
      Height = 41
      OnClick = btnRectangleClick
    end
    object btnEllipse: TSpeedButton
      Left = 79
      Top = 15
      Width = 41
      Height = 41
      OnClick = btnEllipseClick
    end
    object btnLine: TSpeedButton
      Left = 15
      Top = 71
      Width = 41
      Height = 41
      OnClick = btnLineClick
    end
    object btnCustom: TSpeedButton
      Left = 79
      Top = 71
      Width = 41
      Height = 41
      OnClick = btnCustomClick
    end
  end
  object frmStatus: TStatusBar
    Left = 0
    Top = 431
    Width = 688
    Height = 19
    Panels = <
      item
        Width = 50
      end
      item
        Width = 50
      end
      item
        Width = 50
      end>
  end
end
