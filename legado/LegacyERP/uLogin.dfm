object frmLogin: TfrmLogin
  Left = 352
  Top = 238
  BorderStyle = bsDialog
  Caption = 'Acesso ao LegacyERP'
  ClientHeight = 154
  ClientWidth = 354
  Position = poScreenCenter
  OnShow = FormShow
  object lblUsuario: TLabel
    Left = 32
    Top = 30
    Width = 40
    Height = 13
    Caption = 'Usuario:'
  end
  object lblSenha: TLabel
    Left = 32
    Top = 66
    Width = 34
    Height = 13
    Caption = 'Senha:'
  end
  object edtUsuario: TEdit
    Left = 104
    Top = 26
    Width = 210
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
    Text = 'ADMIN'
  end
  object edtSenha: TEdit
    Left = 104
    Top = 62
    Width = 210
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
    Text = 'ADMIN'
  end
  object btnEntrar: TButton
    Left = 104
    Top = 106
    Width = 95
    Height = 27
    Caption = '&Entrar'
    Default = True
    TabOrder = 2
    OnClick = btnEntrarClick
  end
  object btnCancelar: TButton
    Left = 219
    Top = 106
    Width = 95
    Height = 27
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 3
  end
end
