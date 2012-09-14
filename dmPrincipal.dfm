object PrincpalDM: TPrincpalDM
  OldCreateOrder = False
  Left = 549
  Top = 220
  Height = 331
  Width = 536
  object SQLConnection: TSQLConnection
    ConnectionName = 'IBLocal'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'BlobSize=-1'
      'CommitRetain=False'
      'Database=LOCALHOST:C:\Projeto4Sem\DB\HOTEL.FDB'
      'DriverName=Interbase'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Password=masterkey'
      'RoleName=RoleName'
      'ServerCharSet='
      'SQLDialect=3'
      'Interbase TransIsolation=ReadCommited'
      'User_Name=sysdba'
      'WaitOnLocks=True')
    VendorLib = 'GDS32.DLL'
    Left = 64
    Top = 24
  end
  object qryApartamento: TSQLDataSet
    SQLConnection = SQLConnection
    CommandText = 
      'select'#13#10'  A.*,'#13#10'  TA.NOME'#13#10'from'#13#10'   APARTAMENTO A'#13#10'left join TIP' +
      'O_APARTAMENTO TA on A.ID_TIPO_APARTAMENTO = TA.ID_TIPO_APARTAMEN' +
      'TO'
    Params = <>
    Left = 112
    Top = 88
    object qryApartamentoID_APARTAMENTO: TIntegerField
      FieldName = 'ID_APARTAMENTO'
      Required = True
    end
    object qryApartamentoNUMERO: TSmallintField
      FieldName = 'NUMERO'
      Required = True
    end
    object qryApartamentoID_TIPO_APARTAMENTO: TStringField
      FieldName = 'ID_TIPO_APARTAMENTO'
      Required = True
      Visible = False
      Size = 10
    end
    object qryApartamentoNOME: TStringField
      FieldName = 'NOME'
      Size = 10
    end
  end
  object dspApartamento: TDataSetProvider
    DataSet = qryApartamento
    Constraints = True
    Options = [poAllowCommandText]
    Left = 248
    Top = 88
  end
  object cdsApartamento: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspApartamento'
    Left = 384
    Top = 88
    object cdsApartamentoID_APARTAMENTO: TIntegerField
      DisplayLabel = 'Id apartamento'
      FieldName = 'ID_APARTAMENTO'
      Required = True
    end
    object cdsApartamentoNUMERO: TSmallintField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      Required = True
    end
    object cdsApartamentoID_TIPO_APARTAMENTO: TStringField
      DisplayLabel = 'Id tipo'
      FieldName = 'ID_TIPO_APARTAMENTO'
      Required = True
      Visible = False
      Size = 10
    end
    object cdsApartamentoNOME: TStringField
      DisplayLabel = 'Tipo do apartamento'
      FieldName = 'NOME'
      Size = 10
    end
  end
  object qryReserva: TSQLDataSet
    SQLConnection = SQLConnection
    CommandText = 
      'select'#13#10'   R.*,'#13#10'   H.NOME as NOME_HOSPEDE'#13#10'from'#13#10'   RESERVA R'#13#10 +
      'left join HOSPEDE H on H.ID_HOSPEDE = R.ID_HOSPEDE'
    Params = <>
    Left = 112
    Top = 152
    object qryReservaID_RESERVA: TIntegerField
      FieldName = 'ID_RESERVA'
      Required = True
    end
    object qryReservaID_HOSPEDE: TIntegerField
      FieldName = 'ID_HOSPEDE'
      Required = True
      Visible = False
    end
    object qryReservaID_APARTAMENTO: TIntegerField
      FieldName = 'ID_APARTAMENTO'
      Required = True
      Visible = False
    end
    object qryReservaDATA_RESERVA: TDateField
      FieldName = 'DATA_RESERVA'
    end
    object qryReservaDATA_SAIDA: TDateField
      FieldName = 'DATA_SAIDA'
    end
    object qryReservaLG_RESERVADO: TStringField
      FieldName = 'LG_RESERVADO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryReservaNOME_HOSPEDE: TStringField
      FieldName = 'NOME_HOSPEDE'
      Size = 30
    end
  end
  object dspReserva: TDataSetProvider
    DataSet = qryReserva
    Constraints = True
    Options = [poAllowCommandText]
    Left = 248
    Top = 152
  end
  object cdsReserva: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspReserva'
    Left = 384
    Top = 152
    object cdsReservaID_RESERVA: TIntegerField
      DisplayLabel = 'Id reserva'
      FieldName = 'ID_RESERVA'
      Required = True
    end
    object cdsReservaID_HOSPEDE: TIntegerField
      FieldName = 'ID_HOSPEDE'
      Required = True
      Visible = False
    end
    object cdsReservaID_APARTAMENTO: TIntegerField
      FieldName = 'ID_APARTAMENTO'
      Required = True
      Visible = False
    end
    object cdsReservaDATA_RESERVA: TDateField
      DisplayLabel = 'Data da reserva'
      FieldName = 'DATA_RESERVA'
    end
    object cdsReservaDATA_SAIDA: TDateField
      DisplayLabel = 'Data da sa'#237'da'
      FieldName = 'DATA_SAIDA'
    end
    object cdsReservaLG_RESERVADO: TStringField
      FieldName = 'LG_RESERVADO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsReservaNOME_HOSPEDE: TStringField
      DisplayLabel = 'Hospede'
      FieldName = 'NOME_HOSPEDE'
      Size = 30
    end
  end
  object qryHospede: TSQLDataSet
    SQLConnection = SQLConnection
    CommandText = 'select * from HOSPEDE'
    Params = <>
    Left = 112
    Top = 224
    object qryHospedeID_HOSPEDE: TIntegerField
      FieldName = 'ID_HOSPEDE'
      Required = True
    end
    object qryHospedeCPF: TFMTBCDField
      FieldName = 'CPF'
      Required = True
      Precision = 15
      Size = 0
    end
    object qryHospedeNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object qryHospedeRG: TFMTBCDField
      FieldName = 'RG'
      Precision = 15
      Size = 0
    end
    object qryHospedeTELEFONE: TFMTBCDField
      FieldName = 'TELEFONE'
      Precision = 15
      Size = 0
    end
  end
  object dspHospede: TDataSetProvider
    DataSet = qryHospede
    Constraints = True
    Options = [poAllowCommandText]
    Left = 248
    Top = 224
  end
  object cdsHospede: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspHospede'
    Left = 384
    Top = 224
    object cdsHospedeID_HOSPEDE: TIntegerField
      FieldName = 'ID_HOSPEDE'
      Required = True
    end
    object cdsHospedeCPF: TFMTBCDField
      FieldName = 'CPF'
      Required = True
      Precision = 15
      Size = 0
    end
    object cdsHospedeNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object cdsHospedeRG: TFMTBCDField
      FieldName = 'RG'
      Precision = 15
      Size = 0
    end
    object cdsHospedeTELEFONE: TFMTBCDField
      FieldName = 'TELEFONE'
      Precision = 15
      Size = 0
    end
  end
end
