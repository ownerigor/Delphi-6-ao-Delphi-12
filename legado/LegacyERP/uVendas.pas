unit uVendas;

interface

uses
  Classes, Controls, Forms, uMovimentoBase, Grids, StdCtrls, ExtCtrls;

type
  TfrmVendas = class(TfrmMovimentoBase)
    procedure FormCreate(Sender: TObject);
  end;

var
  frmVendas: TfrmVendas;

implementation

{$R *.dfm}

procedure TfrmVendas.FormCreate(Sender: TObject);
begin
  Configurar(True);
end;

end.
