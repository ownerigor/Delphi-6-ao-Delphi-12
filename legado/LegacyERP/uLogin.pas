unit uLogin;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, StdCtrls, DBTables, Dialogs;

type
  TfrmLogin = class(TForm)
    lblUsuario: TLabel;
    lblSenha: TLabel;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    btnEntrar: TButton;
    btnCancelar: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
  end;

var
  frmLogin: TfrmLogin;

implementation

uses
  uDM;

{$R *.dfm}

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  edtUsuario.SetFocus;
end;

procedure TfrmLogin.btnEntrarClick(Sender: TObject);
var
  Query: TQuery;
begin
  Query := TQuery.Create(nil);
  try
    Query.DatabaseName := DM.Database.DatabaseName;
    Query.SQL.Text :=
      'SELECT COD_USUARIO, FLG_ATIVO FROM USUARIOS ' +
      'WHERE NOM_USUARIO = :U AND SENHA = :S';
    Query.ParamByName('U').AsString := UpperCase(Trim(edtUsuario.Text));
    Query.ParamByName('S').AsString := edtSenha.Text;
    Query.Open;

    if Query.IsEmpty or
       not Query.FieldByName('FLG_ATIVO').AsBoolean then
    begin
      MessageDlg('Usuario ou senha invalidos.', mtWarning, [mbOK], 0);
      edtSenha.SelectAll;
      edtSenha.SetFocus;
    end
    else
      ModalResult := mrOk;
  finally
    Query.Free;
  end;
end;

end.
