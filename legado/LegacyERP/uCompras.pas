unit uCompras;

interface

uses
  Classes, Controls, Forms, uMovimentoBase;

type
  TfrmCompras = class(TfrmMovimentoBase)
    procedure FormCreate(Sender: TObject);
  end;

var
  frmCompras: TfrmCompras;

implementation

{$R *.dfm}

procedure TfrmCompras.FormCreate(Sender: TObject);
begin
  Configurar(False);
end;

end.
