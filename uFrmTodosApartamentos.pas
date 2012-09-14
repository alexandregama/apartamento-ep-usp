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
  Método para a criação do próprio formulário, usando Inversão de Controle e Herança
 ***********************************************************************************************}
constructor TFrmTodosApartamentos.Create(DataModule: TPrincpalDM; AOwner: TComponent);
begin
  //Por herança, cria o Formulário chaando o construtor "pai"
  inherited Create(AOwner);
  //Recebe a instância do DataModule
  FPrincipalDM := DataModule;
end;

{***********************************************************************************************
  Método que busca os apartamentos quando o formulário é criado
 ***********************************************************************************************}
procedure TFrmTodosApartamentos.FormCreate(Sender: TObject);
begin
  FPrincipalDM.BuscaApartamentos();
  //Associa o DataSet de Apartamento ao DataSet do Formulário
  dsApartamento.DataSet := FPrincipalDM.cdsApartamento;
end;

{***********************************************************************************************
  Método para a fechar a comunicação com os dados dos DataSets
 ***********************************************************************************************}
procedure TFrmTodosApartamentos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FPrincipalDM.cdsApartamento.Close;
  FPrincipalDM.SQLConnection.Close;
end;

{***********************************************************************************************
  Método para mostrar as reservas do apartamento quando o usuário selecionar um apartamento
 ***********************************************************************************************}
procedure TFrmTodosApartamentos.DBGridApartamentoCellClick(
  Column: TColumn);
begin
  BuscaAsReservasDoApartamentoSelecionado();
end;

{***********************************************************************************************
  Método para a buscar as reservas do apartamento selecionado
 ***********************************************************************************************}
procedure TFrmTodosApartamentos.BuscaAsReservasDoApartamentoSelecionado;
begin
  FPrincipalDM.BuscaReservaPeloApartamentoSelecionado();
  dsReserva.DataSet := FPrincipalDM.cdsReserva;
end;

{***********************************************************************************************
  Método para mostrar as reservas do apartamento quando o usuário usar as setas do teclado
 ***********************************************************************************************}
procedure TFrmTodosApartamentos.DBGridApartamentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  BuscaAsReservasDoApartamentoSelecionado();
end;

{***********************************************************************************************
  Método para mostrar as reservas do apartamento quando o usuário usar as setas do teclado
 ***********************************************************************************************}
procedure TFrmTodosApartamentos.DBGridApartamentoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  BuscaAsReservasDoApartamentoSelecionado();
end;

end.
