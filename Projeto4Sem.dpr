program Projeto4Sem;

uses
  Forms,
  uPrincipal in 'uPrincipal.pas' {FrmControleHospedes},
  dmPrincipal in 'dmPrincipal.pas' {PrincpalDM: TDataModule},
  uFrmTodosApartamentos in 'uFrmTodosApartamentos.pas' {FrmTodosApartamentos},
  uFrmReservaApartamento in 'uFrmReservaApartamento.pas' {FrmReservaApartamento};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmControleHospedes, FrmControleHospedes);
  Application.Run;
end.
