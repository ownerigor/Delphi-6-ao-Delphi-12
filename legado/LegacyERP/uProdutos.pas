unit uProdutos;

interface

uses
  Classes, Controls, Forms, uCadastroBase;

type
  TfrmProdutos = class(TfrmCadastroBase)
    procedure FormCreate(Sender: TObject);
  end;

var
  frmProdutos: TfrmProdutos;

implementation

{$R *.dfm}

procedure TfrmProdutos.FormCreate(Sender: TObject);
begin
  MontarCadastro(
    'PRODUTOS',
    'Cadastro de Produtos',
    ['COD_PRODUTO', 'DESCRICAO', 'UNIDADE', 'PRECO_CUSTO',
     'PRECO_VENDA', 'ESTOQUE_ATUAL', 'ESTOQUE_MINIMO',
     'COD_FORNECEDOR', 'FLG_ATIVO'],
    ['Codigo', 'Descricao', 'Unidade', 'Preco de Custo', 'Preco de Venda',
     'Estoque Atual', 'Estoque Minimo', 'Fornecedor', 'Ativo']);
end;

end.
