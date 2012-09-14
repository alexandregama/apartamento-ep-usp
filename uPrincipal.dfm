object FrmControleHospedes: TFrmControleHospedes
  Left = 397
  Top = 149
  Width = 709
  Height = 207
  Caption = 'Controle de H'#243'spedes do Hotel'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 126
    Height = 13
    Caption = 'Escolha a op'#231#227'o desejada'
  end
  object btnVisualizaTodosApartamentos: TButton
    Left = 16
    Top = 40
    Width = 649
    Height = 49
    Caption = 'Visualizar todos os apartamentos e suas reservas'
    TabOrder = 0
    OnClick = btnVisualizaTodosApartamentosClick
  end
  object btnReservaApartamento: TButton
    Left = 16
    Top = 104
    Width = 649
    Height = 49
    Caption = 'Reservar apartamento para o H'#243'spede'
    TabOrder = 1
    OnClick = btnReservaApartamentoClick
  end
end
