unit uFornecedores;

interface

uses
  Classes, Controls, Forms, uCadastroBase;

type
  TfrmFornecedores = class(TfrmCadastroBase)
    procedure FormCreate(Sender: TObject);
  end;

var
  frmFornecedores: TfrmFornecedores;

implementation

{$R *.dfm}

procedure TfrmFornecedores.FormCreate(Sender: TObject);
begin
  MontarCadastro(
    'FORNECEDORES',
    'Cadastro de Fornecedores',
    ['COD_FORNECEDOR', 'RAZAO_SOCIAL', 'NOM_FANTASIA', 'CNPJ',
     'ENDERECO', 'CIDADE', 'UF', 'CEP', 'TELEFONE', 'EMAIL', 'CONTATO',
     'FLG_ATIVO'],
    ['Codigo', 'Razao Social', 'Nome Fantasia', 'CNPJ', 'Endereco',
     'Cidade', 'UF', 'CEP', 'Telefone', 'E-mail', 'Contato', 'Ativo']);
end;

end.
