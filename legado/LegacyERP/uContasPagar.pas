unit uContasPagar;

interface

uses
  Classes, Controls, Forms, uFinanceiroBase;

type
  TfrmContasPagar = class(TfrmFinanceiroBase)
    procedure FormCreate(Sender: TObject);
  end;

var
  frmContasPagar: TfrmContasPagar;

implementation

{$R *.dfm}

procedure TfrmContasPagar.FormCreate(Sender: TObject);
begin
  Configurar('CONTAS_PAGAR', 'Contas a Pagar');
end;

end.
