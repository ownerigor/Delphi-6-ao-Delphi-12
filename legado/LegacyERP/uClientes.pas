unit uClientes;

interface

uses
  Classes, Controls, Forms, uCadastroBase;

type
  TfrmClientes = class(TfrmCadastroBase)
    procedure FormCreate(Sender: TObject);
  end;

var
  frmClientes: TfrmClientes;

implementation

{$R *.dfm}

procedure TfrmClientes.FormCreate(Sender: TObject);
begin
  MontarCadastro(
    'CLIENTES',
    'Cadastro de Clientes',
    ['COD_CLIENTE', 'NOM_CLIENTE', 'CPF_CNPJ', 'ENDERECO',
     'NUMERO', 'BAIRRO', 'CIDADE', 'UF', 'CEP', 'TELEFONE',
     'EMAIL', 'DAT_CADASTRO', 'FLG_ATIVO'],
    ['Codigo', 'Nome', 'CPF/CNPJ', 'Endereco', 'Numero', 'Bairro',
     'Cidade', 'UF', 'CEP', 'Telefone', 'E-mail', 'Data de Cadastro',
     'Ativo']);
end;

end.
