unit DBConnect;

interface

uses
  Windows, Classes, Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  Buttons, Comobj, inifiles, SysUtils, ComCtrls, DB, ADODB, Variants;

type
  TDBConnectForm = class(TForm)
    OpenDialog1: TOpenDialog;
    Panel2: TPanel;
    PageControl: TPageControl;
    Label1: TLabel;
    BitBtnSel: TBitBtn;
    BitBtnTest: TBitBtn;
    BtnConn: TBitBtn;
    BtnCompact: TBitBtn;
    BtnFix: TBitBtn;
    BtnCancel: TBitBtn;
    CBDefault: TCheckBox;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    RBAccess: TRadioButton;
    RBSQL: TRadioButton;
    BtnClose: TBitBtn;
    lblIp: TLabel;
    EdtDBPath: TMemo;
    BtnCreate: TBitBtn;
    GBFirst: TGroupBox;
    Label2: TLabel;
    EdtIp: TEdit;
    NTCheck: TCheckBox;
    Label4: TLabel;
    Label5: TLabel;
    EdtUser: TEdit;
    EdtPass: TEdit;
    BtnConnect: TBitBtn;
    GBSecond: TGroupBox;
    Label3: TLabel;
    CBDatabase: TComboBox;
    BtnSave: TBitBtn;
    LocalBtn: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BitBtnSelClick(Sender: TObject);
    procedure BtnCompactClick(Sender: TObject);
    procedure BtnFixClick(Sender: TObject);
    procedure CBDefaultClick(Sender: TObject);
    procedure BtnConnClick(Sender: TObject);
    procedure BitBtnTestClick(Sender: TObject);
    procedure RBAccessClick(Sender: TObject);
    procedure RBSQLClick(Sender: TObject);
    procedure BtnConnectClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure NTCheckClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure LocalBtnClick(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure BtnCreateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DBConnectForm: TDBConnectForm;

implementation

uses QueryDM, CommonUtil;
{$R *.dfm}

function DBFileExist(FileName: string; Flag: boolean): string;
begin
  if FileName <> '' then
  begin
    if Flag then
      FileName := ExtractFilePath(ParamStr(0)) + '\Database\Database.mdb';
    if FileExists(FileName) then
      result := FileName
    else
      result := ''
  end
  else
    result := ''
end;

function CompactDatabase(srcFileName, destFileName, dbPassWord: string): boolean; //ѹ�����ݿ�,����Դ�ļ�
const
  SConnectionString = 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=%s;'
    + 'Jet OLEDB:Database Password=%s;';
var DB: OleVariant;
begin
  try
    DB := CreateOleObject('JRO.JetEngine'); //����OLE����,��������OLE���󳬹��������Զ��ͷ�
    OleCheck(DB.CompactDatabase(format(SConnectionString, [srcFileName, dbPassWord]), format(SConnectionString, [destFileName, dbPassWord]))); //ѹ�����ݿ�
    result := CopyFile(pchar(destFileName), pchar(srcFileName), False);
    DeleteFile(destFileName); //ɾ����ʱ�ļ�
  except
    result := False //ѹ��ʧ��
  end
end;

procedure TDBConnectForm.FormShow(Sender: TObject);
var myini: Tinifile;
begin
  myini := Tinifile.Create(ExtractFilePath(ParamStr(0)) + '\db.ini');
  try
    RBAccess.Checked := myini.ReadInteger('db', 'type', 0) = 0;
    RBSQL.Checked := myini.ReadInteger('db', 'type', 0) = 1;

    if RBAccess.Checked then
      PageControl.ActivePageIndex := 0
    else
      PageControl.ActivePageIndex := 1;

    EdtDBPath.Text := myini.ReadString('db', 'addr', '');
    if myini.ReadBool('db', 'default', True) then
    begin
      CBDefault.Checked := True;
      EdtDBPath.Enabled := False;
      BitBtnSel.Enabled := False
    end
    else
      CBDefault.Checked := False;

    CBDatabase.Style := csDropDown;

    EdtIP.Text := myini.ReadString('db', 'IP', '.');
    CBDatabase.Text := myini.ReadString('db', 'DBName', 'weight20');
    EdtUser.Text := myini.ReadString('db', 'user', 'sa');
    EdtPass.Text := TCommonUtil.deBase64(myini.ReadString('db', 'pass', 'MTIz'));
    NTCheck.Checked := myini.ReadBool('db', 'Integrated', True);

    BtnSave.Enabled := False;

  finally
    myini.Free;
  end;
end;

procedure TDBConnectForm.BitBtnSelClick(Sender: TObject);
begin
  OpenDialog1.Execute;
  EdtDBPath.Text := OpenDialog1.FileName
end;

procedure TDBConnectForm.BtnCompactClick(Sender: TObject);
var
  FileName: string;
begin
  FileName := DBFileExist(EdtDBPath.Text, CBDefault.Checked);
  if FileName <> '' then
  begin
    QueryDataModule.DBConnection.Close;
    if CompactDatabase(FileName, ExtractFilePath(FileName) + '\temp.mdb', QueryDM.DB_PASSWORD) then
    begin
      QueryDataModule.DBConnection.Open;
      MessageDlg('���ݿ�ѹ���ɹ���', mtInformation, [mbOK], 0);
      Close
    end
    else
      MessageDlg('���ݿ�ѹ��ʧ�ܣ�', mtWarning, [mbOK], 0);
    QueryDataModule.DBConnection.Open
  end
  else
    MessageDlg('���ݿ��ļ�������,�޷�ѹ����', mtWarning, [mbOK], 0)
end;

procedure TDBConnectForm.BtnFixClick(Sender: TObject);
var
  FileName: string;
begin
  FileName := DBFileExist(EdtDBPath.Text, CBDefault.Checked);
  if FileName <> '' then
  begin
    QueryDataModule.DBConnection.Close;
    if CompactDatabase(FileName, ExtractFilePath(FileName) + '\temp.mdb', QueryDM.DB_PASSWORD) then
    begin
      QueryDataModule.DBConnection.Open;
      MessageDlg('���ݿ��޸��ɹ���', mtInformation, [mbOK], 0);
      Close
    end
    else
      MessageDlg('���ݿ��޸�ʧ�ܣ�', mtWarning, [mbOK], 0);
    QueryDataModule.DBConnection.Open
  end
  else
    MessageDlg('���ݿ��ļ�������,�޷��޸���', mtWarning, [mbOK], 0)
end;

procedure TDBConnectForm.CBDefaultClick(Sender: TObject);
begin
  if CBDefault.Checked then
  begin
    BitBtnSel.Enabled := False;
    EdtDBPath.Text := ExtractFilePath(ParamStr(0)) + '\Database\Database.mdb';
    EdtDBPath.Enabled := False
  end
  else
  begin
    BitBtnSel.Enabled := True;
    EdtDBPath.Enabled := True;
    EdtDBPath.Text := ''
  end
end;

procedure TDBConnectForm.BtnConnClick(Sender: TObject);
var
  FileName: string;
  myini: Tinifile;
begin
  FileName := DBFileExist(EdtDBPath.Text, CBDefault.Checked);
  if FileName <> '' then
  begin
    try
      QueryDataModule.DBConnection.Close;
      QueryDataModule.DBConnection.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='
        + FileName + ';Persist Security Info=False;Jet OLEDB:Database Password=' + QueryDM.DB_PASSWORD;
      QueryDataModule.DBConnection.Open;
    except
      MessageDlg('���ݿ�����ʧ�ܣ�', mtWarning, [mbOK], 0)
    end;
    myini := Tinifile.Create(ExtractFilePath(ParamStr(0)) + '\setup.ini');
    try
      myini.WriteString('db', 'addr', FileName);
      myini.WriteBool('db', 'default', CBDefault.Checked);
      MessageDlg('���ݿ����ӳɹ���', mtInformation, [mbOK], 0);
      Close
    finally
      myini.Free;
    end;
  end
  else
    MessageDlg('���ݿ��ļ�������,�޷����ӣ�', mtWarning, [mbOK], 0)
end;

procedure TDBConnectForm.BitBtnTestClick(Sender: TObject);
var
  FileName: string;
begin
  FileName := DBFileExist(EdtDBPath.Text, CBDefault.Checked);
  if FileName <> '' then
  begin
    try
      QueryDataModule.DBConnection.Close;
      QueryDataModule.DBConnection.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='
        + FileName
        + ';Persist Security Info=False;Jet OLEDB:Database Password=' + QueryDM.DB_PASSWORD;
      QueryDataModule.DBConnection.Open;
      MessageDlg('���ݿ�������ӳɹ���', mtInformation, [mbOK], 0);
    except
      MessageDlg('���ݿ��������ʧ�ܣ�', mtWarning, [mbOK], 0)
    end
  end
  else
    MessageDlg('���ݿ��ļ�������,�޷��������ӣ�', mtWarning, [mbOK], 0)
end;

procedure TDBConnectForm.RBAccessClick(Sender: TObject);
begin
  if (Sender as TRadioButton).Checked then
    RBSQL.Checked := False;
end;

procedure TDBConnectForm.RBSQLClick(Sender: TObject);
begin
  if (Sender as TRadioButton).Checked then
    RBAccess.Checked := False;
end;

procedure TDBConnectForm.BtnConnectClick(Sender: TObject);
var ConnStr: string;
  adoc: TADOConnection;
  adoq: TADOQuery;
begin
  ConnStr := 'Provider=SQLOLEDB.1;'; //OLE DB���ӳ���
  if NTCheck.Checked then //��֤��ʽ
    ConnStr := ConnStr + 'Integrated Security=SSPI;'
  else
    ConnStr := ConnStr + 'User ID=' + trim(EdtUser.Text)
      + ';Password=' + trim(EdtPass.Text) + ';';
  ConnStr := ConnStr + 'Persist Security Info=True;Initial Catalog=master;Data Source='
    + trim(EdtIP.Text);

  adoc := TADOConnection.Create(Application);
  try
    adoc.Close;
    adoc.LoginPrompt := False;
    adoc.ConnectionString := ConnStr;
    try
      adoc.Open;
      MessageDlg('����SQL���ݿ�ɹ���', mtInformation, [mbOK], 0);
      BtnSave.Enabled := True;
      adoq := TADOQuery.Create(Application);
      try
        adoq.Connection := adoc;
        with adoq do
        begin
          Close;
          SQL.Text := 'select name from sysdatabases';
          Open;
          if not IsEmpty then
          begin
            CBDatabase.Items.Clear;
            First;
            while not EOF do
            begin
              CBDatabase.Items.Add(LowerCase(FieldByName('name').AsString));
              Next;
            end;
          end;
        end;
      finally
        adoq.Free;
      end;
    except on e: Exception do
      begin
        MessageDlg('���ݿ�����ʧ��,����������' + Chr(13) + Chr(10) + E.Message, mtError, [mbOK], 0);
        BtnSave.Enabled := False;
      end;
    end;
  finally
    adoc.Free;
  end;
end;

procedure TDBConnectForm.BtnSaveClick(Sender: TObject);
var myini: TIniFile;
begin
  if CBDatabase.Text = '' then
  begin
    MessageBoxW(Handle, '����ѡ�����ݿ�', '��ʾ', MB_OK + MB_ICONWARNING +
      MB_TOPMOST);
    Exit;
  end;
  if myini = nil then myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'db.ini');
  try
    myini.WriteString('db', 'IP', EdtIP.Text);
    myini.WriteString('db', 'DBName', CBDatabase.Text);
    myini.WriteString('db', 'user', EdtUser.Text);
    myini.WriteString('db', 'pass', TCommonUtil.base64(EdtPass.Text));
    myini.WriteBool('db', 'integrated', NTCheck.Checked); //��֤��ʽ
    MessageDlg('�������ݿ�����ɹ���', mtInformation, [mbOK], 0);
    TCommonUtil.Set_WindowsXP_FireWall(False);
    Close;
  finally
    myini.Free;
  end;
end;

procedure TDBConnectForm.NTCheckClick(Sender: TObject);
begin
  EdtUser.Enabled := not NTCheck.Checked;
  EdtPass.Enabled := not NTCheck.Checked;
end;

procedure TDBConnectForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var myini: TiniFile;
begin
  myini := TiniFile.Create(ExtractFilePath(ParamStr(0)) + 'db.ini');
  try
    if RBAccess.Checked then
      myini.WriteInteger('db', 'type', 0)
    else if RBSQL.Checked then
      myini.WriteInteger('db', 'type', 1);
  finally
    myini.Free;
  end;
end;

procedure TDBConnectForm.BtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TDBConnectForm.BtnCancelClick(Sender: TObject);
begin
  Close
end;

procedure TDBConnectForm.LocalBtnClick(Sender: TObject);
var i: Integer;
begin
  RBSQL.Checked := True;
  EdtIp.Text := '.';
  NTCheck.Checked := True;
  BtnConnect.Click;
  for i := 0 to CBDatabase.Items.Count - 1 do
  begin
    if UpperCase(CBDatabase.Items.Strings[i]) = 'WEIGHT20' then
    begin
      CBDatabase.Text := 'WEIGHT20';
      BtnSave.Click;
      Exit;
    end
  end;
  //δ�ҵ����ݿ�
  Application.MessageBox('δ�ҵ��������ݿ����,����ʧ��', '����', MB_OK +
    MB_ICONSTOP + MB_TOPMOST);
end;

procedure TDBConnectForm.TabSheet2Show(Sender: TObject);
begin
  lblIp.Caption := Format('����IP : %s', [TCommonUtil.getLocalIp]);
end;

procedure TDBConnectForm.BtnCreateClick(Sender: TObject);
begin
  if Application.MessageBox('��ɾ������"WEIGHT20"�����ݿ�,�Ƿ����?', '��ʾ',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2 + MB_TOPMOST) = IDYES then
  begin
    if FileExists(ExtractFilePath(ParamStr(0)) + 'Database\WEIGHT20.SQL') then
    begin
      WinExec(PChar('osql -E -n -i ' + ExtractFilePath(ParamStr(0)) + 'Database\WEIGHT20.SQL'), SW_SHOW);
    end
    else
    begin
      Application.MessageBox('�ű��ļ�������,ϵͳ�˳�����.', '��ʾ', MB_OK +
        MB_ICONINFORMATION + MB_TOPMOST);
    end;
  end;
end;

end.
d.

