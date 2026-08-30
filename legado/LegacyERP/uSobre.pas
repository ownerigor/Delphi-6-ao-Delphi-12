unit uSobre;

interface

uses
  Windows, Classes, Controls, Forms, StdCtrls;

type
  TfrmSobre = class(TForm)
  lblProduto: TLabel;
  btnOK: TButton;
    procedure FecharClick(Sender: TObject);
  end;

var
  frmSobre: TfrmSobre;

implementation

{$R *.dfm}

procedure TfrmSobre.FecharClick(Sender: TObject);
begin
  Close;
end;

end.
