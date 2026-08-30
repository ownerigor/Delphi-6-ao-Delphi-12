object frmVendas: TfrmVendas
  Left = 368
  Top = 204
  Width = 760
  Height = 520
  Caption = 'Movimento'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblTotal: TLabel
    Left = 510
    Top = 416
    Width = 94
    Height = 13
    Caption = 'TOTAL: R$ 0,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object pnlCabecalho: TPanel
    Left = 0
    Top = 0
    Width = 744
    Height = 92
    Align = alTop
    TabOrder = 0
    object lblPessoa: TLabel
      Left = 16
      Top = 18
      Width = 89
      Height = 13
      Caption = 'Codigo da Pessoa:'
    end
    object lblForma: TLabel
      Left = 250
      Top = 18
      Width = 104
      Height = 13
      Caption = 'Forma de Pagamento:'
    end
    object lblProduto: TLabel
      Left = 16
      Top = 59
      Width = 40
      Height = 13
      Caption = 'Produto:'
    end
    object lblQuantidade: TLabel
      Left = 160
      Top = 59
      Width = 58
      Height = 13
      Caption = 'Quantidade:'
    end
    object lblDesconto: TLabel
      Left = 315
      Top = 59
      Width = 49
      Height = 13
      Caption = 'Desconto:'
    end
    object edtPessoa: TEdit
      Left = 145
      Top = 14
      Width = 80
      Height = 21
      TabOrder = 0
      Text = '1'
    end
    object cbForma: TComboBox
      Left = 375
      Top = 14
      Width = 180
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 1
      Text = 'DINHEIRO'
      Items.Strings = (
        'DINHEIRO'
        'BOLETO'
        'CARTAO')
    end
    object edtProduto: TEdit
      Left = 75
      Top = 55
      Width = 65
      Height = 21
      TabOrder = 2
      Text = '1'
    end
    object edtQtd: TEdit
      Left = 230
      Top = 55
      Width = 65
      Height = 21
      TabOrder = 3
      Text = '1'
    end
    object edtDesc: TEdit
      Left = 380
      Top = 55
      Width = 65
      Height = 21
      TabOrder = 4
      Text = '0'
    end
    object btnAdicionar: TButton
      Left = 470
      Top = 53
      Width = 110
      Height = 25
      Caption = 'Adicionar Item'
      TabOrder = 5
    end
    object btnRemover: TButton
      Left = 590
      Top = 53
      Width = 110
      Height = 25
      Caption = 'Remover Item'
      TabOrder = 6
    end
  end
  object grdItens: TStringGrid
    Left = 16
    Top = 100
    Width = 710
    Height = 302
    ColCount = 6
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 1
  end
  object btnFinalizar: TButton
    Left = 476
    Top = 447
    Width = 120
    Height = 25
    Caption = '&Finalizar'
    TabOrder = 2
  end
  object btnFechar: TButton
    Left = 606
    Top = 447
    Width = 120
    Height = 25
    Caption = '&Fechar'
    TabOrder = 3
  end
end
