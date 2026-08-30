object frmPrincipal: TfrmPrincipal
  Left = 180
  Top = 110
  Width = 900
  Height = 650
  Caption = 'LegacyERP - Sistema Comercial'
  FormStyle = fsMDIForm
  Menu = MainMenu1
  WindowState = wsMaximized
  OnCreate = FormCreate
  object StatusBar1: TStatusBar
    Left = 0
    Top = 574
    Width = 884
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object MainMenu1: TMainMenu
    Left = 16
    Top = 16
    object Cadastros1: TMenuItem
      Caption = '&Cadastros'
      object miClientes: TMenuItem
        Caption = '&Clientes'
        Tag = 1
        OnClick = MenuClick
      end
      object miFornecedores: TMenuItem
        Caption = '&Fornecedores'
        Tag = 2
        OnClick = MenuClick
      end
      object miProdutos: TMenuItem
        Caption = '&Produtos'
        Tag = 3
        OnClick = MenuClick
      end
      object miUsuarios: TMenuItem
        Caption = '&Usuarios'
        Tag = 4
        OnClick = MenuClick
      end
    end
    object Movimentacoes1: TMenuItem
      Caption = '&Movimentacoes'
      object miVendas: TMenuItem
        Caption = '&Vendas'
        Tag = 5
        OnClick = MenuClick
      end
      object miCompras: TMenuItem
        Caption = '&Compras'
        Tag = 6
        OnClick = MenuClick
      end
    end
    object Financeiro1: TMenuItem
      Caption = '&Financeiro'
      object miReceber: TMenuItem
        Caption = 'Contas a &Receber'
        Tag = 7
        OnClick = MenuClick
      end
      object miPagar: TMenuItem
        Caption = 'Contas a &Pagar'
        Tag = 8
        OnClick = MenuClick
      end
    end
    object Estoque1: TMenuItem
      Caption = '&Estoque'
      object miEstoque: TMenuItem
        Caption = 'Consulta de &Estoque'
        Tag = 9
        OnClick = MenuClick
      end
    end
    object Relatorios1: TMenuItem
      Caption = '&Relatorios'
      object miRelClientes: TMenuItem
        Caption = 'Listagem de Clientes'
        Tag = 10
        OnClick = MenuClick
      end
      object miRelProdutos: TMenuItem
        Caption = 'Listagem de Produtos'
        Tag = 11
        OnClick = MenuClick
      end
      object miRelVendas: TMenuItem
        Caption = 'Vendas por Periodo'
        Tag = 12
        OnClick = MenuClick
      end
    end
    object Sistema1: TMenuItem
      Caption = '&Sistema'
      object miSobre: TMenuItem
        Caption = 'S&obre'
        Tag = 13
        OnClick = MenuClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object miSair: TMenuItem
        Caption = 'Sai&r'
        OnClick = miSairClick
      end
    end
  end
end
