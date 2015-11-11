unit SQLDBBackup;

interface

uses
  Windows, SysUtils, Variants, Classes, Controls, Forms,
  ExtCtrls, StdCtrls, Buttons, Dialogs, ShlObj, IniFiles;

type
  TSQLDBBackupForm = class(TForm)
    Panel1: TPanel;
    EdtAddr: TEdit;
    Label1: TLabel;
    BtnSel1: TBitBtn;
    Label2: TLabel;
    EdtRestore: TEdit;
    BtnSel2: TBitBtn;
    OpenDialog1: TOpenDialog;
    BtnBackup: TBitBtn;
    BtnRestore: TBitBtn;
    ClostBtn: TButton;
    BtnCompact: TButton;
    procedure BtnSel2Click(Sender: TObject);
    procedure BtnBackupClick(Sender: TObject);
    procedure BtnRestoreClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnSel1Click(Sender: TObject);
    procedure ClostBtnClick(Sender: TObject);
    procedure BtnCompactClick(Sender: TObject);
  private
    function SelectFolder(const DlgTitle: string): string; //ѡ��·��
    procedure BackupDatabase();
    { Private declarations }
  public
    Path: string;
    { Public declarations }
  end;

var
  SQLDBBackupForm: TSQLDBBackupForm;

implementation

uses QueryDM;

{$R *.dfm}

procedure TSQLDBBackupForm.BackupDatabase(); //�������ݿ�
var BackupPath, DBName: string;
  myini: TiniFile;
begin
  if myini = nil then myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'db.ini');
  try
    DBName := myini.ReadString('db', 'DBName', 'weight20');
  finally
    myini.Free;
  end;
  BackupPath := '''' + EdtAddr.Text + '\' + FormatDateTime('yyyy-mm-dd hh-nn-ss', now) + '.BAK''';
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'use master';
    ExecSQL;

    SQL.Text := 'backup database ' + DBName + ' to disk=' + BackupPath;
    try
      ExecSQL;
      MessageDlg(pchar('���ݿⱸ�ݳɹ���' + #13 + '����·���� '
        + BackupPath), mtInformation, [mbOK], 0);
      SQL.Text := 'use ' + dbname;
      ExecSQL;
    except
      on E: Exception do
      begin
        MessageDlg(pchar(E.Message), mtInformation, [mbOK], 0);
      end;
    end;

    SQL.Text := 'Use weight20';
    ExecSQL;
  end;
end;

function TSQLDBBackupForm.SelectFolder(const DlgTitle: string): string;
var
  bi: TBrowseInfo;
  PathIdList: PItemIdList;
  strPath: string;
begin
  strPath := stringOfChar(' ', 512);
  bi.hwndOwner := self.Handle;
  bi.pidlRoot := nil;
  bi.pszDisplayName := nil;
  bi.lpszTitle := pchar(DlgTitle);
  bi.ulFlags := BIF_ReturnOnlyFsDirs;
  bi.lpfn := nil;
  bi.lParam := 0;
  bi.iImage := 0;
  result := '';
  PathIdList := SHBrowseForFolder(bi);
  if PathIdList <> nil then
    if SHGetPathFromIdList(PathIdList, pchar(strPath)) then
      result := trim(strPath);
end;

procedure TSQLDBBackupForm.BtnSel2Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    EdtRestore.Text := OpenDialog1.FileName;
end;

procedure TSQLDBBackupForm.BtnBackupClick(Sender: TObject);
var myini: TIniFile;
begin
  if EdtAddr.Text = '' then
  begin
    MessageDlg('���ݿⱸ��·��û��ѡ��,�޷����б��ݣ�', mtWarning, [mbOK], 0);
    exit;
  end;
  if myini = nil then myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'db.ini');
  try
    myini.WriteString('db', 'backup_addr', EdtAddr.Text);
  finally
    myini.Free;
  end;
  BackupDatabase();
end;

procedure TSQLDBBackupForm.BtnRestoreClick(Sender: TObject);
begin
  if EdtRestore.Text = '' then
  begin
    MessageDlg('���ݿ�ָ�·��û��ѡ��,�޷����лָ���', mtWarning, [mbOK], 0);
    exit;
  end;
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'Use master';
    ExecSQL;

    SQL.Text := 'restore database :database from disk=:path with replace';
    Parameters.ParamByName('database').Value := 'weight20';
    Parameters.ParamByName('path').Value := EdtRestore.Text;
    try
      ExecSQL;
      MessageDlg('���ݿ�ָ��ɹ���' + #13 + '������Զ��رգ�������������', mtInformation, [mbOK], 0);
      Application.Terminate;
    except
      MessageDlg('���ݿ�ָ�ʧ�ܣ�', mtInformation, [mbOK], 0);
    end;

    SQL.Text := 'Use weight20';
    ExecSQL;
  end;
end;

procedure TSQLDBBackupForm.FormShow(Sender: TObject);
var myini: TIniFile;
begin
  if myini = nil then myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'db.ini');
  try
    EdtAddr.Text := myini.ReadString('db', 'backup_addr', '');
  finally
    myini.Free;
  end;
end;

procedure TSQLDBBackupForm.BtnSel1Click(Sender: TObject);
begin
  EdtAddr.Text := SelectFolder('ѡ�񱸷�·��');
end;

procedure TSQLDBBackupForm.ClostBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TSQLDBBackupForm.BtnCompactClick(Sender: TObject);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    SQL.Add('dbcc shrinkdatabase weight20');
    try
      ExecSQL;
      MessageBox(0, '���ݿ�ѹ���ɹ���', '��ʾ', MB_OK + MB_ICONINFORMATION);
    except
      on E: Exception do
        MessageBox(0, PChar(E.Message), '����', MB_OK + MB_ICONWARNING);
    end;
  end;
end;

end.

