unit Pay;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms,
  Dialogs, ExtCtrls, DBGridEh, StdCtrls, GridsEh,
  ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, DBGridEhGrouping;

type
  TPayForm = class(TForm)
    DBGridEhShouHuo: TDBGridEh;
    Panel1: TPanel;
    BtnOk: TButton;
    BtnCancel: TButton;
    LECode: TLabeledEdit;
    LEShouHuo: TLabeledEdit;
    LESum: TLabeledEdit;
    LECredit: TLabeledEdit;
    procedure FormShow(Sender: TObject);
    procedure DBGridEhShouHuoCellClick(Column: TColumnEh);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PayForm: TPayForm;

implementation

uses
  QueryDM, PayUtil;

{$R *.dfm}

procedure TPayForm.FormShow(Sender: TObject);
begin
  DBGridEhShouHuo.DataSource := QueryDataModule.DSPay;
  TPayUtil.showCompany;
end;

procedure TPayForm.DBGridEhShouHuoCellClick(Column: TColumnEh);
begin
  LECode.Text := DBGridEhShouHuo.DataSource.DataSet.FieldByName('����').AsString;
  LEShouHuo.Text := DBGridEhShouHuo.DataSource.DataSet.FieldByName('�ջ���λ').AsString;
  LESum.Text := DBGridEhShouHuo.DataSource.DataSet.FieldByName('��ǰ���').AsString;
  LECredit.Text := DBGridEhShouHuo.DataSource.DataSet.FieldByName('���ö��').AsString;
end;

procedure TPayForm.BtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TPayForm.BtnOkClick(Sender: TObject);
var p: string;
begin
  p := InputBox('��ʾ', '������Ҫ��ֵ�Ľ��', '0');
  if TPayUtil.charge(LEShouHuo.Text, p) then
  begin
    Application.MessageBox(PChar(Format('��ֵ�ɹ���%s��ǰ���Ϊ%s�����ö��Ϊ%s��',
      [LEShouHuo.Text, FloatToStr(StrToFloatDef(LESum.Text, 0) + StrToFloatDef(p, 0)), FloatToStr(StrToFloatDef(LECredit.Text, 0))])), '��ʾ', MB_OK + MB_ICONINFORMATION);
    TPayUtil.showCompany;
  end
  else
  begin
    Application.MessageBox('��ֵʧ�ܣ���ȷ�ϲ�����', '��ʾ', MB_OK +
      MB_ICONSTOP);
  end;
end;

end.

