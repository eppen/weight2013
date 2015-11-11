unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ComCtrls, StdCtrls, RzButton, Mask, RzEdit, RzBtnEdt,
  ComObj;

type
  TMainForm = class(TForm)
    BtnEdt15: TRzButtonEdit;
    BtnEdt20: TRzButtonEdit;
    BtnTransform: TRzBitBtn;
    BtnClose: TRzBitBtn;
    lbl15: TLabel;
    lbl20: TLabel;
    PB: TProgressBar;
    lblTime: TLabel;
    CBCopyPic: TCheckBox;
    procedure BtnEdt15ButtonClick(Sender: TObject);
    procedure BtnEdt20ButtonClick(Sender: TObject);
    procedure BtnTransformClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CBCopyPicClick(Sender: TObject);
  private
    { Private declarations }
    adoc15, adoc20: TADOConnection;
    adoq15, adoq20: TADOQuery;
    function importBackRecord(): Boolean;
    function importWeightImg(): Boolean;
    function importBackupInfo(bTitle: string): Boolean;
    function importPrepareInfo(): Boolean;
    function importTao(): Boolean;
    function importLog(): Boolean;
    function importUserInfo(): Boolean;
    function importWeightInfo(): Boolean;
  public
    { Public declarations }
    function get15Connection(): Boolean;
    function get20Connection(): Boolean;
    function transform(): Boolean;
    function compactDatabase15(): Boolean;
    function compactDatabase20(): Boolean;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

{ TMainForm }

procedure TMainForm.BtnEdt15ButtonClick(Sender: TObject);
var od: TOpenDialog;
begin
  od := TOpenDialog.Create(nil);
  try
    od.InitialDir := ExtractFilePath(ParamStr(0));
    od.Filter := '���ݿ��ļ�(*.mdb)|*.mdb';
    if od.Execute then
    begin
      BtnEdt15.Text := od.FileName;
    end;
  finally
    od.Free;
  end;
end;

procedure TMainForm.BtnEdt20ButtonClick(Sender: TObject);
var od: TOpenDialog;
begin
  od := TOpenDialog.Create(nil);
  try
    od.InitialDir := ExtractFilePath(ParamStr(0));
    od.Filter := '���ݿ��ļ�(*.mdb)|*.mdb';
    if od.Execute then
    begin
      BtnEdt20.Text := od.FileName;
    end;
  finally
    od.Free;
  end;
end;

function TMainForm.transform: Boolean;
var adoq15, adoq20: TADOQuery;
  ret: Boolean;
begin
  if not get15Connection() then
  begin
    Application.MessageBox('����1.5�����ݿ�ʧ��!', '����', MB_OK + MB_ICONSTOP
      + MB_TOPMOST);
    Result := False;
    Exit;
  end;
  if not get20Connection() then
  begin
    Application.MessageBox('����2.0�����ݿ�ʧ��!', '����', MB_OK + MB_ICONSTOP
      + MB_TOPMOST);
    Result := False;
    Exit;
  end;

  ret := importBackRecord;
  ret := importBackupInfo('����1');
  ret := importBackupInfo('����2');
  ret := importBackupInfo('����3');
  ret := importBackupInfo('����4');
  ret := importBackupInfo('����5');
  ret := importBackupInfo('������λ');
  ret := importBackupInfo('�ջ���λ');
  ret := importBackupInfo('����');
  ret := importBackupInfo('���');
  ret := importLog;
  ret := importPrepareInfo;
  ret := importTao;
  ret := importUserInfo;
  if CBCopyPic.Checked then
    ret := importWeightImg;
  ret := importWeightInfo;

  ret := compactDatabase20;
  Result := ret;
end;

procedure TMainForm.BtnTransformClick(Sender: TObject);
var t: LongInt;
begin
  if Application.MessageBox('�����н�ɾ��2.0�汾�е����ݣ��Ƿ������',
    '��ʾ', MB_YESNO + MB_ICONWARNING + MB_TOPMOST) = IDNO then
  begin
    Exit;
  end;
  t := GetTickCount;
  BtnTransform.Enabled := False;
  try
    lblTime.Caption := '���ݿ�������...';
    if transform then
    begin
      lblTime.Caption := Format('����%d����', [GetTickCount - t]);
      Application.MessageBox('���ݿ������ɹ���', '��ʾ', MB_OK +
        MB_ICONINFORMATION + MB_TOPMOST);
    end
    else
    begin
      Application.MessageBox('����ʧ�ܣ�', '����', MB_OK +
        MB_ICONSTOP + MB_TOPMOST);
    end;
  finally
    PB.Position := PB.Max;
    BtnTransform.Enabled := True;
  end;
end;

function TMainForm.get15Connection(): Boolean;
begin
  with adoc15 do
  begin
    Close;
    LoginPrompt := False;
    ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;'
      + 'Data Source=' + BtnEdt15.Text
      + ';Persist Security Info=False;Jet OLEDB:Database Password='
      + 'DTL83973118';
    try
      Open;
      Result := True;
    except
      Result := False;
    end;
  end;
end;

function TMainForm.get20Connection(): Boolean;
begin
  with adoc20 do
  begin
    Close;
    LoginPrompt := False;
    ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;'
      + 'Data Source=' + BtnEdt20.Text
      + ';Persist Security Info=False;Jet OLEDB:Database Password='
      + 'www.fzatw.com';
    try
      Open;
      Result := True;
    except
      Result := False;
    end;
  end;
end;

procedure TMainForm.BtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  adoc15 := TADOConnection.Create(nil);
  adoc20 := TADOConnection.Create(nil);
  adoq15 := TADOQuery.Create(nil);
  adoq20 := TADOQuery.Create(nil);

  adoq15.Connection := adoc15;
  adoq20.Connection := adoc20;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  adoq15.Free;
  adoq20.Free;
  adoc15.Free;
  adoc20.Free;
end;

function TMainForm.importBackRecord: Boolean;
var i: Integer;
begin
  adoq15.Close;
  adoq15.SQL.Text := 'SELECT [WEIGHT],[WEIGHT_TIME] FROM [TBL_BACK_RECORD]';
  adoq15.Open;
  if not adoq15.IsEmpty then
  begin
    adoc20.BeginTrans;
    try
      adoq20.Close;
      adoq20.SQL.Text := 'delete from TBL_BACK_RECORD';
      adoq20.ExecSQL;

      adoq20.SQL.Text := 'select top 1 [WEIGHT], [WEIGHT_TIME] from [TBL_BACK_RECORD]';
      adoq20.Open;
      adoq15.First;
      i := 0;
      while not adoq15.Eof do
      begin
        adoq20.InsertRecord([adoq15.FieldByName('WEIGHT').AsFloat,
          adoq15.FieldByName('WEIGHT_TIME').AsDateTime]);
        adoq15.Next;
        Inc(i);
        PB.StepIt;
        Application.ProcessMessages;
        if i = 2000 then
        begin
          adoq20.UpdateBatch();
        end;
      end;
      adoq20.UpdateBatch();
      adoc20.CommitTrans;
      Result := True;
    except
      adoc20.RollbackTrans;
    end;
  end;
end;

function TMainForm.importBackupInfo(bTitle: string): Boolean;
var i: Integer;
begin
  adoq15.Close;
  adoq15.SQL.Text := 'SELECT Min([����]) as [����],[' + bTitle + '] FROM [' + bTitle
    + '] GROUP BY [' + bTitle + ']';
  adoq15.Open;
  if not adoq15.IsEmpty then
  begin
    adoc20.BeginTrans;
    try
      adoq20.Close;
      adoq20.SQL.Text := 'delete from [' + bTitle + ']';
      adoq20.ExecSQL;

      adoq20.SQL.Text := 'select top 1 [����], [' + bTitle + '] from [' + bTitle + ']';
      adoq20.Open;
      adoq15.First;
      i := 0;
      while not adoq15.Eof do
      begin
        adoq20.InsertRecord([adoq15.FieldByName('����').AsString,
          adoq15.FieldByName(bTitle).AsString]);
        adoq15.Next;
        Inc(i);
        PB.StepIt;
        Application.ProcessMessages;
        if i = 2000 then
        begin
          adoq20.UpdateBatch();
        end;
      end;
      adoq20.UpdateBatch();
      adoc20.CommitTrans;
      Result := True;
    except
      adoc20.RollbackTrans;
    end;
  end;
end;

function TMainForm.importLog: Boolean;
var i: Integer;
begin
  adoq15.Close;
  adoq15.SQL.Text := 'SELECT [�޸���],[ʱ��],[��־] FROM [��־]';
  adoq15.Open;
  if not adoq15.IsEmpty then
  begin
    adoc20.BeginTrans;
    try
      adoq20.Close;
      adoq20.SQL.Text := 'delete from [��־]';
      adoq20.ExecSQL;

      adoq20.SQL.Text := 'select top 1 [�޸���],[ʱ��],[��־] FROM [��־]';
      adoq20.Open;
      adoq15.First;
      i := 0;
      while not adoq15.Eof do
      begin
        adoq20.InsertRecord([adoq15.FieldByName('�޸���').AsString,
          adoq15.FieldByName('ʱ��').AsDateTime,
            adoq15.FieldByName('��־').AsString]);
        adoq15.Next;
        Inc(i);
        PB.StepIt;
        Application.ProcessMessages;
        if i = 2000 then
        begin
          adoq20.UpdateBatch();
        end;
      end;
      adoq20.UpdateBatch();
      adoc20.CommitTrans;
      Result := True;
    except
      adoc20.RollbackTrans;
    end;
  end;
end;

function TMainForm.importPrepareInfo: Boolean;
var i: Integer;
begin
  adoq15.Close;
  adoq15.SQL.Text := 'SELECT [����], [Ƥ��], [��ע] FROM [����]';
  adoq15.Open;
  if not adoq15.IsEmpty then
  begin
    adoc20.BeginTrans;
    try
      adoq20.Close;
      adoq20.SQL.Text := 'delete from [����]';
      adoq20.ExecSQL;

      adoq20.SQL.Text := 'select top 1 [����], [Ƥ��], [��ע] from [����]';
      adoq20.Open;
      adoq15.First;
      i := 0;
      while not adoq15.Eof do
      begin
        adoq20.InsertRecord([adoq15.FieldByName('����').AsString,
          adoq15.FieldByName('Ƥ��').AsFloat,
            adoq15.FieldByName('��ע').AsString]);
        adoq15.Next;
        Inc(i);
        PB.StepIt;
        Application.ProcessMessages;
        if i = 2000 then
        begin
          adoq20.UpdateBatch();
        end;
      end;
      adoq20.UpdateBatch();
      adoc20.CommitTrans;
      Result := True;
    except
      adoc20.RollbackTrans;
    end;
  end;
end;

function TMainForm.importTao: Boolean;
var i: Integer;
begin
  adoq15.Close;
  adoq15.SQL.Text := 'SELECT [����], [������λ], [�ջ���λ], [����], [���],'
    + '[����1], [����2], [����3], [����4], [����5] FROM [�ױ�]';
  adoq15.Open;
  if not adoq15.IsEmpty then
  begin
    adoc20.BeginTrans;
    try
      adoq20.Close;
      adoq20.SQL.Text := 'delete from [�ױ�]';
      adoq20.ExecSQL;

      adoq20.SQL.Text := 'select top 1 [����], [������λ], [�ջ���λ], [����], [���],'
        + '[����1], [����2], [����3], [����4], [����5] FROM [�ױ�]';
      adoq20.Open;
      adoq15.First;
      i := 0;
      while not adoq15.Eof do
      begin
        adoq20.InsertRecord([adoq15.FieldByName('����').AsString,
          adoq15.FieldByName('������λ').AsString,
            adoq15.FieldByName('�ջ���λ').AsString,
            adoq15.FieldByName('����').AsString,
            adoq15.FieldByName('���').AsString,
            adoq15.FieldByName('����1').AsString,
            adoq15.FieldByName('����2').AsString,
            adoq15.FieldByName('����3').AsString,
            adoq15.FieldByName('����4').AsString,
            adoq15.FieldByName('����5').AsString]);
        adoq15.Next;
        Inc(i);
        PB.StepIt;
        Application.ProcessMessages;
        if i = 2000 then
        begin
          adoq20.UpdateBatch();
        end;
      end;
      adoq20.UpdateBatch();
      adoc20.CommitTrans;
      Result := True;
    except
      adoc20.RollbackTrans;
    end;
  end;
end;

function TMainForm.importUserInfo: Boolean;
var i: Integer;
begin
  adoq15.Close;
  adoq15.SQL.Text := 'SELECT [�û���],[����],'
    + '[Ԥ��ά��],'
    + '[����ά��] AS [���Ź���],'
    + '[Ԥ��ά��] AS [ϵͳ��־],'
    + '[Ԥ��ά��] AS [��̨��¼],'
    + '[��ӡ����],'
    + '[�޸İ���],'
    + '[��ӡ����],'
    + '[�û�����],'
    + '[ϵͳ����],'
    + '[ϵͳ����] AS [��������],'
    + '[�ֹ�����],'
    + '[��������] AS [���ݿ�����],'
    + '[���ݱ���],'
    + '[����ά��] AS [���ݵ���],'
    + '[���ݵ���],'
    + '[���ݵ���] AS [��������],'
    + '[����ά��] AS [���ݳ�ʼ��],'
    + '[�Ǳ�����],'
    + '[ϵͳ����] AS [��Ƶ����],'
    + '[ϵͳ����] AS [����������],'
    + '[ϵͳ����] AS [IOģ������],'
    + '[ϵͳ����] AS [����Ļ����],'
    + '[ϵͳ����] AS [�������],'
    + '[Ԥ��ά��] AS [���ݲ�ѯ], '
    + '[����ά��] AS [��Ӽ�¼],'
    + '[����ά��] AS [ɾ����¼],'
    + '[����ά��] AS [�޸ĳ���],'
    + '[����ά��] AS [�޸ķ�����λ],'
    + '[����ά��] AS [�޸��ջ���λ],'
    + '[����ά��] AS [�޸Ļ���],'
    + '[����ά��] AS [�޸Ĺ��],'
    + '[����ά��] AS [�޸�ë��],'
    + '[����ά��] AS [�޸�Ƥ��],'
    + '[����ά��] AS [�޸Ŀ���],'
    + '[����ά��] AS [�޸ĵ���],'
    + '[����ά��] AS [�޸��۷�ϵ��],'
    + '[����ά��] AS [�޸Ĺ�����],'
    + '[����ά��] AS [�޸ı���1],'
    + '[����ά��] AS [�޸ı���2],'
    + '[����ά��] AS [�޸ı���3],'
    + '[����ά��] AS [�޸ı���4],'
    + '[����ά��] AS [�޸ı���5],'
    + '[����ά��] AS [�޸ı���6],'
    + '[����ά��] AS [�޸ı���7],'
    + '[����ά��] AS [�޸ı���8],'
    + '[����ά��] AS [�޸ı���9],'
    + '[����ά��] AS [�޸ı���10],'
    + '[����ά��] AS [�޸ı���11],'
    + '[����ά��] AS [�޸ı���12],'
    + '[����ά��] AS [�޸ı���13],'
    + '[����ά��] AS [�޸ı���14],'
    + '[����ά��] AS [�޸ı���15],'
    + '[����ά��] AS [�޸ı���16],'
    + '[����ά��] AS [�޸ı���17],'
    + '[����ά��] AS [�޸ı���18],'
    + '[����Ա] FROM �û���Ϣ';
  adoq15.Open;
  if not adoq15.IsEmpty then
  begin
    adoc20.BeginTrans;
    try
      adoq20.Close;
      adoq20.SQL.Text := 'delete from [�û���Ϣ]';
      adoq20.ExecSQL;

      adoq20.SQL.Text := 'select top 1 [�û���],[����],'
        + '[Ԥ��ά��],'
        + '[���Ź���],'
        + '[ϵͳ��־],'
        + '[��̨��¼],'
        + '[��ӡ����],'
        + '[�޸İ���],'
        + '[��ӡ����],'
        + '[�û�����],'
        + '[ϵͳ����],'
        + '[��������],'
        + '[�ֹ�����],'
        + '[���ݿ�����],'
        + '[���ݱ���],'
        + '[���ݵ���],'
        + '[���ݵ���],'
        + '[��������],'
        + '[���ݳ�ʼ��],'
        + '[�Ǳ�����],'
        + '[��Ƶ����],'
        + '[����������],'
        + '[IOģ������],'
        + '[����Ļ����],'
        + '[�������],'
        + '[���ݲ�ѯ], '
        + '[��Ӽ�¼],'
        + '[ɾ����¼],'
        + '[�޸ĳ���],'
        + '[�޸ķ�����λ],'
        + '[�޸��ջ���λ],'
        + '[�޸Ļ���],'
        + '[�޸Ĺ��],'
        + '[�޸�ë��],'
        + '[�޸�Ƥ��],'
        + '[�޸Ŀ���],'
        + '[�޸ĵ���],'
        + '[�޸��۷�ϵ��],'
        + '[�޸Ĺ�����],'
        + '[�޸ı���1],'
        + '[�޸ı���2],'
        + '[�޸ı���3],'
        + '[�޸ı���4],'
        + '[�޸ı���5],'
        + '[�޸ı���6],'
        + '[�޸ı���7],'
        + '[�޸ı���8],'
        + '[�޸ı���9],'
        + '[�޸ı���10],'
        + '[�޸ı���11],'
        + '[�޸ı���12],'
        + '[�޸ı���13],'
        + '[�޸ı���14],'
        + '[�޸ı���15],'
        + '[�޸ı���16],'
        + '[�޸ı���17],'
        + '[�޸ı���18],'
        + '[����Ա] FROM �û���Ϣ';
      adoq20.Open;
      adoq15.First;
      i := 0;
      while not adoq15.Eof do
      begin
        adoq20.InsertRecord([adoq15.FieldByName('�û���').AsString,
          adoq15.FieldByName('����').AsString,
            adoq15.FieldByName('Ԥ��ά��').AsBoolean,
            adoq15.FieldByName('���Ź���').AsBoolean,
            adoq15.FieldByName('ϵͳ��־').AsBoolean,
            adoq15.FieldByName('��̨��¼').AsBoolean,
            adoq15.FieldByName('��ӡ����').AsBoolean,
            adoq15.FieldByName('�޸İ���').AsBoolean,
            adoq15.FieldByName('��ӡ����').AsBoolean,
            adoq15.FieldByName('�û�����').AsBoolean,
            adoq15.FieldByName('ϵͳ����').AsBoolean,
            adoq15.FieldByName('��������').AsBoolean,
            adoq15.FieldByName('�ֹ�����').AsBoolean,
            adoq15.FieldByName('���ݿ�����').AsBoolean,
            adoq15.FieldByName('���ݱ���').AsBoolean,
            adoq15.FieldByName('���ݵ���').AsBoolean,
            adoq15.FieldByName('���ݵ���').AsBoolean,
            adoq15.FieldByName('��������').AsBoolean,
            adoq15.FieldByName('���ݳ�ʼ��').AsBoolean,
            adoq15.FieldByName('�Ǳ�����').AsBoolean,
            adoq15.FieldByName('��Ƶ����').AsBoolean,
            adoq15.FieldByName('����������').AsBoolean,
            adoq15.FieldByName('IOģ������').AsBoolean,
            adoq15.FieldByName('����Ļ����').AsBoolean,
            adoq15.FieldByName('�������').AsBoolean,
            adoq15.FieldByName('���ݲ�ѯ').AsBoolean,
            adoq15.FieldByName('��Ӽ�¼').AsBoolean,
            adoq15.FieldByName('ɾ����¼').AsBoolean,
            adoq15.FieldByName('�޸ĳ���').AsBoolean,
            adoq15.FieldByName('�޸ķ�����λ').AsBoolean,
            adoq15.FieldByName('�޸��ջ���λ').AsBoolean,
            adoq15.FieldByName('�޸Ļ���').AsBoolean,
            adoq15.FieldByName('�޸Ĺ��').AsBoolean,
            adoq15.FieldByName('�޸�ë��').AsBoolean,
            adoq15.FieldByName('�޸�Ƥ��').AsBoolean,
            adoq15.FieldByName('�޸Ŀ���').AsBoolean,
            adoq15.FieldByName('�޸ĵ���').AsBoolean,
            adoq15.FieldByName('�޸��۷�ϵ��').AsBoolean,
            adoq15.FieldByName('�޸Ĺ�����').AsBoolean,
            adoq15.FieldByName('�޸ı���1').AsBoolean,
            adoq15.FieldByName('�޸ı���2').AsBoolean,
            adoq15.FieldByName('�޸ı���3').AsBoolean,
            adoq15.FieldByName('�޸ı���4').AsBoolean,
            adoq15.FieldByName('�޸ı���5').AsBoolean,
            adoq15.FieldByName('�޸ı���6').AsBoolean,
            adoq15.FieldByName('�޸ı���7').AsBoolean,
            adoq15.FieldByName('�޸ı���8').AsBoolean,
            adoq15.FieldByName('�޸ı���9').AsBoolean,
            adoq15.FieldByName('�޸ı���10').AsBoolean,
            adoq15.FieldByName('�޸ı���11').AsBoolean,
            adoq15.FieldByName('�޸ı���12').AsBoolean,
            adoq15.FieldByName('�޸ı���13').AsBoolean,
            adoq15.FieldByName('�޸ı���14').AsBoolean,
            adoq15.FieldByName('�޸ı���15').AsBoolean,
            adoq15.FieldByName('�޸ı���16').AsBoolean,
            adoq15.FieldByName('�޸ı���17').AsBoolean,
            adoq15.FieldByName('�޸ı���18').AsBoolean,
            adoq15.FieldByName('����Ա').AsBoolean]);
        adoq15.Next;
        Inc(i);
        PB.StepIt;
        Application.ProcessMessages;
        if i = 2000 then
        begin
          adoq20.UpdateBatch();
        end;
      end;
      adoq20.UpdateBatch();
      adoc20.CommitTrans;
      Result := True;
    except
      adoc20.RollbackTrans;
    end;
  end;
end;

function TMainForm.importWeightImg: Boolean;
var i: Integer;
  slId: TStringList;
  gi1, gi2, ti1, ti2: TMemoryStream;
begin
  slId := TStringList.Create;
  gi1 := TMemoryStream.Create;
  gi2 := TMemoryStream.Create;
  ti1 := TMemoryStream.Create;
  ti2 := TMemoryStream.Create;
  try
    adoq15.Close;

    adoq15.SQL.Text := 'SELECT WEIGHT_ID FROM TBL_WEIGHT_IMG';
    adoq15.Open;
    if not adoq15.IsEmpty then
    begin
      adoq15.First;
      while not adoq15.Eof do
      begin
        slId.Add(adoq15.FieldByName('weight_id').AsString);
        adoq15.Next;
      end;
    end;
    adoq20.Close;
    adoq20.SQL.Text := 'DELETE FROM TBL_WEIGHT_IMG';
    adoq20.ExecSQL;

    for i := 0 to slId.Count - 1 do
    begin
      adoq15.SQL.Text := 'SELECT WEIGHT_ID, GROSS_IMG1, GROSS_IMG2,'
        + 'TARE_IMG1, TARE_IMG2 FROM [TBL_WEIGHT_IMG] where weight_id=:weight_id';
      adoq15.Parameters.ParamByName('weight_id').Value := slId.Strings[i];
      adoq15.Open;
      if not adoq15.IsEmpty then
      begin
        adoq20.SQL.Text := 'insert into tbl_weight_img(weight_id, gross_img1, gross_img2,'
          + 'tare_img1, tare_img2) values (:weight_id, :gross_img1, :gross_img2,'
          + ':tare_img1, :tare_img2)';
        adoq20.Parameters.ParamByName('weight_id').Value := adoq15.FieldByName('weight_id').AsString;
        (adoq15.FieldByName('gross_img1') as TBlobField).SaveToStream(gi1);
        adoq20.Parameters.ParamByName('gross_img1').LoadFromStream(gi1, ftBlob);
        (adoq15.FieldByName('gross_img2') as TBlobField).SaveToStream(gi2);
        adoq20.Parameters.ParamByName('gross_img2').LoadFromStream(gi2, ftBlob);
        (adoq15.FieldByName('tare_img1') as TBlobField).SaveToStream(ti1);
        adoq20.Parameters.ParamByName('tare_img1').LoadFromStream(ti1, ftBlob);
        (adoq15.FieldByName('tare_img2') as TBlobField).SaveToStream(ti2);
        adoq20.Parameters.ParamByName('tare_img2').LoadFromStream(ti2, ftBlob);
        adoq20.ExecSQL;

        pb.StepIt;
        Application.ProcessMessages;
      end;
    end;
  finally
    slId.Free;
    gi1.Free;
    gi2.Free;
    ti1.Free;
    ti2.Free;
  end;
end;

function TMainForm.importWeightInfo: Boolean;
var i: Integer;
begin
  adoq15.Close;
  adoq15.SQL.Text := 'SELECT [��ˮ��],[����],[������λ],[�ջ���λ],[����],'
    + '[���],[ë��],[����],[����],[����],'
    + '[ʵ��],[����],[���],[������],[ë��ʱ��],'
    + '[����ʱ��],[��ע],[�ϴ���],[����Ա],[����1],'
    + '[����2],[����3],[����4],[����5],[����6],'
    + '[����7],[����8],[����9] FROM [������Ϣ]';
  adoq15.Open;
  if not adoq15.IsEmpty then
  begin
    adoc20.BeginTrans;
    try
      adoq20.Close;
      adoq20.SQL.Text := 'delete from ������Ϣ';
      adoq20.ExecSQL;

      adoq20.SQL.Text := 'select top 1 [��ˮ��], [����], [��������], [������λ], [�ջ���λ],'
        + '[����], [���], [ë��], [Ƥ��], [����],'
        + '[����], [ʵ��], [����], [���], [�۷�ϵ��],'
        + '[����], [������], [ë��ʱ��], [Ƥ��ʱ��], [��ע],'
        + '[�ϴ���], [ë��˾��Ա], [Ƥ��˾��Ա], [ë�ذ���], [Ƥ�ذ���],'
        + '[������], [����ʱ��], [��ӡ����], [����1], [����2],'
        + '[����3], [����4], [����5], [����6], [����7],'
        + '[����8], [����9] from [������Ϣ]';
      adoq20.Open;
      adoq15.First;
      i := 0;
      while not adoq15.Eof do
      begin
        adoq20.InsertRecord([adoq15.FieldByName('��ˮ��').AsString,
          adoq15.FieldByName('����').AsString,
            'OO',
            adoq15.FieldByName('������λ').AsString,
            adoq15.FieldByName('�ջ���λ').AsString,
            adoq15.FieldByName('����').AsString,
            adoq15.FieldByName('���').AsString,
            adoq15.FieldByName('ë��').AsFloat,
            adoq15.FieldByName('����').AsFloat,
            adoq15.FieldByName('����').AsFloat,
            adoq15.FieldByName('����').AsFloat,
            adoq15.FieldByName('ʵ��').AsFloat,
            adoq15.FieldByName('����').AsFloat,
            adoq15.FieldByName('���').AsFloat,
            1,
            adoq15.FieldByName('ʵ��').AsFloat,
            adoq15.FieldByName('������').AsFloat,
            adoq15.FieldByName('ë��ʱ��').AsDateTime,
            adoq15.FieldByName('����ʱ��').AsDateTime,
            adoq15.FieldByName('��ע').AsString,
            adoq15.FieldByName('�ϴ���').AsBoolean,
            adoq15.FieldByName('����Ա').AsString,
            adoq15.FieldByName('����Ա').AsString,
            'A',
            'A',
            adoq15.FieldByName('����Ա').AsString,
            adoq15.FieldByName('ë��ʱ��').AsDateTime,
            1,
            adoq15.FieldByName('����1').AsString,
            adoq15.FieldByName('����2').AsString,
            adoq15.FieldByName('����3').AsString,
            adoq15.FieldByName('����4').AsString,
            adoq15.FieldByName('����5').AsString,
            adoq15.FieldByName('����6').AsFloat,
            adoq15.FieldByName('����7').AsFloat,
            adoq15.FieldByName('����8').AsFloat,
            adoq15.FieldByName('����9').AsFloat]);
        adoq15.Next;
        Inc(i);
        PB.StepIt;
        Application.ProcessMessages;
        if i = 2000 then
        begin
          adoq20.UpdateBatch();
        end;
      end;
      adoq20.UpdateBatch();
      adoc20.CommitTrans;
      Result := True;
    except
      adoc20.RollbackTrans;
    end;
  end;
end;

function TMainForm.compactDatabase20: Boolean;
var
  fileName: string;
  DB: OleVariant;
const
  SConnectionString = 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=%s;'
    + 'Jet OLEDB:Database Password=%s;';
begin
  fileName := BtnEdt20.Text;
  if FileExists(FileName) then
  begin
    adoc20.Close;
    try
      try
        DB := CreateOleObject('JRO.JetEngine'); //����OLE����,��������OLE���󳬹��������Զ��ͷ�
        OleCheck(DB.CompactDatabase(format(SConnectionString, [fileName, 'www.fzatw.com']),
          format(SConnectionString, ['C:\temp.mdb', 'www.fzatw.com']))); //ѹ�����ݿ�
        Result := CopyFile('c:\temp.mdb', pchar(fileName), False);
        DeleteFile('c:\temp.mdb'); //ɾ����ʱ�ļ�
      except
        Result := False //ѹ��ʧ��
      end;
    finally
      adoc20.Open;
    end;
  end
end;

function TMainForm.compactDatabase15: Boolean;
var
  fileName: string;
  DB: OleVariant;
const
  SConnectionString = 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=%s;'
    + 'Jet OLEDB:Database Password=%s;';
begin
  fileName := BtnEdt15.Text;
  if FileExists(FileName) then
  begin
    adoc15.Close;
    try
      try
        DB := CreateOleObject('JRO.JetEngine'); //����OLE����,��������OLE���󳬹��������Զ��ͷ�
        OleCheck(DB.CompactDatabase(format(SConnectionString, [fileName, 'DTL83973118']),
          format(SConnectionString, ['C:\temp.mdb', 'DTL83973118']))); //ѹ�����ݿ�
        Result := CopyFile('c:\temp.mdb', pchar(fileName), False);
        DeleteFile('c:\temp.mdb'); //ɾ����ʱ�ļ�
      except
        Result := False //ѹ��ʧ��
      end;
    finally
      adoc15.Open;
    end;
  end
end;

procedure TMainForm.CBCopyPicClick(Sender: TObject);
begin
  if CBCopyPic.Checked and (Application.MessageBox('��������ͼƬ��һ�������Ĺ��̣�ƽ��100��4���ӣ������鿽�����Ƿ������',
    '��ʾ', MB_YESNO + MB_ICONINFORMATION + MB_TOPMOST) = IDNO) then
  begin
    CBCopyPic.Checked := False
  end;
end;

end.

