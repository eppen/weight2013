unit Login;

interface

uses
  Classes, Controls, Forms, Dialogs, DB, ADODB, StdCtrls, SysUtils,
  RzEdit, RzCmboBx, RzLabel, ActnList, Mask, jpeg, ExtCtrls;

type
  TLoginForm = class(TForm)
    CBUser: TRzComboBox;
    EdtPass: TRzEdit;
    lblLogin: TLabel;
    ALResetPass: TActionList;
    AResetPass: TAction;
    ImgBack: TImage;
    lblHint: TRzLabel;
    lblTitle: TRzLabel;
    lblInfo: TLabel;
    procedure CBUserChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lblLoginClick(Sender: TObject);
    procedure EdtPassKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AResetPassExecute(Sender: TObject);
  private
    { Private declarations }
    EnterTime: Integer; //����ȫ�ֱ��������û��������ʱ�������˳�
  public
    { Public declarations }
    procedure login();
  end;

var
  LoginForm: TLoginForm;

implementation

uses Main, QueryDM, CommonUtil, OtherUtil;

{$R *.dfm}

procedure TLoginForm.CBUserChange(Sender: TObject);
begin
  EdtPass.Clear;
  EdtPass.SetFocus
end;

procedure TLoginForm.FormShow(Sender: TObject);
begin
  if FileExists(ExtractFilePath(ParamStr(0)) + 'login.jpg') then
    ImgBack.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'login.jpg');
  lblHint.Visible := TUserUtil.isDefaultPass();
  TUserUtil.addUser(CBUser);

  lblTitle.Caption := MainForm.systemConfig.loginTitle;
  lblInfo.Caption := MainForm.systemConfig.loginInfo;

  CBUser.Text := '';
  EdtPass.Clear;
  EnterTime := 0;
end;

procedure TLoginForm.lblLoginClick(Sender: TObject);
begin
  login;
end;

procedure TLoginForm.EdtPassKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then
    login;
end;

procedure TLoginForm.login;
begin
  if CBUser.Text <> '' then
  begin
    with QueryDataModule.ADOQUser do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select ���� from �û���Ϣ where �û���=:user');
      Parameters.ParamByName('user').Value := CBUser.Text;
      Open;
      if UpperCase(FieldByName('����').AsString) = UpperCase(TCommonUtil.Md5(EdtPass.Text)) then
      begin
        Self.Close;
        MainForm.CurrentUser := CBUser.Text;
      end
      else
      begin
        if EnterTime < 1 then
          MessageDlg('�û����������д�����ȷ���룡', mtError, [mbOK], 0);
        inc(EnterTime); //��Ϣ���һ�Σ����Զ���1
        if EnterTime = 2 then
          MessageDlg('�û����������������һ�Σ������˳���', mtError, [mbOK], 0);
        if EnterTime = 3 then
          Application.Terminate;
        EdtPass.Clear;
        EdtPass.SetFocus;
      end
    end
  end
end;

procedure TLoginForm.AResetPassExecute(Sender: TObject);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'update �û���Ϣ set ����=:pass';
    Parameters.ParamByName('pass').Value := TCommonUtil.md5('123');
    ExecSQL;
  end;
end;

end.

