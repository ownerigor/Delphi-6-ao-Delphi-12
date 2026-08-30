unit uConsultaVendas;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, StdCtrls, ExtCtrls, DB,
  DBTables, DBGrids;

type
  TfrmConsultaVendas = class(TForm)
    pnlFiltro: TPanel;
    lblPeriodo: TLabel;
    edtInicio: TEdit;
    edtFim: TEdit;
    btnConsultar: TButton;
    btnFechar: TButton;
    grdConsulta: TDBGrid;
    qryConsulta: TQuery;
    dsConsulta: TDataSource;
    procedure FiltrarClick(Sender: TObject);
    procedure FecharClick(Sender: TObject);
  private
    FTabela: String;
  public
    constructor CreateConsulta(AOwner: TComponent;
      const ATabela, ATitulo: String);
  end;

var
  frmConsultaVendas: TfrmConsultaVendas;

implementation

uses
  uDM;

{$R *.dfm}

constructor TfrmConsultaVendas.CreateConsulta(AOwner: TComponent;
  const ATabela, ATitulo: String);
begin
  inherited Create(AOwner);

  FTabela := ATabela;
  Caption := ATitulo;
  qryConsulta.DatabaseName := DM.Database.DatabaseName;
  edtInicio.Text := DateToStr(Date - 30);
  edtFim.Text := DateToStr(Date);

  if FTabela <> 'VENDAS' then
  begin
    edtInicio.Enabled := False;
    edtFim.Enabled := False;
  end;

  FiltrarClick(nil);
end;

procedure TfrmConsultaVendas.FiltrarClick(Sender: TObject);
begin
  qryConsulta.Close;
  qryConsulta.SQL.Clear;
  qryConsulta.SQL.Add('SELECT * FROM ' + FTabela);

  if FTabela = 'VENDAS' then
  begin
    qryConsulta.SQL.Add(
      'WHERE DAT_VENDA >= :INI AND DAT_VENDA <= :FIM');
    qryConsulta.ParamByName('INI').AsDate := StrToDate(edtInicio.Text);
    qryConsulta.ParamByName('FIM').AsDate := StrToDate(edtFim.Text);
  end;

  qryConsulta.Open;
end;

procedure TfrmConsultaVendas.FecharClick(Sender: TObject);
begin
  Close;
end;

end.
