unit SoftwareSet;

interface

uses
  Windows, Classes, Controls, Forms, ExtCtrls, ComCtrls, StdCtrls,
  Buttons, Spin, Registry, SysUtils, inifiles, Printers;

type
  TSoftwareSetForm = class(TForm)
    PCMain: TPageControl;
    TSBase: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    EdtCompany: TEdit;
    Label2: TLabel;
    EdtTel: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    TSWeightSet: TTabSheet;
    CBEnterAsTab: TCheckBox;
    CBAutoDropDown: TCheckBox;
    TSCostSet: TTabSheet;
    CBDelHistory: TCheckBox;
    CBShowPrepare: TCheckBox;
    CBAllowSecondTare: TCheckBox;
    CBAllowSecondGross: TCheckBox;
    Label4: TLabel;
    CBMeterUnit: TComboBox;
    Label9: TLabel;
    CBSoftUnit: TComboBox;
    CBWriteTare: TCheckBox;
    CBUseCode: TCheckBox;
    CBAutoComplete: TCheckBox;
    CBWaitForZero: TCheckBox;
    CBVoice: TCheckBox;
    CBUseBundleRate: TCheckBox;
    CBManualInput: TCheckBox;
    LEPoint: TLabeledEdit;
    CBUsePound: TCheckBox;
    GBScale: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    EdtPound1: TEdit;
    EdtPound2: TEdit;
    EdtPound3: TEdit;
    EdtPound4: TEdit;
    EdtPound5: TEdit;
    EdtPound6: TEdit;
    EdtInitial: TLabeledEdit;
    EdtUnit: TLabeledEdit;
    EdtUnit2: TLabeledEdit;
    GBCostType: TGroupBox;
    RBTwo: TRadioButton;
    RBGross: TRadioButton;
    RBNet: TRadioButton;
    CBAllowNotSteady: TCheckBox;
    CBSelectTicketBeforePrint: TCheckBox;
    CBTareDiff: TCheckBox;
    LEAddr: TLabeledEdit;
    CBPrinter1: TComboBox;
    Label12: TLabel;
    CBPay: TCheckBox;
    TSWeightSetII: TTabSheet;
    Label15: TLabel;
    LETimeOut: TLabeledEdit;
    Label7: TLabel;
    LEBackRecord: TLabeledEdit;
    LEReturnZero: TLabeledEdit;
    SEDropDownCount: TSpinEdit;
    LESumPoint: TLabeledEdit;
    Label13: TLabel;
    SESteadyCount: TSpinEdit;
    LETareDiff: TLabeledEdit;
    Label3: TLabel;
    GBGlideNoRule: TGroupBox;
    Label10: TLabel;
    Label17: TLabel;
    CBGlideCode1: TComboBox;
    EdtGlideLength: TEdit;
    CBSavePicLocal: TCheckBox;
    CBUseLastTare: TCheckBox;
    LEMax: TLabeledEdit;
    LEDatabaseAlarm: TLabeledEdit;
    GBTicketType: TGroupBox;
    RBFirstGeneration: TRadioButton;
    RBSecondGeneration: TRadioButton;
    CBSay: TCheckBox;
    CBBackRecord: TCheckBox;
    Label16: TLabel;
    LEPrinterBackRow: TLabeledEdit;
    BtnTestPrinter: TBitBtn;
    CBAutoSavePrepare: TCheckBox;
    CBUseWeightLine: TCheckBox;
    Label19: TLabel;
    CBPrinter2: TComboBox;
    TSOther: TTabSheet;
    CBXMLExport: TCheckBox;
    GBXMLType: TGroupBox;
    RBAttr: TRadioButton;
    RBChild: TRadioButton;
    CBAutoRun: TCheckBox;
    CBAutoShutdown: TCheckBox;
    DTPClose: TDateTimePicker;
    LERange: TLabeledEdit;
    CBAllowModifyPrice: TCheckBox;
    CBPrintNet: TCheckBox;
    CBReadLocal: TCheckBox;
    LECompleteHint: TLabeledEdit;
    LEMeterShowMode: TLabeledEdit;
    LEReportTitle: TLabeledEdit;
    CBPrintAfterSave: TCheckBox;
    LECarOutHint: TLabeledEdit;
    Label20: TLabel;
    CBGlideCode2: TComboBox;
    CBUseTimeOutLimit: TCheckBox;
    LESumDivide: TLabeledEdit;
    LEPicCount: TLabeledEdit;
    GBSaveType: TGroupBox;
    RBSaveBySteady: TRadioButton;
    RBSaveByTime: TRadioButton;
    lblSaveByIntervalHint: TLabel;
    lblSaveByTimeHint: TLabel;
    SEInterval: TSpinEdit;
    lblSecond: TLabel;
    LETicketSelHeight: TLabeledEdit;
    RGSumType: TRadioGroup;
    CBPayType: TComboBox;
    Label18: TLabel;
    TBVoiceRate: TTrackBar;
    lblVoice: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure EdtTelKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CBAutoShutdownClick(Sender: TObject);
    procedure BtnTestPrinterClick(Sender: TObject);
  private
    { Private declarations }
    myini: Tinifile;
  public
    { Public declarations }
    //////////////////////////////////////////
    function loadBasic(): Boolean;
    function writeBasic(): Boolean;
    //////////////////////////////////////////////
    function loadWeightSet(): Boolean;
    function writeWeightSet(): Boolean;
    /////////////////////////////////////////////
    function loadWeightSetII(): Boolean;
    function writeWeightSetII(): Boolean;
    //////////////////////////////////////////////
    function loadCostSet(): Boolean;
    function writeCostSet(): Boolean;
    /////////////////////////////////////////////
    function loadOther(): Boolean;
    function writeOther(): Boolean;
  end;

var
  SoftwareSetForm: TSoftwareSetForm;

implementation

uses Main, MeterConnect1, MeterConnect2, CommonUtil;

{$R *.dfm}

procedure TSoftwareSetForm.BitBtn1Click(Sender: TObject);
begin
  writeBasic;
  writeWeightSet;
  writeWeightSetII;
  writeCostSet;
  writeOther;
end;

procedure TSoftwareSetForm.FormShow(Sender: TObject);
begin
  myini := Tinifile.Create(ExtractFilePath(ParamStr(0)) + '\setup.ini');
  loadBasic;
  loadWeightSet;
  loadWeightSetII;
  loadCostSet;
  loadOther;
  PCMain.ActivePageIndex := 0
end;

procedure TSoftwareSetForm.BitBtn2Click(Sender: TObject);
begin
  Close
end;

procedure TSoftwareSetForm.EdtTelKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', '-', '.', #8]) then
    Key := #0
end;

function TSoftwareSetForm.loadBasic: Boolean;
var i: Integer;
begin
  EdtCompany.Text := myini.ReadString('system_set', 'company', '');
  EdtTel.Text := myini.ReadString('system_set', 'tel', '');
  CBMeterUnit.ItemIndex := myini.ReadInteger('system_set', 'meter_unit_index', 0);
  CBSoftUnit.ItemIndex := myini.ReadInteger('system_set', 'soft_unit_index', 0);

  LEAddr.Text := myini.ReadString('system_set', 'addr', 'A');

  RBFirstGeneration.Checked := myini.ReadInteger('system_set', 'ticket_type', 1) = 1;
  RBSecondGeneration.Checked := myini.ReadInteger('system_set', 'ticket_type', 1) = 2;

  CBPrinter1.Items.Clear; //ö�ٱ��ش�ӡ��
  CBPrinter2.Items.Clear;
  for i := 0 to Printer.Printers.Count - 1 do
  begin
    CBPrinter1.Items.Add(Printer.Printers.Strings[i]);
    CBPrinter2.Items.Add(Printer.Printers.Strings[i]);
  end;
  CBPrinter1.Items.Add('Default');
  CBPrinter2.Items.Add('Default');

  CBPrinter1.Text := myini.ReadString('system_set', 'printer1', 'Default');
  CBPrinter2.Text := myini.ReadString('system_set', 'printer2', 'Default');

  CBReadLocal.Checked := myini.ReadBool('system_set', 'read_local', False);
end;

function TSoftwareSetForm.loadCostSet: Boolean;
begin
  //����������
  CBUsePound.Checked := myini.ReadBool('system_set', 'useCost', False);
  EdtInitial.Text := myini.ReadString('system_set', 'initCost', '5');
  EdtUnit.Text := myini.ReadString('system_set', 'unitCost1', '2');
  EdtUnit2.Text := myini.ReadString('system_set', 'unitCost2', '1');
  CBManualInput.Checked := myini.ReadBool('system_set', 'manualInputCost', False);
  EdtPound1.Text := myini.ReadString('system_set', 'grade1', '500');
  EdtPound2.Text := myini.ReadString('system_set', 'grade2', '10000');
  EdtPound3.Text := myini.ReadString('system_set', 'grade3', '10000');
  EdtPound4.Text := myini.ReadString('system_set', 'grade4', '100000');
  EdtPound5.Text := myini.ReadString('system_set', 'grade5', '100000');
  EdtPound6.Text := myini.ReadString('system_set', 'grade6', '120000');

  RBGross.Checked := myini.ReadInteger('system_set', 'costType', 1) = 1;
  RBTwo.Checked := myini.ReadInteger('system_set', 'costType', 1) = 2;
  RBNet.Checked := myini.ReadInteger('system_set', 'costType', 1) = 3;

  LEPoint.Text := myini.ReadString('system_set', 'point', '0');
end;

function TSoftwareSetForm.loadWeightSet: Boolean;
var i: Integer;
begin
  CBAutoDropDown.Checked := myini.ReadBool('system_set', 'autoDropDown', True);
  //�Զ���ȫ�б��
  CBAutoComplete.Checked := myini.ReadBool('system_set', 'autoComplete', False);
  CBEnterAsTab.Checked := myini.ReadBool('system_set', 'enterAsTab', True);
  //ÿ�ι���֮��Ҫ��������ٴ����복��
  CBWaitForZero.Checked := myini.ReadBool('system_set', 'waitForZero', False);
  CBUseBundleRate.Checked := myini.ReadBool('system_set', 'useBundleRate', False);
  CBDelHistory.Checked := myini.ReadBool('system_set', 'delHistory', False);
  CBAllowSecondTare.Checked := myini.ReadBool('system_set', 'allowSecondTare', False);
  CBAllowSecondGross.Checked := myini.ReadBool('system_set', 'allowSecondGross', False);
  //ÿ�ι��ճ�ʱ�Զ�Ԥ�ó�Ƥ
  CBWriteTare.Checked := myini.ReadBool('system_set', 'autoWriteTare', False);
  //������λ,�ջ���λ����Ϣ�ô�������
  CBUseCode.Checked := myini.ReadBool('system_set', 'useCode', True);
  //���ȶ�����
  CBAllowNotSteady.Checked := myini.ReadBool('system_set', 'allowNotSteady', False);
  CBShowPrepare.Checked := myini.ReadBool('system_set', 'showPrepare', False);
  CBVoice.Checked := myini.ReadBool('system_set', 'useVoice', False);
  //��̨�Զ��������С����
  LEBackRecord.Text := myini.ReadString('system_set', 'back_record_weight', '1000');
  //ÿ�γ��ش�ӡʱѡ�����
  CBSelectTicketBeforePrint.Checked := myini.ReadBool('system_set', 'selectTicketBeforePrint', False);
  //Ƥ�س���Ԥ��
  CBTareDiff.Checked := myini.ReadBool('system_set', 'useTareDiff', False);
  //�Ƿ����ÿ۷ѹ���
  CBPay.Checked := myini.ReadBool('system_set', 'pay', False);
  //ͼƬ����ڱ���
  CBSavePicLocal.Checked := myini.ReadBool('system_set', 'savePicLocal', True);
  //��ë��ʱ��ʾ�Ƿ�ʹ���ϴ�Ƥ��
  CBUseLastTare.Checked := myini.ReadBool('system_set', 'useLastTare', False);
  //�Զ�����Ԥ����Ϣ
  CBAutoSavePrepare.Checked := myini.ReadBool('system_set', 'auto_save_prepare', True);
  //������������
  CBUseWeightLine.Checked := myini.ReadBool('system_set', 'use_weight_line', False);
  //�����޸�Ԥ����Ϣ�����ĵ��ۺ��۷�ϵ��
  CBAllowModifyPrice.Checked := myini.ReadBool('system_set', 'allow_modify_price', True);
  //�Զ�����ģʽ�±�����Զ���ӡ
  CBPrintAfterSave.Checked := myini.ReadBool('system_set', 'print_after_save', False);
  //���ó�ʱ����
  CBUseTimeoutLimit.Checked := myini.ReadBool('system_set', 'use_timeout_limit', False);
end;

function TSoftwareSetForm.writeBasic: Boolean;
begin
  //��˾��Ϣ
  myini.WriteString('system_set', 'company', EdtCompany.Text);
  myini.WriteString('system_set', 'tel', EdtTel.Text);
  MainForm.systemConfig.company := EdtCompany.Text;
  MainForm.systemConfig.tel := EdtTel.Text;
  MainForm.setCompanyInfo;
  //������λת��
  if CBMeterUnit.Text <> '' then
  begin
    myini.Writeinteger('system_set', 'meter_unit_index', CBMeterUnit.ItemIndex);
    myini.WriteString('system_set', 'meter_unit', CBMeterUnit.Text);
  end;
  if CBSoftUnit.Text <> '' then
  begin
    myini.Writeinteger('system_set', 'soft_unit_index', CBSoftUnit.ItemIndex);
    myini.WriteString('system_set', 'soft_unit', CBSoftUnit.Text);
  end;
  MainForm.systemConfig.meterUnitIndex := CBMeterUnit.ItemIndex;
  MainForm.systemConfig.softUnitIndex := CBSoftUnit.ItemIndex;
  if (MainForm.systemConfig.meterUnitIndex < 3) then
  begin
    if (MainForm.systemConfig.softUnitIndex < 3) then MainForm.systemConfig.metricPoint := 0
    else MainForm.systemConfig.metricPoint := -3;
  end
  else
  begin
    if (MainForm.systemConfig.softUnitIndex < 3) then MainForm.systemConfig.metricPoint := 3
    else MainForm.systemConfig.metricPoint := 0;
  end;

  if CBSoftUnit.Text <> '' then
  begin
    MainForm.FrmWeight1.lblUnit1.Caption := CBSoftUnit.Text;
    MainForm.FrmWeight1.lblUnit2.Caption := CBSoftUnit.Text;
  end;
  MeterConnect1Form.reloadUnit;
  MeterConnect2Form.reloadUnit;

  //��ӡ��
  myini.WriteString('system_set', 'printer1', CBPrinter1.Text);
  MainForm.systemConfig.printer1 := CBPrinter1.Text;
  myini.WriteString('system_set', 'printer2', CBPrinter2.Text);
  MainForm.systemConfig.printer2 := CBPrinter2.Text;

  myini.WriteString('system_set', 'addr', LEAddr.Text);
  MainForm.systemConfig.addr := LEAddr.Text;

  if RBFirstGeneration.Checked then
  begin
    myini.WriteInteger('system_set', 'ticket_type', 1);
    MainForm.systemConfig.ticketType := 1;
  end
  else if RBSecondGeneration.Checked then
  begin
    myini.WriteInteger('system_set', 'ticket_type', 2);
    MainForm.systemConfig.ticketType := 2;
  end;

  myini.WriteBool('system_set', 'read_local', CBReadLocal.Checked);
  MainForm.systemConfig.readLocal := CBReadLocal.Checked;
end;

function TSoftwareSetForm.writeCostSet: Boolean;
begin
  //����������
  MainForm.systemConfig.usePound := CBUsePound.Checked;
  myini.WriteBool('system_set', 'useCost', CBUsePound.Checked);
  MainForm.systemConfig.BasicPound := StrToFloat(EdtInitial.Text);
  myini.WriteString('system_set', 'initCost', EdtInitial.Text);
  MainForm.systemConfig.UnitPound1 := StrToFloat(EdtUnit.Text);
  myini.WriteString('system_set', 'unitCost1', EdtUnit.Text);
  MainForm.systemConfig.UnitPound2 := StrToFloat(EdtUnit2.Text);
  myini.WriteString('system_set', 'unitCost2', EdtUnit2.Text);
  MainForm.systemConfig.ManualInputPound := CBManualInput.Checked;
  myini.WriteBool('system_set', 'manualInputCost', CBManualInput.Checked);
  MainForm.systemConfig.poundGrade1 := StrToFloatDef(EdtPound1.Text, 500);
  MainForm.systemConfig.poundGrade2 := StrToFloatDef(EdtPound2.Text, 10000);
  MainForm.systemConfig.poundGrade3 := StrToFloatDef(EdtPound3.Text, 10000);
  MainForm.systemConfig.poundGrade4 := StrToFloatDef(EdtPound4.Text, 100000);
  MainForm.systemConfig.poundGrade5 := StrToFloatDef(EdtPound5.Text, 100000);
  MainForm.systemConfig.poundGrade6 := StrToFloatDef(EdtPound6.Text, 120000);
  myini.WriteString('system_set', 'grade1', EdtPound1.Text);
  myini.WriteString('system_set', 'grade2', EdtPound2.Text);
  myini.WriteString('system_set', 'grade3', EdtPound3.Text);
  myini.WriteString('system_set', 'grade4', EdtPound4.Text);
  myini.WriteString('system_set', 'grade5', EdtPound5.Text);
  myini.WriteString('system_set', 'grade6', EdtPound6.Text);

  if RBGross.Checked then
  begin
    MainForm.systemConfig.ChargeType := 1; //ë�ؼƷ�
    myini.WriteInteger('system_set', 'costType', 1);
  end
  else if RBTwo.Checked then
  begin
    MainForm.systemConfig.ChargeType := 2; //ë��+Ƥ�ؼƷ�
    myini.WriteInteger('system_set', 'costType', 2);
  end
  else if RBNet.Checked then
  begin
    MainForm.systemConfig.ChargeType := 3; //���ؼƷ�
    myini.WriteInteger('system_set', 'costType', 3);
  end;
  myini.WriteInteger('system_set', 'point', StrToInt(LEPoint.Text));
  MainForm.systemConfig.scalePoint := StrToIntDef(LEPoint.Text, 0);
end;

function TSoftwareSetForm.writeWeightSet: Boolean;
begin
  //��������
  myini.WriteBool('system_set', 'autoDropDown', CBAutoDropDown.Checked);
  myini.WriteBool('system_set', 'enterAsTab', CBEnterAsTab.Checked);
  //�Զ�����
  MainForm.systemConfig.EnterTab := CBEnterAsTab.Checked;
  //�Զ���ȫ�б��
  myini.WriteBool('system_set', 'autoComplete', CBAutoComplete.Checked);
  //�Զ�ɾ������֮ǰ����ʷ��¼
  myini.WriteBool('system_set', 'delHistory', CBDelHistory.Checked);
  //�Զ��������ѡ�񳵺�,��������Ϣ
  myini.WriteBool('system_set', 'showPrepare', CBShowPrepare.Checked);
  MainForm.systemConfig.ShowPrepare := CBShowPrepare.Checked;
  //�Ƿ�������ι�Ƥ
  myini.WriteBool('system_set', 'allowSecondTare', CBAllowSecondTare.Checked);
  MainForm.systemConfig.AllowSecondTare := CBAllowSecondTare.Checked;
  //�Ƿ�������ι�ë
  myini.WriteBool('system_set', 'allowSecondGross', CBAllowSecondGross.Checked);
  MainForm.systemConfig.AllowSecondGross := CBAllowSecondGross.Checked;
  //ÿ�ι���֮��Ҫ��������ٴ����복��
  myini.WriteBool('system_set', 'waitForZero', CBWaitForZero.Checked);
  MainForm.systemConfig.waitForZero := CBWaitForZero.Checked;
  myini.WriteBool('system_set', 'useBundleRate', CBUseBundleRate.Checked);
  MainForm.systemConfig.useBundleRate := CBUseBundleRate.Checked;
  //ÿ�ι��ճ�ʱ�Զ�Ԥ�ó�Ƥ
  myini.WriteBool('system_set', 'autoWriteTare', CBWriteTare.Checked);
  mainForm.systemConfig.autoWriteTare := CBWriteTare.Checked;
  //������λ,�ջ���λ����Ϣ�ô�������
  myini.WriteBool('system_set', 'useCode', CBUseCode.Checked);
  MainForm.systemConfig.useCode := CBUseCode.Checked;
  //�����ȶ�ʱҲ�ܱ�������
  myini.WriteBool('system_set', 'allowNotSteady', CBAllowNotSteady.Checked);
  MainForm.systemConfig.allowNotSteady := CBAllowNotSteady.Checked;
  myini.WriteBool('system_set', 'useVoice', CBVoice.Checked);
  MainForm.systemConfig.UseVoice := CBVoice.Checked;
  //��ӡʱѡ�����
  myini.WriteBool('system_set', 'selectTicketBeforePrint', CBSelectTicketBeforePrint.Checked);
  MainForm.systemConfig.selectTicketBeforePrint := CBSelectTicketBeforePrint.Checked;
  //Ƥ�س���Ԥ��
  myini.WriteBool('system_set', 'useTareDiff', CBTareDiff.Checked);
  MainForm.systemConfig.useTareDiff := CBTareDiff.Checked;
  //�Ƿ����ÿ۷ѹ���
  myini.WriteBool('system_set', 'pay', CBPay.Checked);
  MainForm.systemConfig.usePay := CBPay.Checked;
  //ͼƬ����ڱ���
  myini.WriteBool('system_set', 'savePicLocal', CBSavePicLocal.Checked);
  MainForm.systemConfig.savePicLocal := CBSavePicLocal.Checked;
  //��ë��ʱ��ʾ�Ƿ�ʹ���ϴ�Ƥ��
  myini.WriteBool('system_set', 'useLastTare', CBUseLastTare.Checked);
  MainForm.systemConfig.useLastTare := CBUseLastTare.Checked;
  //�Զ�����Ԥ����Ϣ
  myini.WriteBool('system_set', 'auto_save_prepare', CBAutoSavePrepare.Checked);
  MainForm.systemConfig.autoSavePrepare := CBAutoSavePrepare.Checked;
  //������������
  myini.WriteBool('system_set', 'use_weight_line', CBUseWeightLine.Checked);
  MainForm.systemConfig.useWeightLine := CBUseWeightLine.Checked;
  //��̨�Զ��������С����
  myini.WriteString('system_set', 'back_record_weight', LEBackRecord.Text);
  MainForm.systemConfig.backRecordWeight := StrToFloatDef(LEBackRecord.Text, 1000);
  //�����޸�Ԥ����Ϣ�����ĵ��ۺ��۷�ϵ��
  myini.WriteBool('system_set', 'allow_modify_price', CBAllowModifyPrice.Checked);
  MainForm.systemConfig.allowModifyPrice := CBAllowModifyPrice.Checked;
  //�Զ�����ģʽ�±�����Զ���ӡ
  myini.WriteBool('system_set', 'print_after_save', CBPrintAfterSave.Checked);
  MainForm.systemConfig.printAfterSave := CBPrintAfterSave.Checked; ;
  //���ó�ʱ����
  myini.WriteBool('system_set', 'use_timeout_limit', CBUseTimeoutLimit.Checked);
  MainForm.systemConfig.useTimeOutLimit := CBUseTimeoutLimit.Checked;
end;

procedure TSoftwareSetForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  myini.Free;
end;

function TSoftwareSetForm.loadWeightSetII: Boolean;
begin
  //��ˮ�Ź���
  CBGlideCode1.ItemIndex := myini.ReadInteger('system_set', 'glide_code1', 0);
  CBGlideCode2.ItemIndex := myini.ReadInteger('system_set', 'glide_code2', 1);
  EdtGlideLength.Text := myini.ReadString('system_set', 'glide_length', '4');
  SEDropDownCount.Value := myini.ReadInteger('system_set', 'dropDownCount', 5);
  LEReturnZero.Text := myini.ReadString('system_set', 'returnZero', '100');
  //���ݴ�ӡ����̧ͷ
  LEReportTitle.Text := myini.ReadString('system_set', 'dataReportTitle', '���ݱ���');
  //���С����λ��
  LESumDivide.Text := myini.ReadString('system_set', 'sumDivide', '1');
  LESumPoint.Text := myini.ReadString('system_set', 'sumPoint', '0');
  //�ȶ�����
  SESteadyCount.Value := myini.ReadInteger('system_set', 'steadyCount', 2);
  LETareDiff.Text := myini.ReadString('system_set', 'tareDiff', '5');
  //���ι�����ʱʱ������
  LETimeOut.Text := myini.ReadString('system_set', 'updateTimeOut', '12000');
  //�������
  LEMax.Text := myini.ReadString('system_set', 'max', '150000');
  //���ú�̨���ݼ�¼
  CBBackRecord.Checked := myini.ReadBool('system_set', 'backRecord', False);
  LEDatabaseAlarm.Text := myini.ReadString('system_set', 'database_alarm_value', '1024');
  //�������������
  CBSay.Checked := myini.ReadBool('system_set', 'say', False);
  //���������ٶ�
  TBVoiceRate.Position := myini.ReadInteger('system_set', 'voice_rate', 0);
  //��ӡ����ֽ����
  LEPrinterBackRow.Text := myini.ReadString('system_set', 'printerBackRow', '0');
  //������Χ
  LERange.Text := myini.ReadString('system_set', 'range', '20');
  //ֻ�����ӡ��ɼ�¼
  CBPrintNet.Checked := myini.ReadBool('system_set', 'print_net', False);
  //�Զ�����������ʾ
  LECompleteHint.Text := myini.ReadString('system_set', 'complete_hint', 'ȡ��������³�');
  LECarOutHint.Text := myini.ReadString('system_set', 'car_out_hint', '�������³�');
  //������ݿ�ͼƬ��������
  LEPicCount.Text := myini.ReadString('system_set', 'pic_count', '20000');
end;

function TSoftwareSetForm.writeWeightSetII: Boolean;
begin
  myini.WriteInteger('system_set', 'glide_code1', CBGlideCode1.ItemIndex);
  myini.WriteInteger('system_set', 'glide_code2', CBGlideCode2.ItemIndex);
  myini.WriteString('system_set', 'glide_length', EdtGlideLength.Text);
  MainForm.systemConfig.glideCode1 := CBGlideCode1.ItemIndex;
  MainForm.systemConfig.glideLength := StrToIntDef(EdtGlideLength.Text, 6);

  myini.Writeinteger('system_set', 'dropDownCount', SEDropDownCount.Value);
  
  myini.WriteFloat('system_set', 'returnZero', StrToFloatDef(LEReturnZero.Text,
    0));
  MainForm.systemConfig.ReturnZero := StrToFloatDef(LEReturnZero.Text, 100);

  //���ݴ�ӡ����̧ͷ
  myini.WriteString('system_set', 'dataReportTitle', LEReportTitle.Text);
  MainForm.systemConfig.dataReportTitle := LEReportTitle.Text;
  //���С����λ��
  myini.WriteInteger('system_set', 'sumDivide', StrToIntDef(LESumDivide.Text, 1));
  MainForm.systemConfig.sumDivide := StrToIntDef(LESumDivide.Text, 1);
  myini.WriteString('system_set', 'sumPoint', LESumPoint.Text);
  MainForm.systemConfig.sumPoint := StrToIntDef(LESumPoint.Text, 0);
  //�ȶ�����
  myini.WriteInteger('system_set', 'steadyCount', SESteadyCount.Value);
  MainForm.systemConfig.steadyCount := SESteadyCount.Value;
  //Ƥ�س���
  myini.WriteFloat('system_set', 'tareDiff', StrToFloatDef(LETareDiff.Text, 0));
  MainForm.systemConfig.tareDiff := StrToFloatDef(LETareDiff.Text, 0);
  //���ι�����ʱʱ������
  myini.WriteInteger('system_set', 'updateTimeOut', StrToIntDef(LETimeOut.Text, 12000));
  MainForm.systemConfig.updateTimeOut := StrToIntDef(LETimeOut.Text, 12000);
  //�������
  myini.WriteFloat('system_set', 'max', StrToFloatDef(LEMax.Text, 200000));
  MainForm.systemConfig.max := StrToFloatDef(LEMax.Text, 200000);
  //���ú�̨���ݼ�¼
  myini.WriteBool('system_set', 'backRecord', CBBackRecord.Checked);
  MainForm.systemConfig.useBackRecord := CBBackRecord.Checked;
  //���ݿⳬ�ޱ���
  myini.WriteFloat('system_set', 'database_alarm_value', StrToFloatDef(LEDatabaseAlarm.Text, 1024));
  MainForm.systemConfig.databaseAlarm := StrToFloatDef(LEDatabaseAlarm.Text, 1024);
  //�������������
  myini.WriteBool('system_set', 'say', CBSay.Checked);
  MainForm.systemConfig.sayCombo := CBSay.Checked;
  //���������ٶ�
  myini.WriteInteger('system_set', 'voice_rate', TBVoiceRate.Position);
  MainForm.setVoiceRate(TBVoiceRate.Position);
  //��ӡ����ֽ����
  myini.WriteFloat('system_set', 'printerBackRow', StrToFloatDef(LEPrinterBackRow.Text, 0));
  MainForm.systemConfig.printerBackRow := StrToFloatDef(LEPrinterBackRow.Text, 0);
  //������Χ
  myini.WriteFloat('system_set', 'range', StrToFloatDef(LERange.Text, 20));
  MainForm.systemConfig.range := StrToFloatDef(LERange.Text, 20);
  //ֻ�����ӡ��ɼ�¼
  myini.WriteBool('system_set', 'print_net', CBPrintNet.Checked);
  MainForm.systemConfig.printNet := CBPrintNet.Checked;
  //�Զ�����������ʾ
  myini.WriteString('system_set', 'complete_hint', LECompleteHint.Text);
  MainForm.systemConfig.completeHint := LECompleteHint.Text;
  myini.WriteString('system_set', 'car_out_hint', LECarOutHint.Text);
  MainForm.systemConfig.carOutHint := LECarOutHint.Text;
  //������ݿ�ͼƬ��������
  myini.WriteInteger('system_set', 'pic_count', StrToIntDef(LEPicCount.Text, 20000));
  MainForm.systemConfig.picCount := StrToIntDef(LEPicCount.Text, 20000);
end;

function TSoftwareSetForm.loadOther: Boolean;
begin
  CBAutoRun.Checked := myini.ReadBool('system_set', 'autoRun', False);

  CBXMLExport.Checked := myini.ReadBool('system_set', 'export_XML', False);
  RBAttr.Checked := myini.Readinteger('system_set', 'XML_type', 0) = 0;

  LEMeterShowMode.Text := myini.ReadString('system_set', 'meter_show_mode', '0');

  RBSaveBySteady.Checked := myini.ReadBool('system_set', 'save_by_steady', True);
  RBSaveByTime.Checked := not RBSaveBySteady.Checked;
  SEInterval.Value := myini.ReadInteger('system_set', 'save_interval', 5);
  LETicketSelHeight.Text := myini.ReadString('system_set', 'ticket_sel_height', '25');
  RGSumType.ItemIndex := myini.ReadInteger('system_set', 'sum_type', 1);

  CBPayType.Items.Clear;
  CBPayType.Items.Add('�۽��');
  CBPayType.Items.Add('��ʵ��');
  CBPayType.Items.Add('�۷���');
  CBPayType.Items.Add('��' + MainForm.weightSetConfig.backup6Caption);
  CBPayType.Items.Add('��' + MainForm.weightSetConfig.backup7Caption);
  CBPayType.Items.Add('��' + MainForm.weightSetConfig.backup8Caption);
  CBPayType.Items.Add('��' + MainForm.weightSetConfig.backup9Caption);
  CBPayType.Items.Add('��' + MainForm.weightSetConfig.backup15Caption);
  CBPayType.Items.Add('��' + MainForm.weightSetConfig.backup16Caption);
  CBPayType.Items.Add('��' + MainForm.weightSetConfig.backup17Caption);
  CBPayType.Items.Add('��' + MainForm.weightSetConfig.backup18Caption);
  CBPayType.ItemIndex := myini.ReadInteger('system_set', 'pay_type', 0);
end;

function TSoftwareSetForm.writeOther: Boolean;
begin
  //�����Զ�����
  with TRegistry.Create do
  begin
    RootKey := HKEY_LOCAL_MACHINE;
    OpenKey('Software\Microsoft\Windows\CurrentVersion\Run', False);
    if CBAutoRun.Checked and (not ValueExists('weight')) then
      WriteString('weight', Application.ExeName)
    else if ValueExists('weight') then
      DeleteValue('weight');
    CloseKey
  end;
  myini.WriteBool('system_set', 'autoRun', CBAutoRun.Checked);

  //����XML
  myini.WriteBool('system_set', 'export_XML', CBXMLExport.Checked);
  if RBAttr.Checked then
    myini.Writeinteger('system_set', 'XML_type', 0)
  else if RBChild.Checked then
    myini.Writeinteger('system_set', 'XML_type', 1);

  myini.WriteString('system_set', 'meter_show_mode', LEMeterShowMode.Text);
  MainForm.systemConfig.meterShowMode := LEMeterShowMode.Text;

  //�Զ��ػ�
  if CBAutoShutdown.Checked then
  begin
    MainForm.systemConfig.CloseTime := FormatDateTime('hns', DTPClose.DateTime);
    MainForm.TAutoShut.Enabled := True;
  end;

  myini.WriteBool('system_set', 'save_by_steady', RBSaveBySteady.Checked);
  myini.WriteInteger('system_set', 'save_interval', SEInterval.Value);
  MainForm.systemConfig.saveByInterval := RBSaveBySteady.Checked;
  MainForm.systemConfig.saveInterval := SEInterval.Value;

  myini.WriteInteger('system_set', 'ticket_sel_height',
    StrToIntDef(LETicketSelHeight.Text, 25));
  MainForm.systemConfig.ticketSelHeight := StrToIntDef(LETicketSelHeight.Text, 25);

  myini.WriteInteger('system_set', 'sum_type', RGSumType.ItemIndex);
  MainForm.systemConfig.sumType := RGSumType.ItemIndex;

  myini.WriteInteger('system_set', 'pay_type', CBPayType.ItemIndex);
  MainForm.systemConfig.payType := CBPayType.ItemIndex;
end;

procedure TSoftwareSetForm.CBAutoShutdownClick(Sender: TObject);
begin
  DTPClose.Enabled := CBAutoShutdown.Checked;
end;

procedure TSoftwareSetForm.BtnTestPrinterClick(Sender: TObject);
begin
  TCommonUtil.printerBack(StrToFloatDef(LEPrinterBackRow.Text, 6));
end;

end.

