unit UnitPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, UnitConta;

type
  TForm_Principal = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Calcular: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Novo_Calculo: TButton;
    Fechar: TButton;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    procedure CalcularClick(Sender: TObject);
    procedure Novo_CalculoClick(Sender: TObject);
    procedure FecharClick(Sender: TObject);
    procedure Informar_valor_do_consumo(Sender: TObject);
    procedure Informar_valores_da_fatura(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Principal: TForm_Principal;
  Conta_Luz1: TConta_Luz;

implementation

{$R *.DFM}

procedure TForm_Principal.Informar_valor_do_consumo(Sender: TObject);
var KWh : Integer;
begin
  KWh:=StrtoInt(Edit1.text);
  Conta_Luz1:=TConta_Luz.Create;
  Conta_Luz1.Calcular_Fatura(KWh);
end;

procedure TForm_Principal.Informar_valores_da_fatura(Sender: TObject);
begin
  Label1.Caption:= FormatFloat('0.00',Conta_Luz1.Fornecimento);
  Label2.Caption:= FormatFloat('0.00',Conta_Luz1.ICMS);
  Label3.Caption:= FormatFloat('0.00',Conta_Luz1.COFINS);
  Label4.Caption:= FormatFloat('0.00',Conta_Luz1.PIS_PASEP);
  Label5.Caption:= FormatFloat('0.00',Conta_Luz1.ICMS_COFINS);
  Label6.Caption:= FormatFloat('0.00',Conta_Luz1.ICMS_PIS_PASEP);
  Label7.Caption:= FormatFloat('0.00',Conta_Luz1.Fatura);
  Conta_Luz1.Destroy;
end;

procedure TForm_Principal.CalcularClick(Sender: TObject);
begin
Informar_valor_do_consumo(Sender);
Informar_valores_da_fatura(Sender);
end;

procedure TForm_Principal.Novo_CalculoClick(Sender: TObject);
begin
Label1.Caption:='0.00';
Label2.Caption:='0.00';
Label3.Caption:='0.00';
Label4.Caption:='0.00';
Label5.Caption:='0.00';
Label6.Caption:='0.00';
Label7.Caption:='0.00';
Edit1.Clear;
Edit1.SetFocus;
end;

procedure TForm_Principal.FecharClick(Sender: TObject);
begin
Close;
end;

end.
