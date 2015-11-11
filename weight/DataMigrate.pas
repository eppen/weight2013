unit DataMigrate;

interface

uses
  SysUtils, Variants, Classes, Controls, Forms, StdCtrls, ComCtrls,
  ExtCtrls, DB, ADODB, Windows;

type
  TDataMigrateForm = class(TForm)
    BtnMigrate: TButton;
    PB: TProgressBar;
    PBack: TPanel;
    LblMsg: TLabel;
    LblMsg2: TLabel;
    ADOCAccess: TADOConnection;
    ADOQAccess: TADOQuery;
    ADOCSQL: TADOConnection;
    ADOQSQL: TADOQuery;
    RBAccess2SQL: TRadioButton;
    RBSQL2Access: TRadioButton;
    procedure BtnMigrateClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function clearSQLDB(): Boolean;
    function copyBackRecord(): Boolean;
    function copyWeightImg(): Boolean;
    function copyBackup(): Boolean;
    function copyPreMaintain(): Boolean;
    function copyLog(): Boolean;
    function copyUserInfo(): Boolean;
    function copyWeightInfo(): Boolean;
  end;

var
  DataMigrateForm: TDataMigrateForm;

implementation

uses
  QueryDM, IniFiles, CommonUtil;

{$R *.dfm}

procedure TDataMigrateForm.BtnMigrateClick(Sender: TObject);
var myini: TiniFile;
  Connstr: string;
begin
  if Application.MessageBox('�ó������ڽ�����ģʽ�µ����ݿ�����Ǩ�Ƶ�����ģʽ�µ����ݿ���ԭ����ģʽ�µ����ݽ��ᱻ��գ�ȷ��Ҫ������',
    '����', MB_YESNO + MB_ICONSTOP + MB_DEFBUTTON2 + MB_TOPMOST) = IDNO then
  begin
    Exit;
  end;

  LblMsg2.Visible := False;
  if RBAccess2SQL.Checked then
  begin
    //ȡ��Access�����ݿ�����
    with adocAccess do
    begin
      Close;
      ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='
        + ExtractFilePath(ParamStr(0)) + '\Database\Database.mdb'
        + ';Persist Security Info=False;'
        + 'Jet OLEDB:Database Password=' + QueryDM.DB_PASSWORD;
      Open;
    end;
    //ȡ��SQL�����ݿ�����
    with adocSQL do
    begin
      Close;
      myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'db.ini');
      try
        ConnStr := 'Provider=SQLOLEDB.1;'; //OLE DB���ӳ���
        if myini.ReadBool('db', 'integrated', True) then //��֤��ʽ
          ConnStr := ConnStr + 'Integrated Security=SSPI;'
        else
          ConnStr := ConnStr + 'User ID=' + myini.ReadString('db', 'user', 'sa')
            + ';Password=' + TCommonUtil.debase64(myini.ReadString('db', 'pass', '')) + ';';
        ConnStr := ConnStr + 'Persist Security Info=True;Initial Catalog='
          + myini.ReadString('db', 'DBName', 'weight20') + ';Data Source='
          + myini.ReadString('db', 'IP', '.');
        LoginPrompt := False;
        ConnectionString := ConnStr;
        Open;
      finally
        myini.Free;
      end;
    end;
  end
  else
  begin
    //ȡ��Access�����ݿ�����
    with adocSQL do
    begin
      Close;
      ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='
        + ExtractFilePath(ParamStr(0)) + '\Database\Database.mdb'
        + ';Persist Security Info=False;'
        + 'Jet OLEDB:Database Password=' + QueryDM.DB_PASSWORD;
      Open;
    end;
    //ȡ��SQL�����ݿ�����
    with adocAccess do
    begin
      Close;
      myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'db.ini');
      try
        ConnStr := 'Provider=SQLOLEDB.1;'; //OLE DB���ӳ���
        if myini.ReadBool('db', 'integrated', True) then //��֤��ʽ
          ConnStr := ConnStr + 'Integrated Security=SSPI;'
        else
          ConnStr := ConnStr + 'User ID=' + myini.ReadString('db', 'user', 'sa')
            + ';Password=' + TCommonUtil.debase64(myini.ReadString('db', 'pass', '')) + ';';
        ConnStr := ConnStr + 'Persist Security Info=True;Initial Catalog='
          + myini.ReadString('db', 'DBName', 'weight20') + ';Data Source='
          + myini.ReadString('db', 'IP', '.');
        LoginPrompt := False;
        ConnectionString := ConnStr;
        Open;
      finally
        myini.Free;
      end;
    end;
  end;
  PB.Position := 0;
  //���SQL�Ŀ�
  clearSQLDB;
  PB.StepIt;
  //����TBL_BACK_RECORD
  copyBackRecord;
  PB.StepIt;
  //����TBL_WEIGHT_IMG
  copyWeightImg;
  PB.StepIt;
  //�������ñ�
  copyBackup;
  PB.StepIt;
  //��������,������λ,�ջ���λ,����,���,�ױ�
  copyPreMaintain;
  PB.StepIt;
  //����������Ϣ
  copyWeightInfo;
  //������־
  copyLog;
  PB.StepIt;
  //�����û���Ϣ
  copyUserInfo;
  PB.StepIt;
  PB.Position := PB.Max;
  LblMsg2.Visible := True;
end;

function TDataMigrateForm.clearSQLDB: Boolean;
begin
  with ADOQSQL do
  begin
    Close;

    if RBAccess2SQL.Checked then
    begin
      SQL.Text := 'truncate table tbl_back_record';
      ExecSQL;
      SQL.Text := 'truncate table tbl_card';
      ExecSQL;
      SQL.Text := 'truncate table tbl_pay_history';
      ExecSQL;
      SQL.Text := 'truncate table tbl_weight_img';
      ExecSQL;
      SQL.Text := 'truncate table ����1';
      ExecSQL;
      SQL.Text := 'truncate table ����2';
      ExecSQL;
      SQL.Text := 'truncate table ����3';
      ExecSQL;
      SQL.Text := 'truncate table ����4';
      ExecSQL;
      SQL.Text := 'truncate table ����5';
      ExecSQL;
      SQL.Text := 'truncate table ����10';
      ExecSQL;
      SQL.Text := 'truncate table ����11';
      ExecSQL;
      SQL.Text := 'truncate table ����12';
      ExecSQL;
      SQL.Text := 'truncate table ����13';
      ExecSQL;
      SQL.Text := 'truncate table ����14';
      ExecSQL;
      SQL.Text := 'truncate table ����';
      ExecSQL;
      SQL.Text := 'truncate table ������λ';
      ExecSQL;
      SQL.Text := 'truncate table �ջ���λ';
      ExecSQL;
      SQL.Text := 'truncate table ����';
      ExecSQL;
      SQL.Text := 'truncate table ���';
      ExecSQL;
      SQL.Text := 'truncate table �ױ�';
      ExecSQL;
      SQL.Text := 'truncate table ��־';
      ExecSQL;
      //SQL.Text := 'truncate table �û���Ϣ';
      //ExecSQL;
      //SQL.Text := 'truncate table ������Ϣ';
      //ExecSQL;
    end
    else if RBSQL2Access.Checked then
    begin
      SQL.Text := 'delete from tbl_back_record';
      ExecSQL;
      SQL.Text := 'delete from tbl_card';
      ExecSQL;
      SQL.Text := 'delete from tbl_pay_history';
      ExecSQL;
      SQL.Text := 'delete from tbl_weight_img';
      ExecSQL;
      SQL.Text := 'delete from ����1';
      ExecSQL;
      SQL.Text := 'delete from ����2';
      ExecSQL;
      SQL.Text := 'delete from ����3';
      ExecSQL;
      SQL.Text := 'delete from ����4';
      ExecSQL;
      SQL.Text := 'delete from ����5';
      ExecSQL;
      SQL.Text := 'delete from ����10';
      ExecSQL;
      SQL.Text := 'delete from ����11';
      ExecSQL;
      SQL.Text := 'delete from ����12';
      ExecSQL;
      SQL.Text := 'delete from ����13';
      ExecSQL;
      SQL.Text := 'delete from ����14';
      ExecSQL;
      SQL.Text := 'delete from ����';
      ExecSQL;
      SQL.Text := 'delete from ������λ';
      ExecSQL;
      SQL.Text := 'delete from �ջ���λ';
      ExecSQL;
      SQL.Text := 'delete from ����';
      ExecSQL;
      SQL.Text := 'delete from ���';
      ExecSQL;
      SQL.Text := 'delete from �ױ�';
      ExecSQL;
      SQL.Text := 'delete from ��־';
      ExecSQL;
      //SQL.Text := 'delete from �û���Ϣ';
      //ExecSQL;
      //SQL.Text := 'delete from ������Ϣ';
      //ExecSQL;
    end;
  end;
end;

function TDataMigrateForm.copyBackRecord: Boolean;
begin
  with ADOQAccess do
  begin
    Close;
    SQL.Text := 'select * from tbl_back_record';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        with ADOQSQL do
        begin
          Close;
          SQL.Text := 'insert into tbl_back_record(weight,weight_time) values (:weight,:weight_time)';
          Parameters.ParamByName('weight').Value := ADOQAccess.FieldByName('weight').AsFloat;
          Parameters.ParamByName('weight_time').Value := ADOQAccess.FieldByName('weight_time').AsDateTime;
          ExecSQL;
        end;
        Next;
      end;
    end;
  end;
end;

function TDataMigrateForm.copyBackup: Boolean;
begin
  with ADOQAccess do
  begin
    Close;
    SQL.Text := 'select * from ����1';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        with ADOQSQL do
        begin
          Close;
          SQL.Text := 'insert into ����1(����,����1) values (:code,:backup)';
          Parameters.ParamByName('code').Value := ADOQAccess.FieldByName('����').AsString;
          Parameters.ParamByName('backup').Value := ADOQAccess.FieldByName('����1').AsString;
          ExecSQL;
        end;
        Next;
      end;
    end;

    SQL.Text := 'select * from ����2';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        with ADOQSQL do
        begin
          Close;
          SQL.Text := 'insert into ����2(����,����2) values (:code,:backup)';
          Parameters.ParamByName('code').Value := ADOQAccess.FieldByName('����').AsString;
          Parameters.ParamByName('backup').Value := ADOQAccess.FieldByName('����2').AsString;
          ExecSQL;
        end;
        Next;
      end;
    end;

    SQL.Text := 'select * from ����3';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        with ADOQSQL do
        begin
          Close;
          SQL.Text := 'insert into ����3(����,����3) values (:code,:backup)';
          Parameters.ParamByName('code').Value := ADOQAccess.FieldByName('����').AsString;
          Parameters.ParamByName('backup').Value := ADOQAccess.FieldByName('����3').AsString;
          ExecSQL;
        end;
        Next;
      end;
    end;

    SQL.Text := 'select * from ����4';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        with ADOQSQL do
        begin
          Close;
          SQL.Text := 'insert into ����4(����,����4) values (:code,:backup)';
          Parameters.ParamByName('code').Value := ADOQAccess.FieldByName('����').AsString;
          Parameters.ParamByName('backup').Value := ADOQAccess.FieldByName('����4').AsString;
          ExecSQL;
        end;
        Next;
      end;
    end;

    SQL.Text := 'select * from ����5';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        with ADOQSQL do
        begin
          Close;
          SQL.Text := 'insert into ����5(����,����5) values (:code,:backup)';
          Parameters.ParamByName('code').Value := ADOQAccess.FieldByName('����').AsString;
          Parameters.ParamByName('backup').Value := ADOQAccess.FieldByName('����5').AsString;
          ExecSQL;
        end;
        Next;
      end;
    end;

    SQL.Text := 'select * from ����10';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        with ADOQSQL do
        begin
          Close;
          SQL.Text := 'insert into ����10(����,����10) values (:code,:backup)';
          Parameters.ParamByName('code').Value := ADOQAccess.FieldByName('����').AsString;
          Parameters.ParamByName('backup').Value := ADOQAccess.FieldByName('����10').AsString;
          ExecSQL;
        end;
        Next;
      end;
    end;

    SQL.Text := 'select * from ����11';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        with ADOQSQL do
        begin
          Close;
          SQL.Text := 'insert into ����11(����,����11) values (:code,:backup)';
          Parameters.ParamByName('code').Value := ADOQAccess.FieldByName('����').AsString;
          Parameters.ParamByName('backup').Value := ADOQAccess.FieldByName('����11').AsString;
          ExecSQL;
        end;
        Next;
      end;
    end;

    SQL.Text := 'select * from ����12';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        with ADOQSQL do
        begin
          Close;
          SQL.Text := 'insert into ����12(����,����12) values (:code,:backup)';
          Parameters.ParamByName('code').Value := ADOQAccess.FieldByName('����').AsString;
          Parameters.ParamByName('backup').Value := ADOQAccess.FieldByName('����12').AsString;
          ExecSQL;
        end;
        Next;
      end;
    end;

    SQL.Text := 'select * from ����13';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        with ADOQSQL do
        begin
          Close;
          SQL.Text := 'insert into ����13(����,����13) values (:code,:backup)';
          Parameters.ParamByName('code').Value := ADOQAccess.FieldByName('����').AsString;
          Parameters.ParamByName('backup').Value := ADOQAccess.FieldByName('����13').AsString;
          ExecSQL;
        end;
        Next;
      end;
    end;

    SQL.Text := 'select * from ����14';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        with ADOQSQL do
        begin
          Close;
          SQL.Text := 'insert into ����14(����,����14) values (:code,:backup)';
          Parameters.ParamByName('code').Value := ADOQAccess.FieldByName('����').AsString;
          Parameters.ParamByName('backup').Value := ADOQAccess.FieldByName('����14').AsString;
          ExecSQL;
        end;
        Next;
      end;
    end;

  end;
end;

function TDataMigrateForm.copyLog: Boolean;
begin
  with ADOQAccess do
  begin
    Close;
    SQL.Text := 'select * from ��־';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        with ADOQSQL do
        begin
          Close;
          SQL.Text := 'insert into ��־(�޸���,ʱ��,��־) values (:update_user,:update_time,:content)';
          Parameters.ParamByName('update_user').Value := ADOQAccess.FieldByName('�޸���').AsString;
          Parameters.ParamByName('update_time').Value := ADOQAccess.FieldByName('ʱ��').AsDateTime;
          Parameters.ParamByName('content').Value := ADOQAccess.FieldByName('��־').AsString;
          ExecSQL;
        end;
        Next;
      end;
    end;
  end;
end;

function TDataMigrateForm.copyPreMaintain: Boolean;
begin
  with ADOQAccess do
  begin
    Close;
    SQL.Text := 'select * from ����';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        with ADOQSQL do
        begin
          Close;
          SQL.Text := 'insert into ����(����,Ƥ��,��ע) '
            + 'values (:car,:tare,:memo)';
          Parameters.ParamByName('car').Value := ADOQAccess.FieldByName('����').AsString;
          Parameters.ParamByName('tare').Value := ADOQAccess.FieldByName('Ƥ��').AsFloat;
          Parameters.ParamByName('memo').Value := ADOQAccess.FieldByName('��ע').AsString;
          ExecSQL;
        end;
        Next;
      end;
    end;

    SQL.Text := 'select * from ������λ';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        with ADOQSQL do
        begin
          Close;
          SQL.Text := 'insert into ������λ(����,������λ) values (:code,:backup)';
          Parameters.ParamByName('code').Value := ADOQAccess.FieldByName('����').AsString;
          Parameters.ParamByName('backup').Value := ADOQAccess.FieldByName('������λ').AsString;
          ExecSQL;
        end;
        Next;
      end;
    end;

    SQL.Text := 'select * from �ջ���λ';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        with ADOQSQL do
        begin
          Close;
          SQL.Text := 'insert into �ջ���λ(����,�ջ���λ,��ǰ���,���ö��) values (:code,:backup,:leftSum,:credit)';
          Parameters.ParamByName('code').Value := ADOQAccess.FieldByName('����').AsString;
          Parameters.ParamByName('backup').Value := ADOQAccess.FieldByName('�ջ���λ').AsString;
          Parameters.ParamByName('leftSum').Value := ADOQAccess.FieldByName('��ǰ���').AsFloat;
          Parameters.ParamByName('credit').Value := ADOQAccess.FieldByName('���ö��').AsFloat;
          ExecSQL;
        end;
        Next;
      end;
    end;

    SQL.Text := 'select * from ����';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        with ADOQSQL do
        begin
          Close;
          SQL.Text := 'insert into ����(����,����,����,�۷�ϵ��) values (:code,:backup,:price,:scale)';
          Parameters.ParamByName('code').Value := ADOQAccess.FieldByName('����').AsString;
          Parameters.ParamByName('backup').Value := ADOQAccess.FieldByName('����').AsString;
          Parameters.ParamByName('price').Value := ADOQAccess.FieldByName('����').AsFloat;
          Parameters.ParamByName('scale').Value := ADOQAccess.FieldByName('�۷�ϵ��').AsFloat;
          ExecSQL;
        end;
        Next;
      end;
    end;

    SQL.Text := 'select * from ���';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        with ADOQSQL do
        begin
          Close;
          SQL.Text := 'insert into ���(����,���) values (:code,:backup)';
          Parameters.ParamByName('code').Value := ADOQAccess.FieldByName('����').AsString;
          Parameters.ParamByName('backup').Value := ADOQAccess.FieldByName('���').AsString;
          ExecSQL;
        end;
        Next;
      end;
    end;

    SQL.Text := 'select * from �ױ�';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        with ADOQSQL do
        begin
          Close;
          SQL.Text := 'insert into �ױ�(����,������λ,�ջ���λ,����,���) '
            + 'values (:car,:faHuo,:shouHuo,:goods,:spec)';
          Parameters.ParamByName('car').Value := ADOQAccess.FieldByName('����').AsString;
          Parameters.ParamByName('faHuo').Value := ADOQAccess.FieldByName('������λ').AsString;
          Parameters.ParamByName('shouHuo').Value := ADOQAccess.FieldByName('�ջ���λ').AsString;
          Parameters.ParamByName('goods').Value := ADOQAccess.FieldByName('����').AsString;
          Parameters.ParamByName('spec').Value := ADOQAccess.FieldByName('���').AsString;
          ExecSQL;
        end;
        Next;
      end;
    end;
  end;
end;

function TDataMigrateForm.copyUserInfo: Boolean;
begin
  with ADOQAccess do
  begin
    Close;
    SQL.Text := 'select * from �û���Ϣ';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        with ADOQSQL do
        begin
          Close;
          SQL.Text := 'insert into �û���Ϣ([�û���],[����],'
            + '[Ԥ��ά��],[���Ź���],[ϵͳ��־],[��̨��¼],[��ӡ����],[�޸İ���],'
            + '[��ӡ����],[�û�����],[ϵͳ����],[��������],[�ֹ�����],[���ݿ�����],'
            + '[���ݱ���],[���ݵ���],[���ݵ���],[��������],[���ݳ�ʼ��],'
            + '[�Ǳ�����],[��Ƶ����],[����������],[IOģ������],[����Ļ����],'
            + '[�������],[���ݲ�ѯ],[��Ӽ�¼],[ɾ����¼],[�޸ĳ���],'
            + '[�޸ķ�����λ],[�޸��ջ���λ],[�޸Ļ���],[�޸Ĺ��],[�޸�ë��],'
            + '[�޸�Ƥ��],[�޸Ŀ���],[�޸ĵ���],[�޸��۷�ϵ��],[�޸Ĺ�����],'
            + '[�޸ı���1],[�޸ı���2],[�޸ı���3],[�޸ı���4],[�޸ı���5],'
            + '[�޸ı���6],[�޸ı���7],[�޸ı���8],[�޸ı���9],[�޸ı���10],'
            + '[�޸ı���11],[�޸ı���12],[�޸ı���13],[�޸ı���14],[�޸ı���15],'
            + '[�޸ı���16],[�޸ı���17],[�޸ı���18],[����Ա]) '
            + 'values (:un,:pwd,'
            + ':Premaintain,:Card,:Log,:BackRecord,:PrintTicket,:ModifyTicket,'
            + ':PrintReport,:User,:SystemSet,:FormSet,:ManualInput,:DBSet,'
            + ':DataBackup,:DataImport,:DataExport,:DataClear,:DataInit,'
            + ':MeterSet,:VideoSet,:ReaderSet,:IOSet,:ScreenSet,'
            + ':VoiceSet,:DataQuery,:AddData,:DelData,:Car,'
            + ':FaHuo,:ShouHuo,:Goods,:Spec,:Gross,'
            + ':Tare,:Bundle,:Price,:Scale,:Cost,'
            + ':Backup1,:Backup2,:Backup3,:Backup4,:Backup5,'
            + ':Backup6,:Backup7,:Backup8,:Backup9,:Backup10,'
            + ':Backup11,:Backup12,:Backup13,:Backup14,:Backup15,'
            + ':Backup16,:Backup17,:Backup18,:admin)';
          Parameters.ParamByName('un').Value := ADOQAccess.FieldByName('�û���').AsString;
          Parameters.ParamByName('pwd').Value := ADOQAccess.FieldByName('����').AsString;
          Parameters.ParamByName('Premaintain').Value := ADOQAccess.FieldByName('Ԥ��ά��').AsBoolean;
          Parameters.ParamByName('Card').Value := ADOQAccess.FieldByName('���Ź���').AsBoolean;
          Parameters.ParamByName('Log').Value := ADOQAccess.FieldByName('ϵͳ��־').AsBoolean;
          Parameters.ParamByName('BackRecord').Value := ADOQAccess.FieldByName('��̨��¼').AsBoolean;
          Parameters.ParamByName('PrintTicket').Value := ADOQAccess.FieldByName('��ӡ����').AsBoolean;
          Parameters.ParamByName('ModifyTicket').Value := ADOQAccess.FieldByName('�޸İ���').AsBoolean;
          Parameters.ParamByName('PrintReport').Value := ADOQAccess.FieldByName('��ӡ����').AsBoolean;
          Parameters.ParamByName('User').Value := ADOQAccess.FieldByName('�û�����').AsBoolean;
          Parameters.ParamByName('SystemSet').Value := ADOQAccess.FieldByName('ϵͳ����').AsBoolean;
          Parameters.ParamByName('FormSet').Value := ADOQAccess.FieldByName('��������').AsBoolean;
          Parameters.ParamByName('ManualInput').Value := ADOQAccess.FieldByName('�ֹ�����').AsBoolean;
          Parameters.ParamByName('DBSet').Value := ADOQAccess.FieldByName('���ݿ�����').AsBoolean;
          Parameters.ParamByName('DataBackup').Value := ADOQAccess.FieldByName('���ݱ���').AsBoolean;
          Parameters.ParamByName('DataImport').Value := ADOQAccess.FieldByName('���ݵ���').AsBoolean;
          Parameters.ParamByName('DataExport').Value := ADOQAccess.FieldByName('���ݵ���').AsBoolean;
          Parameters.ParamByName('DataClear').Value := ADOQAccess.FieldByName('��������').AsBoolean;
          Parameters.ParamByName('DataInit').Value := ADOQAccess.FieldByName('���ݳ�ʼ��').AsBoolean;
          Parameters.ParamByName('MeterSet').Value := ADOQAccess.FieldByName('�Ǳ�����').AsBoolean;
          Parameters.ParamByName('VideoSet').Value := ADOQAccess.FieldByName('��Ƶ����').AsBoolean;
          Parameters.ParamByName('ReaderSet').Value := ADOQAccess.FieldByName('����������').AsBoolean;
          Parameters.ParamByName('IOSet').Value := ADOQAccess.FieldByName('IOģ������').AsBoolean;
          Parameters.ParamByName('ScreenSet').Value := ADOQAccess.FieldByName('����Ļ����').AsBoolean;
          Parameters.ParamByName('VoiceSet').Value := ADOQAccess.FieldByName('�������').AsBoolean;
          Parameters.ParamByName('DataQuery').Value := ADOQAccess.FieldByName('���ݲ�ѯ').AsBoolean;
          Parameters.ParamByName('AddData').Value := ADOQAccess.FieldByName('��Ӽ�¼').AsBoolean;
          Parameters.ParamByName('DelData').Value := ADOQAccess.FieldByName('ɾ����¼').AsBoolean;
          Parameters.ParamByName('Car').Value := ADOQAccess.FieldByName('�޸ĳ���').AsBoolean;
          Parameters.ParamByName('FaHuo').Value := ADOQAccess.FieldByName('�޸ķ�����λ').AsBoolean;
          Parameters.ParamByName('ShouHuo').Value := ADOQAccess.FieldByName('�޸��ջ���λ').AsBoolean;
          Parameters.ParamByName('Goods').Value := ADOQAccess.FieldByName('�޸Ļ���').AsBoolean;
          Parameters.ParamByName('Spec').Value := ADOQAccess.FieldByName('�޸Ĺ��').AsBoolean;
          Parameters.ParamByName('Gross').Value := ADOQAccess.FieldByName('�޸�ë��').AsBoolean;
          Parameters.ParamByName('Tare').Value := ADOQAccess.FieldByName('�޸�Ƥ��').AsBoolean;
          Parameters.ParamByName('Bundle').Value := ADOQAccess.FieldByName('�޸Ŀ���').AsBoolean;
          Parameters.ParamByName('Price').Value := ADOQAccess.FieldByName('�޸ĵ���').AsBoolean;
          Parameters.ParamByName('Scale').Value := ADOQAccess.FieldByName('�޸��۷�ϵ��').AsBoolean;
          Parameters.ParamByName('Cost').Value := ADOQAccess.FieldByName('�޸Ĺ�����').AsBoolean;
          Parameters.ParamByName('Backup1').Value := ADOQAccess.FieldByName('�޸ı���1').AsBoolean;
          Parameters.ParamByName('Backup2').Value := ADOQAccess.FieldByName('�޸ı���2').AsBoolean;
          Parameters.ParamByName('Backup3').Value := ADOQAccess.FieldByName('�޸ı���3').AsBoolean;
          Parameters.ParamByName('Backup4').Value := ADOQAccess.FieldByName('�޸ı���4').AsBoolean;
          Parameters.ParamByName('Backup5').Value := ADOQAccess.FieldByName('�޸ı���5').AsBoolean;
          Parameters.ParamByName('Backup6').Value := ADOQAccess.FieldByName('�޸ı���6').AsBoolean;
          Parameters.ParamByName('Backup7').Value := ADOQAccess.FieldByName('�޸ı���7').AsBoolean;
          Parameters.ParamByName('Backup8').Value := ADOQAccess.FieldByName('�޸ı���8').AsBoolean;
          Parameters.ParamByName('Backup9').Value := ADOQAccess.FieldByName('�޸ı���9').AsBoolean;
          Parameters.ParamByName('Backup10').Value := ADOQAccess.FieldByName('�޸ı���10').AsBoolean;
          Parameters.ParamByName('Backup11').Value := ADOQAccess.FieldByName('�޸ı���11').AsBoolean;
          Parameters.ParamByName('Backup12').Value := ADOQAccess.FieldByName('�޸ı���12').AsBoolean;
          Parameters.ParamByName('Backup13').Value := ADOQAccess.FieldByName('�޸ı���13').AsBoolean;
          Parameters.ParamByName('Backup14').Value := ADOQAccess.FieldByName('�޸ı���14').AsBoolean;
          Parameters.ParamByName('Backup15').Value := ADOQAccess.FieldByName('�޸ı���15').AsBoolean;
          Parameters.ParamByName('Backup16').Value := ADOQAccess.FieldByName('�޸ı���16').AsBoolean;
          Parameters.ParamByName('Backup17').Value := ADOQAccess.FieldByName('�޸ı���17').AsBoolean;
          Parameters.ParamByName('Backup18').Value := ADOQAccess.FieldByName('�޸ı���18').AsBoolean;
          Parameters.ParamByName('admin').Value := ADOQAccess.FieldByName('����Ա').AsBoolean;
          try
            ExecSQL;
          except
          end;
        end;
        Next;
      end;
    end;
  end;
end;

function TDataMigrateForm.copyWeightImg: Boolean;
begin
  with ADOQAccess do
  begin
    Close;
    SQL.Text := 'select * from TBL_WEIGHT_IMG';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        with ADOQSQL do
        begin
          Close;
          SQL.Text := 'insert into TBL_WEIGHT_IMG(WEIGHT_ID,GROSS_IMG1,GROSS_IMG2,GROSS_IMG3,GROSS_IMG4,'
            + 'TARE_IMG1,TARE_IMG2,TARE_IMG3,TARE_IMG4) values (:WEIGHT_ID,:GROSS_IMG1,:GROSS_IMG2,:GROSS_IMG3,:GROSS_IMG4,'
            + ':TARE_IMG1,:TARE_IMG2,:TARE_IMG3,:TARE_IMG4)';
          Parameters.ParamByName('WEIGHT_ID').Value := ADOQAccess.FieldByName('WEIGHT_ID').AsString;
          TBlobField(ADOQAccess.FieldByName('GROSS_IMG1')).SaveToFile(ExtractFilePath(ParamStr(0)) + 'tP0.jpg');
          TBlobField(ADOQAccess.FieldByName('GROSS_IMG2')).SaveToFile(ExtractFilePath(ParamStr(0)) + 'tP1.jpg');
          TBlobField(ADOQAccess.FieldByName('GROSS_IMG3')).SaveToFile(ExtractFilePath(ParamStr(0)) + 'tP2.jpg');
          TBlobField(ADOQAccess.FieldByName('GROSS_IMG4')).SaveToFile(ExtractFilePath(ParamStr(0)) + 'tP3.jpg');
          TBlobField(ADOQAccess.FieldByName('TARE_IMG1')).SaveToFile(ExtractFilePath(ParamStr(0)) + 'tP4.jpg');
          TBlobField(ADOQAccess.FieldByName('TARE_IMG2')).SaveToFile(ExtractFilePath(ParamStr(0)) + 'tP5.jpg');
          TBlobField(ADOQAccess.FieldByName('TARE_IMG3')).SaveToFile(ExtractFilePath(ParamStr(0)) + 'tP6.jpg');
          TBlobField(ADOQAccess.FieldByName('TARE_IMG4')).SaveToFile(ExtractFilePath(ParamStr(0)) + 'tP7.jpg');

          Parameters.ParamByName('GROSS_IMG1').LoadFromFile(ExtractFilePath(ParamStr(0)) + 'tP0.jpg', ftBlob);
          Parameters.ParamByName('GROSS_IMG2').LoadFromFile(ExtractFilePath(ParamStr(0)) + 'tP1.jpg', ftBlob);
          Parameters.ParamByName('GROSS_IMG3').LoadFromFile(ExtractFilePath(ParamStr(0)) + 'tP2.jpg', ftBlob);
          Parameters.ParamByName('GROSS_IMG4').LoadFromFile(ExtractFilePath(ParamStr(0)) + 'tP3.jpg', ftBlob);
          Parameters.ParamByName('TARE_IMG1').LoadFromFile(ExtractFilePath(ParamStr(0)) + 'tP4.jpg', ftBlob);
          Parameters.ParamByName('TARE_IMG2').LoadFromFile(ExtractFilePath(ParamStr(0)) + 'tP5.jpg', ftBlob);
          Parameters.ParamByName('TARE_IMG3').LoadFromFile(ExtractFilePath(ParamStr(0)) + 'tP6.jpg', ftBlob);
          Parameters.ParamByName('TARE_IMG4').LoadFromFile(ExtractFilePath(ParamStr(0)) + 'tP7.jpg', ftBlob);
          ExecSQL;
        end;
        Next;
      end;
    end;
  end;
end;

function TDataMigrateForm.copyWeightInfo: Boolean;
begin
  with ADOQAccess do
  begin
    Close;
    SQL.Text := 'select * from ������Ϣ';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        with ADOQSQL do
        begin
          Close;
          SQL.Text := 'insert into ������Ϣ(��ˮ��,����,��������,������λ,�ջ���λ,'
            + '����,���,ë��,Ƥ��,����,'
            + '����,ʵ��,����,���,�۷�ϵ��,'
            + '����,������,ë��˾��Ա,Ƥ��˾��Ա,ë�ذ���,'
            + 'Ƥ�ذ���,ë��ʱ��,Ƥ��ʱ��,һ�ι���ʱ��,���ι���ʱ��,'
            + '������,����ʱ��,��ע,��ӡ����,�ϴ���,'
            + '����1,����2,����3,����4,����5,'
            + '����6,����7,����8,����9,����10,'
            + '����11,����12,����13,����14,����15,'
            + '����16,����17,����18) '
            + 'values (:glideNo,:car,:weightType,:faHuo,:shouHuo,'
            + ':goods,:spec,:gross,:tare,:net,'
            + ':bundle,:real,:price,:sum,:scale,'
            + ':quanter,:cost,:grossMan,:tareMan,:grossAddr,'
            + ':tareAddr,:grossTime,:tareTime,:firstTime,:secondTime,'
            + ':updateUser,:updateTime,:memo,:printCount,:upload,'
            + ':backup1,:backup2,:backup3,:backup4,:backup5,'
            + ':backup6,:backup7,:backup8,:backup9,:backup10,'
            + ':backup11,:backup12,:backup13,:backup14,'
            + ':backup15,:backup16,:backup17,:backup18)';
          Parameters.ParamByName('glideNo').Value := ADOQAccess.FieldByName('��ˮ��').AsString;
          Parameters.ParamByName('car').Value := ADOQAccess.FieldByName('����').AsString;
          Parameters.ParamByName('weightType').Value := ADOQAccess.FieldByName('��������').AsString;
          Parameters.ParamByName('faHuo').Value := ADOQAccess.FieldByName('������λ').AsString;
          Parameters.ParamByName('shouHuo').Value := ADOQAccess.FieldByName('�ջ���λ').AsString;
          Parameters.ParamByName('goods').Value := ADOQAccess.FieldByName('����').AsString;
          Parameters.ParamByName('spec').Value := ADOQAccess.FieldByName('���').AsString;
          Parameters.ParamByName('gross').Value := ADOQAccess.FieldByName('ë��').AsFloat;
          Parameters.ParamByName('tare').Value := ADOQAccess.FieldByName('Ƥ��').AsFloat;
          Parameters.ParamByName('net').Value := ADOQAccess.FieldByName('����').AsFloat;
          Parameters.ParamByName('bundle').Value := ADOQAccess.FieldByName('����').AsFloat;
          Parameters.ParamByName('real').Value := ADOQAccess.FieldByName('ʵ��').AsFloat;
          Parameters.ParamByName('price').Value := ADOQAccess.FieldByName('����').AsFloat;
          Parameters.ParamByName('sum').Value := ADOQAccess.FieldByName('���').AsFloat;
          Parameters.ParamByName('scale').Value := ADOQAccess.FieldByName('�۷�ϵ��').AsFloat;
          Parameters.ParamByName('quanter').Value := ADOQAccess.FieldByName('����').AsFloat;
          Parameters.ParamByName('cost').Value := ADOQAccess.FieldByName('������').AsFloat;
          Parameters.ParamByName('grossMan').Value := ADOQAccess.FieldByName('ë��˾��Ա').AsString;
          Parameters.ParamByName('tareMan').Value := ADOQAccess.FieldByName('Ƥ��˾��Ա').AsString;
          Parameters.ParamByName('grossAddr').Value := ADOQAccess.FieldByName('ë�ذ���').AsString;
          Parameters.ParamByName('tareAddr').Value := ADOQAccess.FieldByName('Ƥ�ذ���').AsString;

          if ADOQAccess.FieldByName('ë��ʱ��').IsNull then
            Parameters.ParamByName('grossTime').Value := null
          else
            Parameters.ParamByName('grossTime').Value := ADOQAccess.FieldByName('ë��ʱ��').AsDateTime;
          if ADOQAccess.FieldByName('Ƥ��ʱ��').IsNull then
            Parameters.ParamByName('tareTime').Value := null
          else
            Parameters.ParamByName('tareTime').Value := ADOQAccess.FieldByName('Ƥ��ʱ��').AsDateTime;
          if ADOQAccess.FieldByName('һ�ι���ʱ��').IsNull then
            Parameters.ParamByName('firstTime').Value := null
          else
            Parameters.ParamByName('firstTime').Value := ADOQAccess.FieldByName('һ�ι���ʱ��').AsDateTime;
          if ADOQAccess.FieldByName('���ι���ʱ��').IsNull then
            Parameters.ParamByName('secondTime').Value := null
          else
            Parameters.ParamByName('secondTime').Value := ADOQAccess.FieldByName('���ι���ʱ��').AsDateTime;

          Parameters.ParamByName('updateUser').Value := ADOQAccess.FieldByName('������').AsString;

          if ADOQAccess.FieldByName('����ʱ��').IsNull then
            Parameters.ParamByName('updateTime').Value := null
          else
            Parameters.ParamByName('updateTime').Value := ADOQAccess.FieldByName('����ʱ��').AsDateTime;

          Parameters.ParamByName('memo').Value := ADOQAccess.FieldByName('��ע').AsString;
          Parameters.ParamByName('printCount').Value := ADOQAccess.FieldByName('��ӡ����').AsInteger;
          Parameters.ParamByName('upload').Value := ADOQAccess.FieldByName('�ϴ���').AsBoolean;
          Parameters.ParamByName('backup1').Value := ADOQAccess.FieldByName('����1').AsString;
          Parameters.ParamByName('backup2').Value := ADOQAccess.FieldByName('����2').AsString;
          Parameters.ParamByName('backup3').Value := ADOQAccess.FieldByName('����3').AsString;
          Parameters.ParamByName('backup4').Value := ADOQAccess.FieldByName('����4').AsString;
          Parameters.ParamByName('backup5').Value := ADOQAccess.FieldByName('����5').AsString;
          Parameters.ParamByName('backup6').Value := ADOQAccess.FieldByName('����6').AsFloat;
          Parameters.ParamByName('backup7').Value := ADOQAccess.FieldByName('����7').AsFloat;
          Parameters.ParamByName('backup8').Value := ADOQAccess.FieldByName('����8').AsFloat;
          Parameters.ParamByName('backup9').Value := ADOQAccess.FieldByName('����9').AsFloat;
          Parameters.ParamByName('backup10').Value := ADOQAccess.FieldByName('����10').AsString;
          Parameters.ParamByName('backup11').Value := ADOQAccess.FieldByName('����11').AsString;
          Parameters.ParamByName('backup12').Value := ADOQAccess.FieldByName('����12').AsString;
          Parameters.ParamByName('backup13').Value := ADOQAccess.FieldByName('����13').AsString;
          Parameters.ParamByName('backup14').Value := ADOQAccess.FieldByName('����14').AsString;
          Parameters.ParamByName('backup15').Value := ADOQAccess.FieldByName('����15').AsFloat;
          Parameters.ParamByName('backup16').Value := ADOQAccess.FieldByName('����16').AsFloat;
          Parameters.ParamByName('backup17').Value := ADOQAccess.FieldByName('����17').AsFloat;
          Parameters.ParamByName('backup18').Value := ADOQAccess.FieldByName('����18').AsFloat;
          try
            ExecSQL;
          except
          end;
        end;
        Next;
      end;
    end;
  end;
end;

procedure TDataMigrateForm.FormShow(Sender: TObject);
begin
  ADOQAccess.Connection := ADOCAccess;
  ADOQSQL.Connection := ADOCSQL;
end;

end.

