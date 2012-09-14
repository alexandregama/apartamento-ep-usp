unit uFrmTodosApartamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, DB, dmPrincipal;

type
  TFrmTodosApartamentos = class(TForm)
    DBGridApartamento: TDBGrid;
    Label1: TLabel;
    dsApartamento: TDataSource;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    dsReserva: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridApartamentoCellClick(Column: TColumn);
    procedure DBGridApartamentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridApartamentoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FPrincipalDM: TPrincpalDM;
    procedure BuscaAsReservasDoApartamentoSelecionado();
  public
    constructor Create(DataModule: TPrincpalDM; AOwner: TComponent);
  end;

var
  FrmTodosApartamentos: TFrmTodosApartamentos;

implementation

{$R *.dfm}

{ TFrmTodosApartamentos }

{***********************************************************************************************
  M�todo para a cria��o do pr�prio formul�rio, usando Invers�o de Controle e Heran�a
 ***********************************************************************************************}
constructor TFrmTodosApartamentos.Create(DataModule: TPrincpalDM; AOwner: TComponent);
begin
  //Por heran�a, cria o Formul�rio chaando o construtor "pai"
  inherited Create(AOwner);
  //Recebe a inst�ncia do DataModule
  FPrincipalDM := DataModule;
end;

{***********************************************************************************************
  M�todo que busca os apartamentos quando o formul�rio � criado
 ***********************************************************************************************}
procedure TFrmTodosApartamentos.FormCreate(Sender: TObject);
begin
  FPrincipalDM.BuscaApartamentos();
  //Associa o DataSet de Apartamento ao DataSet do Formul�rio
  dsApartamento.DataSet := FPrincipalDM.cdsApartamento;
end;

{***********************************************************************************************
  M�todo para a fechar a comunica��o com os dados dos DataSets
 ***********************************************************************************************}
procedure TFrmTodosApartamentos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FPrincipalDM.cdsApartamento.Close;
  FPrincipalDM.SQLConnection.Close;
end;

{***********************************************************************************************
  M�todo para mostrar as reservas do apartamento quando o usu�rio selecionar um apartamento
 ***********************************************************************************************}
procedure TFrmTodosApartamentos.DBGridApartamentoCellClick(
  Column: TColumn);
begin
  BuscaAsReservasDoApartamentoSelecionado();
end;

{***********************************************************************************************
  M�todo para a buscar as reservas do apartamento selecionado
 ***********************************************************************************************}
procedure TFrmTodosApartamentos.BuscaAsReservasDoApartamentoSelecionado;
begin
  FPrincipalDM.BuscaReservaPeloApartamentoSelecionado();
  dsReserva.DataSet := FPrincipalDM.cdsReserva;
end;

{***********************************************************************************************
  M�todo para mostrar as reservas do apartamento quando o usu�rio usar as setas do teclado
 ***********************************************************************************************}
procedure TFrmTodosApartamentos.DBGridApartamentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  BuscaAsReservasDoApartamentoSelecionado();
end;

{***********************************************************************************************
  M�todo para mostrar as reservas do apartamento quando o usu�rio usar as setas do teclado
 ***********************************************************************************************}
procedure TFrmTodosApartamentos.DBGridApartamentoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  BuscaAsReservasDoApartamentoSelecionado();
end;

end.
