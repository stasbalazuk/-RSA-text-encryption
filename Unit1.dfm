object Form1: TForm1
  Left = 238
  Top = 129
  Width = 571
  Height = 610
  Caption = #1064#1080#1092#1088#1086#1074#1072#1085#1080#1077' '#1072#1083#1075#1086#1088#1080#1090#1084#1086#1084' RSA'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 17
    Height = 13
    Caption = 'D ='
  end
  object Label4: TLabel
    Left = 32
    Top = 32
    Width = 3
    Height = 13
  end
  object Label3: TLabel
    Left = 32
    Top = 8
    Width = 3
    Height = 13
  end
  object Label2: TLabel
    Left = 8
    Top = 32
    Width = 20
    Height = 13
    Caption = 'N = '
  end
  object Label5: TLabel
    Left = 160
    Top = 8
    Width = 32
    Height = 13
    Caption = 'Label5'
  end
  object Label6: TLabel
    Left = 160
    Top = 32
    Width = 32
    Height = 13
    Caption = 'Label6'
  end
  object Label7: TLabel
    Left = 280
    Top = 8
    Width = 32
    Height = 13
    Caption = 'Label7'
  end
  object Label8: TLabel
    Left = 280
    Top = 32
    Width = 32
    Height = 13
    Caption = 'Label8'
  end
  object Memo1: TMemo
    Left = 8
    Top = 56
    Width = 537
    Height = 233
    Lines.Strings = (
      #1043#1040#1047)
    TabOrder = 0
    OnKeyPress = sMemo1KeyPress
  end
  object Memo2: TMemo
    Left = 8
    Top = 336
    Width = 537
    Height = 201
    TabOrder = 1
  end
  object Button1: TButton
    Left = 464
    Top = 304
    Width = 75
    Height = 25
    Caption = #1064#1080#1092#1088#1086#1074#1072#1090#1100
    TabOrder = 2
    OnClick = Btn_codefyClick
  end
end
