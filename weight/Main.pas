unit Main;

interface

uses
  Windows, Graphics, SysUtils, Classes, Controls, Forms,
  Dialogs, Menus, DB, ADODB, ExtCtrls, StdCtrls, inifiles,
  Buttons, DBGridEh, SysConfig, WinSkinData, PropStorageEh, StdActns,
  DBActns, ActnList, PrnDbgeh, RzPanel, RzButton, GridsEh, Registry,
  RzStatus, ExceptionLog, WeightFrm,
  ExtDlgs, PropFilerEh, OleServer, CnAAFont,
  MSNPopUp, RzSplit, ToolCtrlsEh, DBGridEhToolCtrls,
  DBAxisGridsEh, DBGridEhGrouping, SpeechLib_TLB, ImgList, RzAnimtr;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    MSysOper: TMenuItem;
    MDataMaintain: TMenuItem;
    MSysMaintain: TMenuItem;
    MAdditionalTool: TMenuItem;
    MHelp: TMenuItem;
    SMChange: TMenuItem;
    SMPassword: TMenuItem;
    SMWeight: TMenuItem;
    SMClose: TMenuItem;
    SMTerminate: TMenuItem;
    SMUser: TMenuItem;
    SMDataQuery: TMenuItem;
    SMDBSet: TMenuItem;
    SMDBBackup: TMenuItem;
    SMPreMaintain: TMenuItem;
    SMMeter1: TMenuItem;
    SMSoftSet: TMenuItem;
    SMTareTrend: TMenuItem;
    SMComputer: TMenuItem;
    SMModify: TMenuItem;
    SMAbout: TMenuItem;
    N38: TMenuItem;
    N40: TMenuItem;
    N41: TMenuItem;
    N44: TMenuItem;
    SMDBClear: TMenuItem;
    TAutoBackup: TTimer;
    PrintDBGridEh1: TPrintDBGridEh;
    SMSimulate: TMenuItem;
    ActionListMain: TActionList;
    DataSetFirst1: TDataSetFirst;
    DataSetLast1: TDataSetLast;
    DataSetInsert1: TDataSetInsert;
    DataSetDelete1: TDataSetDelete;
    DataSetEdit1: TDataSetEdit;
    DataSetPost1: TDataSetPost;
    DataSetCancel1: TDataSetCancel;
    DataSetRefresh1: TDataSetRefresh;
    PMDBGridEh: TPopupMenu;
    SPMPrint: TMenuItem;
    SPMSaveAs: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    TSimulate: TTimer;
    SMReadWeight: TMenuItem;
    N4: TMenuItem;
    SMDb: TMenuItem;
    SMSysLog: TMenuItem;
    IniPropStorageManEh1: TIniPropStorageManEh;
    PropStorageEh1: TPropStorageEh;
    SMVideo: TMenuItem;
    SMHelp: TMenuItem;
    cheat1: TAction;
    SMBackRecord: TMenuItem;
    SMTicketSet: TMenuItem;
    SMScreen: TMenuItem;
    SMMeter: TMenuItem;
    SMMeter2: TMenuItem;
    SMDBInit: TMenuItem;
    N11: TMenuItem;
    SMEquipment: TMenuItem;
    cheat2: TAction;
    cheat3: TAction;
    cheat4: TAction;
    ASetCheat: TAction;
    SMDesign: TMenuItem;
    RzToolbar1: TRzToolbar;
    RzSpacer4: TRzSpacer;
    RzSpacer5: TRzSpacer;
    RzSpacer6: TRzSpacer;
    RzSpacer1: TRzSpacer;
    StatusBar1: TRzStatusBar;
    SpMode: TRzStatusPane;
    SpUser: TRzStatusPane;
    SpTime: TRzClockStatus;
    spInfo: TRzMarqueeStatus;
    PMVoice: TPopupMenu;
    SMCharge: TMenuItem;
    SMChargeHistory: TMenuItem;
    EurekaLog1: TEurekaLog;
    SMTaoQuery: TMenuItem;
    AVideo: TAction;
    SMSkin: TMenuItem;
    SkinData1: TSkinData;
    ImgBack: TImage;
    TLine: TTimer;
    N8: TMenuItem;
    SMDBMigrate: TMenuItem;
    TBackRecord: TTimer;
    SMStaticTrend: TMenuItem;
    N23: TMenuItem;
    N27: TMenuItem;
    TBExit: TRzBitBtn;
    TBChange: TRzBitBtn;
    TBWeight: TRzBitBtn;
    TBQuery: TRzBitBtn;
    TBTicket: TRzBitBtn;
    TBVideo: TRzBitBtn;
    TBCalc: TRzBitBtn;
    TBVoice: TRzMenuButton;
    TBDouble: TRzBitBtn;
    SMMail: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    TBNet: TRzBitBtn;
    SMManualInput: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    MSNPopUp1: TMSNPopUp;
    SMStorageInfo: TMenuItem;
    N34: TMenuItem;
    SMInvalidQuery: TMenuItem;
    N35: TMenuItem;
    SMPriceQuery: TMenuItem;
    cbjt1: TMenuItem;
    N37: TMenuItem;
    N39: TMenuItem;
    ADefine: TAction;
    TAutoShut: TTimer;
    N43: TMenuItem;
    N45: TMenuItem;
    N46: TMenuItem;
    N47: TMenuItem;
    cheatClose: TAction;
    SPCheat: TRzStatusPane;
    SMWeightSet: TMenuItem;
    N48: TMenuItem;
    SMReportSys: TMenuItem;
    SpltMain: TRzSplitter;
    PWeight: TRzPanel;
    FrmWeight1: TFrmWeight;
    PData: TRzPanel;
    DBGridEh1: TDBGridEh;
    SPTool: TRzSizePanel;
    PhotoBtn: TSpeedButton;
    CBRecordType: TComboBox;
    CBRecordTime: TComboBox;
    ListBtn: TBitBtn;
    OutputBtn: TRzBitBtn;
    PrintBtn: TBitBtn;
    cheat5: TAction;
    cheat6: TAction;
    cheat7: TAction;
    cheat8: TAction;
    SMCostSet: TMenuItem;
    TAutoRefresh: TTimer;
    SpVoice1: TSpVoice;
    ASetCloud: TAction;
    SMScanTicket: TMenuItem;
    SMScanReport: TMenuItem;
    TBPhone: TRzBitBtn;
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure SMMeter1Click(Sender: TObject);
    procedure SMCloseClick(Sender: TObject);
    procedure SMSoftSetClick(Sender: TObject);
    procedure SMChangeClick(Sender: TObject);
    procedure SMPasswordClick(Sender: TObject);
    procedure SMWeightClick(Sender: TObject);
    procedure SMUserClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SMDBSetClick(Sender: TObject);
    procedure SMDBBackupClick(Sender: TObject);
    procedure SMPreMaintainClick(Sender: TObject);
    procedure SMDBClearClick(Sender: TObject);
    procedure TAutoBackupTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure SMDataQueryClick(Sender: TObject);
    procedure SMAboutClick(Sender: TObject);
    procedure SMComputerClick(Sender: TObject);
    procedure SMTerminateClick(Sender: TObject);
    procedure SMSimulateClick(Sender: TObject);
    procedure SPMPrintClick(Sender: TObject);
    procedure SPMSaveAsClick(Sender: TObject);
    procedure TSimulateTimer(Sender: TObject);
    procedure SMReadWeightClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure SMSysLogClick(Sender: TObject);
    procedure SMBackRecordClick(Sender: TObject);
    procedure SMTicketSetClick(Sender: TObject);
    procedure SMModifyClick(Sender: TObject);
    procedure SMScreenClick(Sender: TObject);
    procedure SMMeter2Click(Sender: TObject);
    procedure SMDBInitClick(Sender: TObject);
    procedure CBRecordTypeChange(Sender: TObject);
    procedure cheat1Execute(Sender: TObject);
    procedure cheat2Execute(Sender: TObject);
    procedure cheat3Execute(Sender: TObject);
    procedure cheat4Execute(Sender: TObject);
    procedure ASetCheatExecute(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure SMTareTrendClick(Sender: TObject);
    procedure SMDesignClick(Sender: TObject);
    procedure TBExitClick(Sender: TObject);
    procedure TBChangeClick(Sender: TObject);
    procedure TBWeightClick(Sender: TObject);
    procedure TBQueryClick(Sender: TObject);
    procedure TBCalcClick(Sender: TObject);
    procedure TBTicketClick(Sender: TObject);
    procedure TBVideoClick(Sender: TObject);
    procedure SMVideoClick(Sender: TObject);
    procedure CBRecordTimeChange(Sender: TObject);
    procedure SMChargeClick(Sender: TObject);
    procedure SMChargeHistoryClick(Sender: TObject);
    procedure SMTaoQueryClick(Sender: TObject);
    procedure RzToolbar1DblClick(Sender: TObject);
    procedure AVideoExecute(Sender: TObject);
    procedure SMSkinClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure TLineTimer(Sender: TObject);
    procedure SMDBMigrateClick(Sender: TObject);
    procedure TBackRecordTimer(Sender: TObject);
    procedure SMStaticTrendClick(Sender: TObject);
    procedure SMBackGroundClick(Sender: TObject);
    procedure TBDoubleClick(Sender: TObject);
    procedure SMMailClick(Sender: TObject);
    procedure TBNetClick(Sender: TObject);
    procedure TBVoiceContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure ImgBackDblClick(Sender: TObject);
    procedure SMHelpClick(Sender: TObject);
    procedure SMManualInputClick(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure SMStorageInfoClick(Sender: TObject);
    procedure SMInvalidQueryClick(Sender: TObject);
    procedure N35Click(Sender: TObject);
    procedure SMPriceQueryClick(Sender: TObject);
    procedure cbjt1Click(Sender: TObject);
    procedure N37Click(Sender: TObject);
    procedure TAutoShutTimer(Sender: TObject);
    procedure N45Click(Sender: TObject);
    procedure N46Click(Sender: TObject);
    procedure N47Click(Sender: TObject);
    procedure PhotoBtnClick(Sender: TObject);
    procedure ListBtnClick(Sender: TObject);
    procedure OutputBtnClick(Sender: TObject);
    procedure PrintBtnClick(Sender: TObject);
    procedure cheatCloseExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SMReportSysClick(Sender: TObject);
    procedure cheat5Execute(Sender: TObject);
    procedure cheat6Execute(Sender: TObject);
    procedure cheat7Execute(Sender: TObject);
    procedure cheat8Execute(Sender: TObject);
    procedure SMCostSetClick(Sender: TObject);
    procedure TAutoRefreshTimer(Sender: TObject);
    procedure DBGridEh1CellClick(Column: TColumnEh);
    procedure SMScanTicketClick(Sender: TObject);
    procedure SMScanReportClick(Sender: TObject);
    procedure ADefineExecute(Sender: TObject);
    procedure ShowJson1Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
  private
    { Private declarations }
    myini: TiniFile;
    canAutoSave1, canAutoSave2: Boolean; //��̨�Զ�����
    arrPicFile: TStringList;
    arrDesignMenu: array of TMenuItem;
    picStep: Integer; //�����л�ͼƬʹ��
    FCurrentUser: string;
    testStep: Boolean;
    meter1Plus, meter2Plus: Boolean; //ģ����ؼӼ���־

    procedure SetCurrentUser(const Value: string);
    function getBgFile(): Boolean; //��ȡ����ͼƬ�ļ�����������
    procedure selWeightForm(Sender: TObject); //ѡ����ؽ���
  public
    { Public declarations }
    systemConfig: TSysConfig; //ϵͳ����
    poWeightSetConfig, soWeightSetConfig, ioWeightSetConfig, ooWeightSetConfig: TWeightSetConfig; //�������
    procedure ShowMsg(Msg: string); //��ʾ��Ϣ
    procedure GetStaticInfo(); //������ؽ������Ͻǵ�ͳ����Ϣ
    procedure setAutoBackup(t: boolean); //�����Զ��������ݿ�
    procedure CheckRegistry; //����ע����
    function GetRegistryCode: string; //ȡϵͳע����
    procedure loadFormDesign(); //���봰������
    procedure loadVoiceList(); //��ȡ���������б�
    function showGridRecord(): string; //��ʾ���ļ�¼,��������
    procedure loadSysConfig(); //��ȡϵͳ����
    procedure pmVoiceClick(Sender: TObject); //���������б�
    function setSkin(skinFile: string): Boolean; //����ϵͳƤ��
    function setBackGround(s: string): Boolean; //���ñ����ļ�
    function setVoiceRate(r: Integer): Boolean; //���ò����ٶ�
    function resizeMain(): Boolean; //���ô���
    procedure setCompanyInfo();
    procedure loadFormDesignFile();

    procedure loadMenu();
    procedure saveMenu();
    procedure loadDBGrid(dg: TDBGridEh);
    procedure saveDBGrid(dg: TDBGridEh);

    procedure speak(str: string);
    procedure setExportWeightCheat();
    property
      CurrentUser: string read FCurrentUser write SetCurrentUser; //��ǰ�û�
  end;

var
  MainForm: TMainForm;
  //rd: TReadDog;

type
  TMyDBGrid = class(TDBGridEh);

implementation

uses QueryDM, SoftwareSet, ModifyPassword, Login, UserPurview,
  DataQuery, PrepareMaintain, DBConnect,
  DBMaintain, DBClear, DBBackup, About, ReadWeight, Log,
  PhotoUnit, SQLDBBackup, BackRecord, TicketSet, CommonUtil,
  RegCode, Reg, ComOutput,
  Correct, DogUtil, Tao,
  TareChart, WeightSet, InitializeOption, Video,
  Voice, Pay, PayHistory, VideoSet, DataShowSetting,
  SkinChange, DrawLine1, DrawLine2, DataMigrate, StaticChart, MeterConnect1,
  MeterConnect2, Mail, OtherUtil, WeightUtil, ReportUtil, ShellAPI,
  ManualInput, Storage, Price, InvalidDataQuery, Autoshut, DateUtils,
  ReportSys, CostSet, Math, ScanTicket, ScanReport, WeightRecord,
  MeterUtil, LoginInfo;

{$R *.dfm}

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  if MessageDlg('ȷ��Ҫ�ر������?', mtConfirmation, [mbOK, mbCancel], 0) = mrCancel then
    CanClose := False
end;

procedure TMainForm.SMMeter1Click(Sender: TObject);
begin
  if TUserUtil.HasAuthority('�Ǳ�����') then
    MeterConnect1Form.ShowModal
  else
    ShowMsg('�Բ�����û���Ǳ�����Ȩ�ޣ��޷������Ǳ����ã�')
end;

procedure TMainForm.SMCloseClick(Sender: TObject);
begin
  Close
end;

procedure TMainForm.SMSoftSetClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('ϵͳ����') then
  begin
    Application.CreateForm(TSoftwareSetForm, SoftwareSetForm);
    try
      SoftwareSetForm.ShowModal;
    finally
      SoftwareSetForm.Free;
    end
  end
  else
    ShowMsg('�Բ�����û��ϵͳ����Ȩ�ޣ��޷�����������ã�')
end;

procedure TMainForm.SMChangeClick(Sender: TObject);
begin
  SpltMain.Visible := False;
  CurrentUser := '';
  Application.CreateForm(TLoginForm, LoginForm);
  try
    LoginForm.ShowModal;
    if CurrentUser = '' then
      Application.Terminate;
    TLogUtil.AddLog(CurrentUser + '��½');
  finally
    LoginForm.Free
  end
end;

procedure TMainForm.SMPasswordClick(Sender: TObject);
begin
  Application.CreateForm(TModifyPasswordForm, ModifyPasswordForm);
  try
    ModifyPasswordForm.ShowModal;
  finally
    ModifyPasswordForm.Free
  end
end;

procedure TMainForm.SMWeightClick(Sender: TObject);
begin
  SpltMain.Visible := True;
  //���³��ؽ��� , �������߼��ȶ��ж�
  FrmWeight1.Align := alClient;
  FrmWeight1.resizeFrame;
  FrmWeight1.setSysConfig(systemConfig);
  FrmWeight1.EdtGross.ReadOnly := not TUserUtil.HasAuthority('�޸�ë��');
  FrmWeight1.EdtTare.ReadOnly := not TUserUtil.HasAuthority('�޸�Ƥ��');
  FrmWeight1.addDropdownInfo();
  FrmWeight1.startSteady(True);
  FrmWeight1.setWeightPos;
  FrmWeight1.clearInfo();
  FrmWeight1.P00SetFocus;

  TLine.Enabled := True;
  //������ؽ������Ͻǵ�ͳ����Ϣ
  GetStaticInfo();
  showGridRecord;

  DBGridEh1.OddRowColor := systemConfig.oddColor;
  DBGridEh1.EvenRowColor := systemConfig.evenColor;
end;

procedure TMainForm.SMUserClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('�û�����') then
  begin
    Application.CreateForm(TUserPurviewForm, UserPurviewForm);
    try
      UserPurviewForm.ShowModal;
    finally
      UserPurviewForm.Free
    end
  end
  else
    ShowMsg('�Բ�����û���û�����Ȩ�ޣ��޷����в���Աά����')
end;

procedure TMainForm.FormCreate(Sender: TObject);
var i: Integer;
begin
  //CheckRegistry;
  if not TDog.DogExists() then
  begin
    MessageBoxW(0, '�������ܹ���', '��ʾ', MB_OK + MB_ICONWARNING +
      MB_TOPMOST);
  end;
  if myini = nil then myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'setup.ini');
  IniPropStorageManEh1.IniFileName := ExtractFilePath(ParamStr(0)) +
    '\form.ini';
  systemConfig := TSysConfig.Create;
  poWeightSetConfig := TWeightSetConfig.Create;
  soWeightSetConfig := TWeightSetConfig.Create;
  ioWeightSetConfig := TWeightSetConfig.Create;
  ooWeightSetConfig := TWeightSetConfig.Create;
  arrPicFile := TStringList.Create;

  if not QueryDataModule.ConnectFlag then
  begin
    Application.CreateForm(TDBConnectForm, DBConnectForm);
    try
      DBConnectForm.ShowModal;
      QueryDataModule.ConnectDatabase;
      if not QueryDataModule.ConnectFlag then
      begin
        Exit;
      end;
    finally
      DBConnectForm.Free
    end
  end;

  //��ȡϵͳ��������
  loadSysConfig();
  loadFormDesign();
  //���������ļ�
  loadVoiceList();
  loadMenu;

  //�����ݿ����ʱ,��ʾ�û�����,�����ڵ���ģʽ
  if TWeightUtil.getDatabaseSpace(systemConfig.databaseInUse) >= systemConfig.databaseAlarm then
  begin
    MessageBox(0, '�������ݿ��ļ��Ѿ�������,�뼰ʱ��������', '����', MB_OK +
      MB_ICONWARNING + MB_DEFBUTTON1 + MB_TOPMOST);
  end;
  if (TWeightUtil.getRecordCount > 500) and (not TDog.DogExists) then
  begin
    Application.Terminate;
  end;
  if systemConfig.autoLogin then
  begin
    if UpperCase(TUserUtil.getPassword(systemConfig.loginName)) =
      UpperCase(TCommonUtil.md5(systemConfig.loginPass)) then
    begin
      CurrentUser := systemConfig.loginName;
    end
    else
    begin
      CurrentUser := '';
      Application.CreateForm(TLoginForm, LoginForm);
      try
        LoginForm.ShowModal;
        if CurrentUser = '' then
          Application.Terminate;
      finally
        LoginForm.Free
      end
    end;
  end
  else
  begin
    CurrentUser := '';
    Application.CreateForm(TLoginForm, LoginForm);
    try
      LoginForm.ShowModal;
      if CurrentUser = '' then
        Application.Terminate;
    finally
      LoginForm.Free
    end
  end;

  getBgFile;
  loadFormDesignFile;
  loadDBGrid(DBGridEh1);
end;

procedure TMainForm.SMDBSetClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('���ݿ�����') then
  begin
    Application.CreateForm(TDBConnectForm, DBConnectForm);
    try
      DBConnectForm.ShowModal;
    finally
      DBConnectForm.Free
    end;
  end
  else
    ShowMsg('�Բ�����û����������Ȩ�ޣ��޷��������ݿ����ã�')
end;

procedure TMainForm.SMDBBackupClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('���ݱ���') then
  begin
    if systemConfig.DatabaseInUse then
    begin
      Application.CreateForm(TDBMaintainForm, DBMaintainForm);
      try
        DBMaintainForm.ShowModal;
      finally
        DBMaintainForm.Free
      end
    end
    else
    begin
      Application.CreateForm(TSQLDBBackupForm, SQLDBBackupForm);
      try
        SQLDBBackupForm.ShowModal;
      finally
        SQLDBBackupForm.Free;
      end;
    end;
  end
  else
  begin
    if systemConfig.DatabaseInUse then //�����Access���ݿ�,���Զ�����
    begin
      Application.CreateForm(TDBBackupForm, DBBackupForm);
      try
        DBBackupForm.ShowModal;
      finally
        DBBackupForm.Free
      end
    end;
  end
end;

procedure TMainForm.SMPreMaintainClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('Ԥ��ά��') then
  begin
    Application.CreateForm(TPrepareMaintainForm, PrepareMaintainForm);
    try
      PrepareMaintainForm.toMainForm := False;
      PrepareMaintainForm.ShowModal;
    finally
      FrmWeight1.addDropdownInfo();
      PrepareMaintainForm.Free
    end
  end
  else
    ShowMsg('�Բ�����û��Ԥ��ά��Ȩ�ޣ��޷�����Ԥ��ά����')
end;

procedure TMainForm.SMDBClearClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('��������') then
  begin
    Application.CreateForm(TDBClearForm, DBClearForm);
    try
      DBClearForm.ShowModal;
    finally
      DBClearForm.Free
    end
  end
  else
    ShowMsg('�Բ�����û�����ݵ���Ȩ�ޣ��޷��������ݿ�����')
end;

procedure TMainForm.TAutoBackupTimer(Sender: TObject); //ÿСʱ����
begin
  Application.CreateForm(TDBBackupForm, DBBackupForm);
  DBBackupForm.ShowModal
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  MeterConnect1Form.CommP.Disconnect;
  MeterConnect2Form.CommP.Disconnect;

  if myini.ReadBool('system_set', 'export_XML', False) then
  begin
    case myini.ReadInteger('system_set', 'XML_type', 0) of
      0: TWeightUtil.XMLExport0();
      1: TWeightUtil.XMLExport1();
    end;
  end;
  //�����������
  if FrmWeight1.RBPurchase.Checked then
    myini.WriteInteger('system_set', 'weight_type', 0)
  else if FrmWeight1.RBSale.Checked then
    myini.WriteInteger('system_set', 'weight_type', 1)
  else if FrmWeight1.RBInner.Checked then
    myini.WriteInteger('system_set', 'weight_type', 2)
  else if FrmWeight1.RBOther.Checked then
    myini.WriteInteger('system_set', 'weight_type', 3);
  //�������ģʽ
  if FrmWeight1.RBStandard.Checked then
    myini.WriteInteger('system_set', 'weight_mode', 0)
  else if FrmWeight1.RBSimple.Checked then
    myini.WriteInteger('system_set', 'weight_mode', 1)
  else if FrmWeight1.RBOnce.Checked then
    myini.WriteInteger('system_set', 'weight_mode', 2);
  //�����Զ�����
  myini.WriteBool('system_set', 'auto_mode', FrmWeight1.CBAuto.Checked);
  //��¼��ǰ��ʾ���Ǳ���,δ��ɼ�¼��
  myini.WriteInteger('system_set', 'record_time', CBRecordTime.ItemIndex);
  myini.WriteInteger('system_set', 'record_type', CBRecordType.ItemIndex);
  myini.WriteBool('system_set', 'show_meter2', FrmWeight1.PMeter2.Visible);
  myini.WriteBool('system_set', 'previewTicket', FrmWeight1.CBPreview.Checked);

  saveMenu;
  saveDBGrid(DBGridEh1);

  FrmWeight1.TReadWeight.Enabled := False;
  FrmWeight1.startSteady(False);
  FrmWeight1.TAuto.Enabled := False;
  FrmWeight1.TWaitForZero.Enabled := False;
  FrmWeight1.TWaitForScreen.Enabled := False;

  if (systemConfig.backupType = 3) and (systemConfig.databaseInUse) then
  begin
    Application.CreateForm(TDBBackupForm, DBBackupForm);
    DBBackupForm.ShowModal
  end;

  if myini <> nil then myini.Free;
  if systemConfig <> nil then systemConfig.Free;
  if poWeightSetConfig <> nil then poWeightSetConfig.Free;
  if soWeightSetConfig <> nil then soWeightSetConfig.Free;
  if ioWeightSetConfig <> nil then ioWeightSetConfig.Free;
  if ooWeightSetConfig <> nil then ooWeightSetConfig.Free;

  if arrPicFile <> nil then arrPicFile.Free;
end;

procedure TMainForm.DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  if QueryDataModule.WeightMaintainQuery.Sort <> (Column.FieldName + ' ASC') then
    //�ж�ԭ����ʽ
    QueryDataModule.WeightMaintainQuery.Sort := Column.FieldName + ' ASC'
  else
    QueryDataModule.WeightMaintainQuery.Sort := Column.FieldName + ' DESC'
end;

procedure TMainForm.SMDataQueryClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('���ݲ�ѯ') then
  begin
    DataQueryForm.ShowModal;
  end
  else
    ShowMsg('�Բ�����û�����ݲ�ѯȨ�ޣ��޷��������ݲ�ѯ��')
end;

procedure TMainForm.SMAboutClick(Sender: TObject);
begin
  Application.CreateForm(TAboutForm, AboutForm);
  try
    AboutForm.ShowModal;
  finally
    AboutForm.Free
  end
end;

procedure TMainForm.SMComputerClick(Sender: TObject);
begin
  WinExec('calc.exe', SW_SHOW)
end;

procedure TMainForm.SMTerminateClick(Sender: TObject);
begin
  if Application.MessageBox('��ȷʵҪ�رռ������?', '����', MB_YESNO +
    MB_ICONQUESTION + MB_TOPMOST) = IDYES then
  begin
    TCommonUtil.ExitWin32Sys(EWX_POWEROFF)
  end;
end;

procedure TMainForm.SMSimulateClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('����Ա') then
  begin
    if systemConfig.disconnectToZero then
    begin
      ShowMsg('���ȹر��Ǳ���߻��㹦��');
      Exit;
    end;
    if not SMSimulate.Checked then
    begin
      SMSimulate.Checked := True;
      meter1Plus := True;
      meter2Plus := True;
      TSimulate.Enabled := True;
    end
    else
    begin
      SMSimulate.Checked := False;
      TSimulate.Enabled := False;
    end
  end
  else
    ShowMsg('�Բ��������ǹ���Ա���޷�����ģ����أ�')
end;

procedure TMainForm.SPMPrintClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('��ӡ����') then
  begin
    TReportUtil.printTicket(
      DBGridEh1.DataSource.DataSet.FieldByName('��ˮ��').AsString, True,
      systemConfig.ticketType);
  end
end;

procedure TMainForm.SPMSaveAsClick(Sender: TObject);
begin
  if not TUserUtil.HasAuthority('���ݵ���') then
    Exit;
  if TCommonUtil.exportExcel(DBGridEh1) then
    Application.MessageBox('���ݵ����ɹ�!', '����', MB_OK + MB_ICONINFORMATION
      + MB_TOPMOST);
end;

procedure TMainForm.TSimulateTimer(Sender: TObject);
begin
  if meter1Plus then
  begin
    FrmWeight1.PWeight1.Caption := FloatToStr(
      StrToFloatDef(FrmWeight1.PWeight1.Caption, 0) + Random(1000) * 10);
    if StrToFloatDef(FrmWeight1.PWeight1.Caption, 0) >= systemConfig.max then
      meter1Plus := False;
  end
  else
  begin
    FrmWeight1.PWeight1.Caption := FloatToStr(
      StrToFloatDef(FrmWeight1.PWeight1.Caption, 0) - Random(1000) * 10);
    if StrToFloatDef(FrmWeight1.PWeight1.Caption, 0) <= systemConfig.returnZero then
      meter1Plus := True;
  end;

  if FrmWeight1.PMeter2.Visible then
  begin
    if meter2Plus then
    begin
      FrmWeight1.PWeight2.Caption := FloatToStr(
        StrToFloatDef(FrmWeight1.PWeight2.Caption, 0) + Random(1000) * 10);
      if StrToFloatDef(FrmWeight1.PWeight2.Caption, 0) >= systemConfig.max then
        meter2Plus := False;
    end
    else
    begin
      FrmWeight1.PWeight2.Caption := FloatToStr(
        StrToFloatDef(FrmWeight1.PWeight2.Caption, 0) - Random(1000) * 10);
      if StrToFloatDef(FrmWeight1.PWeight2.Caption, 0) <= systemConfig.returnZero then
        meter2Plus := True;
    end;
  end;
end;

procedure TMainForm.SMReadWeightClick(Sender: TObject);
begin
  if not TUserUtil.HasAuthority('�������') then
    ShowMsg('�Բ�����û�и�Ȩ�ޣ��޷���������������ã�');
  ReadWeightForm.ShowModal;
end;

procedure TMainForm.N4Click(Sender: TObject);
begin
  if TUserUtil.HasAuthority('��ӡ����') then
  begin
    TReportUtil.printTicket(
      DBGridEh1.DataSource.DataSet.FieldByName('��ˮ��').AsString, False, systemConfig.ticketType);
  end
end;

procedure TMainForm.ShowMsg(Msg: string);
begin
  msnpopup1.Title := '��ʾ';
  MSNPopUp1.Text := Msg;
  MSNPopUp1.TimeOut := 3;
  MSNPopUp1.ShowPopUp;
end;

procedure TMainForm.SetCurrentUser(const Value: string);
begin
  FCurrentUser := Value;
  SpUser.Caption := Format('��ǰ�û�: %s', [Value]);
end;

procedure TMainForm.SMSysLogClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('ϵͳ��־') then
  begin
    Application.CreateForm(TLogForm, LogForm);
    try
      LogForm.ShowModal;
    finally
      LogForm.Free;
    end;
  end
  else
  begin
    ShowMsg('�Բ�����û����־��ѯȨ�ޣ��޷���ѯ��־��')
  end;
end;

procedure TMainForm.SMBackRecordClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('��̨��¼') then
  begin
    Application.CreateForm(TBackRecordForm, BackRecordForm);
    try
      BackRecordForm.ShowModal;
    finally
      BackRecordForm.Free;
    end;
  end
  else
  begin
    ShowMsg('�Բ�����û�к�̨��¼��ѯȨ�ޣ��޷���ѯ��̨��¼��')
  end;
end;

procedure TMainForm.SMTicketSetClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('ϵͳ����') then
  begin
    Application.CreateForm(TTicketSetForm, TicketSetForm);
    try
      TicketSetForm.ShowModal();
    finally
      TicketSetForm.Free;
    end;
  end
  else
    ShowMsg('�Բ�����û�а����޸�Ȩ�ޣ��޷����а����޸ģ�')
end;

procedure TMainForm.GetStaticInfo;
var count, todayCount: integer;
  todayNet, todayReal: Double;
begin
  TWeightUtil.getStaticInfo(count, todayCount, todayNet, todayReal);
  FrmWeight1.MSTotalMsg.Caption := Format('ȫ����¼: %s ��; ���ռ�¼: %s ��; ���վ���: %s',
    [IntToStr(count), IntToStr(todayCount), FloatToStr(todayNet)]);
end;

procedure TMainForm.setAutoBackup(t: boolean);
begin
  TAutoBackup.Enabled := t;
end;

procedure TMainForm.SMModifyClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('�޸İ���') then
  begin
    if systemConfig.ticketType = 1 then
    begin
      if FrmWeight1.RBPurchase.Checked then
        TReportUtil.designTicket(ExtractFilePath(ParamStr(0)) + systemConfig.poTicketFormat, 1)
      else if FrmWeight1.RBSale.Checked then
        TReportUtil.designTicket(ExtractFilePath(ParamStr(0)) + systemConfig.soTicketFormat, 1)
      else if FrmWeight1.RBInner.Checked then
        TReportUtil.designTicket(ExtractFilePath(ParamStr(0)) + systemConfig.ioTicketFormat, 1)
      else if FrmWeight1.RBOther.Checked then
        TReportUtil.designTicket(ExtractFilePath(ParamStr(0)) + systemConfig.ooTicketFormat, 1)
    end
    else if systemConfig.ticketType = 2 then
    begin
      if FrmWeight1.RBPurchase.Checked then
        TReportUtil.designTicket(ExtractFilePath(ParamStr(0)) + systemConfig.poTicketFormat2, 2)
      else if FrmWeight1.RBSale.Checked then
        TReportUtil.designTicket(ExtractFilePath(ParamStr(0)) + systemConfig.soTicketFormat2, 2)
      else if FrmWeight1.RBInner.Checked then
        TReportUtil.designTicket(ExtractFilePath(ParamStr(0)) + systemConfig.ioTicketFormat2, 2)
      else if FrmWeight1.RBOther.Checked then
        TReportUtil.designTicket(ExtractFilePath(ParamStr(0)) + systemConfig.ooTicketFormat2, 2)
    end;
  end;
end;

procedure TMainForm.CheckRegistry;
begin
  //ע����е�ע�����뵱ǰ�������һ��
  if GetRegistryCode() <> RegisterCode(GetNewEncodeKey) then
  begin
    Application.CreateForm(TRegCodeForm, RegCodeForm);
    try
      RegCodeForm.ShowModal;
    finally
      RegCodeForm.Free;
    end
  end
end;

function TMainForm.GetRegistryCode: string;
var Reg: TRegistry;
begin
  reg := TRegistry.Create;
  try
    reg.RootKey := HKEY_CURRENT_USER;
    if reg.OpenKey('\Software\Weight', True) then
    begin
      if reg.ValueExists('RegistryCode') then
        Result := reg.ReadString('RegistryCode')
      else
        Result := '';
    end;
  finally
    reg.Free;
  end;
end;

procedure TMainForm.SMScreenClick(Sender: TObject);
begin
  if not TUserUtil.HasAuthority('����Ļ����') then
    ShowMsg('�Բ�����û�и�Ȩ�ޣ��޷����д���Ļ���ã�');
  ComOutputForm.ShowModal();
end;

procedure TMainForm.loadFormDesign;
begin
  with FrmWeight1 do
  begin
    lblCar.Caption := poWeightSetConfig.carCaption;
    lblFaHuo.Caption := poWeightSetConfig.faHuoCaption;
    lblShouHuo.Caption := poWeightSetConfig.shouHuoCaption;
    lblGoods.Caption := poWeightSetConfig.goodsCaption;
    lblSpec.Caption := poWeightSetConfig.specCaption;
    lblGross.Caption := poWeightSetConfig.grossCaption;
    lblTare.Caption := poWeightSetConfig.tareCaption;
    lblNet.Caption := poWeightSetConfig.netCaption;
    lblBundle.Caption := poWeightSetConfig.bundleCaption;
    lblReal.Caption := poWeightSetConfig.realCaption;
    lblPrice.Caption := poWeightSetConfig.priceCaption;
    lblSum.Caption := poWeightSetConfig.sumCaption;
    lblScale.Caption := poWeightSetConfig.scaleCaption;
    lblQuanter.Caption := poWeightSetConfig.quanterCaption;
    lblCost.Caption := poWeightSetConfig.costCaption;
    lblMemo.Caption := poWeightSetConfig.memoCaption;
    lblbackup1.Caption := poWeightSetConfig.backup1Caption;
    lblbackup2.Caption := poWeightSetConfig.backup2Caption;
    lblbackup3.Caption := poWeightSetConfig.backup3Caption;
    lblbackup4.Caption := poWeightSetConfig.backup4Caption;
    lblbackup5.Caption := poWeightSetConfig.backup5Caption;
    lblbackup6.Caption := poWeightSetConfig.backup6Caption;
    lblbackup7.Caption := poWeightSetConfig.backup7Caption;
    lblbackup8.Caption := poWeightSetConfig.backup8Caption;
    lblbackup9.Caption := poWeightSetConfig.backup9Caption;
    lblbackup10.Caption := poWeightSetConfig.backup10Caption;
    lblbackup11.Caption := poWeightSetConfig.backup11Caption;
    lblbackup12.Caption := poWeightSetConfig.backup12Caption;
    lblbackup13.Caption := poWeightSetConfig.backup13Caption;
    lblbackup14.Caption := poWeightSetConfig.backup14Caption;
    lblbackup15.Caption := poWeightSetConfig.backup15Caption;
    lblbackup16.Caption := poWeightSetConfig.backup16Caption;
    lblbackup17.Caption := poWeightSetConfig.backup17Caption;
    lblbackup18.Caption := poWeightSetConfig.backup18Caption;
  end;

  DBGridEh1.FieldColumns['���'].Title.Caption := poWeightSetConfig.noCaption;
  DBGridEh1.FieldColumns['��ˮ��'].Title.Caption := poWeightSetConfig.glideNoCaption;
  DBGridEh1.FieldColumns['����'].Title.Caption := poWeightSetConfig.carCaption;
  DBGridEh1.FieldColumns['��������'].Title.Caption := poWeightSetConfig.weightTypeCaption;
  DBGridEh1.FieldColumns['������λ'].Title.Caption := poWeightSetConfig.faHuoCaption;
  DBGridEh1.FieldColumns['�ջ���λ'].Title.Caption := poWeightSetConfig.shouHuoCaption;
  DBGridEh1.FieldColumns['����'].Title.Caption := poWeightSetConfig.goodsCaption;
  DBGridEh1.FieldColumns['���'].Title.Caption := poWeightSetConfig.specCaption;
  DBGridEh1.FieldColumns['ë��'].Title.Caption := poWeightSetConfig.grossCaption;
  DBGridEh1.FieldColumns['Ƥ��'].Title.Caption := poWeightSetConfig.tareCaption;
  DBGridEh1.FieldColumns['����'].Title.Caption := poWeightSetConfig.netCaption;
  DBGridEh1.FieldColumns['����'].Title.Caption := poWeightSetConfig.bundleCaption;
  DBGridEh1.FieldColumns['ʵ��'].Title.Caption := poWeightSetConfig.realCaption;
  DBGridEh1.FieldColumns['����'].Title.Caption := poWeightSetConfig.priceCaption;
  DBGridEh1.FieldColumns['���'].Title.Caption := poWeightSetConfig.sumCaption;
  DBGridEh1.FieldColumns['�۷�ϵ��'].Title.Caption := poWeightSetConfig.scaleCaption;
  DBGridEh1.FieldColumns['����'].Title.Caption := poWeightSetConfig.quanterCaption;
  DBGridEh1.FieldColumns['������'].Title.Caption := poWeightSetConfig.costCaption;
  DBGridEh1.FieldColumns['ë��˾��Ա'].Title.Caption := poWeightSetConfig.grossManCaption;
  DBGridEh1.FieldColumns['Ƥ��˾��Ա'].Title.Caption := poWeightSetConfig.tareManCaption;
  DBGridEh1.FieldColumns['ë�ذ���'].Title.Caption := poWeightSetConfig.grossAddrCaption;
  DBGridEh1.FieldColumns['Ƥ�ذ���'].Title.Caption := poWeightSetConfig.tareAddrCaption;
  DBGridEh1.FieldColumns['ë��ʱ��'].Title.Caption := poWeightSetConfig.grossTimeCaption;
  DBGridEh1.FieldColumns['Ƥ��ʱ��'].Title.Caption := poWeightSetConfig.tareTimeCaption;
  DBGridEh1.FieldColumns['һ�ι���ʱ��'].Title.Caption := poWeightSetConfig.firstTimeCaption;
  DBGridEh1.FieldColumns['���ι���ʱ��'].Title.Caption := poWeightSetConfig.secondTimeCaption;
  DBGridEh1.FieldColumns['������'].Title.Caption := poWeightSetConfig.updateUserCaption;
  DBGridEh1.FieldColumns['����ʱ��'].Title.Caption := poWeightSetConfig.updateTimeCaption;
  DBGridEh1.FieldColumns['��ע'].Title.Caption := poWeightSetConfig.memoCaption;
  DBGridEh1.FieldColumns['��ӡ����'].Title.Caption := poWeightSetConfig.printCountCaption;
  DBGridEh1.FieldColumns['�ϴ���'].Title.Caption := poWeightSetConfig.uploadCaption;
  DBGridEh1.FieldColumns['����1'].Title.Caption := poWeightSetConfig.backup1Caption;
  DBGridEh1.FieldColumns['����2'].Title.Caption := poWeightSetConfig.backup2Caption;
  DBGridEh1.FieldColumns['����3'].Title.Caption := poWeightSetConfig.backup3Caption;
  DBGridEh1.FieldColumns['����4'].Title.Caption := poWeightSetConfig.backup4Caption;
  DBGridEh1.FieldColumns['����5'].Title.Caption := poWeightSetConfig.backup5Caption;
  DBGridEh1.FieldColumns['����6'].Title.Caption := poWeightSetConfig.backup6Caption;
  DBGridEh1.FieldColumns['����7'].Title.Caption := poWeightSetConfig.backup7Caption;
  DBGridEh1.FieldColumns['����8'].Title.Caption := poWeightSetConfig.backup8Caption;
  DBGridEh1.FieldColumns['����9'].Title.Caption := poWeightSetConfig.backup9Caption;
  DBGridEh1.FieldColumns['����10'].Title.Caption := poWeightSetConfig.backup10Caption;
  DBGridEh1.FieldColumns['����11'].Title.Caption := poWeightSetConfig.backup11Caption;
  DBGridEh1.FieldColumns['����12'].Title.Caption := poWeightSetConfig.backup12Caption;
  DBGridEh1.FieldColumns['����13'].Title.Caption := poWeightSetConfig.backup13Caption;
  DBGridEh1.FieldColumns['����14'].Title.Caption := poWeightSetConfig.backup14Caption;
  DBGridEh1.FieldColumns['����15'].Title.Caption := poWeightSetConfig.backup15Caption;
  DBGridEh1.FieldColumns['����16'].Title.Caption := poWeightSetConfig.backup16Caption;
  DBGridEh1.FieldColumns['����17'].Title.Caption := poWeightSetConfig.backup17Caption;
  DBGridEh1.FieldColumns['����18'].Title.Caption := poWeightSetConfig.backup18Caption;

end;

procedure TMainForm.SMMeter2Click(Sender: TObject);
begin
  if TUserUtil.HasAuthority('�Ǳ�����') then
    MeterConnect2Form.ShowModal
  else
    ShowMsg('�Բ�����û���Ǳ�����Ȩ�ޣ��޷������Ǳ����ã�')
end;

procedure TMainForm.SMDBInitClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('���ݳ�ʼ��') then
  begin
    Application.CreateForm(TInitializeOptionForm, InitializeOptionForm);
    try
      InitializeOptionForm.ShowModal();
    finally
      InitializeOptionForm.Free;
    end;
  end
  else
  begin
    ShowMsg('�Բ�����û�����ݿ�Ȩ�ޣ��޷��������ݿ��ʼ��������')
  end;
  showGridRecord;
end;

function TMainForm.showGridRecord: string;
begin
  if systemConfig.useExceed then
    TWeightUtil.moveExceedRecord;

  try
    case CBRecordTime.ItemIndex of
      0:
        TWeightUtil.showHistoryRecord(CBRecordType.ItemIndex);
      1:
        TWeightUtil.showTodayRecord(CBRecordType.ItemIndex);
      2:
        TWeightUtil.showToWeekRecord(CBRecordType.ItemIndex);
      3:
        TWeightUtil.showToMonthRecord(CBRecordType.ItemIndex);
      4:
        TWeightUtil.showToSeasonRecord(CBRecordType.ItemIndex);
      5:
        TWeightUtil.showToYearRecord(CBRecordType.ItemIndex);
    else
      TWeightUtil.showHistoryRecord(CBRecordType.ItemIndex);
    end;
  except
    ShowMsg('���ݿ��޷��򿪣�����!');
  end;

  Repaint
end;

procedure TMainForm.CBRecordTypeChange(Sender: TObject);
begin
  showGridRecord;
end;

procedure TMainForm.loadSysConfig;
var i: Integer;
begin
  //�ȵ�������
  TSysConfigUtil.loadConfig(systemConfig, poWeightSetConfig, soWeightSetConfig,
    ioWeightSetConfig, ooWeightSetConfig);

  setAutoBackup(systemConfig.backupType = 2);
  if FileExists(ExtractFilePath(ParamStr(0)) + 'bg.jpg') then
    ImgBack.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'bg.jpg');

  if FileExists(ExtractFilePath(ParamStr(0)) + '\ico\exit.bmp') then
    TBExit.Glyph.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\ico\exit.bmp');
  if FileExists(ExtractFilePath(ParamStr(0)) + '\ico\logout.bmp') then
    TBChange.Glyph.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\ico\logout.bmp');
  if FileExists(ExtractFilePath(ParamStr(0)) + '\ico\weight.bmp') then
    TBWeight.Glyph.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\ico\weight.bmp');
  if FileExists(ExtractFilePath(ParamStr(0)) + '\ico\query.bmp') then
    TBQuery.Glyph.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\ico\query.bmp');
  if FileExists(ExtractFilePath(ParamStr(0)) + '\ico\ticket.bmp') then
    TBTicket.Glyph.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\ico\ticket.bmp');
  if FileExists(ExtractFilePath(ParamStr(0)) + '\ico\video.bmp') then
    TBVideo.Glyph.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\ico\video.bmp');
  if FileExists(ExtractFilePath(ParamStr(0)) + '\ico\calc.bmp') then
    TBCalc.Glyph.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\ico\calc.bmp');
  if FileExists(ExtractFilePath(ParamStr(0)) + '\ico\double.bmp') then
    TBDouble.Glyph.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\ico\double.bmp');
  if FileExists(ExtractFilePath(ParamStr(0)) + '\ico\net.bmp') then
    TBNet.Glyph.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\ico\net.bmp');
  if FileExists(ExtractFilePath(ParamStr(0)) + '\ico\voice.bmp') then
    TBVoice.Glyph.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\ico\voice.bmp');
  if FileExists(ExtractFilePath(ParamStr(0)) + '\ico\phone.bmp') then
    TBPhone.Glyph.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\ico\phone.bmp');
  if FileExists(ExtractFilePath(ParamStr(0)) + '\ico\gross.bmp') then
    FrmWeight1.BitBtnGross.Glyph.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\ico\gross.bmp');
  if FileExists(ExtractFilePath(ParamStr(0)) + '\ico\tare.bmp') then
    FrmWeight1.BitBtnTare.Glyph.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\ico\tare.bmp');
  if FileExists(ExtractFilePath(ParamStr(0)) + '\ico\save.bmp') then
    FrmWeight1.BitBtnSave.Glyph.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\ico\save.bmp');
  if FileExists(ExtractFilePath(ParamStr(0)) + '\ico\print.bmp') then
    FrmWeight1.BitBtnPrint.Glyph.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\ico\print.bmp');
  if FileExists(ExtractFilePath(ParamStr(0)) + '\ico\setTare.bmp') then
    FrmWeight1.BtnSetTare.Glyph.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\ico\setTare.bmp');
  if FileExists(ExtractFilePath(ParamStr(0)) + '\ico\clear.bmp') then
    FrmWeight1.BitBtnClear.Glyph.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\ico\clear.bmp');
  if FileExists(ExtractFilePath(ParamStr(0)) + '\ico\weight.bmp') then
    FrmWeight1.BtnWeight.Glyph.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\ico\weight.bmp');
  if FileExists(ExtractFilePath(ParamStr(0)) + '\ico\save.bmp') then
    FrmWeight1.BtnSave.Glyph.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\ico\save.bmp');
  if FileExists(ExtractFilePath(ParamStr(0)) + '\ico\print.bmp') then
    FrmWeight1.BtnPrint.Glyph.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\ico\print.bmp');
  if FileExists(ExtractFilePath(ParamStr(0)) + '\ico\clear.bmp') then
    FrmWeight1.BtnCancel.Glyph.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\ico\clear.bmp');


  TBackRecord.Enabled := systemConfig.useBackRecord;
  canAutoSave1 := True;
  canAutoSave2 := True;

  FrmWeight1.saved := False;
  //��¼��ǰ��ʾ���Ǳ���,δ��ɼ�¼��
  CBRecordTime.ItemIndex := systemConfig.recordTime;
  CBRecordType.ItemIndex := systemConfig.recordType;
  if systemConfig.showMeter2 then FrmWeight1.showMeter2();
  if systemConfig.deleteHistory then TWeightUtil.DelHistory();
  TWeightUtil.checkPicCount(systemConfig.picCount);

  case systemConfig.weightType of
    0: FrmWeight1.RBPurchase.Checked := True;
    1: FrmWeight1.RBSale.Checked := True;
    2: FrmWeight1.RBInner.Checked := True;
    3: FrmWeight1.RBOther.Checked := True;
  end;
  FrmWeight1.RBStandard.Enabled := systemConfig.useStandard;
  FrmWeight1.RBSimple.Enabled := systemConfig.useSimple;
  FrmWeight1.RBOnce.Enabled := systemConfig.useOnce;
  FrmWeight1.CBAuto.Checked := systemConfig.autoMode;
  FrmWeight1.setAutoState();

  case systemConfig.weightMode of
    0: FrmWeight1.RBStandard.Checked := True;
    1: FrmWeight1.RBSimple.Checked := True;
    2: FrmWeight1.RBOnce.Checked := True;
  end;
  FrmWeight1.CBPreview.Checked := systemConfig.previewTicket;

  FrmWeight1.EdtBackup6.ReadOnly := poWeightSetConfig.useExpression6;
  FrmWeight1.EdtBackup7.ReadOnly := poWeightSetConfig.useExpression7;
  FrmWeight1.EdtBackup8.ReadOnly := poWeightSetConfig.useExpression8;
  FrmWeight1.EdtBackup9.ReadOnly := poWeightSetConfig.useExpression9;
  FrmWeight1.EdtBackup15.ReadOnly := poWeightSetConfig.useExpression15;
  FrmWeight1.EdtBackup16.ReadOnly := poWeightSetConfig.useExpression16;
  FrmWeight1.EdtBackup17.ReadOnly := poWeightSetConfig.useExpression17;
  FrmWeight1.EdtBackup18.ReadOnly := poWeightSetConfig.useExpression18;

  FrmWeight1.EdtPrice.ReadOnly := not systemConfig.allowModifyPrice;
  FrmWeight1.EdtScale.ReadOnly := not systemConfig.allowModifyPrice;
  FrmWeight1.EdtCost.Enabled := systemConfig.manualInputPound;

  FrmWeight1.MSTotalMsg.Visible := systemConfig.showTotal;

  Application.Title := '���ع���ϵͳ';
  Caption := systemConfig.mainTitle; //'���ع���ϵͳ';

  setCompanyInfo();
  if systemConfig.databaseInUse then
    SpMode.Caption := '[����ģʽ]'
  else
    SpMode.Caption := '[����ģʽ]';
  //��������
  cheat1.ShortCut := systemConfig.cheat1ShortCut;
  cheat2.ShortCut := systemConfig.cheat2ShortCut;
  cheat3.ShortCut := systemConfig.cheat3ShortCut;
  cheat4.ShortCut := systemConfig.cheat4ShortCut;
  cheat5.ShortCut := systemConfig.cheat5ShortCut;
  cheat6.ShortCut := systemConfig.cheat6ShortCut;
  cheat7.ShortCut := systemConfig.cheat7ShortCut;
  cheat8.ShortCut := systemConfig.cheat8ShortCut;
  cheatClose.ShortCut := systemConfig.cheatCloseShortCut;

  setSkin(systemConfig.skinFile);
  setVoiceRate(systemConfig.voiceRate);
  TAutoRefresh.Interval := systemConfig.autoRefreshInterval * 1000;
  TAutoRefresh.Enabled := systemConfig.autoRefresh;

end;

procedure TMainForm.cheat1Execute(Sender: TObject);
begin
  systemConfig.cweightFlag1 := not systemConfig.cweightFlag1;
  systemConfig.cweightFlag2 := False;
  systemConfig.cweightFlag3 := False;
  systemConfig.cweightFlag4 := False;
  systemConfig.cweightFlag5 := False;
  systemConfig.cweightFlag6 := False;
  systemConfig.cweightFlag7 := False;
  systemConfig.cweightFlag8 := False;
  setExportWeightCheat();
end;

procedure TMainForm.cheat2Execute(Sender: TObject);
begin
  systemConfig.cweightFlag1 := False;
  systemConfig.cweightFlag2 := not systemConfig.cweightFlag2;
  systemConfig.cweightFlag3 := False;
  systemConfig.cweightFlag4 := False;
  systemConfig.cweightFlag5 := False;
  systemConfig.cweightFlag6 := False;
  systemConfig.cweightFlag7 := False;
  systemConfig.cweightFlag8 := False;
  setExportWeightCheat();
end;

procedure TMainForm.cheat3Execute(Sender: TObject);
begin
  systemConfig.cweightFlag1 := False;
  systemConfig.cweightFlag2 := False;
  systemConfig.cweightFlag3 := not systemConfig.cweightFlag3;
  systemConfig.cweightFlag4 := False;
  systemConfig.cweightFlag5 := False;
  systemConfig.cweightFlag6 := False;
  systemConfig.cweightFlag7 := False;
  systemConfig.cweightFlag8 := False;
  setExportWeightCheat();
end;

procedure TMainForm.cheat4Execute(Sender: TObject);
begin
  systemConfig.cweightFlag1 := False;
  systemConfig.cweightFlag2 := False;
  systemConfig.cweightFlag3 := False;
  systemConfig.cweightFlag4 := not systemConfig.cweightFlag4;
  systemConfig.cweightFlag5 := False;
  systemConfig.cweightFlag6 := False;
  systemConfig.cweightFlag7 := False;
  systemConfig.cweightFlag8 := False;
  setExportWeightCheat();
end;

procedure TMainForm.ASetCheatExecute(Sender: TObject);
begin
  if TUserUtil.HasAuthority('ϵͳ����') and SMSimulate.Checked then
  begin
    Application.CreateForm(TCorrectForm, CorrectForm);
    try
      CorrectForm.ShowModal();
    finally
      CorrectForm.Free;
    end;
  end;
end;

procedure TMainForm.DBGridEh1DblClick(Sender: TObject);
begin
  with DBGridEh1.DataSource.DataSet do
  begin
    //ֻ������δ��ɼ�¼
    if systemConfig.onlyShowNotFinishedRecord then
    begin
      if StrToFloatDef(FieldByName('����').AsString, 0) <> 0 then
        Exit;
    end;
    FrmWeight1.lastGlideNo := '';

    FrmWeight1.CBCar.Text := FieldByName('����').AsString;
    FrmWeight1.CBFaHuo.Text := FieldByName('������λ').AsString;
    FrmWeight1.CBShouHuo.Text := FieldByName('�ջ���λ').AsString;
    FrmWeight1.CBGoods.Text := FieldByName('����').AsString;
    FrmWeight1.CBSpec.Text := FieldByName('���').AsString;
    {
    if StrToFloatDef(FieldByName('����').AsString, 0) = 0 then
    begin
      FrmWeight1.EdtGross.Text := FieldByName('ë��').AsString;
      FrmWeight1.EdtTare.Text := FieldByName('Ƥ��').AsString;
      FrmWeight1.lastGlideNo := FieldByName('��ˮ��').AsString;
    end;
    }
    FrmWeight1.EdtCost.Text := FieldByName('������').AsString;
    FrmWeight1.EdtQuanter.Text := FieldByName('����').AsString;

    FrmWeight1.EdtBundle.Text := FieldByName('����').AsString;
    FrmWeight1.EdtPrice.Text := FieldByName('����').AsString;
    FrmWeight1.EdtScale.Text := FieldByName('�۷�ϵ��').AsString;
    FrmWeight1.EdtMemo.Text := FieldByName('��ע').AsString;
    FrmWeight1.CBBackup1.Text := FieldByName('����1').AsString;
    FrmWeight1.CBBackup2.Text := FieldByName('����2').AsString;
    FrmWeight1.CBBackup3.Text := FieldByName('����3').AsString;
    FrmWeight1.CBBackup4.Text := FieldByName('����4').AsString;
    FrmWeight1.CBBackup5.Text := FieldByName('����5').AsString;
    FrmWeight1.EdtBackup6.Text := FieldByName('����6').AsString;
    FrmWeight1.EdtBackup7.Text := FieldByName('����7').AsString;
    FrmWeight1.EdtBackup8.Text := FieldByName('����8').AsString;
    FrmWeight1.EdtBackup9.Text := FieldByName('����9').AsString;
    FrmWeight1.CBBackup10.Text := FieldByName('����10').AsString;
    FrmWeight1.CBBackup11.Text := FieldByName('����11').AsString;
    FrmWeight1.CBBackup12.Text := FieldByName('����12').AsString;
    FrmWeight1.CBBackup13.Text := FieldByName('����13').AsString;
    FrmWeight1.CBBackup14.Text := FieldByName('����14').AsString;
    FrmWeight1.EdtBackup15.Text := FieldByName('����15').AsString;
    FrmWeight1.EdtBackup16.Text := FieldByName('����16').AsString;
    FrmWeight1.EdtBackup17.Text := FieldByName('����17').AsString;
    FrmWeight1.EdtBackup18.Text := FieldByName('����18').AsString;

    if systemConfig.doubleClickModifyRecord then
    begin
      Application.CreateForm(TManualInputForm, ManualInputForm);
      try
        ManualInputForm.glideNo :=
          FieldByName('��ˮ��').AsString;
        ManualInputForm.insertOrUpdate := False;
        ManualInputForm.ShowModal;
      finally
        ManualInputForm.Free;
        showGridRecord;
      end;
    end;
  end;
end;

procedure TMainForm.SMTareTrendClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('���ݲ�ѯ') then
  begin
    Application.CreateForm(TTareChartForm, TareChartForm);
    try
      TareChartForm.ShowModal;
    finally
      TareChartForm.Free;
    end;
  end
  else
  begin
    ShowMsg('�Բ�����û�����ݲ�ѯȨ�ޣ��޷��鿴Ƥ������ͼ��')
  end;
end;

procedure TMainForm.SMDesignClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('��������') then
  begin
    Application.CreateForm(TWeightSetForm, WeightSetForm);
    try
      WeightSetForm.ShowModal;
    finally
      WeightSetForm.Free;
    end
  end
  else
    ShowMsg('�Բ�����û��ϵͳ����Ȩ�ޣ��޷����г��ؽ������ã�');
end;

procedure TMainForm.TBExitClick(Sender: TObject);
begin
  SpltMain.Visible := False;
end;

procedure TMainForm.TBChangeClick(Sender: TObject);
begin
  SMChange.Click
end;

procedure TMainForm.TBWeightClick(Sender: TObject);
begin
  SMWeight.Click
end;

procedure TMainForm.TBQueryClick(Sender: TObject);
begin
  SMDataQuery.Click
end;

procedure TMainForm.TBCalcClick(Sender: TObject);
begin
  SMComputer.Click
end;

procedure TMainForm.TBTicketClick(Sender: TObject);
begin
  SMTicketSet.Click;
end;

procedure TMainForm.TBVideoClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('��Ƶ����') then
  begin
    if VideoForm.Visible then VideoForm.Close
    else VideoForm.Show;
  end
  else
  begin
    ShowMsg('�Բ�������Ȩ�鿴��Ƶ��')
  end;
end;

procedure TMainForm.SMVideoClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('��Ƶ����') then
    VideoSetForm.ShowModal
  else
    ShowMsg('�Բ�����û����Ƶ����Ȩ�ޣ��޷�������Ƶ���ã�')
end;

procedure TMainForm.loadVoiceList;
var sl: TStrings;
  t: TMenuItem;
  i: Integer;
begin
  sl := TStringList.Create;
  try
    if not FileExists(ExtractFilePath(ParamStr(0)) + 'VoiceList.txt') then
    begin
      sl.Add('������ϣ����뿪��̨��');
      sl.Add('��Ϩ���³���');
      sl.Add('��ͣ����̨�м䣡');
      sl.Add('ף��һ·ƽ����');
      sl.Add('���ϳ�');
      sl.SaveToFile(ExtractFilePath(ParamStr(0)) + 'VoiceList.txt');
    end;
    sl.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'VoiceList.txt');
    PMVoice.Items.Clear;
    PMVoice.AutoHotkeys := maManual;
    for i := 0 to sl.Count - 1 do
    begin
      t := TMenuItem.Create(PMVoice);
      t.AutoHotkeys := maManual;
      t.Caption := sl.Strings[i];
      t.OnClick := pmVoiceClick;
      PMVoice.Items.Add(t);
    end;
  finally
    sl.Free;
  end;
end;

procedure TMainForm.pmVoiceClick(Sender: TObject);
begin
  try
    SpVoice1.Speak('', SVSFPurgeBeforeSpeak);
    SpVoice1.Speak((Sender as TMenuItem).Caption, SVSFlagsAsync);
  except
  end;
end;

procedure TMainForm.CBRecordTimeChange(Sender: TObject);
begin
  showGridRecord;
end;

procedure TMainForm.SMChargeClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('Ԥ��ά��') then
  begin
    Application.CreateForm(TPayForm, PayForm);
    try
      PayForm.ShowModal;
    finally
      PayForm.Free
    end
  end
  else
    ShowMsg('�Բ�����û��Ԥ��ά��Ȩ�ޣ��޷����г�ֵ������')
end;

procedure TMainForm.SMChargeHistoryClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('Ԥ��ά��') then
  begin
    Application.CreateForm(TPayHistoryForm, PayHistoryForm);
    try
      PayHistoryForm.ShowModal;
    finally
      PayHistoryForm.Free
    end
  end
  else
    ShowMsg('�Բ�����û��Ԥ��ά��Ȩ�ޣ��޷���ѯ��ֵ��ʷ��')
end;

procedure TMainForm.SMTaoQueryClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('Ԥ��ά��') then
  begin
    Application.CreateForm(TTaoForm, TaoForm);
    try
      TaoForm.ShowModal;
    finally
      TaoForm.Free;
    end;
  end
  else
  begin
    ShowMsg('�Բ�����û���ױ�ά��Ȩ�ޣ��޷������ױ�ά����');
  end;
end;

procedure TMainForm.RzToolbar1DblClick(Sender: TObject);
begin
  RzToolbar1.Customize();
end;

procedure TMainForm.AVideoExecute(Sender: TObject);
begin
  if VideoForm.Visible then VideoForm.Close
  else VideoForm.Show;
end;

procedure TMainForm.SMSkinClick(Sender: TObject);
begin
  Application.CreateForm(TSkinChangeForm, SkinChangeForm);
  try
    SkinChangeForm.ShowModal;
  finally
    SkinChangeForm.Free;
  end;
end;

function TMainForm.setSkin(skinFile: string): Boolean;
begin
  if skinFile = '' then
  begin
    SkinData1.Active := False;
  end
  else
  begin
    if FileExists(ExtractFilePath(ParamStr(0)) + '\Skin\' + skinFile + '.skn') then
    begin
      SkinData1.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\Skin\' + skinFile + '.skn');
      SkinData1.Active := True;
    end;
  end;
end;

function TMainForm.resizeMain: Boolean;
begin
  FrmWeight1.Align := alClient;
  FrmWeight1.Width := PWeight.Width;
  FrmWeight1.resizeWidth;
  FrmWeight1.setWeightPos;
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  resizeMain;
end;

procedure TMainForm.TLineTimer(Sender: TObject);
begin
  if systemConfig.useWeightLine then
  begin
    TDrawLine1.draw(FrmWeight1.PWeight1);
    TDrawLine2.draw(FrmWeight1.PWeight2);
  end;
end;

procedure TMainForm.SMDBMigrateClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('���ݿ�����') then
  begin
    Application.CreateForm(TDataMigrateForm, DataMigrateForm);
    try
      DataMigrateForm.ShowModal;
    finally
      DataMigrateForm.Free
    end;
  end
  else
    ShowMsg('�Բ�����û�и�Ȩ�ޣ��޷��������ݿ�Ǩ�ƣ�')
end;

procedure TMainForm.TBackRecordTimer(Sender: TObject);
begin
  //��̨�Զ���������
  if canAutoSave1 then
  begin
    if (StrToFloatDef(FrmWeight1.PWeight1.Caption, 1000) > systemConfig.backRecordWeight)
      and (FrmWeight1.getSteady) then
    begin
      TWeightUtil.saveBackRecord(FrmWeight1.PWeight1.Caption);
      canAutoSave1 := False;
    end;
  end
  else
  begin
    if StrToFloatDef(FrmWeight1.PWeight1.Caption, 1000) < systemConfig.ReturnZero then
      canAutoSave1 := True;
  end;

  if canAutoSave2 then
  begin
    if (StrToFloatDef(FrmWeight1.PWeight2.Caption, 1000) > systemConfig.backRecordWeight)
      and (FrmWeight1.getSteady) then
    begin
      TWeightUtil.saveBackRecord(FrmWeight1.PWeight2.Caption);
      canAutoSave2 := False;
    end;
  end
  else
  begin
    if StrToFloatDef(FrmWeight1.PWeight2.Caption, 1000) < systemConfig.ReturnZero then
      canAutoSave2 := True;
  end;
end;

procedure TMainForm.SMStaticTrendClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('���ݲ�ѯ') then
  begin
    Application.CreateForm(TStaticChartForm, StaticChartForm);
    try
      StaticChartForm.ShowModal;
    finally
      StaticChartForm.Free;
    end;
  end
  else
  begin
    ShowMsg('�Բ�����û�����ݲ�ѯȨ�ޣ��޷��鿴ͳ�����ݣ�')
  end;
end;

procedure TMainForm.SMBackGroundClick(Sender: TObject);
var od: TOpenPictureDialog;
begin
  od := TOpenPictureDialog.Create(nil);
  try
    od.DefaultExt := 'jpg';
    od.FileName := '';
    od.Filter := '����ͼƬ(*.jpg)|*.jpg';
    od.InitialDir := ExtractFilePath(ParamStr(0)) + 'BackGround';
    if od.Execute then
    begin
      setBackGround(od.FileName);
    end;
  finally
    od.Free;
  end;
end;

function TMainForm.setBackGround(s: string): Boolean;
begin
  if FileExists(s) then
  begin
    CopyFile(PChar(s), PChar(ExtractFilePath(ParamStr(0)) + '\bg.jpg'), False);
    ImgBack.Picture.LoadFromFile(s);
  end;
end;

function TMainForm.setVoiceRate(r: Integer): Boolean;
begin
  if (r >= -10) and (r <= 10) then
  begin
    try
      SpVoice1.Rate := r;
      SpVoice1.Volume
    except
    end;
  end;
end;

procedure TMainForm.TBDoubleClick(Sender: TObject);
begin
  FrmWeight1.showMeter2();
  FrmWeight1.setWeightPos;
end;

procedure TMainForm.SMMailClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('���ݵ���') then
  begin
    MailForm.ShowModal();
  end;
end;

procedure TMainForm.TBNetClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('���ݿ�����') then
  begin
    Application.CreateForm(TDBConnectForm, DBConnectForm);
    try
      DBConnectForm.ShowModal;
    finally
      DBConnectForm.Free
    end;
  end
  else
    ShowMsg('�Բ�����û����������Ȩ�ޣ��޷��������ݿ����ã�')
end;

procedure TMainForm.TBVoiceContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
  if TUserUtil.HasAuthority('�������') then
  begin
    Application.CreateForm(TVoiceForm, VoiceForm);
    try
      VoiceForm.ShowModal();
    finally
      VoiceForm.Free;
    end;
  end
  else
    ShowMsg('�Բ�����û���������Ȩ�ޣ��޷���������������ã�')
end;

procedure TMainForm.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
var t: string;
begin
  if not systemConfig.gridOddEvenColor then
  begin
    t := DBGridEh1.DataSource.DataSet.FieldByName('��������').AsString;
    if t = 'PO' then
      Background := clWindow
    else if t = 'SO' then
      Background := clSkyBlue
    else if t = 'IO' then
      Background := clMoneyGreen
    else
      Background := clBtnFace;
  end;
end;

function TMainForm.getBgFile: Boolean;
var f: TSearchRec;
  sPath, sFile: string;
  dt: TDateTime;
  FilePath: string;
begin
  FilePath := ExtractFilePath(ParamStr(0)) + 'BackGround\';
  if Copy(FilePath, Length(FilePath), 1) <> '\\' then
    sPath := FilePath + '\\'
  else
    sPath := FilePath;
  if FindFirst(sPath + '*.jpg', faAnyFile, f) = 0 then
  begin
    repeat
      sFile := Trim(f.Name);
      if sFile = '.' then
        Continue;
      if sFile = '..' then
        Continue;
      sFile := sPath + f.Name;
      if (f.Attr and faAnyFile) = f.Attr then
      begin
        arrPicFile.Add(sFile);
      end;
    until FindNext(f) <> 0;
    FindClose(f);
  end;
end;

procedure TMainForm.ImgBackDblClick(Sender: TObject);
begin
  {inc(picStep);
  if picStep > arrPicFile.Count - 1 then
    picStep := 0;
  if FileExists(arrPicFile[picStep]) then
    setBackGround(arrPicFile[picStep]);  }
end;

procedure TMainForm.SMHelpClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PAnsiChar(ExtractFilePath(Application.ExeName) + '\help.chm'), '', '', SW_SHOW);
end;

procedure TMainForm.SMManualInputClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('��Ӽ�¼') then
  begin
    Application.CreateForm(TManualInputForm, ManualInputForm);
    try
      ManualInputForm.insertOrUpdate := True;
      ManualInputForm.ShowModal;
    finally
      ManualInputForm.Free;
    end;
  end
  else
  begin
    ShowMsg('�Բ�����û����Ӽ�¼Ȩ�ޣ��޷���Ӽ�¼��')
  end;
end;

procedure TMainForm.N30Click(Sender: TObject);
begin
  showGridRecord;
end;

procedure TMainForm.setCompanyInfo();
begin
  SpInfo.Caption := Format('%s ʹ�õ�λ:%s �绰����:%s  רҵ�з��������ϵͳ,����ֵ��ϵͳ,������ϵͳ,����ϵͳ',
    [Application.Title, systemConfig.company, systemConfig.tel]);
end;

procedure TMainForm.SMStorageInfoClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('���ݲ�ѯ') then
  begin
    Application.CreateForm(TStorageForm, StorageForm);
    try
      StorageForm.ShowModal;
    finally
      StorageForm.Free;
    end;
  end;
end;

procedure TMainForm.SMInvalidQueryClick(Sender: TObject);
begin
  Application.CreateForm(TInvalidDataQueryForm, InvalidDataQueryForm);
  try
    InvalidDataQueryForm.ShowModal;
  finally
    InvalidDataQueryForm.Free;
  end;
end;

procedure TMainForm.N35Click(Sender: TObject);
begin
  if systemConfig.onlyAllowInvalidNotFinished then
  begin
    if DBGridEh1.DataSource.DataSet.FieldByName('����').AsFloat <> 0 then
    begin
      Exit;
    end;
  end;
  if TUserUtil.HasAuthority('���Ź���') then
  begin
    if MessageDlg('��ȷ��Ҫ����������¼��?', mtConfirmation, [mbYes, mbNo],
      0) = mrNo then
    begin
      Exit;
    end;
    if TWeightUtil.moveDeletedRecord(
      DBGridEh1.DataSource.DataSet.FieldByName('��ˮ��').AsString) then
    begin
      DBGridEh1.DataSource.DataSet.Delete;
      Application.MessageBox('�ü�¼�Ѿ�����', '��ʾ', MB_OK +
        MB_ICONINFORMATION + MB_TOPMOST);
    end
    else
    begin
      if MessageBox(0, '���ϸü�¼ʧ�ܣ��Ƿ�ֱ��ɾ����', '��ʾ', MB_YESNO +
        MB_ICONSTOP + MB_DEFBUTTON2 + MB_TOPMOST) = IDYES then
      begin
        if TUserUtil.HasAuthority('ɾ����¼') then
        begin
          DBGridEh1.DataSource.DataSet.Delete;
          TWeightUtil.deletePhoto(DBGridEh1.DataSource.DataSet.FieldByName('��ˮ��').AsString);
        end
        else
        begin
          MessageBox(0, '�Բ�������Ȩɾ�����ݣ�', '����', MB_OK + MB_ICONSTOP
            + MB_DEFBUTTON2 + MB_TOPMOST);
        end;
      end;
    end;
  end;
end;

procedure TMainForm.SMPriceQueryClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('Ԥ��ά��') then
  begin
    Application.CreateForm(TPriceForm, PriceForm);
    try
      PriceForm.ShowModal;
    finally
      PriceForm.Free
    end
  end
  else
    ShowMsg('�Բ�����û��Ԥ��ά��Ȩ�ޣ��޷����пͻ��۸�ά����')
end;

procedure TMainForm.cbjt1Click(Sender: TObject);
begin
  if TUserUtil.HasAuthority('��ӡ����') then
  begin
    TReportUtil.printPicTicket(
      DBGridEh1.DataSource.DataSet.FieldByName('��ˮ��').AsString, True,
      systemConfig.ticketType);
  end
end;

procedure TMainForm.N37Click(Sender: TObject);
begin
  if TUserUtil.HasAuthority('��ӡ����') then
  begin
    TReportUtil.printPicTicket(
      DBGridEh1.DataSource.DataSet.FieldByName('��ˮ��').AsString, False, systemConfig.ticketType);
  end
end;

procedure TMainForm.TAutoShutTimer(Sender: TObject);
begin
  if systemConfig.CloseTime = FormatDateTime('hns', Now) then
  begin
    Application.CreateForm(TAutoShutForm, AutoShutForm);
    AutoShutForm.ShowModal
  end
end;

procedure TMainForm.N45Click(Sender: TObject);
begin
  TWeightUtil.showWeightPic(
    DBGridEh1.DataSource.DataSet.FieldByName('��ˮ��').AsString);
  PhotoForm.Show;
end;

procedure TMainForm.N46Click(Sender: TObject);
begin
  Application.CreateForm(TDataShowSettingForm, DataShowSettingForm);
  try
    DataShowSettingForm.DBGridEh1 := DBGridEh1;
    DataShowSettingForm.ShowModal;
  finally
    DataShowSettingForm.Free
  end
end;

procedure TMainForm.N47Click(Sender: TObject);
begin
  with PrintDBGridEh1 do
  begin
    DBGridEh := DBGridEh1;
    Options := Options - [pghOptimalColWidths];
    Options := Options + [pghFitingByColWidths];

    PageHeader.CenterText.Clear;
    PageHeader.CenterText.Add(systemConfig.dataReportTitle);
    PageHeader.CenterText.Add('');

    BeforeGridText.Clear;
    BeforeGridText.Add('����Ա��' + CurrentUser + '        ' + '����ʱ�䣺' +
      DateTimeToStr(Now));
    PageFooter.CenterText.Clear;
    PageFooter.CenterText.Add('��&[Page]ҳ/��&[Pages]ҳ');
    Preview
  end
end;

procedure TMainForm.PhotoBtnClick(Sender: TObject);
begin
  TWeightUtil.showWeightPic(
    DBGridEh1.DataSource.DataSet.FieldByName('��ˮ��').AsString);

  PhotoForm.Show;
end;

procedure TMainForm.ListBtnClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('��������') then
  begin
    Application.CreateForm(TDataShowSettingForm, DataShowSettingForm);
    try
      DataShowSettingForm.DBGridEh1 := DBGridEh1;
      DataShowSettingForm.ShowModal;
    finally
      DataShowSettingForm.Free
    end
  end
end;

procedure TMainForm.OutputBtnClick(Sender: TObject);
begin
  if not TUserUtil.HasAuthority('���ݵ���') then
    Exit;
  if TCommonUtil.exportExcel(DBGridEh1) then
    Application.MessageBox('���ݵ����ɹ�!', '����', MB_OK + MB_ICONINFORMATION
      + MB_TOPMOST);
end;

procedure TMainForm.PrintBtnClick(Sender: TObject);
begin
  with PrintDBGridEh1 do
  begin
    DBGridEh := DBGridEh1;
    Options := Options - [pghOptimalColWidths];
    Options := Options + [pghFitingByColWidths];

    PageHeader.CenterText.Clear;
    PageHeader.CenterText.Add(systemConfig.dataReportTitle);
    PageHeader.CenterText.Add('');

    BeforeGridText.Clear;
    BeforeGridText.Add('����Ա��' + CurrentUser + '        ' + '����ʱ�䣺' +
      DateTimeToStr(Now));
    PageFooter.CenterText.Clear;
    PageFooter.CenterText.Add('��&[Page]ҳ/��&[Pages]ҳ');
    Preview
  end
end;

procedure TMainForm.cheatCloseExecute(Sender: TObject);
begin
  systemConfig.cweightFlag1 := False;
  systemConfig.cweightFlag2 := False;
  systemConfig.cweightFlag3 := False;
  systemConfig.cweightFlag4 := False;
  systemConfig.cweightFlag5 := False;
  systemConfig.cweightFlag6 := False;
  systemConfig.cweightFlag7 := False;
  systemConfig.cweightFlag8 := False;

  systemConfig.fixCheatFlag := not systemConfig.fixCheatFlag;
  setExportWeightCheat();
end;

procedure TMainForm.loadFormDesignFile;
var f: TSearchRec;
  sPath, sFile: string;
  dt: TDateTime;
  FilePath: string;
  slDesign: TStringList;
  i: Integer;
begin
  slDesign := TStringList.Create;
  try
    FilePath := ExtractFilePath(ParamStr(0)) + 'Design';
    if Copy(FilePath, Length(FilePath), 1) <> '\' then
      sPath := FilePath + '\'
    else
      sPath := FilePath;
    if FindFirst(sPath + '*.wfc', faAnyFile, f) = 0 then
    begin
      repeat
        sFile := Trim(f.Name);
        if sFile = '.' then
          Continue;
        if sFile = '..' then
          Continue;
        //sFile := sPath + f.Name;
        if (f.Attr and faAnyFile) = f.Attr then
        begin
          slDesign.Add(Copy(sFile, 1, Length(sFile) - 4));
        end;
      until FindNext(f) <> 0;
      FindClose(f);
    end;

    setLength(arrDesignMenu, slDesign.Count);
    for i := 0 to slDesign.Count - 1 do
    begin
      arrDesignMenu[i] := TMenuItem.Create(nil);
      arrDesignMenu[i].AutoHotkeys := maManual;
      arrDesignMenu[i].Caption := slDesign.Strings[i];
      arrDesignMenu[i].OnClick := selWeightForm;
    end;
    SMWeightSet.Add(arrDesignMenu);
  finally
    slDesign.Free;
  end;
end;

procedure TMainForm.selWeightForm(Sender: TObject);
var f: string;
begin
  if TUserUtil.HasAuthority('��������') then
  begin
    if MessageBox(0, '�㽫��ʧ��ǰ���棬�Ƿ������', '����', MB_YESNO +
      MB_ICONWARNING + MB_DEFBUTTON2 + MB_TOPMOST) = IDYES then
    begin
      f := ExtractFilePath(ParamStr(0)) + 'Design\' + (Sender as TMenuItem).Caption + '.wfc';

      if FileExists(f) then
      begin
        CopyFile(PChar(f), PChar(ExtractFilePath(ParamStr(0)) + 'design.ini'), False);
        TSysConfigUtil.loadFormConfig(MainForm.poWeightSetConfig, MainForm.soWeightSetConfig,
          MainForm.ioWeightSetConfig, MainForm.ooWeightSetConfig);

        if MainForm.SpltMain.Visible then
        begin
          MainForm.loadFormDesign;
          MainForm.SMWeight.Click;
        end;
      end;
    end;
  end
  else
  begin
    ShowMsg('����Ȩ�л�����');
  end;
end;

procedure TMainForm.speak(str: string);
begin
  if str = '' then
    Exit;
  try
    SpVoice1.Speak('', SVSFPurgeBeforeSpeak);
    str := StringReplace(str, '[����]', FrmWeight1.CBCar.Text, [rfReplaceAll]);
    str := StringReplace(str, '[������λ]', FrmWeight1.CBFaHuo.Text, [rfReplaceAll]);
    str := StringReplace(str, '[�ջ���λ]', FrmWeight1.CBShouHuo.Text, [rfReplaceAll]);
    str := StringReplace(str, '[����]', FrmWeight1.CBGoods.Text, [rfReplaceAll]);
    str := StringReplace(str, '[���]', FrmWeight1.CBSpec.Text, [rfReplaceAll]);
    str := StringReplace(str, '[ë��]', FrmWeight1.EdtGross.Text, [rfReplaceAll]);
    str := StringReplace(str, '[Ƥ��]', FrmWeight1.EdtTare.Text, [rfReplaceAll]);
    str := StringReplace(str, '[����]', FrmWeight1.EdtNet.Text, [rfReplaceAll]);
    str := StringReplace(str, '[����]', FrmWeight1.getWeight, [rfReplaceAll]);
    SpVoice1.Speak(str, SVSFlagsAsync);
  except
  end;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  if not QueryDataModule.ConnectFlag then
  begin
    Application.MessageBox('�޷��������ݿ�,ϵͳ�����˳�', '����', MB_OK +
      MB_ICONSTOP + MB_TOPMOST);
    Application.Terminate;
  end;
  //���Ӱ�����ʽ
  if not myini.ReadBool('system_set', 'add_print_form', False) then
  begin
    TCommonUtil.AddPaper('��������ʽ1', 10.1, 10.1);
    TCommonUtil.AddPaper('��������ʽ2', 10.1, 19.1);
    TCommonUtil.AddPaper('��������ʽ3', 21, 9.3);
    TCommonUtil.AddPaper('��������ʽ4', 24.1, 19.1);
    TCommonUtil.AddPaper('��������ʽ5', 12.1, 19.1);
    myini.WriteBool('system_set', 'add_print_form', True);
  end;
  //����ϵͳʱ���ʽ
  TCommonUtil.setTimeFormat();

  DBGridEh1.SumList.Active := MainForm.systemConfig.showSumList;
end;

procedure TMainForm.SMReportSysClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('���ݲ�ѯ') then
  begin
    Application.CreateForm(TReportSysForm, ReportSysForm);
    try
      ReportSysForm.ShowModal;
    finally
      ReportSysForm.Free;
    end;
  end
  else
    ShowMsg('�Բ�����û�����ݲ�ѯȨ�ޣ��޷����б����ѯ��')
end;

procedure TMainForm.cheat5Execute(Sender: TObject);
begin
  systemConfig.cweightFlag1 := False;
  systemConfig.cweightFlag2 := False;
  systemConfig.cweightFlag3 := False;
  systemConfig.cweightFlag4 := False;
  systemConfig.cweightFlag5 := not systemConfig.cweightFlag5;
  systemConfig.cweightFlag6 := False;
  systemConfig.cweightFlag7 := False;
  systemConfig.cweightFlag8 := False;
  setExportWeightCheat();
end;

procedure TMainForm.cheat6Execute(Sender: TObject);
begin
  systemConfig.cweightFlag1 := False;
  systemConfig.cweightFlag2 := False;
  systemConfig.cweightFlag3 := False;
  systemConfig.cweightFlag4 := False;
  systemConfig.cweightFlag5 := False;
  systemConfig.cweightFlag6 := not systemConfig.cweightFlag6;
  systemConfig.cweightFlag7 := False;
  systemConfig.cweightFlag8 := False;
  setExportWeightCheat();
end;

procedure TMainForm.cheat7Execute(Sender: TObject);
begin
  systemConfig.cweightFlag1 := False;
  systemConfig.cweightFlag2 := False;
  systemConfig.cweightFlag3 := False;
  systemConfig.cweightFlag4 := False;
  systemConfig.cweightFlag5 := False;
  systemConfig.cweightFlag6 := False;
  systemConfig.cweightFlag7 := not systemConfig.cweightFlag7;
  systemConfig.cweightFlag8 := False;
  setExportWeightCheat();
end;

procedure TMainForm.cheat8Execute(Sender: TObject);
begin
  systemConfig.cweightFlag1 := False;
  systemConfig.cweightFlag2 := False;
  systemConfig.cweightFlag3 := False;
  systemConfig.cweightFlag4 := False;
  systemConfig.cweightFlag5 := False;
  systemConfig.cweightFlag6 := False;
  systemConfig.cweightFlag7 := False;
  systemConfig.cweightFlag8 := not systemConfig.cweightFlag8;
  setExportWeightCheat();
end;

procedure TMainForm.SMCostSetClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('ϵͳ����') then
  begin
    Application.CreateForm(TCostSetForm, CostSetForm);
    try
      CostSetForm.ShowModal;
    finally
      CostSetForm.Free;
    end
  end;
end;

procedure TMainForm.TAutoRefreshTimer(Sender: TObject);
begin
  if (not systemConfig.databaseInUse)
    and (StrToIntDef(FrmWeight1.getWeight, 0) < systemConfig.returnZero) then
  begin
    showGridRecord;
  end;
end;

procedure TMainForm.loadMenu;
var menuIni: TIniFile;
begin
  menuIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'menu.ini');
  try
    MSysOper.Caption := menuIni.ReadString('sys_oper', 'caption', 'ϵͳ����');
    MDataMaintain.Caption := menuIni.ReadString('data_maintain', 'caption', '����ά��');
    MSysMaintain.Caption := menuIni.ReadString('sys_maintain', 'caption', 'ϵͳά��');
    MAdditionalTool.Caption := menuIni.ReadString('additional_tool', 'caption', '���ӹ���');
    MHelp.Caption := menuIni.ReadString('help', 'caption', '����');

    SMChange.Caption := menuIni.ReadString('user_change', 'caption', '�л��û�');
    SMPassword.Caption := menuIni.ReadString('change_password', 'caption', '��������');
    SMWeight.Caption := menuIni.ReadString('weight', 'caption', '���ز���');
    SMClose.Caption := menuIni.ReadString('close', 'caption', '�ر����');
    SMTerminate.Caption := menuIni.ReadString('terminate', 'caption', '�رռ����');

    SMUser.Caption := menuIni.ReadString('user', 'caption', '����Աά��');
    SMDataQuery.Caption := menuIni.ReadString('data_query', 'caption', '���ݼ�¼��ѯ');
    SMPreMaintain.Caption := menuIni.ReadString('pre_maintain', 'caption', 'Ԥ����Ϣ��ѯ');
    SMTaoQuery.Caption := menuIni.ReadString('tao_query', 'caption', '�ױ���Ϣ��ѯ');
    SMSysLog.Caption := menuIni.ReadString('sys_log', 'caption', 'ϵͳ��־��ѯ');
    SMBackRecord.Caption := menuIni.ReadString('back_record', 'caption', '��̨��¼��ѯ');
    SMInvalidQuery.Caption := menuIni.ReadString('invalid_query', 'caption', '���ϼ�¼��ѯ');
    SMStorageInfo.Caption := menuIni.ReadString('storage_info', 'caption', '�����Ϣ��ѯ');
    SMChargeHistory.Caption := menuIni.ReadString('charge_history', 'caption', '��ֵ��ʷ��ѯ');
    SMPriceQuery.Caption := menuIni.ReadString('price_query', 'caption', '�ͻ��۸��ѯ');
    SMReportSys.Caption := menuIni.ReadString('report_sys', 'caption', '�߼������ѯ');
    SMTareTrend.Caption := menuIni.ReadString('tare_trend', 'caption', 'Ƥ������ͼ');
    SMStaticTrend.Caption := menuIni.ReadString('static_trend', 'caption', 'ͳ�Ʒ���ͼ');
    SMCharge.Caption := menuIni.ReadString('charge', 'caption', '�ջ���λ��ֵ');
    SMManualInput.Caption := menuIni.ReadString('manual_input', 'caption', '�ֹ�����');
    SMScanTicket.Caption := menuIni.ReadString('scan_ticket', 'caption', '������֤����');
    SMScanReport.Caption := menuIni.ReadString('scan_report', 'caption', 'ɨ���ӡ����');

    SMMeter.Caption := menuIni.ReadString('meter', 'caption', '�Ǳ�����');
    SMMeter1.Caption := menuIni.ReadString('meter1', 'caption', '1#�Ǳ�����');
    SMMeter2.Caption := menuIni.ReadString('meter2', 'caption', '2#�Ǳ�����');
    SMDb.Caption := menuIni.ReadString('db', 'caption', '���ݿ�');
    SMDBSet.Caption := menuIni.ReadString('db_set', 'caption', '���ݿ�����');
    SMDBBackup.Caption := menuIni.ReadString('db_backup', 'caption', '���ݿⱸ��');
    SMDBClear.Caption := menuIni.ReadString('db_clear', 'caption', '���ݿ�����');
    SMDBInit.Caption := menuIni.ReadString('db_init', 'caption', '���ݿ��ʼ��');
    SMDBMigrate.Caption := menuIni.ReadString('db_migrate', 'caption', '���ݿ�Ǩ��');
    SMEquipment.Caption := menuIni.ReadString('equipment', 'caption', '��Χ�豸');
    SMVideo.Caption := menuIni.ReadString('video', 'caption', '��Ƶ����');
    SMScreen.Caption := menuIni.ReadString('screen', 'caption', '����Ļ����');
    SMReadWeight.Caption := menuIni.ReadString('read_weight', 'caption', '��������');
    SMTicketSet.Caption := menuIni.ReadString('ticket_set', 'caption', '������ʽ����');
    SMModify.Caption := menuIni.ReadString('modify', 'caption', '�޸ĵ�ǰ����');
    SMWeightSet.Caption := menuIni.ReadString('weight_set', 'caption', '���ؽ�������');
    SMDesign.Caption := menuIni.ReadString('design', 'caption', '���漴ʱ����');
    SMSoftSet.Caption := menuIni.ReadString('soft_set', 'caption', '���ϵͳ����');
    SMCostSet.Caption := menuIni.ReadString('cost_set', 'caption', '����������');

    SMComputer.Caption := menuIni.ReadString('computer', 'caption', '������');
    SMSkin.Caption := menuIni.ReadString('skin', 'caption', '���Ƥ������');
    SMMail.Caption := menuIni.ReadString('mail', 'caption', '��ʱ�ʼ�����');
    SMSimulate.Caption := menuIni.ReadString('simulate', 'caption', 'ģ�����');

    SMAbout.Caption := menuIni.ReadString('about', 'caption', '�������');
    SMHelp.Caption := menuIni.ReadString('use_help', 'caption', 'ʹ�ð���');

    //////////////////////////////////////////////////////////////////////////////////
    MSysOper.Visible := menuIni.ReadBool('sys_oper', 'visible', True);
    MDataMaintain.Visible := menuIni.ReadBool('data_maintain', 'visible', True);
    MSysMaintain.Visible := menuIni.ReadBool('sys_maintain', 'visible', True);
    MAdditionalTool.Visible := menuIni.ReadBool('additional_tool', 'visible', True);
    MHelp.Visible := menuIni.ReadBool('help', 'visible', True);

    SMChange.Visible := menuIni.ReadBool('user_change', 'visible', True);
    SMPassword.Visible := menuIni.ReadBool('change_password', 'visible', True);
    SMWeight.Visible := menuIni.ReadBool('weight', 'visible', True);
    SMClose.Visible := menuIni.ReadBool('close', 'visible', True);
    SMTerminate.Visible := menuIni.ReadBool('terminate', 'visible', True);

    SMUser.Visible := menuIni.ReadBool('user', 'visible', True);
    SMDataQuery.Visible := menuIni.ReadBool('data_query', 'visible', True);
    SMPreMaintain.Visible := menuIni.ReadBool('pre_maintain', 'visible', True);
    SMTaoQuery.Visible := menuIni.ReadBool('tao_query', 'visible', True);
    SMSysLog.Visible := menuIni.ReadBool('sys_log', 'visible', True);
    SMBackRecord.Visible := menuIni.ReadBool('back_record', 'visible', True);
    SMInvalidQuery.Visible := menuIni.ReadBool('invalid_query', 'visible', True);
    SMStorageInfo.Visible := menuIni.ReadBool('storage_info', 'visible', True);
    SMChargeHistory.Visible := menuIni.ReadBool('charge_history', 'visible', True);
    SMPriceQuery.Visible := menuIni.ReadBool('price_query', 'visible', True);
    SMReportSys.Visible := menuIni.ReadBool('report_sys', 'visible', True);
    SMTareTrend.Visible := menuIni.ReadBool('tare_trend', 'visible', True);
    SMStaticTrend.Visible := menuIni.ReadBool('static_trend', 'visible', True);
    SMCharge.Visible := menuIni.ReadBool('charge', 'visible', True);
    SMManualInput.Visible := menuIni.ReadBool('manual_input', 'visible', True);
    SMScanTicket.Visible := menuIni.ReadBool('scan_ticket', 'visible', False);
    SMScanReport.Visible := menuIni.ReadBool('scan_report', 'visible', False);

    SMMeter.Visible := menuIni.ReadBool('meter', 'visible', True);
    SMMeter1.Visible := menuIni.ReadBool('meter1', 'visible', True);
    SMMeter2.Visible := menuIni.ReadBool('meter2', 'visible', True);
    SMDb.Visible := menuIni.ReadBool('db', 'visible', True);
    SMDBSet.Visible := menuIni.ReadBool('db_set', 'visible', True);
    SMDBBackup.Visible := menuIni.ReadBool('db_backup', 'visible', True);
    SMDBClear.Visible := menuIni.ReadBool('db_clear', 'visible', True);
    SMDBInit.Visible := menuIni.ReadBool('db_init', 'visible', True);
    SMDBMigrate.Visible := menuIni.ReadBool('db_migrate', 'visible', True);
    SMEquipment.Visible := menuIni.ReadBool('equipment', 'visible', True);
    SMVideo.Visible := menuIni.ReadBool('video', 'visible', True);
    SMScreen.Visible := menuIni.ReadBool('screen', 'visible', True);
    SMReadWeight.Visible := menuIni.ReadBool('read_weight', 'visible', True);
    SMTicketSet.Visible := menuIni.ReadBool('ticket_set', 'visible', True);
    SMModify.Visible := menuIni.ReadBool('modify', 'visible', True);
    SMWeightSet.Visible := menuIni.ReadBool('weight_set', 'visible', True);
    SMDesign.Visible := menuIni.ReadBool('design', 'visible', True);
    SMSoftSet.Visible := menuIni.ReadBool('soft_set', 'visible', True);
    SMCostSet.Visible := menuIni.ReadBool('cost_set', 'visible', True);

    SMComputer.Visible := menuIni.ReadBool('computer', 'visible', True);
    SMSkin.Visible := menuIni.ReadBool('skin', 'visible', True);
    SMMail.Visible := menuIni.ReadBool('mail', 'visible', True);
    SMSimulate.Visible := menuIni.ReadBool('simulate', 'visible', True);

    SMAbout.Visible := menuIni.ReadBool('about', 'visible', True);
    SMHelp.Visible := menuIni.ReadBool('use_help', 'visible', True);
  finally
    menuIni.Free;
  end;
end;

procedure TMainForm.saveMenu;
var menuIni: TIniFile;
begin
  menuIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'menu.ini');
  try
    menuIni.WriteString('sys_oper', 'caption', MSysOper.Caption);
    menuIni.WriteString('data_maintain', 'caption', MDataMaintain.Caption);
    menuIni.WriteString('sys_maintain', 'caption', MSysMaintain.Caption);
    menuIni.WriteString('additional_tool', 'caption', MAdditionalTool.Caption);
    menuIni.WriteString('help', 'caption', MHelp.Caption);

    menuIni.WriteString('user_change', 'caption', SMChange.Caption);
    menuIni.WriteString('change_password', 'caption', SMPassword.Caption);
    menuIni.WriteString('weight', 'caption', SMWeight.Caption);
    menuIni.WriteString('close', 'caption', SMClose.Caption);
    menuIni.WriteString('terminate', 'caption', SMTerminate.Caption);

    menuIni.WriteString('user', 'caption', SMUser.Caption);
    menuIni.WriteString('data_query', 'caption', SMDataQuery.Caption);
    menuIni.WriteString('pre_maintain', 'caption', SMPreMaintain.Caption);
    menuIni.WriteString('tao_query', 'caption', SMTaoQuery.Caption);
    menuIni.WriteString('sys_log', 'caption', SMSysLog.Caption);
    menuIni.WriteString('back_record', 'caption', SMBackRecord.Caption);
    menuIni.WriteString('invalid_query', 'caption', SMInvalidQuery.Caption);
    menuIni.WriteString('storage_info', 'caption', SMStorageInfo.Caption);
    menuIni.WriteString('charge_history', 'caption', SMChargeHistory.Caption);
    menuIni.WriteString('price_query', 'caption', SMPriceQuery.Caption);
    menuIni.WriteString('report_sys', 'caption', SMReportSys.Caption);
    menuIni.WriteString('tare_trend', 'caption', SMTareTrend.Caption);
    menuIni.WriteString('static_trend', 'caption', SMStaticTrend.Caption);
    menuIni.WriteString('charge', 'caption', SMCharge.Caption);
    menuIni.WriteString('manual_input', 'caption', SMManualInput.Caption);
    menuIni.WriteString('scan_ticket', 'caption', SMScanTicket.Caption);
    menuIni.WriteString('scan_report', 'caption', SMScanReport.Caption);

    menuIni.WriteString('meter', 'caption', SMMeter.Caption);
    menuIni.WriteString('meter1', 'caption', SMMeter1.Caption);
    menuIni.WriteString('meter2', 'caption', SMMeter2.Caption);
    menuIni.WriteString('db', 'caption', SMDb.Caption);
    menuIni.WriteString('db_set', 'caption', SMDBSet.Caption);
    menuIni.WriteString('db_backup', 'caption', SMDBBackup.Caption);
    menuIni.WriteString('db_clear', 'caption', SMDBClear.Caption);
    menuIni.WriteString('db_init', 'caption', SMDBInit.Caption);
    menuIni.WriteString('db_migrate', 'caption', SMDBMigrate.Caption);
    menuIni.WriteString('equipment', 'caption', SMEquipment.Caption);
    menuIni.WriteString('video', 'caption', SMVideo.Caption);
    menuIni.WriteString('screen', 'caption', SMScreen.Caption);
    menuIni.WriteString('read_weight', 'caption', SMReadWeight.Caption);
    menuIni.WriteString('ticket_set', 'caption', SMTicketSet.Caption);
    menuIni.WriteString('modify', 'caption', SMModify.Caption);
    menuIni.WriteString('weight_set', 'caption', SMWeightSet.Caption);
    menuIni.WriteString('design', 'caption', SMDesign.Caption);
    menuIni.WriteString('soft_set', 'caption', SMSoftSet.Caption);
    menuIni.WriteString('cost_set', 'caption', SMCostSet.Caption);

    menuIni.WriteString('computer', 'caption', SMComputer.Caption);
    menuIni.WriteString('skin', 'caption', SMSkin.Caption);
    menuIni.WriteString('mail', 'caption', SMMail.Caption);
    menuIni.WriteString('simulate', 'caption', SMSimulate.Caption);

    menuIni.WriteString('about', 'caption', SMAbout.Caption);
    menuIni.WriteString('use_help', 'caption', SMHelp.Caption);

    //////////////////////////////////////////////////////////////////////////////////
    menuIni.WriteBool('sys_oper', 'visible', MSysOper.Visible);
    menuIni.WriteBool('data_maintain', 'visible', MDataMaintain.Visible);
    menuIni.WriteBool('sys_maintain', 'visible', MSysMaintain.Visible);
    menuIni.WriteBool('additional_tool', 'visible', MAdditionalTool.Visible);
    menuIni.WriteBool('help', 'visible', MHelp.Visible);

    menuIni.WriteBool('user_change', 'visible', SMChange.Visible);
    menuIni.WriteBool('change_password', 'visible', SMPassword.Visible);
    menuIni.WriteBool('weight', 'visible', SMWeight.Visible);
    menuIni.WriteBool('close', 'visible', SMClose.Visible);
    menuIni.WriteBool('terminate', 'visible', SMTerminate.Visible);

    menuIni.WriteBool('user', 'visible', SMUser.Visible);
    menuIni.WriteBool('data_query', 'visible', SMDataQuery.Visible);
    menuIni.WriteBool('pre_maintain', 'visible', SMPreMaintain.Visible);
    menuIni.WriteBool('tao_query', 'visible', SMTaoQuery.Visible);
    menuIni.WriteBool('sys_log', 'visible', SMSysLog.Visible);
    menuIni.WriteBool('back_record', 'visible', SMBackRecord.Visible);
    menuIni.WriteBool('invalid_query', 'visible', SMInvalidQuery.Visible);
    menuIni.WriteBool('storage_info', 'visible', SMStorageInfo.Visible);
    menuIni.WriteBool('charge_history', 'visible', SMChargeHistory.Visible);
    menuIni.WriteBool('price_query', 'visible', SMPriceQuery.Visible);
    menuIni.WriteBool('report_sys', 'visible', SMReportSys.Visible);
    menuIni.WriteBool('tare_trend', 'visible', SMTareTrend.Visible);
    menuIni.WriteBool('static_trend', 'visible', SMStaticTrend.Visible);
    menuIni.WriteBool('charge', 'visible', SMCharge.Visible);
    menuIni.WriteBool('manual_input', 'visible', SMManualInput.Visible);
    menuIni.WriteBool('scan_ticket', 'visible', SMScanTicket.Visible);
    menuIni.WriteBool('scan_report', 'visible', SMScanReport.Visible);

    menuIni.WriteBool('meter', 'visible', SMMeter.Visible);
    menuIni.WriteBool('meter1', 'visible', SMMeter1.Visible);
    menuIni.WriteBool('meter2', 'visible', SMMeter2.Visible);
    menuIni.WriteBool('db', 'visible', SMDb.Visible);
    menuIni.WriteBool('db_set', 'visible', SMDBSet.Visible);
    menuIni.WriteBool('db_backup', 'visible', SMDBBackup.Visible);
    menuIni.WriteBool('db_clear', 'visible', SMDBClear.Visible);
    menuIni.WriteBool('db_init', 'visible', SMDBInit.Visible);
    menuIni.WriteBool('db_migrate', 'visible', SMDBMigrate.Visible);
    menuIni.WriteBool('equipment', 'visible', SMEquipment.Visible);
    menuIni.WriteBool('video', 'visible', SMVideo.Visible);
    menuIni.WriteBool('screen', 'visible', SMScreen.Visible);
    menuIni.WriteBool('read_weight', 'visible', SMReadWeight.Visible);
    menuIni.WriteBool('ticket_set', 'visible', SMTicketSet.Visible);
    menuIni.WriteBool('modify', 'visible', SMModify.Visible);
    menuIni.WriteBool('weight_set', 'visible', SMWeightSet.Visible);
    menuIni.WriteBool('design', 'visible', SMDesign.Visible);
    menuIni.WriteBool('soft_set', 'visible', SMSoftSet.Visible);
    menuIni.WriteBool('cost_set', 'visible', SMCostSet.Visible);

    menuIni.WriteBool('computer', 'visible', SMComputer.Visible);
    menuIni.WriteBool('skin', 'visible', SMSkin.Visible);
    menuIni.WriteBool('mail', 'visible', SMMail.Visible);
    menuIni.WriteBool('simulate', 'visible', SMSimulate.Visible);

    menuIni.WriteBool('about', 'visible', SMAbout.Visible);
    menuIni.WriteBool('use_help', 'visible', SMHelp.Visible);
  finally
    menuIni.Free;
  end;
end;

procedure TMainForm.DBGridEh1CellClick(Column: TColumnEh);
begin
  TWeightUtil.showWeightPic(
    DBGridEh1.DataSource.DataSet.FieldByName('��ˮ��').AsString);
end;

procedure TMainForm.loadDBGrid(dg: TDBGridEh);
begin

  dg.FieldColumns['���'].Visible := poWeightSetConfig.noVisible;
  dg.FieldColumns['��ˮ��'].Visible := poWeightSetConfig.glideNoVisible;
  dg.FieldColumns['����'].Visible := poWeightSetConfig.carVisible;
  dg.FieldColumns['��������'].Visible := poWeightSetConfig.weightTypeVisible;
  dg.FieldColumns['������λ'].Visible := poWeightSetConfig.faHuoVisible;
  dg.FieldColumns['�ջ���λ'].Visible := poWeightSetConfig.shouHuoVisible;
  dg.FieldColumns['����'].Visible := poWeightSetConfig.goodsVisible;
  dg.FieldColumns['���'].Visible := poWeightSetConfig.specVisible;
  dg.FieldColumns['ë��'].Visible := poWeightSetConfig.grossVisible;
  dg.FieldColumns['Ƥ��'].Visible := poWeightSetConfig.tareVisible;
  dg.FieldColumns['����'].Visible := poWeightSetConfig.netVisible;
  dg.FieldColumns['����'].Visible := poWeightSetConfig.bundleVisible;
  dg.FieldColumns['ʵ��'].Visible := poWeightSetConfig.realVisible;
  dg.FieldColumns['����'].Visible := poWeightSetConfig.priceVisible;
  dg.FieldColumns['���'].Visible := poWeightSetConfig.sumVisible;
  dg.FieldColumns['�۷�ϵ��'].Visible := poWeightSetConfig.scaleVisible;
  dg.FieldColumns['����'].Visible := poWeightSetConfig.quanterVisible;
  dg.FieldColumns['������'].Visible := poWeightSetConfig.costVisible;
  dg.FieldColumns['ë��˾��Ա'].Visible := poWeightSetConfig.grossManVisible;
  dg.FieldColumns['Ƥ��˾��Ա'].Visible := poWeightSetConfig.tareManVisible;
  dg.FieldColumns['ë�ذ���'].Visible := poWeightSetConfig.grossAddrVisible;
  dg.FieldColumns['Ƥ�ذ���'].Visible := poWeightSetConfig.tareAddrVisible;
  dg.FieldColumns['ë��ʱ��'].Visible := poWeightSetConfig.grossTimeVisible;
  dg.FieldColumns['Ƥ��ʱ��'].Visible := poWeightSetConfig.tareTimeVisible;
  dg.FieldColumns['һ�ι���ʱ��'].Visible := poWeightSetConfig.firstTimeVisible;
  dg.FieldColumns['���ι���ʱ��'].Visible := poWeightSetConfig.secondTimeVisible;
  dg.FieldColumns['������'].Visible := poWeightSetConfig.updateUserVisible;
  dg.FieldColumns['����ʱ��'].Visible := poWeightSetConfig.updateTimeVisible;
  dg.FieldColumns['��ע'].Visible := poWeightSetConfig.memoVisible;
  dg.FieldColumns['��ӡ����'].Visible := poWeightSetConfig.printCountVisible;
  dg.FieldColumns['�ϴ���'].Visible := poWeightSetConfig.uploadVisible;
  dg.FieldColumns['����1'].Visible := poWeightSetConfig.backup1Visible;
  dg.FieldColumns['����2'].Visible := poWeightSetConfig.backup2Visible;
  dg.FieldColumns['����3'].Visible := poWeightSetConfig.backup3Visible;
  dg.FieldColumns['����4'].Visible := poWeightSetConfig.backup4Visible;
  dg.FieldColumns['����5'].Visible := poWeightSetConfig.backup5Visible;
  dg.FieldColumns['����6'].Visible := poWeightSetConfig.backup6Visible;
  dg.FieldColumns['����7'].Visible := poWeightSetConfig.backup7Visible;
  dg.FieldColumns['����8'].Visible := poWeightSetConfig.backup8Visible;
  dg.FieldColumns['����9'].Visible := poWeightSetConfig.backup9Visible;
  dg.FieldColumns['����10'].Visible := poWeightSetConfig.backup10Visible;
  dg.FieldColumns['����11'].Visible := poWeightSetConfig.backup11Visible;
  dg.FieldColumns['����12'].Visible := poWeightSetConfig.backup12Visible;
  dg.FieldColumns['����13'].Visible := poWeightSetConfig.backup13Visible;
  dg.FieldColumns['����14'].Visible := poWeightSetConfig.backup14Visible;
  dg.FieldColumns['����15'].Visible := poWeightSetConfig.backup15Visible;
  dg.FieldColumns['����16'].Visible := poWeightSetConfig.backup16Visible;
  dg.FieldColumns['����17'].Visible := poWeightSetConfig.backup17Visible;
  dg.FieldColumns['����18'].Visible := poWeightSetConfig.backup18Visible;

  dg.FieldColumns['���'].Title.Caption := poWeightSetConfig.noCaption;
  dg.FieldColumns['��ˮ��'].Title.Caption := poWeightSetConfig.glideNoCaption;
  dg.FieldColumns['����'].Title.Caption := poWeightSetConfig.carCaption;
  dg.FieldColumns['��������'].Title.Caption := poWeightSetConfig.weightTypeCaption;
  dg.FieldColumns['������λ'].Title.Caption := poWeightSetConfig.faHuoCaption;
  dg.FieldColumns['�ջ���λ'].Title.Caption := poWeightSetConfig.shouHuoCaption;
  dg.FieldColumns['����'].Title.Caption := poWeightSetConfig.goodsCaption;
  dg.FieldColumns['���'].Title.Caption := poWeightSetConfig.specCaption;
  dg.FieldColumns['ë��'].Title.Caption := poWeightSetConfig.grossCaption;
  dg.FieldColumns['Ƥ��'].Title.Caption := poWeightSetConfig.tareCaption;
  dg.FieldColumns['����'].Title.Caption := poWeightSetConfig.netCaption;
  dg.FieldColumns['����'].Title.Caption := poWeightSetConfig.bundleCaption;
  dg.FieldColumns['ʵ��'].Title.Caption := poWeightSetConfig.realCaption;
  dg.FieldColumns['����'].Title.Caption := poWeightSetConfig.priceCaption;
  dg.FieldColumns['���'].Title.Caption := poWeightSetConfig.sumCaption;
  dg.FieldColumns['�۷�ϵ��'].Title.Caption := poWeightSetConfig.scaleCaption;
  dg.FieldColumns['����'].Title.Caption := poWeightSetConfig.quanterCaption;
  dg.FieldColumns['������'].Title.Caption := poWeightSetConfig.costCaption;
  dg.FieldColumns['ë��˾��Ա'].Title.Caption := poWeightSetConfig.grossManCaption;
  dg.FieldColumns['Ƥ��˾��Ա'].Title.Caption := poWeightSetConfig.tareManCaption;
  dg.FieldColumns['ë�ذ���'].Title.Caption := poWeightSetConfig.grossAddrCaption;
  dg.FieldColumns['Ƥ�ذ���'].Title.Caption := poWeightSetConfig.tareAddrCaption;
  dg.FieldColumns['ë��ʱ��'].Title.Caption := poWeightSetConfig.grossTimeCaption;
  dg.FieldColumns['Ƥ��ʱ��'].Title.Caption := poWeightSetConfig.tareTimeCaption;
  dg.FieldColumns['һ�ι���ʱ��'].Title.Caption := poWeightSetConfig.firstTimeCaption;
  dg.FieldColumns['���ι���ʱ��'].Title.Caption := poWeightSetConfig.secondTimeCaption;
  dg.FieldColumns['������'].Title.Caption := poWeightSetConfig.updateUserCaption;
  dg.FieldColumns['����ʱ��'].Title.Caption := poWeightSetConfig.updateTimeCaption;
  dg.FieldColumns['��ע'].Title.Caption := poWeightSetConfig.memoCaption;
  dg.FieldColumns['��ӡ����'].Title.Caption := poWeightSetConfig.printCountCaption;
  dg.FieldColumns['�ϴ���'].Title.Caption := poWeightSetConfig.uploadCaption;
  dg.FieldColumns['����1'].Title.Caption := poWeightSetConfig.backup1Caption;
  dg.FieldColumns['����2'].Title.Caption := poWeightSetConfig.backup2Caption;
  dg.FieldColumns['����3'].Title.Caption := poWeightSetConfig.backup3Caption;
  dg.FieldColumns['����4'].Title.Caption := poWeightSetConfig.backup4Caption;
  dg.FieldColumns['����5'].Title.Caption := poWeightSetConfig.backup5Caption;
  dg.FieldColumns['����6'].Title.Caption := poWeightSetConfig.backup6Caption;
  dg.FieldColumns['����7'].Title.Caption := poWeightSetConfig.backup7Caption;
  dg.FieldColumns['����8'].Title.Caption := poWeightSetConfig.backup8Caption;
  dg.FieldColumns['����9'].Title.Caption := poWeightSetConfig.backup9Caption;
  dg.FieldColumns['����10'].Title.Caption := poWeightSetConfig.backup10Caption;
  dg.FieldColumns['����11'].Title.Caption := poWeightSetConfig.backup11Caption;
  dg.FieldColumns['����12'].Title.Caption := poWeightSetConfig.backup12Caption;
  dg.FieldColumns['����13'].Title.Caption := poWeightSetConfig.backup13Caption;
  dg.FieldColumns['����14'].Title.Caption := poWeightSetConfig.backup14Caption;
  dg.FieldColumns['����15'].Title.Caption := poWeightSetConfig.backup15Caption;
  dg.FieldColumns['����16'].Title.Caption := poWeightSetConfig.backup16Caption;
  dg.FieldColumns['����17'].Title.Caption := poWeightSetConfig.backup17Caption;
  dg.FieldColumns['����18'].Title.Caption := poWeightSetConfig.backup18Caption;

  dg.FieldColumns['���'].Index := poWeightSetConfig.noIndex;
  dg.FieldColumns['��ˮ��'].Index := poWeightSetConfig.glideNoIndex;
  dg.FieldColumns['����'].Index := poWeightSetConfig.carIndex;
  dg.FieldColumns['��������'].Index := poWeightSetConfig.weightTypeIndex;
  dg.FieldColumns['������λ'].Index := poWeightSetConfig.faHuoIndex;
  dg.FieldColumns['�ջ���λ'].Index := poWeightSetConfig.shouHuoIndex;
  dg.FieldColumns['����'].Index := poWeightSetConfig.goodsIndex;
  dg.FieldColumns['���'].Index := poWeightSetConfig.specIndex;
  dg.FieldColumns['ë��'].Index := poWeightSetConfig.grossIndex;
  dg.FieldColumns['Ƥ��'].Index := poWeightSetConfig.tareIndex;
  dg.FieldColumns['����'].Index := poWeightSetConfig.netIndex;
  dg.FieldColumns['����'].Index := poWeightSetConfig.bundleIndex;
  dg.FieldColumns['ʵ��'].Index := poWeightSetConfig.realIndex;
  dg.FieldColumns['����'].Index := poWeightSetConfig.priceIndex;
  dg.FieldColumns['���'].Index := poWeightSetConfig.sumIndex;
  dg.FieldColumns['�۷�ϵ��'].Index := poWeightSetConfig.scaleIndex;
  dg.FieldColumns['����'].Index := poWeightSetConfig.quanterIndex;
  dg.FieldColumns['������'].Index := poWeightSetConfig.costIndex;
  dg.FieldColumns['ë��˾��Ա'].Index := poWeightSetConfig.grossManIndex;
  dg.FieldColumns['Ƥ��˾��Ա'].Index := poWeightSetConfig.tareManIndex;
  dg.FieldColumns['ë�ذ���'].Index := poWeightSetConfig.grossAddrIndex;
  dg.FieldColumns['Ƥ�ذ���'].Index := poWeightSetConfig.tareAddrIndex;
  dg.FieldColumns['ë��ʱ��'].Index := poWeightSetConfig.grossTimeIndex;
  dg.FieldColumns['Ƥ��ʱ��'].Index := poWeightSetConfig.tareTimeIndex;
  dg.FieldColumns['һ�ι���ʱ��'].Index := poWeightSetConfig.firstTimeIndex;
  dg.FieldColumns['���ι���ʱ��'].Index := poWeightSetConfig.secondTimeIndex;
  dg.FieldColumns['������'].Index := poWeightSetConfig.updateUserIndex;
  dg.FieldColumns['����ʱ��'].Index := poWeightSetConfig.updateTimeIndex;
  dg.FieldColumns['��ע'].Index := poWeightSetConfig.memoIndex;
  dg.FieldColumns['��ӡ����'].Index := poWeightSetConfig.printCountIndex;
  dg.FieldColumns['�ϴ���'].Index := poWeightSetConfig.uploadIndex;
  dg.FieldColumns['����1'].Index := poWeightSetConfig.backup1Index;
  dg.FieldColumns['����2'].Index := poWeightSetConfig.backup2Index;
  dg.FieldColumns['����3'].Index := poWeightSetConfig.backup3Index;
  dg.FieldColumns['����4'].Index := poWeightSetConfig.backup4Index;
  dg.FieldColumns['����5'].Index := poWeightSetConfig.backup5Index;
  dg.FieldColumns['����6'].Index := poWeightSetConfig.backup6Index;
  dg.FieldColumns['����7'].Index := poWeightSetConfig.backup7Index;
  dg.FieldColumns['����8'].Index := poWeightSetConfig.backup8Index;
  dg.FieldColumns['����9'].Index := poWeightSetConfig.backup9Index;
  dg.FieldColumns['����10'].Index := poWeightSetConfig.backup10Index;
  dg.FieldColumns['����11'].Index := poWeightSetConfig.backup11Index;
  dg.FieldColumns['����12'].Index := poWeightSetConfig.backup12Index;
  dg.FieldColumns['����13'].Index := poWeightSetConfig.backup13Index;
  dg.FieldColumns['����14'].Index := poWeightSetConfig.backup14Index;
  dg.FieldColumns['����15'].Index := poWeightSetConfig.backup15Index;
  dg.FieldColumns['����16'].Index := poWeightSetConfig.backup16Index;
  dg.FieldColumns['����17'].Index := poWeightSetConfig.backup17Index;
  dg.FieldColumns['����18'].Index := poWeightSetConfig.backup18Index;

  dg.FieldColumns['���'].Width := poWeightSetConfig.noWidth;
  dg.FieldColumns['��ˮ��'].Width := poWeightSetConfig.glideNoWidth;
  dg.FieldColumns['����'].Width := poWeightSetConfig.carWidth;
  dg.FieldColumns['��������'].Width := poWeightSetConfig.weightTypeWidth;
  dg.FieldColumns['������λ'].Width := poWeightSetConfig.faHuoWidth;
  dg.FieldColumns['�ջ���λ'].Width := poWeightSetConfig.shouHuoWidth;
  dg.FieldColumns['����'].Width := poWeightSetConfig.goodsWidth;
  dg.FieldColumns['���'].Width := poWeightSetConfig.specWidth;
  dg.FieldColumns['ë��'].Width := poWeightSetConfig.grossWidth;
  dg.FieldColumns['Ƥ��'].Width := poWeightSetConfig.tareWidth;
  dg.FieldColumns['����'].Width := poWeightSetConfig.netWidth;
  dg.FieldColumns['����'].Width := poWeightSetConfig.bundleWidth;
  dg.FieldColumns['ʵ��'].Width := poWeightSetConfig.realWidth;
  dg.FieldColumns['����'].Width := poWeightSetConfig.priceWidth;
  dg.FieldColumns['���'].Width := poWeightSetConfig.sumWidth;
  dg.FieldColumns['�۷�ϵ��'].Width := poWeightSetConfig.scaleWidth;
  dg.FieldColumns['����'].Width := poWeightSetConfig.quanterWidth;
  dg.FieldColumns['������'].Width := poWeightSetConfig.costWidth;
  dg.FieldColumns['ë��˾��Ա'].Width := poWeightSetConfig.grossManWidth;
  dg.FieldColumns['Ƥ��˾��Ա'].Width := poWeightSetConfig.tareManWidth;
  dg.FieldColumns['ë�ذ���'].Width := poWeightSetConfig.grossAddrWidth;
  dg.FieldColumns['Ƥ�ذ���'].Width := poWeightSetConfig.tareAddrWidth;
  dg.FieldColumns['ë��ʱ��'].Width := poWeightSetConfig.grossTimeWidth;
  dg.FieldColumns['Ƥ��ʱ��'].Width := poWeightSetConfig.tareTimeWidth;
  dg.FieldColumns['һ�ι���ʱ��'].Width := poWeightSetConfig.firstTimeWidth;
  dg.FieldColumns['���ι���ʱ��'].Width := poWeightSetConfig.secondTimeWidth;
  dg.FieldColumns['������'].Width := poWeightSetConfig.updateUserWidth;
  dg.FieldColumns['����ʱ��'].Width := poWeightSetConfig.updateTimeWidth;
  dg.FieldColumns['��ע'].Width := poWeightSetConfig.memoWidth;
  dg.FieldColumns['��ӡ����'].Width := poWeightSetConfig.printCountWidth;
  dg.FieldColumns['�ϴ���'].Width := poWeightSetConfig.uploadWidth;
  dg.FieldColumns['����1'].Width := poWeightSetConfig.backup1Width;
  dg.FieldColumns['����2'].Width := poWeightSetConfig.backup2Width;
  dg.FieldColumns['����3'].Width := poWeightSetConfig.backup3Width;
  dg.FieldColumns['����4'].Width := poWeightSetConfig.backup4Width;
  dg.FieldColumns['����5'].Width := poWeightSetConfig.backup5Width;
  dg.FieldColumns['����6'].Width := poWeightSetConfig.backup6Width;
  dg.FieldColumns['����7'].Width := poWeightSetConfig.backup7Width;
  dg.FieldColumns['����8'].Width := poWeightSetConfig.backup8Width;
  dg.FieldColumns['����9'].Width := poWeightSetConfig.backup9Width;
  dg.FieldColumns['����10'].Width := poWeightSetConfig.backup10Width;
  dg.FieldColumns['����11'].Width := poWeightSetConfig.backup11Width;
  dg.FieldColumns['����12'].Width := poWeightSetConfig.backup12Width;
  dg.FieldColumns['����13'].Width := poWeightSetConfig.backup13Width;
  dg.FieldColumns['����14'].Width := poWeightSetConfig.backup14Width;
  dg.FieldColumns['����15'].Width := poWeightSetConfig.backup15Width;
  dg.FieldColumns['����16'].Width := poWeightSetConfig.backup16Width;
  dg.FieldColumns['����17'].Width := poWeightSetConfig.backup17Width;
  dg.FieldColumns['����18'].Width := poWeightSetConfig.backup18Width;
end;

procedure TMainForm.saveDBGrid(dg: TDBGridEh);
var myini: TiniFile;
begin
  myini := Tinifile.Create(ExtractFilePath(ParamStr(0)) + '\design.ini');
  try
    myini.WriteBool('formDesign', 'no', dg.FieldColumns['���'].Visible);
    myini.WriteBool('formDesign', 'glideNo', dg.FieldColumns['��ˮ��'].Visible);
    myini.WriteBool('formDesign', 'car', dg.FieldColumns['����'].Visible);
    myini.WriteBool('formDesign', 'weightType', dg.FieldColumns['��������'].Visible);
    myini.WriteBool('formDesign', 'faHuo', dg.FieldColumns['������λ'].Visible);
    myini.WriteBool('formDesign', 'shouHuo', dg.FieldColumns['�ջ���λ'].Visible);
    myini.WriteBool('formDesign', 'goods', dg.FieldColumns['����'].Visible);
    myini.WriteBool('formDesign', 'spec', dg.FieldColumns['���'].Visible);
    myini.WriteBool('formDesign', 'gross', dg.FieldColumns['ë��'].Visible);
    myini.WriteBool('formDesign', 'tare', dg.FieldColumns['Ƥ��'].Visible);
    myini.WriteBool('formDesign', 'net', dg.FieldColumns['����'].Visible);
    myini.WriteBool('formDesign', 'bundle', dg.FieldColumns['����'].Visible);
    myini.WriteBool('formDesign', 'real', dg.FieldColumns['ʵ��'].Visible);
    myini.WriteBool('formDesign', 'price', dg.FieldColumns['����'].Visible);
    myini.WriteBool('formDesign', 'sum', dg.FieldColumns['���'].Visible);
    myini.WriteBool('formDesign', 'scale', dg.FieldColumns['�۷�ϵ��'].Visible);
    myini.WriteBool('formDesign', 'quanter', dg.FieldColumns['����'].Visible);
    myini.WriteBool('formDesign', 'cost', dg.FieldColumns['������'].Visible);
    myini.WriteBool('formDesign', 'grossMan', dg.FieldColumns['ë��˾��Ա'].Visible);
    myini.WriteBool('formDesign', 'tareMan', dg.FieldColumns['Ƥ��˾��Ա'].Visible);
    myini.WriteBool('formDesign', 'grossAddr', dg.FieldColumns['ë�ذ���'].Visible);
    myini.WriteBool('formDesign', 'tareAddr', dg.FieldColumns['Ƥ�ذ���'].Visible);
    myini.WriteBool('formDesign', 'grossTime', dg.FieldColumns['ë��ʱ��'].Visible);
    myini.WriteBool('formDesign', 'tareTime', dg.FieldColumns['Ƥ��ʱ��'].Visible);
    myini.WriteBool('formDesign', 'firstTime', dg.FieldColumns['һ�ι���ʱ��'].Visible);
    myini.WriteBool('formDesign', 'secondTime', dg.FieldColumns['���ι���ʱ��'].Visible);
    myini.WriteBool('formDesign', 'updateUser', dg.FieldColumns['������'].Visible);
    myini.WriteBool('formDesign', 'updateTime', dg.FieldColumns['����ʱ��'].Visible);
    myini.WriteBool('formDesign', 'remark', dg.FieldColumns['��ע'].Visible);
    myini.WriteBool('formDesign', 'printCount', dg.FieldColumns['��ӡ����'].Visible);
    myini.WriteBool('formDesign', 'upload', dg.FieldColumns['�ϴ���'].Visible);
    myini.WriteBool('formDesign', 'backup1', dg.FieldColumns['����1'].Visible);
    myini.WriteBool('formDesign', 'backup2', dg.FieldColumns['����2'].Visible);
    myini.WriteBool('formDesign', 'backup3', dg.FieldColumns['����3'].Visible);
    myini.WriteBool('formDesign', 'backup4', dg.FieldColumns['����4'].Visible);
    myini.WriteBool('formDesign', 'backup5', dg.FieldColumns['����5'].Visible);
    myini.WriteBool('formDesign', 'backup6', dg.FieldColumns['����6'].Visible);
    myini.WriteBool('formDesign', 'backup7', dg.FieldColumns['����7'].Visible);
    myini.WriteBool('formDesign', 'backup8', dg.FieldColumns['����8'].Visible);
    myini.WriteBool('formDesign', 'backup9', dg.FieldColumns['����9'].Visible);
    myini.WriteBool('formDesign', 'backup10', dg.FieldColumns['����10'].Visible);
    myini.WriteBool('formDesign', 'backup11', dg.FieldColumns['����11'].Visible);
    myini.WriteBool('formDesign', 'backup12', dg.FieldColumns['����12'].Visible);
    myini.WriteBool('formDesign', 'backup13', dg.FieldColumns['����13'].Visible);
    myini.WriteBool('formDesign', 'backup14', dg.FieldColumns['����14'].Visible);
    myini.WriteBool('formDesign', 'backup15', dg.FieldColumns['����15'].Visible);
    myini.WriteBool('formDesign', 'backup16', dg.FieldColumns['����16'].Visible);
    myini.WriteBool('formDesign', 'backup17', dg.FieldColumns['����17'].Visible);
    myini.WriteBool('formDesign', 'backup18', dg.FieldColumns['����18'].Visible);

    myini.WriteString('formDesign', 'noCaption', dg.FieldColumns['���'].Title.Caption);
    myini.WriteString('formDesign', 'glideNoCaption', dg.FieldColumns['��ˮ��'].Title.Caption);
    myini.WriteString('formDesign', 'carCaption', dg.FieldColumns['����'].Title.Caption);
    myini.WriteString('formDesign', 'weightTypeCaption', dg.FieldColumns['��������'].Title.Caption);
    myini.WriteString('formDesign', 'faHuoCaption', dg.FieldColumns['������λ'].Title.Caption);
    myini.WriteString('formDesign', 'shouHuoCaption', dg.FieldColumns['�ջ���λ'].Title.Caption);
    myini.WriteString('formDesign', 'goodsCaption', dg.FieldColumns['����'].Title.Caption);
    myini.WriteString('formDesign', 'specCaption', dg.FieldColumns['���'].Title.Caption);
    myini.WriteString('formDesign', 'grossCaption', dg.FieldColumns['ë��'].Title.Caption);
    myini.WriteString('formDesign', 'tareCaption', dg.FieldColumns['Ƥ��'].Title.Caption);
    myini.WriteString('formDesign', 'netCaption', dg.FieldColumns['����'].Title.Caption);
    myini.WriteString('formDesign', 'bundleCaption', dg.FieldColumns['����'].Title.Caption);
    myini.WriteString('formDesign', 'realCaption', dg.FieldColumns['ʵ��'].Title.Caption);
    myini.WriteString('formDesign', 'priceCaption', dg.FieldColumns['����'].Title.Caption);
    myini.WriteString('formDesign', 'sumCaption', dg.FieldColumns['���'].Title.Caption);
    myini.WriteString('formDesign', 'scaleCaption', dg.FieldColumns['�۷�ϵ��'].Title.Caption);
    myini.WriteString('formDesign', 'quanterCaption', dg.FieldColumns['����'].Title.Caption);
    myini.WriteString('formDesign', 'costCaption', dg.FieldColumns['������'].Title.Caption);
    myini.WriteString('formDesign', 'grossManCaption', dg.FieldColumns['ë��˾��Ա'].Title.Caption);
    myini.WriteString('formDesign', 'tareManCaption', dg.FieldColumns['Ƥ��˾��Ա'].Title.Caption);
    myini.WriteString('formDesign', 'grossAddrCaption', dg.FieldColumns['ë�ذ���'].Title.Caption);
    myini.WriteString('formDesign', 'tareAddrCaption', dg.FieldColumns['Ƥ�ذ���'].Title.Caption);
    myini.WriteString('formDesign', 'grossTimeCaption', dg.FieldColumns['ë��ʱ��'].Title.Caption);
    myini.WriteString('formDesign', 'tareTimeCaption', dg.FieldColumns['Ƥ��ʱ��'].Title.Caption);
    myini.WriteString('formDesign', 'firstTimeCaption', dg.FieldColumns['һ�ι���ʱ��'].Title.Caption);
    myini.WriteString('formDesign', 'secondTimeCaption', dg.FieldColumns['���ι���ʱ��'].Title.Caption);
    myini.WriteString('formDesign', 'updateUserCaption', dg.FieldColumns['������'].Title.Caption);
    myini.WriteString('formDesign', 'updateTimeCaption', dg.FieldColumns['����ʱ��'].Title.Caption);
    myini.WriteString('formDesign', 'remarkCaption', dg.FieldColumns['��ע'].Title.Caption);
    myini.WriteString('formDesign', 'printCountCaption', dg.FieldColumns['��ӡ����'].Title.Caption);
    myini.WriteString('formDesign', 'uploadCaption', dg.FieldColumns['�ϴ���'].Title.Caption);
    myini.WriteString('formDesign', 'backup1Caption', dg.FieldColumns['����1'].Title.Caption);
    myini.WriteString('formDesign', 'backup2Caption', dg.FieldColumns['����2'].Title.Caption);
    myini.WriteString('formDesign', 'backup3Caption', dg.FieldColumns['����3'].Title.Caption);
    myini.WriteString('formDesign', 'backup4Caption', dg.FieldColumns['����4'].Title.Caption);
    myini.WriteString('formDesign', 'backup5Caption', dg.FieldColumns['����5'].Title.Caption);
    myini.WriteString('formDesign', 'backup6Caption', dg.FieldColumns['����6'].Title.Caption);
    myini.WriteString('formDesign', 'backup7Caption', dg.FieldColumns['����7'].Title.Caption);
    myini.WriteString('formDesign', 'backup8Caption', dg.FieldColumns['����8'].Title.Caption);
    myini.WriteString('formDesign', 'backup9Caption', dg.FieldColumns['����9'].Title.Caption);
    myini.WriteString('formDesign', 'backup10Caption', dg.FieldColumns['����10'].Title.Caption);
    myini.WriteString('formDesign', 'backup11Caption', dg.FieldColumns['����11'].Title.Caption);
    myini.WriteString('formDesign', 'backup12Caption', dg.FieldColumns['����12'].Title.Caption);
    myini.WriteString('formDesign', 'backup13Caption', dg.FieldColumns['����13'].Title.Caption);
    myini.WriteString('formDesign', 'backup14Caption', dg.FieldColumns['����14'].Title.Caption);
    myini.WriteString('formDesign', 'backup15Caption', dg.FieldColumns['����15'].Title.Caption);
    myini.WriteString('formDesign', 'backup16Caption', dg.FieldColumns['����16'].Title.Caption);
    myini.WriteString('formDesign', 'backup17Caption', dg.FieldColumns['����17'].Title.Caption);
    myini.WriteString('formDesign', 'backup18Caption', dg.FieldColumns['����18'].Title.Caption);

    myini.WriteInteger('formDesign', 'noIndex', dg.FieldColumns['���'].Index);
    myini.WriteInteger('formDesign', 'glideNoIndex', dg.FieldColumns['��ˮ��'].Index);
    myini.WriteInteger('formDesign', 'carIndex', dg.FieldColumns['����'].Index);
    myini.WriteInteger('formDesign', 'weightTypeIndex', dg.FieldColumns['��������'].Index);
    myini.WriteInteger('formDesign', 'faHuoIndex', dg.FieldColumns['������λ'].Index);
    myini.WriteInteger('formDesign', 'shouHuoIndex', dg.FieldColumns['�ջ���λ'].Index);
    myini.WriteInteger('formDesign', 'goodsIndex', dg.FieldColumns['����'].Index);
    myini.WriteInteger('formDesign', 'specIndex', dg.FieldColumns['���'].Index);
    myini.WriteInteger('formDesign', 'grossIndex', dg.FieldColumns['ë��'].Index);
    myini.WriteInteger('formDesign', 'tareIndex', dg.FieldColumns['Ƥ��'].Index);
    myini.WriteInteger('formDesign', 'netIndex', dg.FieldColumns['����'].Index);
    myini.WriteInteger('formDesign', 'bundleIndex', dg.FieldColumns['����'].Index);
    myini.WriteInteger('formDesign', 'realIndex', dg.FieldColumns['ʵ��'].Index);
    myini.WriteInteger('formDesign', 'priceIndex', dg.FieldColumns['����'].Index);
    myini.WriteInteger('formDesign', 'sumIndex', dg.FieldColumns['���'].Index);
    myini.WriteInteger('formDesign', 'scaleIndex', dg.FieldColumns['�۷�ϵ��'].Index);
    myini.WriteInteger('formDesign', 'quanterIndex', dg.FieldColumns['����'].Index);
    myini.WriteInteger('formDesign', 'costIndex', dg.FieldColumns['������'].Index);
    myini.WriteInteger('formDesign', 'grossManIndex', dg.FieldColumns['ë��˾��Ա'].Index);
    myini.WriteInteger('formDesign', 'tareManIndex', dg.FieldColumns['Ƥ��˾��Ա'].Index);
    myini.WriteInteger('formDesign', 'grossAddrIndex', dg.FieldColumns['ë�ذ���'].Index);
    myini.WriteInteger('formDesign', 'tareAddrIndex', dg.FieldColumns['Ƥ�ذ���'].Index);
    myini.WriteInteger('formDesign', 'grossTimeIndex', dg.FieldColumns['ë��ʱ��'].Index);
    myini.WriteInteger('formDesign', 'tareTimeIndex', dg.FieldColumns['Ƥ��ʱ��'].Index);
    myini.WriteInteger('formDesign', 'firstTimeIndex', dg.FieldColumns['һ�ι���ʱ��'].Index);
    myini.WriteInteger('formDesign', 'secondTimeIndex', dg.FieldColumns['���ι���ʱ��'].Index);
    myini.WriteInteger('formDesign', 'updateUserIndex', dg.FieldColumns['������'].Index);
    myini.WriteInteger('formDesign', 'updateTimeIndex', dg.FieldColumns['����ʱ��'].Index);
    myini.WriteInteger('formDesign', 'remarkIndex', dg.FieldColumns['��ע'].Index);
    myini.WriteInteger('formDesign', 'printCountIndex', dg.FieldColumns['��ӡ����'].Index);
    myini.WriteInteger('formDesign', 'uploadIndex', dg.FieldColumns['�ϴ���'].Index);
    myini.WriteInteger('formDesign', 'backup1Index', dg.FieldColumns['����1'].Index);
    myini.WriteInteger('formDesign', 'backup2Index', dg.FieldColumns['����2'].Index);
    myini.WriteInteger('formDesign', 'backup3Index', dg.FieldColumns['����3'].Index);
    myini.WriteInteger('formDesign', 'backup4Index', dg.FieldColumns['����4'].Index);
    myini.WriteInteger('formDesign', 'backup5Index', dg.FieldColumns['����5'].Index);
    myini.WriteInteger('formDesign', 'backup6Index', dg.FieldColumns['����6'].Index);
    myini.WriteInteger('formDesign', 'backup7Index', dg.FieldColumns['����7'].Index);
    myini.WriteInteger('formDesign', 'backup8Index', dg.FieldColumns['����8'].Index);
    myini.WriteInteger('formDesign', 'backup9Index', dg.FieldColumns['����9'].Index);
    myini.WriteInteger('formDesign', 'backup10Index', dg.FieldColumns['����10'].Index);
    myini.WriteInteger('formDesign', 'backup11Index', dg.FieldColumns['����11'].Index);
    myini.WriteInteger('formDesign', 'backup12Index', dg.FieldColumns['����12'].Index);
    myini.WriteInteger('formDesign', 'backup13Index', dg.FieldColumns['����13'].Index);
    myini.WriteInteger('formDesign', 'backup14Index', dg.FieldColumns['����14'].Index);
    myini.WriteInteger('formDesign', 'backup15Index', dg.FieldColumns['����15'].Index);
    myini.WriteInteger('formDesign', 'backup16Index', dg.FieldColumns['����16'].Index);
    myini.WriteInteger('formDesign', 'backup17Index', dg.FieldColumns['����17'].Index);
    myini.WriteInteger('formDesign', 'backup18Index', dg.FieldColumns['����18'].Index);

    myini.WriteInteger('formDesign', 'noWidth', dg.FieldColumns['���'].Width);
    myini.WriteInteger('formDesign', 'glideNoWidth', dg.FieldColumns['��ˮ��'].Width);
    myini.WriteInteger('formDesign', 'carWidth', dg.FieldColumns['����'].Width);
    myini.WriteInteger('formDesign', 'weightTypeWidth', dg.FieldColumns['��������'].Width);
    myini.WriteInteger('formDesign', 'faHuoWidth', dg.FieldColumns['������λ'].Width);
    myini.WriteInteger('formDesign', 'shouHuoWidth', dg.FieldColumns['�ջ���λ'].Width);
    myini.WriteInteger('formDesign', 'goodsWidth', dg.FieldColumns['����'].Width);
    myini.WriteInteger('formDesign', 'specWidth', dg.FieldColumns['���'].Width);
    myini.WriteInteger('formDesign', 'grossWidth', dg.FieldColumns['ë��'].Width);
    myini.WriteInteger('formDesign', 'tareWidth', dg.FieldColumns['Ƥ��'].Width);
    myini.WriteInteger('formDesign', 'netWidth', dg.FieldColumns['����'].Width);
    myini.WriteInteger('formDesign', 'bundleWidth', dg.FieldColumns['����'].Width);
    myini.WriteInteger('formDesign', 'realWidth', dg.FieldColumns['ʵ��'].Width);
    myini.WriteInteger('formDesign', 'priceWidth', dg.FieldColumns['����'].Width);
    myini.WriteInteger('formDesign', 'sumWidth', dg.FieldColumns['���'].Width);
    myini.WriteInteger('formDesign', 'scaleWidth', dg.FieldColumns['�۷�ϵ��'].Width);
    myini.WriteInteger('formDesign', 'quanterWidth', dg.FieldColumns['����'].Width);
    myini.WriteInteger('formDesign', 'costWidth', dg.FieldColumns['������'].Width);
    myini.WriteInteger('formDesign', 'grossManWidth', dg.FieldColumns['ë��˾��Ա'].Width);
    myini.WriteInteger('formDesign', 'tareManWidth', dg.FieldColumns['Ƥ��˾��Ա'].Width);
    myini.WriteInteger('formDesign', 'grossAddrWidth', dg.FieldColumns['ë�ذ���'].Width);
    myini.WriteInteger('formDesign', 'tareAddrWidth', dg.FieldColumns['Ƥ�ذ���'].Width);
    myini.WriteInteger('formDesign', 'grossTimeWidth', dg.FieldColumns['ë��ʱ��'].Width);
    myini.WriteInteger('formDesign', 'tareTimeWidth', dg.FieldColumns['Ƥ��ʱ��'].Width);
    myini.WriteInteger('formDesign', 'firstTimeWidth', dg.FieldColumns['һ�ι���ʱ��'].Width);
    myini.WriteInteger('formDesign', 'secondTimeWidth', dg.FieldColumns['���ι���ʱ��'].Width);
    myini.WriteInteger('formDesign', 'updateUserWidth', dg.FieldColumns['������'].Width);
    myini.WriteInteger('formDesign', 'updateTimeWidth', dg.FieldColumns['����ʱ��'].Width);
    myini.WriteInteger('formDesign', 'remarkWidth', dg.FieldColumns['��ע'].Width);
    myini.WriteInteger('formDesign', 'printCountWidth', dg.FieldColumns['��ӡ����'].Width);
    myini.WriteInteger('formDesign', 'uploadWidth', dg.FieldColumns['�ϴ���'].Width);
    myini.WriteInteger('formDesign', 'backup1Width', dg.FieldColumns['����1'].Width);
    myini.WriteInteger('formDesign', 'backup2Width', dg.FieldColumns['����2'].Width);
    myini.WriteInteger('formDesign', 'backup3Width', dg.FieldColumns['����3'].Width);
    myini.WriteInteger('formDesign', 'backup4Width', dg.FieldColumns['����4'].Width);
    myini.WriteInteger('formDesign', 'backup5Width', dg.FieldColumns['����5'].Width);
    myini.WriteInteger('formDesign', 'backup6Width', dg.FieldColumns['����6'].Width);
    myini.WriteInteger('formDesign', 'backup7Width', dg.FieldColumns['����7'].Width);
    myini.WriteInteger('formDesign', 'backup8Width', dg.FieldColumns['����8'].Width);
    myini.WriteInteger('formDesign', 'backup9Width', dg.FieldColumns['����9'].Width);
    myini.WriteInteger('formDesign', 'backup10Width', dg.FieldColumns['����10'].Width);
    myini.WriteInteger('formDesign', 'backup11Width', dg.FieldColumns['����11'].Width);
    myini.WriteInteger('formDesign', 'backup12Width', dg.FieldColumns['����12'].Width);
    myini.WriteInteger('formDesign', 'backup13Width', dg.FieldColumns['����13'].Width);
    myini.WriteInteger('formDesign', 'backup14Width', dg.FieldColumns['����14'].Width);
    myini.WriteInteger('formDesign', 'backup15Width', dg.FieldColumns['����15'].Width);
    myini.WriteInteger('formDesign', 'backup16Width', dg.FieldColumns['����16'].Width);
    myini.WriteInteger('formDesign', 'backup17Width', dg.FieldColumns['����17'].Width);
    myini.WriteInteger('formDesign', 'backup18Width', dg.FieldColumns['����18'].Width);
  finally
    myini.Free;
  end;
end;

procedure TMainForm.setExportWeightCheat;
var cheat: Double;
begin
  if systemConfig.exportToWeight then
  begin
    if systemConfig.cweightFlag1 then cheat := systemConfig.cweight1
    else if systemConfig.cweightFlag2 then cheat := systemConfig.cweight2
    else if systemConfig.cweightFlag3 then cheat := systemConfig.cweight3
    else if systemConfig.cweightFlag4 then cheat := systemConfig.cweight4
    else if systemConfig.cweightFlag5 then cheat := systemConfig.cweight5
    else if systemConfig.cweightFlag6 then cheat := systemConfig.cweight6
    else if systemConfig.cweightFlag7 then cheat := systemConfig.cweight7
    else if systemConfig.cweightFlag8 then cheat := systemConfig.cweight8
    else cheat := 0;
    case systemConfig.exportItem of
      0: FrmWeight1.CBCar.Text := FloatToStr(cheat);
      1: FrmWeight1.CBFaHuo.Text := FloatToStr(cheat);
      2: FrmWeight1.CBShouHuo.Text := FloatToStr(cheat);
      3: FrmWeight1.CBGoods.Text := FloatToStr(cheat);
      4: FrmWeight1.CBSpec.Text := FloatToStr(cheat);
      5: FrmWeight1.EdtBundle.Text := FloatToStr(cheat);
      6: FrmWeight1.EdtPrice.Text := FloatToStr(cheat);
      7: FrmWeight1.EdtScale.Text := FloatToStr(cheat);
      8: FrmWeight1.CBBackup1.Text := FloatToStr(cheat);
      9: FrmWeight1.CBBackup2.Text := FloatToStr(cheat);
      10: FrmWeight1.CBBackup3.Text := FloatToStr(cheat);
      11: FrmWeight1.CBBackup4.Text := FloatToStr(cheat);
      12: FrmWeight1.CBBackup5.Text := FloatToStr(cheat);
      13: FrmWeight1.EdtBackup6.Text := FloatToStr(cheat);
      14: FrmWeight1.EdtBackup7.Text := FloatToStr(cheat);
      15: FrmWeight1.EdtBackup8.Text := FloatToStr(cheat);
      16: FrmWeight1.EdtBackup9.Text := FloatToStr(cheat);
      17: FrmWeight1.CBBackup10.Text := FloatToStr(cheat);
      18: FrmWeight1.CBBackup11.Text := FloatToStr(cheat);
      19: FrmWeight1.CBBackup12.Text := FloatToStr(cheat);
      20: FrmWeight1.CBBackup13.Text := FloatToStr(cheat);
      21: FrmWeight1.CBBackup14.Text := FloatToStr(cheat);
      22: FrmWeight1.EdtBackup15.Text := FloatToStr(cheat);
      23: FrmWeight1.EdtBackup16.Text := FloatToStr(cheat);
      24: FrmWeight1.EdtBackup17.Text := FloatToStr(cheat);
      25: FrmWeight1.EdtBackup18.Text := FloatToStr(cheat);
    end;
  end;
end;

procedure TMainForm.SMScanTicketClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('��ӡ����') then
  begin
    Application.CreateForm(TScanTicketForm, ScanTicketForm);
    try
      ScanTicketForm.ShowModal;
    finally
      ScanTicketForm.Free;
    end;
  end;
end;

procedure TMainForm.SMScanReportClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('��ӡ����') then
  begin
    Application.CreateForm(TScanReportForm, ScanReportForm);
    try
      ScanReportForm.ShowModal;
    finally
      ScanReportForm.Free;
    end;
  end;
end;

procedure TMainForm.ADefineExecute(Sender: TObject);
var s: string;
begin
  s := TCommonUtil.deBase64AndDecompress(TIniFile.Create('weightSysInfo.ini').ReadString('system_set', 'pass', 'eJwrLy/XS6tKLCnXS87PBQAk2QUt'));
  if s = InputBox('', '����������      ', '') then
  begin
    Application.CreateForm(TLoginInfoForm, LoginInfoForm);
    try
      LoginInfoForm.ShowModal;
    finally
      LoginInfoForm.Free;
    end;
  end;
end;

procedure TMainForm.ShowJson1Click(Sender: TObject);
var w: TWeightRecord;
begin
  w := TWeightRecord.Create;
  try
    if TWeightRecordUtil.get(
      DBGridEh1.DataSource.DataSet.FieldByName('��ˮ��').AsString, w) then
    begin
      ShowMessage(w.toJsonString);
    end;
  finally
    w.Free;
  end;
end;

procedure TMainForm.N5Click(Sender: TObject);
var w: TWeightRecord;
begin
  w := TWeightRecord.Create;
  try
    if TWeightRecordUtil.get(
      DBGridEh1.DataSource.DataSet.FieldByName('��ˮ��').AsString, w) then
    begin
      ShowMessage(Utf8ToAnsi( w.toXmlString));
    end;
  finally
    w.Free;
  end;
end;

end.

