unit RegCode;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Registry, DateUtils;

type
  TRegCodeForm = class(TForm)
    btnReg: TBitBtn;
    edtRegCode: TEdit;
    Label1: TLabel;
    Label5: TLabel;
    edtIDE: TEdit;
    BtnUnReg: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BtnUnRegClick(Sender: TObject);
    procedure btnRegClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure WriteRegistryCode(); //д��ע���뵽ע�����
    function useDateExist(): Boolean; //�Ƿ��Ѿ�ʹ�ù����
    procedure writeUseDate(te: integer = 0); //д���һ��ʹ��ʱ�� ,����Ϊ0ʱд�뵱ǰʱ�䣬����д�뵱ǰʱ��ǰ30��
    function getUseDate(): TDateTime; //��ȡ��һ��ʹ��ʱ��
  end;

var
  RegCodeForm: TRegCodeForm;

implementation

uses Reg, Main;

{$R *.DFM}

procedure TRegCodeForm.FormShow(Sender: TObject);
begin
  EdtIDE.Text := GetNewEncodeKey();
end;

procedure TRegCodeForm.BtnUnRegClick(Sender: TObject);
begin
  Close;
end;

procedure TRegCodeForm.btnRegClick(Sender: TObject);
begin
  MainForm.N2.Visible := not (EdtRegCode.Text = RegisterCode(EdtIDE.Text));
  WriteRegistryCode();
  Close;
end;

procedure TRegCodeForm.WriteRegistryCode;
var Reg: TRegistry;
begin
  reg := TRegistry.Create;
  try
    reg.RootKey := HKEY_CURRENT_USER;
    if reg.OpenKey('\Software\Weight', True) then
    begin
      reg.WriteString('RegistryCode', edtRegCode.Text);
    end;
  finally
    reg.Free;
  end;
end;

procedure TRegCodeForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var useDate: TDateTime;
begin
  //���û�м�¼��һ��ʹ��ʱ�䣬��д���һ��ʹ��ʱ��
  //����Ƚϵ�һ��ʹ��ʱ��͵�ǰʱ�䣬�������һ���£���Ҫ������ע����
  if not useDateExist then
  begin
    writeUseDate;
  end
  else
  begin
    try
      useDate := getUseDate();
    except
      useDate := Now - 60;
      writeUseDate(1);
    end;
    if DaysBetween(Now, useDate) < 30 then
      CanClose := True
    else if EdtRegCode.Text <> RegisterCode(GetNewEncodeKey) then
    begin
      MessageDlg('��������ȷ��ע����', mtInformation, [mbOK], 0);
      CanClose := False;
    end
  end
end;

function TRegCodeForm.useDateExist: Boolean;
var Reg: TRegistry;
begin
  reg := TRegistry.Create;
  try
    reg.RootKey := HKEY_CURRENT_USER;
    if reg.OpenKey('\Software\Weight', True) then
    begin
      result := Reg.ValueExists('useDate');
    end;
  finally
    reg.Free;
  end;
end;

procedure TRegCodeForm.writeUseDate(te: integer);
var Reg: TRegistry;
begin
  reg := TRegistry.Create;
  try
    reg.RootKey := HKEY_CURRENT_USER;
    if reg.OpenKey('\Software\Weight', True) then
    begin
      if te = 0 then
        reg.WriteDateTime('useDate', now)
      else
        reg.WriteDateTime('useDate', now - 30)
    end;
  finally
    reg.Free;
  end;
end;

function TRegCodeForm.getUseDate: TDateTime;
var Reg: TRegistry;
begin
  reg := TRegistry.Create;
  try
    reg.RootKey := HKEY_CURRENT_USER;
    if reg.OpenKey('\Software\Weight', True) then
    begin
      result := reg.ReadDateTime('useDate');
    end;
  finally
    reg.Free;
  end;
end;

end.

