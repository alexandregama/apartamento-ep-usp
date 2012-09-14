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
  M�todo para a cria��o do DataModule principal para a manipula��o dos Dados do Banco
 ***********************************************************************************************}

procedure TFrmControleHospedes.FormCreate(Sender: TObject);
begin
  if not Assigned(PrincipalDM) then
    PrincipalDM := TPrincpalDM.Create(self);
end;

{***********************************************************************************************
  M�todo para a cria��o do formul�rio de visualiza��o geral dos apartamentos e suas reservas
 ***********************************************************************************************}
procedure TFrmControleHospedes.btnVisualizaTodosApartamentosClick(
  Sender: TObject);
begin
  //Verifica se existe o formul�rio na mem�ria
  if not Assigned(FrmTodosApartamentos) then
  //Por Inje��o de Depend�ncia, cria o formul�rio passando pelo construtor o DataModule
    FrmTodosApartamentos := TFrmTodosApartamentos.Create(PrincipalDM, Self);
  try
    //Mostra o formul�rio de forma "modal", ou seja, impossibilitando de clicar no formul�rio anterior
    FrmTodosApartamentos.ShowModal();
  finally
    //Retira a inst�ncia do formul�rio da mem�ria
    FreeAndNil(FrmTodosApartamentos);
  end;
end;

{***********************************************************************************************
  M�todo para a cria��o do formul�rio de reservas de apartamentos para os h�spedes
 ***********************************************************************************************}
procedure TFrmControleHospedes.btnReservaApartamentoClick(Sender: TObject);
begin
  //Verifica se existe o formul�rio na mem�ria
  if not Assigned(FrmReservaApartamento) then
  //Por Inje��o de Depend�ncia, cria o formul�rio passando pelo construtor o DataModule  
    FrmReservaApartamento := TFrmReservaApartamento.Create(PrincipalDM, Self);
  try
    //Mostra o formul�rio de forma "modal", ou seja, impossibilitando de clicar no formul�rio anterior
    FrmReservaApartamento.ShowModal();
  finally
    //Retira a inst�ncia do formul�rio da mem�ria
    FreeAndNil(FrmReservaApartamento);
  end;
end;

end.
