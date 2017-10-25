unit UnitConta;

interface

type
 TConta_Luz = class(TObject)
public
     Fornecimento: Double;
     ICMS:Double;
     COFINS:Double;
     PIS_PASEP:Double;
     ICMS_COFINS:Double;
     ICMS_PIS_PASEP:Double;
     Fatura:Double;
     function Calcular_Fornecimento(X:Integer):Double;
     function Calcular_ICMS(X:Integer):Double;
     function Calcular_COFINS(X:Integer):Double;
     function Calcular_PIS_PASEP(X:Integer):Double;
     function Calcular_ICMS_COFINS(X:Integer):Double;
     function Calcular_ICMS_PIS_PASEP(X:Integer):Double;
     function Calcular_Fatura(X:Integer):Double;
  end;

implementation

{ TConta_Luz }

function TConta_Luz.Calcular_Fornecimento(X: Integer): Double;
begin
  result:= (X * 0.28172);
end;

function TConta_Luz.Calcular_ICMS(X: Integer): Double;
begin
  if X<= 200 then
    result:= (Calcular_Fornecimento(X)* 0.136363)
  else
    result:= (Calcular_Fornecimento(X)* 0.333333);
end;

function TConta_Luz.Calcular_COFINS(X: Integer): Double;
begin
  if X<= 200 then
    result:= (Calcular_Fornecimento(X)* 0.0614722)
  else
    result:= (Calcular_Fornecimento(X)* 0.0730751);
end;

function TConta_Luz.Calcular_PIS_PASEP(X: Integer): Double;
begin
  if X<= 200 then
    result:= (Calcular_Fornecimento(X)* 0.013346)
  else
    result:= (Calcular_Fornecimento(X)* 0.0158651);
end;

function TConta_Luz.Calcular_ICMS_COFINS(X: Integer): Double;
begin
  if X<= 200 then
    result:= (Calcular_Fornecimento(X)* 0.136363 * 0.0614722)
  else
    result:= (Calcular_Fornecimento(X)* 0.333333 * 0.0730751);
end;

function TConta_Luz.Calcular_ICMS_PIS_PASEP(X: Integer): Double;
begin
  if X<= 200 then
    result:= (Calcular_Fornecimento(X)* 0.136363 * 0.013346)
  else
    result:= (Calcular_Fornecimento(X)* 0.333333 * 0.0158651);
end;

function TConta_Luz.Calcular_Fatura(X: Integer): Double;
begin
    Fornecimento:= Calcular_Fornecimento(X);
    ICMS:= Calcular_ICMS(X);
    COFINS:= Calcular_COFINS(X);
    PIS_PASEP:= Calcular_PIS_PASEP(X);
    ICMS_COFINS:= Calcular_ICMS_COFINS(X);
    ICMS_PIS_PASEP:= Calcular_ICMS_PIS_PASEP(X);
    Fatura:= (Fornecimento + ICMS + COFINS  + PIS_PASEP + ICMS_COFINS + ICMS_PIS_PASEP);
    result:= Fatura;
end;


end.
