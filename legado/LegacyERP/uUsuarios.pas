unit uUsuarios;

interface

uses
  Classes, Controls, Forms, uCadastroBase;

type
  TfrmUsuarios = class(TfrmCadastroBase)
    procedure FormCreate(Sender: TObject);
  end;

var
  frmUsuarios: TfrmUsuarios;

implementation

{$R *.dfm}

procedure TfrmUsuarios.FormCreate(Sender: TObject);
begin
  MontarCadastro(
    'USUARIOS',
    'Cadastro de Usuarios',
    ['COD_USUARIO', 'NOM_USUARIO', 'SENHA', 'NOM_COMPLETO', 'FLG_ATIVO'],
    ['Codigo', 'Usuario', 'Senha', 'Nome Completo', 'Ativo']);
end;

end.
