unit uContasReceber;

interface

uses
  Classes, Controls, Forms, uFinanceiroBase;

type
  TfrmContasReceber = class(TfrmFinanceiroBase)
    procedure FormCreate(Sender: TObject);
  end;

var
  frmContasReceber: TfrmContasReceber;

implementation

{$R *.dfm}

procedure TfrmContasReceber.FormCreate(Sender: TObject);
begin
  Configurar('CONTAS_RECEBER', 'Contas a Receber');
end;

end.
