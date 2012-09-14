unit uFrmReservaApartamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, DB, dmPrincipal, ComCtrls;

type
  TFrmReservaApartamento = class(TForm)
    Label1: TLabel;
    dsHospedes: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    Label2: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    dsApartamento: TDataSource;
    Label3: TLabel;
    Tipo: TDBText;
    Label4: TLabel;
    dtEntrada: TDateTimePicker;
    dtSaida: TDateTimePicker;
    Label5: TLabel;
    btnReservar: TButton;
    procedure DBLookupComboBox2Click(Sender: TObject);
    procedure btnReservarClick(Sender: TObject);
  private
    { Private declarations }
    FPrincipalDM: TPrincpalDM;
  private  
    function ApartamentoEstiverLivre(): Boolean;
  public
    { Public declarations }
    constructor Create(DataModule: TPrincpalDM; AOwner: TComponent);
  end;

var
  FrmReservaApartamento: TFrmReservaApartamento;

implementation

{$R *.dfm}

{ TFrmReservaApartamento }

{***********************************************************************************************
  Método de sobreescrita do construtor para iniciar as instâncias necessárias e datasets
 ***********************************************************************************************}
constructor TFrmReservaApartamento.Create(DataModule: TPrincpalDM;
  AOwner: TComponent);
begin
  inherited Create(AOwner);
  FPrincipalDM := DataModule;
  FPrincipalDM.BuscaTodosOsHospedes();
  FPrincipalDM.BuscaApartamentos();  
  dsHospedes.DataSet := FPrincipalDM.cdsHospede;
  dsApartamento.DataSet := FPrincipalDM.cdsApartamento;  
end;

{***********************************************************************************************
  Método para mostrar o tipo do apartamento somente no primeiro click do usuário
 ***********************************************************************************************}
procedure TFrmReservaApartamento.DBLookupComboBox2Click(Sender: TObject);
begin
  Tipo.Visible := True;
end;

{***********************************************************************************************
  Ação responsável por chamar os métodos responsáveis por Reservar um apartamento
 ***********************************************************************************************}
procedure TFrmReservaApartamento.btnReservarClick(Sender: TObject);
begin
  if ApartamentoEstiverLivre() then
  begin
    try
      FPrincipalDM.ReservarApartamento(dtEntrada.Date, dtSaida.Date);
      Application.MessageBox('Apartamento reservado com sucesso!', 'Aviso', MB_OK or MB_ICONINFORMATION);
    except
      on E: Exception do
      begin
        raise Exception.Create('Ocorreu um erro na reserva do apartamento!' + sLineBreak + E.Message);
      end;
    end;
  end;    
end;

{***********************************************************************************************
  Método para verificar se um apartamento está livre
 ***********************************************************************************************}
function TFrmReservaApartamento.ApartamentoEstiverLivre: Boolean;
begin
  Result := True;
  if FPrincipalDM.ApartamentoEstiverReservadoParaEstaData(dtEntrada.Date, dtSaida.Date) then
  begin
    Application.MessageBox('Apartamento já reservado para este período!', 'Aviso', MB_OK or MB_ICONINFORMATION);
    Result := False;
  end;
end;

end.
