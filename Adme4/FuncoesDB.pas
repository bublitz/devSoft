unit FuncoesDB;

interface

uses SysUtils, DB, IBTable;

function CalcValorVenda( formula: string;
                         valorCusto: real;
                         tbMoeda: TIBTable): real;

implementation

{+---------------------------------------------------------------------+}
{: Função CalcValorVenda                                               :}
{:        Calcula o valor de venda de um produto de acordo com         :}
{:        a fórmula.                                                   :}
{+---------------------------------------------------------------------+}
{: formato : CampoCalculado.Value := CalcValorVenda( .... )            :}
{:                                                                     :}
{: Fórmula: pode ser formada por duas variáveis:                       :}
{:          PC = Preço de Custo do Produto                             :}
{:          Mx = Valor da Moeda Código "x"                             :}
{:          e também por constantes.                                   :}
{:                                                                     :}
{: As variáveis e as constantes devem estar entre colchetes "[]"       :}
{:                                                                     :}
{: Podem ser usadas 4 operações:                                       :}
{: "+" Adição      "-" Subtração     "*" Multiplicação     "/" Divisão :}
{:                                                                     :}
{: Exemplo de Fórmulas:                                                :}
{:                                                                     :}
{: Preço de Custo acrescido de 25%                                     :}
{: [PC]*[1,25]                                                         :}
{:                                                                     :}
{: Preço de Custo dividido pelo valor da Moeda 3                       :}
{: [PC]/[M3]                                                           :}
{:                                                                     :}
{: Preço de Custo multiplicado pelo valor da Moeda 1 com descto de 5%  :}
{: [PC]*[M1]*[0,95]                                                    :}
{:                                                                     :}
{+---------------------------------------------------------------------+}

function CalcValorVenda;
var
  parte: array[1..20] of string;
  opera: array[1..20] of string;
  valor, v1: real;
  i, p, c, moeda: integer;

begin
  c := 1;
  for i := 1 to Length(formula) do
  begin
    if formula[i] = '[' then
      p := i
    else
    if formula[i] = ']' then
    begin
      parte[c] := Copy(formula, p, i-p+1 );
      opera[c] := Copy(formula, i+1, 1 );
      Inc(c);
    end;
  end;
  i := 1;
  if UpperCase(parte[i]) = '[PC]' then
    valor := valorCusto
  else
  if Copy(UpperCase(parte[i]),1,2) = '[M' then
  begin
    moeda := StrToInt(Copy(parte[i],3, Length(parte[i])-3));
    if tbMoeda.Locate('CODIGOMOEDA', moeda, [loPartialKey]) then
      valor := tbMoeda.FieldByName('VALOR').AsFloat
    else
      valor := 0.00;
  end
  else
    valor := StrToFloat(Copy(parte[i],2, Length(parte[i])-2));

  for i := 2 to c - 1 do
  begin
    if UpperCase(parte[i]) = '[PC]' then
      v1 := valorCusto
    else
    if Copy(UpperCase(parte[i]),1,2) = '[M' then
    begin
      moeda := StrToInt(Copy(parte[i],3, Length(parte[i])-3));
      if tbMoeda.Locate('CODIGOMOEDA', moeda, [loPartialKey]) then
        v1 := tbMoeda.FieldByName('VALOR').AsFloat
      else
        v1 := 0.00;
    end
    else
      v1 := StrToFloat(Copy(parte[i],2, Length(parte[i])-2));

    if opera[i-1] = '+' then
      valor := valor + v1
    else
    if opera[i-1] = '-' then
      valor := valor - v1
    else
    if opera[i-1] = '*' then
      valor := valor * v1
    else
    if opera[i-1] = '/' then
      valor := valor / v1;

  end;
  CalcValorVenda := valor;
end;

end.
