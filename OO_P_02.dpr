program OO_P_02;

uses
  Forms,
  UnitPrincipal in 'UnitPrincipal.pas' {Form_Principal},
  UnitConta in 'UnitConta.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm_Principal, Form_Principal);
  Application.Run;
end.
