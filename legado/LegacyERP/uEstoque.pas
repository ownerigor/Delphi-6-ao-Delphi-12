unit uEstoque;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, StdCtrls, Grids, DBTables;

type
  TfrmEstoque = class(TForm)
    grdEstoque: TStringGrid;
    btnFechar: TButton;
    tblProdutos: TTable;
    procedure FormCreate(Sender: TObject);
    procedure FecharClick(Sender: TObject);
  end;

var
  frmEstoque: TfrmEstoque;

implementation

uses
  uDM;

{$R *.dfm}

procedure TfrmEstoque.FormCreate(Sender: TObject);
var
  Linha: Integer;
begin
  grdEstoque.Cells[0, 0] := 'Produto';
  grdEstoque.Cells[1, 0] := 'Descricao';
  grdEstoque.Cells[2, 0] := 'Estoque Atual';
  grdEstoque.Cells[3, 0] := 'Estoque Minimo';
  grdEstoque.Cells[4, 0] := 'Situacao';
  grdEstoque.ColWidths[1] := 300;
  grdEstoque.ColWidths[4] := 130;

  tblProdutos.DatabaseName := DM.Database.DatabaseName;
  tblProdutos.Open;
  Linha := 1;

  while not tblProdutos.Eof do
  begin
    if Linha >= grdEstoque.RowCount then
      grdEstoque.RowCount := grdEstoque.RowCount + 1;

    grdEstoque.Cells[0, Linha] :=
      tblProdutos.FieldByName('COD_PRODUTO').AsString;
    grdEstoque.Cells[1, Linha] :=
      tblProdutos.FieldByName('DESCRICAO').AsString;
    grdEstoque.Cells[2, Linha] :=
      tblProdutos.FieldByName('ESTOQUE_ATUAL').AsString;
    grdEstoque.Cells[3, Linha] :=
      tblProdutos.FieldByName('ESTOQUE_MINIMO').AsString;

    if tblProdutos.FieldByName('ESTOQUE_ATUAL').AsFloat <=
       tblProdutos.FieldByName('ESTOQUE_MINIMO').AsFloat then
      grdEstoque.Cells[4, Linha] := 'REPOR ESTOQUE'
    else
      grdEstoque.Cells[4, Linha] := 'NORMAL';

    Inc(Linha);
    tblProdutos.Next;
  end;
end;

procedure TfrmEstoque.FecharClick(Sender: TObject);
begin
  Close;
end;

end.
