object frmConsultaVendas: TfrmConsultaVendas
  Left = 190
  Top = 120
  Width = 850
  Height = 500
  Caption = 'Consulta'
  Position = poScreenCenter
  object pnlFiltro: TPanel
    Left = 0
    Top = 0
    Width = 842
    Height = 48
    Align = alTop
    TabOrder = 0
    object lblPeriodo: TLabel
      Left = 10
      Top = 16
      Width = 39
      Height = 13
      Caption = 'Periodo:'
    end
    object edtInicio: TEdit
      Left = 65
      Top = 12
      Width = 90
      Height = 21
      TabOrder = 0
    end
    object edtFim: TEdit
      Left = 165
      Top = 12
      Width = 90
      Height = 21
      TabOrder = 1
    end
    object btnConsultar: TButton
      Left = 270
      Top = 10
      Width = 85
      Height = 25
      Caption = 'Consultar'
      TabOrder = 2
      OnClick = FiltrarClick
    end
    object btnFechar: TButton
      Left = 750
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Fechar'
      TabOrder = 3
      OnClick = FecharClick
    end
  end
  object grdConsulta: TDBGrid
    Left = 0
    Top = 48
    Width = 842
    Height = 425
    Align = alClient
    DataSource = dsConsulta
    ReadOnly = True
    TabOrder = 1
  end
  object qryConsulta: TQuery
    Left = 32
    Top = 72
  end
  object dsConsulta: TDataSource
    DataSet = qryConsulta
    Left = 72
    Top = 72
  end
end
