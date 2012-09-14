object FrmTodosApartamentos: TFrmTodosApartamentos
  Left = 516
  Top = 192
  Width = 556
  Height = 507
  Caption = 'Visualiza'#231#227'o de todos os apartamentos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 297
    Height = 13
    Caption = 'Selecione o apartamento para visualizar as reservas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 240
    Width = 218
    Height = 13
    Caption = 'Reservas do apartamento selecionado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGridApartamento: TDBGrid
    Left = 24
    Top = 40
    Width = 497
    Height = 185
    DataSource = dsApartamento
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGridApartamentoCellClick
    OnKeyDown = DBGridApartamentoKeyDown
    OnKeyUp = DBGridApartamentoKeyUp
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 264
    Width = 497
    Height = 185
    DataSource = dsReserva
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object dsApartamento: TDataSource
    Left = 400
    Top = 88
  end
  object dsReserva: TDataSource
    Left = 360
    Top = 280
  end
end
