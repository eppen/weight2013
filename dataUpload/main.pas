unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Registry, IniFiles,
  IdCoder, IdCoder3to4, IdCoderMIME, IdBaseComponent, IdHashMessageDigest,
  ZLib, ZLibEx, Menus;

type
  TUploadCloudForm = class(TForm)
    GBDatabase: TGroupBox;
    LEIP: TLabeledEdit;
    LEUsername: TLabeledEdit;
    LEPassword: TLabeledEdit;
    Label1: TLabel;
    CBDatabase: TComboBox;
    BitBtnRun: TBitBtn;
    BitBtnStop: TBitBtn;
    MemoLog: TMemo;
    TUpload: TTimer;
    ADOCLocal: TADOConnection;
    ADOCRemote: TADOConnection;
    ADOQRemote: TADOQuery;
    ADOQLocal: TADOQuery;
    LEAddr: TLabeledEdit;
    procedure BitBtnRunClick(Sender: TObject);
    procedure TUploadTimer(Sender: TObject);
    procedure BitBtnStopClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CBDatabaseEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CBDatabaseChange(Sender: TObject);
  private
    { Private declarations }
    lastRun: Boolean;
  public
    { Public declarations }
    function uploadRecord(): Boolean;
    function getLocalConnection(): Boolean;
    function saveSetting(): Boolean;
    function loadSetting(): Boolean;
    function log(str: string): Boolean;
    function getRemoteConnection(): Boolean;
  end;

var
  UploadCloudForm: TUploadCloudForm;

implementation

uses
  CommonUtil;

{$R *.dfm}

function EncodePassword(str: string): string;
var
  encode: TIdEncoderMIME;
begin
  encode := TIdEncoderMIME.Create(nil);
  try
    result := encode.EncodeString(str);
  finally
    encode.Free;
  end;
end;

function DecodePassword(str: string): string;
var
  decode: TIdDecoderMIME;
begin
  if Length(str) mod 2 <> 0 then //�ַ���������2�ı������ܽ���
  begin
    result := '';
    exit;
  end;
  decode := TIdDecoderMIME.Create(nil);
  try
    result := decode.DecodeString(str);
  finally
    decode.Free;
  end;
end;

procedure TUploadCloudForm.BitBtnRunClick(Sender: TObject);
begin
  TUpload.Enabled := True;
  BitBtnRun.Enabled := False;
  BitBtnStop.Enabled := True;
end;

function TUploadCloudForm.uploadRecord: Boolean;
var uploadId: string;
  gs1, gs2, gs3, gs4, ts1, ts2, ts3, ts4: TMemoryStream;
begin
  if not getLocalConnection then
  begin
    log('Զ�����ݿ�����ʧ��,���������ò���');
    Result := False;
    Exit;
  end;
  if not getRemoteConnection then
  begin
    log('Զ�����ݿ�����ʧ��,���������ò���');
    Result := False;
    Exit;
  end;
  with ADOQLocal do
  begin
    Close;
    SQL.Text := 'select max(��ˮ��) as glideNo from ������Ϣ where (�ϴ���=0) and (����<>0)';
    Open;
    if not IsEmpty then
    begin
      uploadId := FieldByName('glideNo').AsString;
      if uploadId = '' then
      begin
        Result := False;
        Exit;
      end;
    end
    else
    begin
      Result := False;
      Exit;
    end;
    //�����¼��ϸ
    Close;
    SQL.Text := 'select * from ������Ϣ where ��ˮ��=:glideNo';
    Parameters.ParamByName('glideNo').Value := uploadId;
    Open;
    if not IsEmpty then
    begin
      with ADOQRemote do
      begin
        Close;

        SQL.Text := 'select ��� from ������Ϣ where ��ˮ�� = :glideNo';
        Parameters.ParamByName('glideNo').Value := LEAddr.Text + ADOQLocal.FieldByName('��ˮ��').AsString;
        Open;
        if IsEmpty then
        begin
          SQL.Text := 'insert into ������Ϣ(��ˮ��,����,��������,������λ,�ջ���λ,'
            + '����,���,ë��,Ƥ��,����,����,ʵ��,����,���,�۷�ϵ��,����,������,'
            + 'ë��˾��Ա,Ƥ��˾��Ա,ë�ذ���,Ƥ�ذ���,'
            + 'ë��ʱ��,Ƥ��ʱ��,һ�ι���ʱ��,���ι���ʱ��,������,����ʱ��,��ע,��ӡ����,�ϴ���,'
            + '����1,����2,����3,����4,����5,����6,����7,����8,����9,'
            + '����10,����11,����12,����13,����14,����15,����16,����17,����18) '
            + 'values (:glideNo,:car,:weightType,:faHuo,:shouHuo,'
            + ':goods,:spec,:gross,:tare,:net,:bundle,:real,:price,:sum,:scale,:quanter,'
            + ':cost,:grossMan,:tareMan,:grossAddr,:tareAddr,'
            + ':grossTime,:tareTime,:firstTime,:secondTime,:updateUser,:updateTime,'
            + ':memo,:printCount,:upload,'
            + ':backup1,:backup2,:backup3,:backup4,:backup5,'
            + ':backup6,:backup7,:backup8,:backup9,:backup10,:backup11,:backup12,'
            + ':backup13,:backup14,:backup15,:backup16,:backup17,:backup18)';
        end
        else
        begin
          SQL.Text := 'update ������Ϣ set ����=:car,��������=:weightType,������λ=:faHuo,�ջ���λ=:shouHuo,'
            + '����=:goods,���=:spec,ë��=:gross,Ƥ��=:tare,����=:net,����=:bundle,'
            + 'ʵ��=:real,����=:price,���=:sum,�۷�ϵ��=:scale,����=:quanter,������=:cost,'
            + 'ë��˾��Ա=:grossMan,Ƥ��˾��Ա=:tareMan,ë�ذ���=:grossAddr,Ƥ�ذ���=:tareAddr,'
            + 'ë��ʱ��=:grossTime,Ƥ��ʱ��=:tareTime,һ�ι���ʱ��=:firstTime,'
            + '���ι���ʱ��=:secondTime,������=:updateUser,����ʱ��=:updateTime,'
            + '��ע=:memo,��ӡ����=:printCount,�ϴ���=:upload,'
            + '����1=:backup1,����2=:backup2,����3=:backup3,����4=:backup4,����5=:backup5,'
            + '����6=:backup6,����7=:backup7,����8=:backup8,����9=:backup9,'
            + '����10=:backup10,����11=:backup11,����12=:backup12,����13=:backup13,'
            + '����14=:backup14,����15=:backup15,����16=:backup16,����17=:backup17,����18=:backup18 '
            + 'where ��ˮ��=:glideNo';
        end;
        Parameters.ParamByName('glideNo').Value := LEAddr.Text + ADOQLocal.FieldByName('��ˮ��').AsString;
        Parameters.ParamByName('car').Value := ADOQLocal.FieldByName('����').AsString;
        Parameters.ParamByName('weightType').Value := ADOQLocal.FieldByName('��������').AsString;
        Parameters.ParamByName('faHuo').Value := ADOQLocal.FieldByName('������λ').AsString;
        Parameters.ParamByName('shouHuo').Value := ADOQLocal.FieldByName('�ջ���λ').AsString;
        Parameters.ParamByName('goods').Value := ADOQLocal.FieldByName('����').AsString;
        Parameters.ParamByName('spec').Value := ADOQLocal.FieldByName('���').AsString;
        Parameters.ParamByName('gross').Value := ADOQLocal.FieldByName('ë��').AsFloat;
        Parameters.ParamByName('tare').Value := ADOQLocal.FieldByName('Ƥ��').AsFloat;
        Parameters.ParamByName('net').Value := ADOQLocal.FieldByName('����').AsFloat;
        Parameters.ParamByName('bundle').Value := ADOQLocal.FieldByName('����').AsFloat;
        Parameters.ParamByName('real').Value := ADOQLocal.FieldByName('ʵ��').AsFloat;
        Parameters.ParamByName('price').Value := ADOQLocal.FieldByName('����').AsFloat;
        Parameters.ParamByName('sum').Value := ADOQLocal.FieldByName('���').AsFloat;
        Parameters.ParamByName('scale').Value := ADOQLocal.FieldByName('�۷�ϵ��').AsFloat;
        Parameters.ParamByName('quanter').Value := ADOQLocal.FieldByName('����').AsFloat;
        Parameters.ParamByName('cost').Value := ADOQLocal.FieldByName('������').AsFloat;
        Parameters.ParamByName('grossMan').Value := ADOQLocal.FieldByName('ë��˾��Ա').AsString;
        Parameters.ParamByName('grossMan').Value := ADOQLocal.FieldByName('Ƥ��˾��Ա').AsString;
        Parameters.ParamByName('grossAddr').Value := ADOQLocal.FieldByName('ë�ذ���').AsString;
        Parameters.ParamByName('grossAddr').Value := ADOQLocal.FieldByName('Ƥ�ذ���').AsString;
        if ADOQLocal.FieldByName('ë��ʱ��').IsNull then
          Parameters.ParamByName('grossTime').Value := null
        else
          Parameters.ParamByName('grossTime').Value := ADOQLocal.FieldByName('ë��ʱ��').AsDateTime;

        if ADOQLocal.FieldByName('Ƥ��ʱ��').IsNull then
          Parameters.ParamByName('tareTime').Value := null
        else
          Parameters.ParamByName('tareTime').Value := ADOQLocal.FieldByName('Ƥ��ʱ��').AsDateTime;
        if ADOQLocal.FieldByName('һ�ι���ʱ��').IsNull then
          Parameters.ParamByName('firstTime').Value := null
        else
          Parameters.ParamByName('firstTime').Value := ADOQLocal.FieldByName('һ�ι���ʱ��').AsDateTime;

        if ADOQLocal.FieldByName('���ι���ʱ��').IsNull then
          Parameters.ParamByName('secondTime').Value := null
        else
          Parameters.ParamByName('secondTime').Value := ADOQLocal.FieldByName('���ι���ʱ��').AsDateTime;
        Parameters.ParamByName('updateUser').Value := ADOQLocal.FieldByName('������').AsString;
        if ADOQLocal.FieldByName('����ʱ��').IsNull then
          Parameters.ParamByName('updateTime').Value := null
        else
          Parameters.ParamByName('updateTime').Value := ADOQLocal.FieldByName('����ʱ��').AsDateTime;
        Parameters.ParamByName('memo').Value := ADOQLocal.FieldByName('��ע').AsString;
        Parameters.ParamByName('printCount').Value := ADOQLocal.FieldByName('��ӡ����').AsInteger;
        Parameters.ParamByName('upload').Value := True;
        Parameters.ParamByName('backup1').Value := ADOQLocal.FieldByName('����1').AsString;
        Parameters.ParamByName('backup2').Value := ADOQLocal.FieldByName('����2').AsString;
        Parameters.ParamByName('backup3').Value := ADOQLocal.FieldByName('����3').AsString;
        Parameters.ParamByName('backup4').Value := ADOQLocal.FieldByName('����4').AsString;
        Parameters.ParamByName('backup5').Value := ADOQLocal.FieldByName('����5').AsString;
        Parameters.ParamByName('backup6').Value := ADOQLocal.FieldByName('����6').AsFloat;
        Parameters.ParamByName('backup7').Value := ADOQLocal.FieldByName('����7').AsFloat;
        Parameters.ParamByName('backup8').Value := ADOQLocal.FieldByName('����8').AsFloat;
        Parameters.ParamByName('backup9').Value := ADOQLocal.FieldByName('����9').AsFloat;
        Parameters.ParamByName('backup10').Value := ADOQLocal.FieldByName('����10').AsString;
        Parameters.ParamByName('backup11').Value := ADOQLocal.FieldByName('����11').AsString;
        Parameters.ParamByName('backup12').Value := ADOQLocal.FieldByName('����12').AsString;
        Parameters.ParamByName('backup13').Value := ADOQLocal.FieldByName('����13').AsString;
        Parameters.ParamByName('backup14').Value := ADOQLocal.FieldByName('����14').AsString;
        Parameters.ParamByName('backup15').Value := ADOQLocal.FieldByName('����15').AsFloat;
        Parameters.ParamByName('backup16').Value := ADOQLocal.FieldByName('����16').AsFloat;
        Parameters.ParamByName('backup17').Value := ADOQLocal.FieldByName('����17').AsFloat;
        Parameters.ParamByName('backup18').Value := ADOQLocal.FieldByName('����18').AsFloat;
        try
          ExecSQL;
        except on e: Exception do
          begin
            log('�ϴ���¼����' + e.Message);
            Result := False;
            Exit;
          end;
        end;
      end;
    end;

    //�����¼��ϸ
    SQL.Text := 'select * from tbl_weight_img where weight_id=:glideNo';
    Parameters.ParamByName('glideNo').Value := uploadId;
    Open;
    if not IsEmpty then
    begin
      with ADOQRemote do
      begin
        Close;
        //�ϴ���Ƭ
        SQL.Text := 'select * from tbl_weight_img where weight_id = :glideNo';
        Parameters.ParamByName('glideNo').Value := LEAddr.Text + ADOQLocal.FieldByName('weight_id').AsString;
        Open;
        if IsEmpty then
        begin
          SQL.Text := 'insert into tbl_weight_img(weight_id,gross_img1,gross_img2,'
            + 'gross_img3,gross_img4,tare_img1,tare_img2,tare_img3,tare_img4) '
            + 'values (:weight_id,:gross_img1,:gross_img2,:gross_img3,:gross_img4,'
            + ':tare_img1,:tare_img2,:tare_img3,:tare_img4)';
        end
        else
        begin
          SQL.Text := 'update tbl_weight_img set gross_img1=:gross_img1,'
            + 'gross_img2=:gross_img2,'
            + 'gross_img3=:gross_img3,'
            + 'gross_img4=:gross_img4,'
            + 'tare_img1=:tare_img1,'
            + 'tare_img2=:tare_img2,'
            + 'tare_img3=:tare_img3,'
            + 'tare_img4=:tare_img4 '
            + 'where weight_id=:weight_id';
        end;
        gs1 := TMemoryStream.Create;
        gs2 := TMemoryStream.Create;
        gs3 := TMemoryStream.Create;
        gs4 := TMemoryStream.Create;
        ts1 := TMemoryStream.Create;
        ts2 := TMemoryStream.Create;
        ts3 := TMemoryStream.Create;
        ts4 := TMemoryStream.Create;
        try
          (ADOQLocal.FieldByName('gross_img1') as TBlobField).SaveToStream(gs1);
          (ADOQLocal.FieldByName('gross_img2') as TBlobField).SaveToStream(gs2);
          (ADOQLocal.FieldByName('gross_img3') as TBlobField).SaveToStream(gs3);
          (ADOQLocal.FieldByName('gross_img4') as TBlobField).SaveToStream(gs4);
          (ADOQLocal.FieldByName('tare_img1') as TBlobField).SaveToStream(ts1);
          (ADOQLocal.FieldByName('tare_img2') as TBlobField).SaveToStream(ts2);
          (ADOQLocal.FieldByName('tare_img3') as TBlobField).SaveToStream(ts3);
          (ADOQLocal.FieldByName('tare_img4') as TBlobField).SaveToStream(ts4);
          Parameters.ParamByName('weight_id').Value := LEAddr.Text + ADOQLocal.FieldByName('weight_id').AsString;
          Parameters.ParamByName('gross_img1').LoadFromStream(gs1, ftBlob);
          Parameters.ParamByName('gross_img2').LoadFromStream(gs2, ftBlob);
          Parameters.ParamByName('gross_img3').LoadFromStream(gs3, ftBlob);
          Parameters.ParamByName('gross_img4').LoadFromStream(gs4, ftBlob);
          Parameters.ParamByName('tare_img1').LoadFromStream(ts1, ftBlob);
          Parameters.ParamByName('tare_img2').LoadFromStream(ts2, ftBlob);
          Parameters.ParamByName('tare_img3').LoadFromStream(ts3, ftBlob);
          Parameters.ParamByName('tare_img4').LoadFromStream(ts4, ftBlob);
          try
            ExecSQL;
          except on e: Exception do
            begin
              log('�ϴ�ͼƬ����' + e.Message);
              Result := False;
              Exit;
            end;
          end;
        finally
          gs1.Free;
          gs2.Free;
          gs3.Free;
          gs4.Free;
          ts1.Free;
          ts2.Free;
          ts3.Free;
          ts4.Free;
        end;
      end;
    end;

    SQL.Text := 'update ������Ϣ set �ϴ���=1 where ��ˮ��=:glideNo';
    Parameters.ParamByName('glideNo').Value := uploadId;
    try
      ExecSQL;
    except on e: Exception do
      begin
        log('�����ϴ���־����' + e.Message);
        Result := False;
        Exit;
      end;
    end;

    log('�ϴ���ˮ��Ϊ ' + uploadId + ' �ĳ��ؼ�¼�ɹ�');
  end;
  Result := True;
end;

procedure TUploadCloudForm.TUploadTimer(Sender: TObject);
begin
  (Sender as TTimer).Enabled := False;
  try
    uploadRecord;
  finally
    (Sender as TTimer).Enabled := True;
  end;
end;

procedure TUploadCloudForm.BitBtnStopClick(Sender: TObject);
begin
  TUpload.Enabled := False;
  BitBtnRun.Enabled := True;
  BitBtnStop.Enabled := False;
end;

function TUploadCloudForm.getLocalConnection: Boolean;
var fileName: string;
  ConnectedIP, Database, user, pass: string;
  ConnStr: string;
  myini: TIniFile;
begin
  myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'db.ini');
  try
    //�������Access���ݿ�
    if myini.ReadInteger('db', 'type', 0) = 0 then
    begin
      FileName := myini.ReadString('db', 'addr',
        ExtractFilePath(ParamStr(0)) + '\Database\Database.mdb');
      if FileExists(FileName) then
      begin
        with ADOCLocal do
        begin
          Close;
          ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='
            + FileName + ';Persist Security Info=False;Jet OLEDB:Database Password=www.fzatw.com';
          Open
        end;
      end
      else
      begin
        MessageBoxW(Handle, '�뽫������������ݿ�����λ�õ���һ��', '����', MB_OK
          + MB_ICONSTOP + MB_DEFBUTTON2 + MB_TOPMOST);
        //Application.Terminate;
      end;
    end
    else //����SQL����
    begin
      ConnectedIP := myini.ReadString('db', 'ip', '.');
      Database := myini.ReadString('db', 'dbname', 'weight20');
      user := myini.ReadString('db', 'user', 'sa');
      pass := TCommonUtil.deBase64(myini.ReadString('db', 'pass', 'MTIz'));
      ConnStr := 'Provider=SQLOLEDB.1;'; //OLE����
      if myini.ReadInteger('db', 'integrated', 0) = 0 then //ʹ�õĵ�¼ģʽ��SA����NT��֤
        ConnStr := ConnStr + 'Integrated Security=SSPI;'
      else
        ConnStr := ConnStr + 'User ID=' + user + ';Password=' + pass + ';';
      ConnStr := ConnStr + 'Persist Security Info=True;'
        + 'Initial Catalog='
        + Database + ';Data Source=' + ConnectedIP;

      with ADOCLocal do //�������ݿ�
      try
        Close;
        ConnectionString := ConnStr;
        Open;
      except
        on E: Exception do
        begin
          MessageDlg(pchar(E.Message), mtError, [mbOK], 0);
        end;
      end
    end;
  finally
    myini.Free;
  end;
  Result := True;
end;

procedure TUploadCloudForm.FormShow(Sender: TObject);
begin
  loadSetting;
  getLocalConnection;
  ADOQLocal.Connection := ADOCLocal;
  ADOQRemote.Connection := ADOCRemote;
end;

procedure TUploadCloudForm.CBDatabaseEnter(Sender: TObject);
begin
  with ADOCRemote do
  begin
    Close;
    ConnectionString := 'Provider=SQLOLEDB.1;'
      + 'User ID=' + LEUsername.Text + ';Password=' + LEPassword.Text + ';'
      + 'Persist Security Info=True;Initial Catalog=master;Data Source=' + LEIP.Text;
    try
      Open;
      with ADOQRemote do
      begin
        Close;
        SQL.Text := 'select name from master..sysdatabases order by name';
        Open;
        if not IsEmpty then
        begin
          CBDatabase.Items.Clear;
          First;
          while not Eof do
          begin
            CBDatabase.Items.Add(FieldByName('name').AsString);
            Next;
          end;
        end;
      end;
    except
      MessageBoxW(Handle, '���ݿ�����ʧ��', '����', MB_OK + MB_ICONSTOP +
        MB_DEFBUTTON2 + MB_TOPMOST);
    end;
  end;
end;

function TUploadCloudForm.saveSetting: Boolean;
var myini: TiniFile;
begin
  myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'setup.ini');
  try
    myini.WriteString('remote', 'ip', LEIP.Text);
    myini.WriteString('remote', 'username', LEUsername.Text);
    myini.WriteString('remote', 'password', EncodePassword(ZCompressStr(LEPassword.Text)));
    myini.WriteString('remote', 'database', CBDatabase.Text);
    myini.WriteString('remote', 'address', LEAddr.Text);
    myini.WriteBool('remote', 'last_run', not BitBtnRun.Enabled);
  finally
    myini.Free;
  end;
  Result := True;
end;

function TUploadCloudForm.loadSetting: Boolean;
var myini: TiniFile;
begin
  myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'setup.ini');
  try
    LEIP.Text := myini.ReadString('remote', 'ip', '');
    LEUsername.Text := myini.ReadString('remote', 'username', '');
    LEPassword.Text := ZDecompressStr(DecodePassword(myini.ReadString('remote', 'password', EncodePassword(ZCompressStr('')))));
    CBDatabase.Text := myini.ReadString('remote', 'database', '');
    LEAddr.Text := myini.ReadString('remote', 'address', 'A');
    lastRun := myini.ReadBool('remote', 'last_run', False);

    if lastRun then BitBtnRun.Click; 
  finally
    myini.Free;
  end;
  Result := True;
end;

procedure TUploadCloudForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  saveSetting;
end;

procedure TUploadCloudForm.CBDatabaseChange(Sender: TObject);
begin
  saveSetting;
end;

function TUploadCloudForm.log(str: string): Boolean;
var sl: TStringList;
begin
  if MemoLog.Lines.Count > 200 then
  begin
    sl := TStringList.Create;
    try
      sl.Text := MemoLog.Text;
      sl.SaveToFile(ExtractFilePath(ParamStr(0)) + FormatDateTime('yyyyMMddHHnnss', Now) + '.log');
    finally
      sl.Free;
    end;
    MemoLog.Lines.Clear;
  end;
  MemoLog.Lines.Add(str);
  Result := True;
end;

function TUploadCloudForm.getRemoteConnection: Boolean;
begin
  with ADOCRemote do //�������ݿ�
  try
    Close;
    ConnectionString := 'Provider=SQLOLEDB.1;' + 'User ID=' + LEUsername.Text
      + ';Password=' + LEPassword.Text + ';Persist Security Info=True;'
      + 'Initial Catalog='
      + CBDatabase.Text + ';Data Source=' + LEIP.Text;
    Open;
  except
    Result := False;
    Exit;
  end;
  Result := True;
end;

end.

