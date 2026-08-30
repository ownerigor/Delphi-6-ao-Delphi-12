object frmSobre: TfrmSobre
  Left = 300
  Top = 220
  BorderStyle = bsDialog
  Caption = 'Sobre o LegacyERP'
  ClientHeight = 210
  ClientWidth = 392
  Position = poScreenCenter
  object lblProduto: TLabel
    Left = 55
    Top = 45
    Width = 282
    Height = 64
    Caption = 
      'LegacyERP - Sistema Comercial'#13#10'Versao 1.0'#13#10'Desenvolvido para Bor' +
      'land Delphi 6'#13#10'Banco de dados Paradox / BDE'
    Font.Height = -13
    ParentFont = False
  end
  object btnOK: TButton
    Left = 155
    Top = 150
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 0
    OnClick = FecharClick
  end
end
