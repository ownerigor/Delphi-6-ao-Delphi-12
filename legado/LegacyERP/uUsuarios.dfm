object frmUsuarios: TfrmUsuarios
  Left = 190
  Top = 120
  Width = 790
  Height = 560
  Caption = 'Cadastro'
  Position = poScreenCenter
  OnCreate = FormCreate
  object pnlCampos: TPanel
    Left = 0
    Top = 0
    Width = 782
    Height = 245
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object lbl1: TLabel
      Left = 16
      Top = 20
      Width = 40
      Height = 13
      Caption = 'Campo 1:'
    end
    object lbl2: TLabel
      Left = 16
      Top = 51
      Width = 40
      Height = 13
      Caption = 'Campo 2:'
    end
    object lbl3: TLabel
      Left = 16
      Top = 82
      Width = 40
      Height = 13
      Caption = 'Campo 3:'
    end
    object lbl4: TLabel
      Left = 16
      Top = 113
      Width = 40
      Height = 13
      Caption = 'Campo 4:'
    end
    object lbl5: TLabel
      Left = 16
      Top = 144
      Width = 40
      Height = 13
      Caption = 'Campo 5:'
    end
    object lbl6: TLabel
      Left = 16
      Top = 175
      Width = 40
      Height = 13
      Caption = 'Campo 6:'
    end
    object lbl7: TLabel
      Left = 16
      Top = 206
      Width = 40
      Height = 13
      Caption = 'Campo 7:'
    end
    object lbl8: TLabel
      Left = 396
      Top = 20
      Width = 40
      Height = 13
      Caption = 'Campo 8:'
    end
    object lbl9: TLabel
      Left = 396
      Top = 51
      Width = 40
      Height = 13
      Caption = 'Campo 9:'
    end
    object lbl10: TLabel
      Left = 396
      Top = 82
      Width = 46
      Height = 13
      Caption = 'Campo 10:'
    end
    object lbl11: TLabel
      Left = 396
      Top = 113
      Width = 46
      Height = 13
      Caption = 'Campo 11:'
    end
    object lbl12: TLabel
      Left = 396
      Top = 144
      Width = 46
      Height = 13
      Caption = 'Campo 12:'
    end
    object lbl13: TLabel
      Left = 396
      Top = 175
      Width = 46
      Height = 13
      Caption = 'Campo 13:'
    end
    object edt1: TDBEdit
      Left = 146
      Top = 16
      Width = 220
      Height = 21
      DataSource = dsDados
      TabOrder = 0
    end
    object edt2: TDBEdit
      Left = 146
      Top = 47
      Width = 220
      Height = 21
      DataSource = dsDados
      TabOrder = 1
    end
    object edt3: TDBEdit
      Left = 146
      Top = 78
      Width = 220
      Height = 21
      DataSource = dsDados
      TabOrder = 2
    end
    object edt4: TDBEdit
      Left = 146
      Top = 109
      Width = 220
      Height = 21
      DataSource = dsDados
      TabOrder = 3
    end
    object edt5: TDBEdit
      Left = 146
      Top = 140
      Width = 220
      Height = 21
      DataSource = dsDados
      TabOrder = 4
    end
    object edt6: TDBEdit
      Left = 146
      Top = 171
      Width = 220
      Height = 21
      DataSource = dsDados
      TabOrder = 5
    end
    object edt7: TDBEdit
      Left = 146
      Top = 202
      Width = 220
      Height = 21
      DataSource = dsDados
      TabOrder = 6
    end
    object edt8: TDBEdit
      Left = 526
      Top = 16
      Width = 220
      Height = 21
      DataSource = dsDados
      TabOrder = 7
    end
    object edt9: TDBEdit
      Left = 526
      Top = 47
      Width = 220
      Height = 21
      DataSource = dsDados
      TabOrder = 8
    end
    object edt10: TDBEdit
      Left = 526
      Top = 78
      Width = 220
      Height = 21
      DataSource = dsDados
      TabOrder = 9
    end
    object edt11: TDBEdit
      Left = 526
      Top = 109
      Width = 220
      Height = 21
      DataSource = dsDados
      TabOrder = 10
    end
    object edt12: TDBEdit
      Left = 526
      Top = 140
      Width = 220
      Height = 21
      DataSource = dsDados
      TabOrder = 11
    end
    object chkAtivo: TDBCheckBox
      Left = 526
      Top = 171
      Width = 100
      Height = 17
      Caption = 'Sim'
      DataSource = dsDados
      TabOrder = 12
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 245
    Width = 782
    Height = 45
    Align = alTop
    TabOrder = 1
    object btnNovo: TButton
      Left = 8
      Top = 9
      Width = 80
      Height = 25
      Caption = '&Novo'
      TabOrder = 0
    end
    object btnAlterar: TButton
      Left = 94
      Top = 9
      Width = 80
      Height = 25
      Caption = '&Alterar'
      TabOrder = 1
    end
    object btnExcluir: TButton
      Left = 180
      Top = 9
      Width = 80
      Height = 25
      Caption = '&Excluir'
      TabOrder = 2
    end
    object btnSalvar: TButton
      Left = 266
      Top = 9
      Width = 80
      Height = 25
      Caption = '&Salvar'
      TabOrder = 3
    end
    object btnCancelar: TButton
      Left = 352
      Top = 9
      Width = 80
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 4
    end
    object btnFechar: TButton
      Left = 438
      Top = 9
      Width = 80
      Height = 25
      Caption = '&Fechar'
      TabOrder = 5
    end
    object btnPesquisar: TButton
      Left = 524
      Top = 9
      Width = 95
      Height = 25
      Caption = '&Pesquisar'
      TabOrder = 6
    end
    object navRegistros: TDBNavigator
      Left = 635
      Top = 9
      Width = 128
      Height = 25
      DataSource = dsDados
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 7
    end
  end
  object grdDados: TDBGrid
    Left = 0
    Top = 290
    Width = 782
    Height = 243
    Align = alClient
    DataSource = dsDados
    ReadOnly = True
    TabOrder = 2
  end
  object tblDados: TTable
    Left = 32
    Top = 312
  end
  object dsDados: TDataSource
    DataSet = tblDados
    Left = 72
    Top = 312
  end
end
