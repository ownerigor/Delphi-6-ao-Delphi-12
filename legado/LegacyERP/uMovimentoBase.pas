unit uMovimentoBase;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms, StdCtrls, ExtCtrls,
  Grids, DB, DBTables, Dialogs;

type
  TfrmMovimentoBase = class(TForm)
    pnlCabecalho: TPanel;
    lblPessoa: TLabel;
    lblForma: TLabel;
    lblProduto: TLabel;
    lblQuantidade: TLabel;
    lblDesconto: TLabel;
    edtPessoa: TEdit;
    edtProduto: TEdit;
    edtQtd: TEdit;
    edtDesc: TEdit;
    cbForma: TComboBox;
    btnAdicionar: TButton;
    btnRemover: TButton;
    btnFinalizar: TButton;
    btnFechar: TButton;
    grdItens: TStringGrid;
    lblTotal: TLabel;
    procedure AdicionarClick(Sender: TObject);
    procedure RemoverClick(Sender: TObject);
    procedure FinalizarClick(Sender: TObject);
    procedure FecharClick(Sender: TObject);
  private
    FVenda: Boolean;
    FTotal: Currency;
    function ValorProduto(ACodigo: Integer): Currency;
    function NomeProduto(ACodigo: Integer): String;
  protected
    procedure Configurar(AEhVenda: Boolean);
  end;

implementation

uses
  uDM, uFuncoes;

procedure TfrmMovimentoBase.Configurar(AEhVenda: Boolean);
begin
  FVenda := AEhVenda;
  btnAdicionar.OnClick := AdicionarClick;
  btnRemover.OnClick := RemoverClick;
  btnFinalizar.OnClick := FinalizarClick;
  btnFechar.OnClick := FecharClick;

  if FVenda then
  begin
    Caption := 'Lancamento de Venda';
    lblPessoa.Caption := 'Codigo do Cliente:';
  end
  else
  begin
    Caption := 'Lancamento de Compra';
    lblPessoa.Caption := 'Codigo do Fornecedor:';
  end;

  edtDesc.Enabled := FVenda;
  grdItens.Cells[0, 0] := 'Codigo';
  grdItens.Cells[1, 0] := 'Produto';
  grdItens.Cells[2, 0] := 'Quantidade';
  grdItens.Cells[3, 0] := 'Valor Unit.';
  grdItens.Cells[4, 0] := 'Desconto';
  grdItens.Cells[5, 0] := 'Total';
  grdItens.ColWidths[0] := 55;
  grdItens.ColWidths[1] := 260;
end;

function TfrmMovimentoBase.ValorProduto(ACodigo: Integer): Currency;
var
  Table: TTable;
begin
  Result := 0;
  Table := TTable.Create(nil);
  try
    Table.DatabaseName := DM.Database.DatabaseName;
    Table.TableName := 'PRODUTOS.db';
    Table.Open;

    if Table.FindKey([ACodigo]) then
      if FVenda then
        Result := Table.FieldByName('PRECO_VENDA').AsCurrency
      else
        Result := Table.FieldByName('PRECO_CUSTO').AsCurrency;
  finally
    Table.Free;
  end;
end;

function TfrmMovimentoBase.NomeProduto(ACodigo: Integer): String;
var
  Table: TTable;
begin
  Result := '';
  Table := TTable.Create(nil);
  try
    Table.DatabaseName := DM.Database.DatabaseName;
    Table.TableName := 'PRODUTOS.db';
    Table.Open;

    if Table.FindKey([ACodigo]) then
      Result := Table.FieldByName('DESCRICAO').AsString;
  finally
    Table.Free;
  end;
end;

procedure TfrmMovimentoBase.AdicionarClick(Sender: TObject);
var
  CodigoProduto: Integer;
  Linha: Integer;
  Quantidade: Double;
  ValorUnitario: Currency;
  Desconto: Currency;
  TotalItem: Currency;
  Nome: String;
begin
  CodigoProduto := StrToIntDef(edtProduto.Text, 0);
  Quantidade := StrToFloatDef(edtQtd.Text, 0);
  Desconto := StrToCurrDef(edtDesc.Text, 0);
  Nome := NomeProduto(CodigoProduto);
  ValorUnitario := ValorProduto(CodigoProduto);

  if (CodigoProduto = 0) or (Nome = '') or (Quantidade <= 0) then
  begin
    MessageDlg('Informe um produto e uma quantidade validos.',
      mtWarning, [mbOK], 0);
    Exit;
  end;

  TotalItem := ValorUnitario * Quantidade - Desconto;
  Linha := grdItens.RowCount - 1;

  if grdItens.Cells[0, Linha] <> '' then
  begin
    grdItens.RowCount := grdItens.RowCount + 1;
    Linha := grdItens.RowCount - 1;
  end;

  grdItens.Cells[0, Linha] := IntToStr(CodigoProduto);
  grdItens.Cells[1, Linha] := Nome;
  grdItens.Cells[2, Linha] := FloatToStr(Quantidade);
  grdItens.Cells[3, Linha] := CurrToStr(ValorUnitario);
  grdItens.Cells[4, Linha] := CurrToStr(Desconto);
  grdItens.Cells[5, Linha] := CurrToStr(TotalItem);

  FTotal := FTotal + TotalItem;
  lblTotal.Caption := 'TOTAL: R$ ' + FormatFloat('#,##0.00', FTotal);
end;

procedure TfrmMovimentoBase.RemoverClick(Sender: TObject);
var
  Linha: Integer;
  I: Integer;
begin
  Linha := grdItens.Row;
  if (Linha < 1) or (grdItens.Cells[0, Linha] = '') then
    Exit;

  FTotal := FTotal - StrToCurrDef(grdItens.Cells[5, Linha], 0);

  for I := Linha to grdItens.RowCount - 2 do
    grdItens.Rows[I].Assign(grdItens.Rows[I + 1]);

  grdItens.Rows[grdItens.RowCount - 1].Clear;
  lblTotal.Caption := 'TOTAL: R$ ' + FormatFloat('#,##0.00', FTotal);
end;

procedure TfrmMovimentoBase.FinalizarClick(Sender: TObject);
var
  Cabecalho: TTable;
  Itens: TTable;
  Produtos: TTable;
  Financeiro: TTable;
  Numero: Integer;
  I: Integer;
  CodigoPessoa: Integer;
  CodigoProduto: Integer;
  Quantidade: Double;
  TotalItem: Currency;
begin
  CodigoPessoa := StrToIntDef(edtPessoa.Text, 0);
  if (CodigoPessoa = 0) or (FTotal <= 0) then
  begin
    MessageDlg('Informe o cliente/fornecedor e pelo menos um item.',
      mtWarning, [mbOK], 0);
    Exit;
  end;

  Cabecalho := TTable.Create(nil);
  Itens := TTable.Create(nil);
  Produtos := TTable.Create(nil);
  Financeiro := TTable.Create(nil);
  try
    Cabecalho.DatabaseName := DM.Database.DatabaseName;
    Itens.DatabaseName := DM.Database.DatabaseName;
    Produtos.DatabaseName := DM.Database.DatabaseName;
    Financeiro.DatabaseName := DM.Database.DatabaseName;

    if FVenda then
    begin
      Cabecalho.TableName := 'VENDAS.db';
      Itens.TableName := 'VENDAS_ITENS.db';
      Financeiro.TableName := 'CONTAS_RECEBER.db';
      Numero := ProximoCodigo('VENDAS', 'NUM_VENDA');
    end
    else
    begin
      Cabecalho.TableName := 'COMPRAS.db';
      Itens.TableName := 'COMPRAS_ITENS.db';
      Financeiro.TableName := 'CONTAS_PAGAR.db';
      Numero := ProximoCodigo('COMPRAS', 'NUM_COMPRA');
    end;

    Produtos.TableName := 'PRODUTOS.db';
    Cabecalho.Open;
    Itens.Open;
    Produtos.Open;
    Financeiro.Open;
    DM.Database.StartTransaction;
    try
      Cabecalho.Append;
      Cabecalho.Fields[0].AsInteger := Numero;
      Cabecalho.Fields[1].AsDateTime := Date;
      Cabecalho.Fields[2].AsInteger := CodigoPessoa;

      if FVenda then
        Cabecalho.FieldByName('VENDEDOR').AsString := 'ADMIN'
      else
        Cabecalho.FieldByName('DOCUMENTO').AsString :=
          'COMPRA ' + IntToStr(Numero);

      Cabecalho.FieldByName('FORMA_PAGTO').AsString := cbForma.Text;
      Cabecalho.FieldByName('VAL_TOTAL').AsCurrency := FTotal;
      Cabecalho.Post;

      for I := 1 to grdItens.RowCount - 1 do
      begin
        if grdItens.Cells[0, I] <> '' then
        begin
          CodigoProduto := StrToInt(grdItens.Cells[0, I]);
          Quantidade := StrToFloat(grdItens.Cells[2, I]);
          TotalItem := StrToCurr(grdItens.Cells[5, I]);

          Itens.Append;
          Itens.FieldByName('COD_ITEM').AsInteger := ProximoCodigo(
            ChangeFileExt(Itens.TableName, ''), 'COD_ITEM');
          Itens.Fields[1].AsInteger := Numero;
          Itens.FieldByName('COD_PRODUTO').AsInteger := CodigoProduto;
          Itens.FieldByName('QUANTIDADE').AsFloat := Quantidade;
          Itens.FieldByName('VAL_UNITARIO').AsCurrency :=
            StrToCurr(grdItens.Cells[3, I]);

          if FVenda then
            Itens.FieldByName('DESCONTO').AsCurrency :=
              StrToCurr(grdItens.Cells[4, I]);

          Itens.FieldByName('VAL_TOTAL').AsCurrency := TotalItem;
          Itens.Post;

          if Produtos.FindKey([CodigoProduto]) then
          begin
            if FVenda and
               (Produtos.FieldByName('ESTOQUE_ATUAL').AsFloat <
                Quantidade) then
              raise Exception.Create(
                'Estoque insuficiente para o produto ' +
                IntToStr(CodigoProduto) + '.');

            Produtos.Edit;
            if FVenda then
              Produtos.FieldByName('ESTOQUE_ATUAL').AsFloat :=
                Produtos.FieldByName('ESTOQUE_ATUAL').AsFloat - Quantidade
            else
              Produtos.FieldByName('ESTOQUE_ATUAL').AsFloat :=
                Produtos.FieldByName('ESTOQUE_ATUAL').AsFloat + Quantidade;
            Produtos.Post;
          end;
        end;
      end;

      if cbForma.Text <> 'DINHEIRO' then
      begin
        Financeiro.Append;
        Financeiro.FieldByName('COD_CONTA').AsInteger := ProximoCodigo(
          ChangeFileExt(Financeiro.TableName, ''), 'COD_CONTA');
        Financeiro.Fields[1].AsInteger := CodigoPessoa;
        Financeiro.Fields[2].AsInteger := Numero;
        Financeiro.FieldByName('DAT_EMISSAO').AsDateTime := Date;
        Financeiro.FieldByName('DAT_VENCIMENTO').AsDateTime := Date + 30;
        Financeiro.FieldByName('VALOR').AsCurrency := FTotal;
        Financeiro.FieldByName('VAL_PAGO').AsCurrency := 0;
        Financeiro.FieldByName('SITUACAO').AsString := 'ABERTO';
        Financeiro.Post;
      end;

      DM.Database.Commit;
      MessageDlg(
        'Movimento numero ' + IntToStr(Numero) + ' gravado com sucesso.',
        mtInformation, [mbOK], 0);
      Close;
    except
      DM.Database.Rollback;
      raise;
    end;
  finally
    Financeiro.Free;
    Produtos.Free;
    Itens.Free;
    Cabecalho.Free;
  end;
end;

procedure TfrmMovimentoBase.FecharClick(Sender: TObject);
begin
  Close;
end;

end.
