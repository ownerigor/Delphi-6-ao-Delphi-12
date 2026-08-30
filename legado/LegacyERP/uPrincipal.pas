unit uPrincipal;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, Menus, ComCtrls, ExtCtrls,
  Dialogs;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    miClientes: TMenuItem;
    miFornecedores: TMenuItem;
    miProdutos: TMenuItem;
    miUsuarios: TMenuItem;
    Movimentacoes1: TMenuItem;
    miVendas: TMenuItem;
    miCompras: TMenuItem;
    Financeiro1: TMenuItem;
    miReceber: TMenuItem;
    miPagar: TMenuItem;
    Estoque1: TMenuItem;
    miEstoque: TMenuItem;
    Relatorios1: TMenuItem;
    miRelClientes: TMenuItem;
    miRelProdutos: TMenuItem;
    miRelVendas: TMenuItem;
    Sistema1: TMenuItem;
    miSobre: TMenuItem;
    N1: TMenuItem;
    miSair: TMenuItem;
    StatusBar1: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure MenuClick(Sender: TObject);
    procedure miSairClick(Sender: TObject);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  uClientes, uFornecedores, uProdutos, uUsuarios, uVendas, uCompras,
  uEstoque, uContasReceber, uContasPagar, uConsultaVendas, uSobre;

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  StatusBar1.SimpleText :=
    ' Usuario: ADMIN     Banco: Paradox/BDE     ' + DateToStr(Date);
end;

procedure TfrmPrincipal.MenuClick(Sender: TObject);
var
  F: TForm;
  CodigoMenu: Integer;
begin
  CodigoMenu := TMenuItem(Sender).Tag;
  F := nil;

  case CodigoMenu of
    1: F := TfrmClientes.Create(Application);
    2: F := TfrmFornecedores.Create(Application);
    3: F := TfrmProdutos.Create(Application);
    4: F := TfrmUsuarios.Create(Application);
    5: F := TfrmVendas.Create(Application);
    6: F := TfrmCompras.Create(Application);
    7: F := TfrmContasReceber.Create(Application);
    8: F := TfrmContasPagar.Create(Application);
    9: F := TfrmEstoque.Create(Application);
    10: F := TfrmConsultaVendas.CreateConsulta(
      Application, 'CLIENTES', 'Listagem de Clientes');
    11: F := TfrmConsultaVendas.CreateConsulta(
      Application, 'PRODUTOS', 'Listagem de Produtos');
    12: F := TfrmConsultaVendas.CreateConsulta(
      Application, 'VENDAS', 'Vendas por Periodo');
    13: F := TfrmSobre.Create(Application);
  end;

  if Assigned(F) then
  begin
    F.FormStyle := fsMDIChild;
    F.Show;
  end;
end;

procedure TfrmPrincipal.miSairClick(Sender: TObject);
begin
  Close;
end;

end.
