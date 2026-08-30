unit uFinanceiroBase;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, StdCtrls, ExtCtrls, DB,
  DBTables, DBGrids, DBCtrls, Dialogs;

type
  TfrmFinanceiroBase = class(TForm)
    pnlBotoes: TPanel;
    navRegistros: TDBNavigator;
    btnBaixar: TButton;
    btnFechar: TButton;
    grdContas: TDBGrid;
    tblContas: TTable;
    dsContas: TDataSource;
    procedure BaixarClick(Sender: TObject);
    procedure FecharClick(Sender: TObject);
  protected
    procedure Configurar(const ATabela, ATitulo: String);
  end;

implementation

uses
  uDM;

procedure TfrmFinanceiroBase.Configurar(const ATabela, ATitulo: String);
begin
  Caption := ATitulo;
  btnBaixar.OnClick := BaixarClick;
  btnFechar.OnClick := FecharClick;

  tblContas.DatabaseName := DM.Database.DatabaseName;
  tblContas.TableName := ATabela + '.db';
  tblContas.Open;
  tblContas.First;

  while not tblContas.Eof do
  begin
    if (tblContas.FieldByName('SITUACAO').AsString = 'ABERTO') and
       (not tblContas.FieldByName('DAT_VENCIMENTO').IsNull) and
       (tblContas.FieldByName('DAT_VENCIMENTO').AsDateTime < Date) then
    begin
      tblContas.Edit;
      tblContas.FieldByName('SITUACAO').AsString := 'ATRASADO';
      tblContas.Post;
    end;
    tblContas.Next;
  end;

  tblContas.First;
end;

procedure TfrmFinanceiroBase.BaixarClick(Sender: TObject);
begin
  if tblContas.IsEmpty then
    Exit;

  if tblContas.FieldByName('SITUACAO').AsString = 'PAGO' then
    Exit;

  tblContas.Edit;
  tblContas.FieldByName('DAT_PAGAMENTO').AsDateTime := Date;
  tblContas.FieldByName('VAL_PAGO').AsCurrency :=
    tblContas.FieldByName('VALOR').AsCurrency;
  tblContas.FieldByName('SITUACAO').AsString := 'PAGO';
  tblContas.Post;
end;

procedure TfrmFinanceiroBase.FecharClick(Sender: TObject);
begin
  Close;
end;

end.
