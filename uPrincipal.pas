unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, dmPrincipal;

type
  TFrmControleHospedes = class(TForm)
    Label1: TLabel;
    btnVisualizaTodosApartamentos: TButton;
    btnReservaApartamento: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnVisualizaTodosApartamentosClick(Sender: TObject);
    procedure btnReservaApartamentoClick(Sender: TObject);
  private
    { Private declarations }
    PrincipalDM: TPrincpalDM;
  public
    { Public declarations }
  end;

var
  FrmControleHospedes: TFrmControleHospedes;

implementation

uses uFrmTodosApartamentos, uFrmReservaApartamento;

{$R *.dfm}

{***********************************************************************************************
  Método para a criação do DataModule principal para a manipulação dos Dados do Banco
 ***********************************************************************************************}

procedure TFrmControleHospedes.FormCreate(Sender: TObject);
begin
  if not Assigned(PrincipalDM) then
    PrincipalDM := TPrincpalDM.Create(self);
end;

{***********************************************************************************************
  Método para a criação do formulário de visualização geral dos apartamentos e suas reservas
 ***********************************************************************************************}
procedure TFrmControleHospedes.btnVisualizaTodosApartamentosClick(
  Sender: TObject);
begin
  //Verifica se existe o formulário na memória
  if not Assigned(FrmTodosApartamentos) then
  //Por Injeção de Dependência, cria o formulário passando pelo construtor o DataModule
    FrmTodosApartamentos := TFrmTodosApartamentos.Create(PrincipalDM, Self);
  try
    //Mostra o formulário de forma "modal", ou seja, impossibilitando de clicar no formulário anterior
    FrmTodosApartamentos.ShowModal();
  finally
    //Retira a instância do formulário da memória
    FreeAndNil(FrmTodosApartamentos);
  end;
end;

{***********************************************************************************************
  Método para a criação do formulário de reservas de apartamentos para os hóspedes
 ***********************************************************************************************}
procedure TFrmControleHospedes.btnReservaApartamentoClick(Sender: TObject);
begin
  //Verifica se existe o formulário na memória
  if not Assigned(FrmReservaApartamento) then
  //Por Injeção de Dependência, cria o formulário passando pelo construtor o DataModule  
    FrmReservaApartamento := TFrmReservaApartamento.Create(PrincipalDM, Self);
  try
    //Mostra o formulário de forma "modal", ou seja, impossibilitando de clicar no formulário anterior
    FrmReservaApartamento.ShowModal();
  finally
    //Retira a instância do formulário da memória
    FreeAndNil(FrmReservaApartamento);
  end;
end;

end.
