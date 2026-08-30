program LegacyERP;

uses
  Forms, SysUtils, Controls, Dialogs,
  uDM in 'uDM.pas' {DM: TDataModule},
  uFuncoes in 'uFuncoes.pas',
  uLogin in 'uLogin.pas' {frmLogin},
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uClientes in 'uClientes.pas' {frmClientes},
  uFornecedores in 'uFornecedores.pas' {frmFornecedores},
  uProdutos in 'uProdutos.pas' {frmProdutos},
  uUsuarios in 'uUsuarios.pas' {frmUsuarios},
  uVendas in 'uVendas.pas' {frmVendas},
  uCompras in 'uCompras.pas' {frmCompras},
  uEstoque in 'uEstoque.pas' {frmEstoque},
  uContasReceber in 'uContasReceber.pas' {frmContasReceber},
  uContasPagar in 'uContasPagar.pas' {frmContasPagar},
  uConsultaVendas in 'uConsultaVendas.pas' {frmConsultaVendas},
  uSobre in 'uSobre.pas' {frmSobre};

begin
  Application.Initialize;
  Application.Title := 'LegacyERP';
  Application.CreateForm(TDM, DM);
  try
    DM.InicializarBanco;
    frmLogin := TfrmLogin.Create(Application);
    try
      if frmLogin.ShowModal <> mrOk then
        Exit;
    finally
      frmLogin.Free;
    end;
    Application.CreateForm(TfrmPrincipal, frmPrincipal);
    Application.Run;
  except
    on E: Exception do
      MessageDlg('Erro ao iniciar o sistema:' + #13#10 + E.Message,
        mtError, [mbOK], 0);
  end;
end.
