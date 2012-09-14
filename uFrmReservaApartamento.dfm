object FrmReservaApartamento: TFrmReservaApartamento
  Left = 414
  Top = 259
  Width = 451
  Height = 279
  Caption = 'Reserva de apartamento'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 120
    Height = 13
    Caption = 'Selecione o h'#243'spede'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 64
    Width = 142
    Height = 13
    Caption = 'Selecione o apartamento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 104
    Width = 118
    Height = 13
    Caption = 'Tipo do apartamento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Tipo: TDBText
    Left = 184
    Top = 104
    Width = 65
    Height = 17
    DataField = 'NOME'
    DataSource = dsApartamento
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label4: TLabel
    Left = 16
    Top = 144
    Width = 151
    Height = 13
    Caption = 'Escolha a data de entrada'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 16
    Top = 176
    Width = 140
    Height = 13
    Caption = 'Escolha a data de sa'#237'da'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 184
    Top = 22
    Width = 233
    Height = 21
    KeyField = 'ID_HOSPEDE'
    ListField = 'NOME'
    ListSource = dsHospedes
    TabOrder = 0
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 184
    Top = 64
    Width = 233
    Height = 21
    KeyField = 'ID_APARTAMENTO'
    ListField = 'NUMERO'
    ListSource = dsApartamento
    TabOrder = 1
    OnClick = DBLookupComboBox2Click
  end
  object dtEntrada: TDateTimePicker
    Left = 184
    Top = 139
    Width = 129
    Height = 21
    CalAlignment = dtaLeft
    Date = 40517.7836658102
    Time = 40517.7836658102
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 2
  end
  object dtSaida: TDateTimePicker
    Left = 184
    Top = 171
    Width = 129
    Height = 21
    CalAlignment = dtaLeft
    Date = 40517.7836658102
    Time = 40517.7836658102
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 3
  end
  object btnReservar: TButton
    Left = 16
    Top = 208
    Width = 401
    Height = 25
    Caption = 'Reservar'
    TabOrder = 4
    OnClick = btnReservarClick
  end
  object dsHospedes: TDataSource
    DataSet = PrincpalDM.cdsHospede
    Left = 376
    Top = 16
  end
  object dsApartamento: TDataSource
    DataSet = PrincpalDM.cdsApartamento
    Left = 376
    Top = 56
  end
end
