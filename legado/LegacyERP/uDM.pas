unit uDM;

interface

uses
  Windows, SysUtils, Classes, DB, DBTables, Forms;

type
  TDM = class(TDataModule)
    Database: TDatabase;
    procedure DataModuleDestroy(Sender: TObject);
  private
    procedure CriarTabela(const ANome: String;
      const ACampos: array of String; const AChave: String);
    procedure CriarTabelas;
    procedure InserirDadosIniciais;
  public
    procedure InicializarBanco;
  end;

var
  DM: TDM;

implementation

uses
  uFuncoes;

{$R *.dfm}

procedure TDM.InicializarBanco;
begin
  if not DirectoryExists(CaminhoDados) then
    if not CreateDir(CaminhoDados) then
      raise Exception.Create('Nao foi possivel criar a pasta DADOS.');

  Database.Close;
  Database.Params.Values['PATH'] := CaminhoDados;
  Database.Connected := True;
  CriarTabelas;
  InserirDadosIniciais;
end;

procedure TDM.CriarTabela(const ANome: String;
  const ACampos: array of String; const AChave: String);
var
  Table: TTable;
  I: Integer;
  Nome: String;
  Tipo: String;
  Tamanho: Integer;
  TipoCampo: TFieldType;
begin
  if FileExists(CaminhoDados + '\\' + ANome + '.db') then
    Exit;

  if (Length(ACampos) = 0) or ((Length(ACampos) mod 3) <> 0) then
    raise Exception.Create(
      'Definicao de campos invalida para a tabela ' + ANome + '.');

  Table := TTable.Create(nil);
  try
    Table.DatabaseName := Database.DatabaseName;
    Table.TableName := ANome + '.db';
    Table.TableType := ttParadox;
    I := 0;

    while I < High(ACampos) do
    begin
      Nome := ACampos[I];
      Tipo := ACampos[I + 1];
      Tamanho := StrToInt(ACampos[I + 2]);

      if Tipo = 'I' then
        TipoCampo := ftInteger
      else if Tipo = 'S' then
        TipoCampo := ftString
      else if Tipo = 'D' then
        TipoCampo := ftDate
      else if Tipo = 'B' then
        TipoCampo := ftBoolean
      else if Tipo = 'C' then
        TipoCampo := ftCurrency
      else if Tipo = 'F' then
        TipoCampo := ftFloat
      else
        TipoCampo := ftString;

      Table.FieldDefs.Add(Nome, TipoCampo, Tamanho, False);
      Inc(I, 3);
    end;

    if AChave <> '' then
      Table.IndexDefs.Add('', AChave, [ixPrimary, ixUnique]);

    Table.CreateTable;
  finally
    Table.Free;
  end;
end;

procedure TDM.CriarTabelas;
begin
  CriarTabela(
    'USUARIOS',
    ['COD_USUARIO', 'I', '0', 'NOM_USUARIO', 'S', '30',
     'SENHA', 'S', '20', 'NOM_COMPLETO', 'S', '60',
     'FLG_ATIVO', 'B', '0'],
    'COD_USUARIO');

  CriarTabela(
    'CLIENTES',
    ['COD_CLIENTE', 'I', '0', 'NOM_CLIENTE', 'S', '80',
     'CPF_CNPJ', 'S', '18', 'ENDERECO', 'S', '80',
     'NUMERO', 'S', '10', 'BAIRRO', 'S', '40',
     'CIDADE', 'S', '40', 'UF', 'S', '2', 'CEP', 'S', '9',
     'TELEFONE', 'S', '20', 'EMAIL', 'S', '80',
     'DAT_CADASTRO', 'D', '0', 'FLG_ATIVO', 'B', '0'],
    'COD_CLIENTE');

  CriarTabela(
    'FORNECEDORES',
    ['COD_FORNECEDOR', 'I', '0', 'RAZAO_SOCIAL', 'S', '80',
     'NOM_FANTASIA', 'S', '60', 'CNPJ', 'S', '18',
     'ENDERECO', 'S', '80', 'CIDADE', 'S', '40', 'UF', 'S', '2',
     'CEP', 'S', '9', 'TELEFONE', 'S', '20', 'EMAIL', 'S', '80',
     'CONTATO', 'S', '60', 'FLG_ATIVO', 'B', '0'],
    'COD_FORNECEDOR');

  CriarTabela(
    'PRODUTOS',
    ['COD_PRODUTO', 'I', '0', 'DESCRICAO', 'S', '80',
     'UNIDADE', 'S', '5', 'PRECO_CUSTO', 'C', '0',
     'PRECO_VENDA', 'C', '0', 'ESTOQUE_ATUAL', 'F', '0',
     'ESTOQUE_MINIMO', 'F', '0', 'COD_FORNECEDOR', 'I', '0',
     'FLG_ATIVO', 'B', '0'],
    'COD_PRODUTO');

  CriarTabela(
    'VENDAS',
    ['NUM_VENDA', 'I', '0', 'DAT_VENDA', 'D', '0',
     'COD_CLIENTE', 'I', '0', 'VENDEDOR', 'S', '40',
     'FORMA_PAGTO', 'S', '30', 'VAL_TOTAL', 'C', '0'],
    'NUM_VENDA');

  CriarTabela(
    'VENDAS_ITENS',
    ['COD_ITEM', 'I', '0', 'NUM_VENDA', 'I', '0',
     'COD_PRODUTO', 'I', '0', 'QUANTIDADE', 'F', '0',
     'VAL_UNITARIO', 'C', '0', 'DESCONTO', 'C', '0',
     'VAL_TOTAL', 'C', '0'],
    'COD_ITEM');

  CriarTabela(
    'COMPRAS',
    ['NUM_COMPRA', 'I', '0', 'DAT_COMPRA', 'D', '0',
     'COD_FORNECEDOR', 'I', '0', 'DOCUMENTO', 'S', '30',
     'FORMA_PAGTO', 'S', '30', 'VAL_TOTAL', 'C', '0'],
    'NUM_COMPRA');

  CriarTabela(
    'COMPRAS_ITENS',
    ['COD_ITEM', 'I', '0', 'NUM_COMPRA', 'I', '0',
     'COD_PRODUTO', 'I', '0', 'QUANTIDADE', 'F', '0',
     'VAL_UNITARIO', 'C', '0', 'VAL_TOTAL', 'C', '0'],
    'COD_ITEM');

  CriarTabela(
    'CONTAS_RECEBER',
    ['COD_CONTA', 'I', '0', 'COD_CLIENTE', 'I', '0',
     'NUM_VENDA', 'I', '0', 'DAT_EMISSAO', 'D', '0',
     'DAT_VENCIMENTO', 'D', '0', 'VALOR', 'C', '0',
     'DAT_PAGAMENTO', 'D', '0', 'VAL_PAGO', 'C', '0',
     'SITUACAO', 'S', '10'],
    'COD_CONTA');

  CriarTabela(
    'CONTAS_PAGAR',
    ['COD_CONTA', 'I', '0', 'COD_FORNECEDOR', 'I', '0',
     'NUM_COMPRA', 'I', '0', 'DAT_EMISSAO', 'D', '0',
     'DAT_VENCIMENTO', 'D', '0', 'VALOR', 'C', '0',
     'DAT_PAGAMENTO', 'D', '0', 'VAL_PAGO', 'C', '0',
     'SITUACAO', 'S', '10'],
    'COD_CONTA');
end;

procedure TDM.InserirDadosIniciais;
var
  Table: TTable;

  procedure Abrir(const ANome: String);
  begin
    Table.Close;
    Table.TableName := ANome + '.db';
    Table.Open;
  end;

begin
  Table := TTable.Create(nil);
  try
    Table.DatabaseName := Database.DatabaseName;

    Abrir('USUARIOS');
    if Table.IsEmpty then
    begin
      Table.Append;
      Table.FieldByName('COD_USUARIO').AsInteger := 1;
      Table.FieldByName('NOM_USUARIO').AsString := 'ADMIN';
      Table.FieldByName('SENHA').AsString := 'ADMIN';
      Table.FieldByName('NOM_COMPLETO').AsString :=
        'Administrador do Sistema';
      Table.FieldByName('FLG_ATIVO').AsBoolean := True;
      Table.Post;
    end;

    Abrir('CLIENTES');
    if Table.IsEmpty then
    begin
      Table.AppendRecord([
        1, 'COMERCIAL SAO PAULO LTDA', '12.345.678/0001-90',
        'RUA CENTRAL', '100', 'CENTRO', 'SAO PAULO', 'SP', '01000-000',
        '(11) 3333-1000', 'COMPRAS@COMERCIAL.COM', Date, True]);
      Table.AppendRecord([
        2, 'JOSE DA SILVA', '123.456.789-00', 'RUA DAS FLORES', '25',
        'JARDINS', 'SAO PAULO', 'SP', '01400-000', '(11) 9999-1000',
        'JOSE@EMAIL.COM', Date, True]);
    end;

    Abrir('FORNECEDORES');
    if Table.IsEmpty then
      Table.AppendRecord([
        1, 'DISTRIBUIDORA BRASIL LTDA', 'DISTRIBUIDORA BRASIL',
        '98.765.432/0001-10', 'AV INDUSTRIAL, 500', 'CAMPINAS', 'SP',
        '13000-000', '(19) 3333-2000', 'VENDAS@DISTRIBUIDORA.COM',
        'MARIA', True]);

    Abrir('PRODUTOS');
    if Table.IsEmpty then
    begin
      Table.AppendRecord([
        1, 'PAPEL SULFITE A4 500 FOLHAS', 'PCT', 18.50, 29.90,
        40.0, 10.0, 1, True]);
      Table.AppendRecord([
        2, 'CANETA ESFEROGRAFICA AZUL', 'UN', 0.80, 1.90,
        100.0, 20.0, 1, True]);
      Table.AppendRecord([
        3, 'PASTA ARQUIVO MORTO', 'UN', 3.50, 6.90,
        8.0, 10.0, 1, True]);
    end;
  finally
    Table.Free;
  end;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  Database.Connected := False;
end;

end.
