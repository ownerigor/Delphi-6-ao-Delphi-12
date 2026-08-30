unit uFuncoes;

interface

uses SysUtils, Controls, Dialogs, DBTables;

function SomenteNumeros(const AValor: String): String;
function FormataDocumento(const AValor: String): String;
function Confirma(const AMensagem: String): Boolean;
function ProximoCodigo(const ATabela, ACampo: String): Integer;
function CaminhoDados: String;

implementation

uses Forms, uDM;

function SomenteNumeros(const AValor: String): String;
var I: Integer;
begin
  Result := '';
  for I := 1 to Length(AValor) do
    if AValor[I] in ['0'..'9'] then
      Result := Result + AValor[I];
end;

function FormataDocumento(const AValor: String): String;
var S: String;
begin
  S := SomenteNumeros(AValor);
  Result := S;
  if Length(S) = 11 then
    Result := Copy(S, 1, 3) + '.' + Copy(S, 4, 3) + '.' +
      Copy(S, 7, 3) + '-' + Copy(S, 10, 2)
  else if Length(S) = 14 then
    Result := Copy(S, 1, 2) + '.' + Copy(S, 3, 3) + '.' +
      Copy(S, 6, 3) + '/' + Copy(S, 9, 4) + '-' + Copy(S, 13, 2);
end;

function Confirma(const AMensagem: String): Boolean;
begin
  Result := MessageDlg(AMensagem, mtConfirmation, [mbYes, mbNo], 0) = mrYes;
end;

function ProximoCodigo(const ATabela, ACampo: String): Integer;
var Q: TQuery;
begin
  Q := TQuery.Create(nil);
  try
    Q.DatabaseName := DM.Database.DatabaseName;
    Q.SQL.Text := 'SELECT MAX(' + ACampo + ') AS MAIOR FROM ' + ATabela;
    Q.Open;
    Result := Q.FieldByName('MAIOR').AsInteger + 1;
    if Result < 1 then Result := 1;
  finally
    Q.Free;
  end;
end;

function CaminhoDados: String;
begin
  Result := ExtractFilePath(Application.ExeName) + 'DADOS';
end;

end.
