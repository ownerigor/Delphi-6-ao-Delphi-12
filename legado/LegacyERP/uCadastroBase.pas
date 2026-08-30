unit uCadastroBase;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, StdCtrls, ExtCtrls, Dialogs,
  DB, DBTables, DBCtrls, Grids, DBGrids;

type
  TfrmCadastroBase = class(TForm)
    pnlCampos: TPanel;
    pnlBotoes: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    edt1: TDBEdit;
    edt2: TDBEdit;
    edt3: TDBEdit;
    edt4: TDBEdit;
    edt5: TDBEdit;
    edt6: TDBEdit;
    edt7: TDBEdit;
    edt8: TDBEdit;
    edt9: TDBEdit;
    edt10: TDBEdit;
    edt11: TDBEdit;
    edt12: TDBEdit;
    chkAtivo: TDBCheckBox;
    btnNovo: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    btnSalvar: TButton;
    btnCancelar: TButton;
    btnFechar: TButton;
    btnPesquisar: TButton;
    navRegistros: TDBNavigator;
    grdDados: TDBGrid;
    tblDados: TTable;
    dsDados: TDataSource;
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure dsDadosStateChange(Sender: TObject);
  private
    FFields: TStringList;
    procedure MostrarControle(AIndice: Integer;
      const ACampo, ARotulo: String);
  protected
    procedure MontarCadastro(const ATabela, ATitulo: String;
      const ACampos, ARotulos: array of String);
  public
    destructor Destroy; override;
  end;

implementation

uses
  uDM, uFuncoes;

procedure TfrmCadastroBase.MostrarControle(AIndice: Integer;
  const ACampo, ARotulo: String);
var
  Edit: TDBEdit;
  Rotulo: TLabel;
begin
  Rotulo := TLabel(FindComponent('lbl' + IntToStr(AIndice + 1)));
  Rotulo.Caption := ARotulo + ':';
  Rotulo.Visible := True;

  if ACampo = 'FLG_ATIVO' then
  begin
    chkAtivo.Left := Rotulo.Left + 130;
    chkAtivo.Top := Rotulo.Top - 3;
    chkAtivo.DataField := ACampo;
    chkAtivo.Visible := True;
  end
  else
  begin
    Edit := TDBEdit(FindComponent('edt' + IntToStr(AIndice + 1)));
    Edit.DataField := ACampo;
    Edit.Visible := True;
  end;
end;

procedure TfrmCadastroBase.MontarCadastro(const ATabela, ATitulo: String;
  const ACampos, ARotulos: array of String);
var
  I: Integer;
begin
  Caption := ATitulo;
  FFields := TStringList.Create;

  btnNovo.OnClick := btnNovoClick;
  btnAlterar.OnClick := btnAlterarClick;
  btnExcluir.OnClick := btnExcluirClick;
  btnSalvar.OnClick := btnSalvarClick;
  btnCancelar.OnClick := btnCancelarClick;
  btnFechar.OnClick := btnFecharClick;
  btnPesquisar.OnClick := btnPesquisarClick;
  dsDados.OnStateChange := dsDadosStateChange;

  for I := 1 to 13 do
  begin
    TLabel(FindComponent('lbl' + IntToStr(I))).Visible := False;
    if I <= 12 then
      TDBEdit(FindComponent('edt' + IntToStr(I))).Visible := False;
  end;

  chkAtivo.Visible := False;

  for I := 0 to High(ACampos) do
  begin
    FFields.Add(ACampos[I]);
    MostrarControle(I, ACampos[I], ARotulos[I]);
  end;

  tblDados.DatabaseName := DM.Database.DatabaseName;
  tblDados.TableName := ATabela + '.db';
  tblDados.Open;
  dsDadosStateChange(dsDados);
end;

procedure TfrmCadastroBase.btnNovoClick(Sender: TObject);
begin
  tblDados.Append;
  tblDados.Fields[0].AsInteger := ProximoCodigo(
    ChangeFileExt(tblDados.TableName, ''), FFields[0]);
end;

procedure TfrmCadastroBase.btnAlterarClick(Sender: TObject);
begin
  if not tblDados.IsEmpty then
    tblDados.Edit;
end;

procedure TfrmCadastroBase.btnExcluirClick(Sender: TObject);
begin
  if (not tblDados.IsEmpty) and Confirma('Excluir este registro?') then
    tblDados.Delete;
end;

procedure TfrmCadastroBase.btnSalvarClick(Sender: TObject);
begin
  if tblDados.State in [dsEdit, dsInsert] then
    tblDados.Post;
end;

procedure TfrmCadastroBase.btnCancelarClick(Sender: TObject);
begin
  if tblDados.State in [dsEdit, dsInsert] then
    tblDados.Cancel;
end;

procedure TfrmCadastroBase.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadastroBase.btnPesquisarClick(Sender: TObject);
var
  Texto: String;
begin
  if FFields.Count < 2 then
    Exit;

  Texto := InputBox('Pesquisa', 'Digite o texto a localizar:', '');
  if (Texto <> '') and
     (not tblDados.Locate(FFields[1], Texto,
       [loPartialKey, loCaseInsensitive])) then
    MessageDlg('Registro nao encontrado.', mtInformation, [mbOK], 0);
end;

procedure TfrmCadastroBase.dsDadosStateChange(Sender: TObject);
var
  Editando: Boolean;
begin
  Editando := tblDados.State in [dsEdit, dsInsert];
  btnSalvar.Enabled := Editando;
  btnCancelar.Enabled := Editando;
end;

destructor TfrmCadastroBase.Destroy;
begin
  FFields.Free;
  inherited Destroy;
end;

end.
