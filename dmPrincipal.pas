unit dmPrincipal;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, FMTBcd, DBClient, Provider;

type
  TPrincpalDM = class(TDataModule)
    SQLConnection: TSQLConnection;
    qryApartamento: TSQLDataSet;
    dspApartamento: TDataSetProvider;
    cdsApartamento: TClientDataSet;
    qryApartamentoID_APARTAMENTO: TIntegerField;
    qryApartamentoNUMERO: TSmallintField;
    qryApartamentoID_TIPO_APARTAMENTO: TStringField;
    cdsApartamentoID_APARTAMENTO: TIntegerField;
    cdsApartamentoNUMERO: TSmallintField;
    cdsApartamentoID_TIPO_APARTAMENTO: TStringField;
    qryApartamentoNOME: TStringField;
    cdsApartamentoNOME: TStringField;
    qryReserva: TSQLDataSet;
    dspReserva: TDataSetProvider;
    cdsReserva: TClientDataSet;
    qryReservaID_RESERVA: TIntegerField;
    qryReservaID_HOSPEDE: TIntegerField;
    qryReservaID_APARTAMENTO: TIntegerField;
    qryReservaDATA_RESERVA: TDateField;
    qryReservaDATA_SAIDA: TDateField;
    qryReservaLG_RESERVADO: TStringField;
    qryReservaNOME_HOSPEDE: TStringField;
    cdsReservaID_RESERVA: TIntegerField;
    cdsReservaID_HOSPEDE: TIntegerField;
    cdsReservaID_APARTAMENTO: TIntegerField;
    cdsReservaDATA_RESERVA: TDateField;
    cdsReservaDATA_SAIDA: TDateField;
    cdsReservaLG_RESERVADO: TStringField;
    cdsReservaNOME_HOSPEDE: TStringField;
    qryHospede: TSQLDataSet;
    dspHospede: TDataSetProvider;
    cdsHospede: TClientDataSet;
    qryHospedeID_HOSPEDE: TIntegerField;
    qryHospedeCPF: TFMTBCDField;
    qryHospedeNOME: TStringField;
    qryHospedeRG: TFMTBCDField;
    qryHospedeTELEFONE: TFMTBCDField;
    cdsHospedeID_HOSPEDE: TIntegerField;
    cdsHospedeCPF: TFMTBCDField;
    cdsHospedeNOME: TStringField;
    cdsHospedeRG: TFMTBCDField;
    cdsHospedeTELEFONE: TFMTBCDField;
  private
    { Private declarations }
    function CriaDataSetPadrao(Consulta: String; OpenDataSet: Boolean = False): TSQLDataSet;
    function RetornaProximoCodigo(): Integer;
    function FormataData(Data: TDateTime): String;    
  public
    { Public declarations }
    procedure BuscaApartamentos();
    procedure BuscaReservaPeloApartamentoSelecionado();
    procedure BuscaTodosOsHospedes();
    procedure ReservarApartamento(DataDeEntrada: TDateTime; DataDeSaida: TDateTime);
    function ApartamentoEstiverReservadoParaEstaData(DataDeEntrada: TDateTime; DataDeSaida: TDateTime): Boolean;
  end;

const
  SQL_TODOS_OS_APARTAMENTOS =
    string(
            'select ' +
            '  A.*, ' +
            '  TA.NOME ' +
            'from ' +
            '   APARTAMENTO A ' +
            'left join TIPO_APARTAMENTO TA on A.ID_TIPO_APARTAMENTO = TA.ID_TIPO_APARTAMENTO '
          );

  SQL_RESERVA_POR_APARTAMENTO =
    string(
            'select ' +
            '   R.*, ' +
            '   H.NOME as NOME_HOSPEDE ' +
            'from ' +
            '   RESERVA R ' +
            'left join HOSPEDE H on H.ID_HOSPEDE = R.ID_HOSPEDE ' +
            'where ' +
            '   ID_APARTAMENTO = %d'
          );

  SQL_TODOS_OS_HOSPEDES =
    string(
            'select * from HOSPEDE'
          );

  SQL_APARTAMENTO_SELECIONADO =
    string(
             'select * from RESERVA where ID_APARTAMENTO = %d'
          );

  SQL_INSERE_RESERVA =
    string(
            'insert into RESERVA ' +
            '( ' +
            '  ID_RESERVA, ' +
            '  ID_HOSPEDE, ' +
            '  ID_APARTAMENTO, ' +
            '  DATA_RESERVA, ' +
            '  DATA_SAIDA ' +
            ')' +
            'values ' +
            '( ' +
            '  %d, ' +
            '  %d, ' +
            '  %d, ' +
            '  %s, ' +
            '  %s ' +
            ')'
          );

  SQL_PROXIMO_CODIGO_RESERVA =
    string(
            'select MAX(ID_RESERVA) as MAXIMO from RESERVA '
          );

var
  PrincpalDM: TPrincpalDM;

implementation

{$R *.dfm}

{ TPrincpalDM }

{***********************************************************************************************
  Método para buscar os apartamentos no banco e popular o ClientDataSet
 ***********************************************************************************************}
procedure TPrincpalDM.BuscaApartamentos;
begin
  cdsApartamento.Close;
  cdsApartamento.CommandText := SQL_TODOS_OS_APARTAMENTOS;
  cdsApartamento.Open;
end;

{***********************************************************************************************
  Método para buscar as reservas do apartamento selecionado e popular ClientDataSet
 ***********************************************************************************************}
procedure TPrincpalDM.BuscaReservaPeloApartamentoSelecionado;
begin
  cdsReserva.Close;
  cdsReserva.CommandText := Format(SQL_RESERVA_POR_APARTAMENTO, [cdsApartamento.FieldByName('ID_APARTAMENTO').AsInteger]);
  cdsReserva.Open;
end;

{***********************************************************************************************
  Método para buscar todos os hospedes e popular o ClientDataSet
 ***********************************************************************************************}
procedure TPrincpalDM.BuscaTodosOsHospedes;
begin
  cdsHospede.Close;
  cdsHospede.CommandText := SQL_TODOS_OS_HOSPEDES;
  cdsHospede.Open;
end;

{***********************************************************************************************
  Método com a lógica para verificar se uma possível reserva já existe cadastrada
 ***********************************************************************************************}
function TPrincpalDM.ApartamentoEstiverReservadoParaEstaData(DataDeEntrada: TDateTime; DataDeSaida: TDateTime): Boolean;
var
  DataSet: TSQLDataSet;
begin
  Result := False;
  DataSet := CriaDataSetPadrao(Format(SQL_APARTAMENTO_SELECIONADO, [cdsApartamento.FieldByName('ID_APARTAMENTO').AsInteger]), True);
  try
    DataSet.First;
    while not DataSet.Eof do
    begin
      if (DataSet.FieldByName('DATA_RESERVA').AsDateTime <= DataDeEntrada) and (DataSet.FieldByName('DATA_SAIDA').AsDateTime >= DataDeEntrada) or
        (DataDeSaida >= DataSet.FieldByName('DATA_RESERVA').AsDateTime) and (DataDeSaida <= DataSet.FieldByName('DATA_SAIDA').AsDateTime) then
      begin
        Result := True;
        break;
      end;
      DataSet.Next;
    end;
  finally
    FreeAndNil(DataSet);
  end;
end;

{***********************************************************************************************
  Método para reservar um apartamento em determinado período
 ***********************************************************************************************}
procedure TPrincpalDM.ReservarApartamento(DataDeEntrada: TDateTime; DataDeSaida: TDateTime);
var
  DataSet: TSQLDataSet;
begin
  DataSet := CriaDataSetPadrao(
    Format(
      SQL_INSERE_RESERVA,
         [ RetornaProximoCodigo(),
           cdsHospede.FieldByName('ID_HOSPEDE').AsInteger,
           cdsApartamento.FieldByName('ID_APARTAMENTO').AsInteger,
           QuotedStr(FormataData(DataDeEntrada)),
           QuotedStr(FormataData(DataDeSaida))
         ]
          ), False);
  try
    DataSet.ExecSQL(False);
  finally
    FreeAndNil(DataSet);
  end;
end;

{***********************************************************************************************
  Método para retornar um SQLDataSet padrão para uso genérico do banco de dados
 ***********************************************************************************************}
function TPrincpalDM.CriaDataSetPadrao(Consulta: String; OpenDataSet: Boolean): TSQLDataSet;
var
  SQLDataSet: TSQLDataSet;
begin
  SQLDataSet := TSQLDataSet.Create(nil);
  SQLDataSet.CommandText   := Consulta;
  SQLDataSet.SQLConnection := Self.SQLConnection;
  if OpenDataSet then
    SQLDataSet.Open();
  Result := SQLDataSet;    
end;

{***********************************************************************************************
  Método para retornar o proximo código da tabela de Reserva para não ter problema de Primary Key
 ***********************************************************************************************}
function TPrincpalDM.RetornaProximoCodigo: Integer;
var
  DataSet: TSQLDataSet;
begin
  DataSet := CriaDataSetPadrao(SQL_PROXIMO_CODIGO_RESERVA, True);
  try
    Result := DataSet.FieldByName('MAXIMO').AsInteger + 1;
  finally
    FreeAndNil(DataSet);
  end;
end;

{***********************************************************************************************
  Método para retornar a data formatada em 'mm\dd\yyyy'
 ***********************************************************************************************}
function TPrincpalDM.FormataData(Data: TDateTime): String;
var
  Dia: Word;
  Mes: Word;
  Ano: Word;
  DataFormatada: String;
begin
  DecodeDate(Data, Ano, Mes, Dia);
  DataFormatada := IntToStr(Mes) + '/' + IntToStr(Dia) + '/' + IntToStr(Ano);
  Result := DataFormatada;
end;

end.

