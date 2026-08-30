object frmEstoque: TfrmEstoque
  Left = 210
  Top = 130
  Width = 760
  Height = 500
  Caption = 'Consulta de Estoque'
  Position = poScreenCenter
  OnCreate = FormCreate
  object grdEstoque: TStringGrid
    Left = 16
    Top = 16
    Width = 710
    Height = 394
    ColCount = 5
    FixedCols = 0
    RowCount = 2
    TabOrder = 0
  end
  object btnFechar: TButton
    Left = 640
    Top = 425
    Width = 90
    Height = 25
    Caption = 'Fechar'
    TabOrder = 1
    OnClick = FecharClick
  end
  object tblProdutos: TTable
    TableName = 'PRODUTOS.db'
    Left = 32
    Top = 424
  end
end
