object frmFinanceiroBase: TfrmFinanceiroBase
  Left = 190
  Top = 120
  Width = 850
  Height = 500
  Caption = 'Financeiro'
  Position = poScreenCenter
  object pnlBotoes: TPanel
    Left = 0
    Top = 425
    Width = 842
    Height = 48
    Align = alBottom
    TabOrder = 0
    object navRegistros: TDBNavigator
      Left = 10
      Top = 10
      Width = 180
      Height = 25
      DataSource = dsContas
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 0
    end
    object btnBaixar: TButton
      Left = 580
      Top = 10
      Width = 120
      Height = 25
      Caption = 'Marcar como Pago'
      TabOrder = 1
      OnClick = BaixarClick
    end
    object btnFechar: TButton
      Left = 710
      Top = 10
      Width = 110
      Height = 25
      Caption = 'Fechar'
      TabOrder = 2
      OnClick = FecharClick
    end
  end
  object grdContas: TDBGrid
    Left = 0
    Top = 0
    Width = 842
    Height = 425
    Align = alClient
    DataSource = dsContas
    ReadOnly = True
    TabOrder = 1
  end
  object tblContas: TTable
    Left = 32
    Top = 32
  end
  object dsContas: TDataSource
    DataSet = tblContas
    Left = 72
    Top = 32
  end
end
