unit SoftwareSet;

interface

uses
  Windows, Classes, Controls, Forms, ExtCtrls, ComCtrls, StdCtrls,
  Buttons, Spin, Registry, SysUtils, inifiles, Printers, Dialogs, Mask;

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
    LEAddr: TLabeledEdit;
    CBPrinter1: TComboBox;
    Label12: TLabel;
    TSWeightSetII: TTabSheet;
    Label7: TLabel;
    LEBackRecord: TLabeledEdit;
    LEReturnZero: TLabeledEdit;
    SEDropDownCount: TSpinEdit;
    LESumPoint: TLabeledEdit;
    Label13: TLabel;
    SESteadyCount: TSpinEdit;
    LETareDiff: TLabeledEdit;
    GBGlideNoRule: TGroupBox;
    Label10: TLabel;
    Label17: TLabel;
    CBGlideCode1: TComboBox;
    EdtGlideLength: TEdit;
    LEMax: TLabeledEdit;
    LEDatabaseAlarm: TLabeledEdit;
    GBTicketType: TGroupBox;
    RBFirstGeneration: TRadioButton;
    RBSecondGeneration: TRadioButton;
    LEPrinterBackRow: TLabeledEdit;
    BtnTestPrinter: TBitBtn;
    Label19: TLabel;
    CBPrinter2: TComboBox;
    TSOther: TTabSheet;
    CBXMLExport: TCheckBox;
    GBXMLType: TGroupBox;
    RBAttr: TRadioButton;
    RBChild: TRadioButton;
    CBAutoShutdown: TCheckBox;
    DTPClose: TDateTimePicker;
    LERange: TLabeledEdit;
    LECompleteHint: TLabeledEdit;
    LEReportTitle: TLabeledEdit;
    LECarOutHint: TLabeledEdit;
    Label20: TLabel;
    CBGlideCode2: TComboBox;
    LESumDivide: TLabeledEdit;
    LEPicCount: TLabeledEdit;
    LEQuanterPoint: TLabeledEdit;
    LEQuanterDivide: TLabeledEdit;
    CBAutoRun: TCheckBox;
    PLogin: TPanel;
    LELoginPass: TLabeledEdit;
    LELoginName: TLabeledEdit;
    LEAutoRefreshInterval: TLabeledEdit;
    LEPicPath: TLabeledEdit;
    RGSimpleMode: TRadioGroup;
    GBSaveType: TGroupBox;
    lblSaveByIntervalHint: TLabel;
    lblSaveByTimeHint: TLabel;
    lblSecond: TLabel;
    lblSaveByQuantityHint: TLabel;
    RBSaveBySteady: TRadioButton;
    RBSaveByTime: TRadioButton;
    SEInterval: TSpinEdit;
    RBSaveByQuantity: TRadioButton;
    LEQuantity: TLabeledEdit;
    RGSumType: TRadioGroup;
    lblVoice: TLabel;
    TBVoiceRate: TTrackBar;
    GBWeightMode: TGroupBox;
    CBStandard: TCheckBox;
    CBSimple: TCheckBox;
    CBOnce: TCheckBox;
    CBSaveAfterReturnZero: TCheckBox;
    LEUpperLimit: TLabeledEdit;
    LELowerLimit: TLabeledEdit;
    LETicketSelHeight: TLabeledEdit;
    LEDisconectCheckCount: TLabeledEdit;
    LEWeightSaveInterval: TLabeledEdit;
    LENotVisibleWeight: TLabeledEdit;
    lblUpdateTime: TLabel;
    EdtMinUpdateTime: TEdit;
    EdtMaxUpdateTime: TEdit;
    Label5: TLabel;
    CBAutoLogin: TCheckBox;
    Label18: TLabel;
    CBPayType: TComboBox;
    lblColorSel: TLabel;
    SpOddColor: TShape;
    SpEvenColor: TShape;
    lblDayStart: TLabel;
    MEDayStart: TMaskEdit;
    LERealPoint: TLabeledEdit;
    GBList: TGroupBox;
    GBFunc: TGroupBox;
    GBWeight: TGroupBox;
    GBOther: TGroupBox;
    GBRecord: TGroupBox;
    CBAutoDropDown: TCheckBox;
    CBAutoComplete: TCheckBox;
    CBEnterAsTab: TCheckBox;
    CBUseCode: TCheckBox;
    CBShowPrepare: TCheckBox;
    CBSay: TCheckBox;
    CBAllowSecondTare: TCheckBox;
    CBAllowSecondGross: TCheckBox;
    CBWriteTare: TCheckBox;
    CBSavePicLocal: TCheckBox;
    CBAutoSavePrepare: TCheckBox;
    CBUseLastTare: TCheckBox;
    CBUseWeightLine: TCheckBox;
    CBVoice: TCheckBox;
    CBBackRecord: TCheckBox;
    CBAutoRefresh: TCheckBox;
    CBUseLog: TCheckBox;
    CBPay: TCheckBox;
    CBRecordLeft: TCheckBox;
    CBUseOutGlideNo: TCheckBox;
    CBUseManualFlag: TCheckBox;
    CBRecordCorrect: TCheckBox;
    CBUseFilterForm: TCheckBox;
    GBPrint: TGroupBox;
    CBPrintTwo: TCheckBox;
    CBShowPrintDialog: TCheckBox;
    CBDefaultPrintPicTicket: TCheckBox;
    CBSelectTicketBeforePrint: TCheckBox;
    CBAllowModifyGlideNo: TCheckBox;
    CBOnlyAllowInvalidNotFinished: TCheckBox;
    CBUseSaveInterval: TCheckBox;
    CBUseTimeOutLimit: TCheckBox;
    CBUseBundleRate: TCheckBox;
    CBTareDiff: TCheckBox;
    CBWeightOneClick: TCheckBox;
    CBPrintAfterSave: TCheckBox;
    CBPrintNet: TCheckBox;
    CBWaitForZero: TCheckBox;
    CBAllowNotSteady: TCheckBox;
    CBAllowModifyPrice: TCheckBox;
    CBUseLast100CarNo: TCheckBox;
    CBAutoUpdateExpression: TCheckBox;
    CBOnlyShowNotFinishedRecord: TCheckBox;
    CBDisconnectToZero: TCheckBox;
    CBDoubleAdd: TCheckBox;
    CBGridOddEvenColor: TCheckBox;
    CBShowSumList: TCheckBox;
    CBShowTotal: TCheckBox;
    CBDelHistory: TCheckBox;
    CBDoubleClickModifyRecord: TCheckBox;
    CBNotAllowTareExceed: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure EdtTelKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CBAutoShutdownClick(Sender: TObject);
    procedure BtnTestPrinterClick(Sender: TObject);
    procedure LEPicPathDblClick(Sender: TObject);
    procedure SpOddColorMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
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

uses Main, MeterConnect1, MeterConnect2, CommonUtil, Graphics, DateUtils;

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

  LEAddr.Text := myini.ReadString('system_set', 'addr', 'A');

  RBFirstGeneration.Checked := myini.ReadInteger('system_set', 'ticket_type', 1) = 1;
  RBSecondGeneration.Checked := myini.ReadInteger('system_set', 'ticket_type', 1) = 2;

  CBPrinter1.Items.Clear; //ö�ٱ��ش�ӡ��
  CBPrinter2.Items.Clear;

  CBPrinter1.Items := Printer.Printers;
  CBPrinter2.Items := Printer.Printers;
  CBPrinter1.Text := myini.ReadString('system_set', 'printer1', 'Default');
  CBPrinter2.Text := myini.ReadString('system_set', 'printer2', 'Default');

  CBStandard.Checked := myini.ReadBool('system_set', 'use_standard', True);
  CBSimple.Checked := myini.ReadBool('system_set', 'use_simple', False);
  CBOnce.Checked := myini.ReadBool('system_set', 'use_once', False);
end;

function TSoftwareSetForm.loadCostSet: Boolean;
begin

end;

function TSoftwareSetForm.loadWeightSet: Boolean;
var i: Integer;
begin
  CBAutoDropDown.Checked := myini.ReadBool('system_set', 'autoDropDown', False);
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
  CBUseCode.Checked := myini.ReadBool('system_set', 'useCode', False);
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
  //Ԥ����������ʹ�����100�εĳ���
  CBUseLast100CarNo.Checked := myini.ReadBool('system_set', 'use_last_100_carNo', False);
  //���ó�ʱ����
  CBUseTimeoutLimit.Checked := myini.ReadBool('system_set', 'use_timeout_limit', False);
  //����ʱ�Զ�ˢ������
  CBAutoRefresh.Checked := myini.ReadBool('system_set', 'auto_refresh', False);
  //����غ���������
  CBWeightOneClick.Checked := myini.ReadBool('system_set', 'weight_one_click', False);
  //��ʾ�ϼ���Ϣ
  CBShowTotal.Checked := myini.ReadBool('system_set', 'show_total', True);
  //�Ǳ���߹���
  CBDisconnectToZero.Checked := myini.ReadBool('system_set', 'disconnect_to_zero', False);
  //��¼ʣ����
  CBRecordLeft.Checked := myini.ReadBool('system_set', 'record_left', False);
  //ʹ�ó�����ˮ��
  CBUseOutGlideNo.Checked := myini.ReadBool('system_set', 'use_out_glide_no', False);
  //�б���˿�
  CBUseFilterForm.Checked := myini.ReadBool('system_set', 'use_filter_form', False);
  //��ӡ��ѡ��Ի���
  CBShowPrintDialog.Checked := myini.ReadBool('system_set', 'show_print_dialog', False);
  //�����ظ�����ʱ������
  CBUseSaveInterval.Checked := myini.ReadBool('system_set', 'use_save_interval', False);
  //˫�Ǳ��ۼ�
  CBDoubleAdd.Checked := myini.ReadBool('system_set', 'double_add', False);
  //ͬʱ����̨��ӡ����ӡ
  CBPrintTwo.Checked := myini.ReadBool('system_set', 'print_two', False);
  //����ϵͳ��־
  CBUseLog.Checked := myini.ReadBool('system_set', 'use_log', True);
  //ֻ��������δ��ɼ�¼
  CBOnlyAllowInvalidNotFinished.Checked := myini.ReadBool('system_set',
    'only_allow_invalid_not_finished', False);
  //�����޸���ˮ��
  CBAllowModifyGlideNo.Checked := myini.ReadBool('system_set', 'allow_modify_glideNo', False);
  //ʹ�ò�����־
  CBUseManualFlag.Checked := myini.ReadBool('system_set', 'use_manual_flag', False);
  //Ĭ�ϴ�ӡͼ�ΰ���
  CBDefaultPrintPicTicket.Checked := myini.ReadBool('system_set', 'default_print_pic_ticket', False);
  //ʵʱ�����Զ��幫ʽ
  CBAutoUpdateExpression.Checked := myini.ReadBool('system_set', 'auto_update_expression', False);
  //��¼������
  CBRecordCorrect.Checked := myini.ReadBool('system_set', 'record_correct', False);
  //�б�˫������δ��ɼ�¼
  CBOnlyShowNotFinishedRecord.Checked := myini.ReadBool('system_set', 'only_show_not_finished_record', False);
  //�б�˫����ɫ����
  CBGridOddEvenColor.Checked := myini.ReadBool('system_set', 'grid_odd_even_color', False);
  //��ʾ�ϼ���
  CBShowSumList.Checked := myini.ReadBool('system_set', 'show_sum_list', True);
  //˫���޸ĳ��ؽ����б��¼
  CBDoubleClickModifyRecord.Checked := myini.ReadBool('system_set', 'double_click_modify_record', False);
  //�������Ƥ����Ԥ��Ƥ��
  CBNotAllowTareExceed.Checked := myini.ReadBool('system_set', 'not_allow_tare_exceed', False);
end;

function TSoftwareSetForm.writeBasic: Boolean;
begin
  //��˾��Ϣ
  myini.WriteString('system_set', 'company', EdtCompany.Text);
  myini.WriteString('system_set', 'tel', EdtTel.Text);
  MainForm.systemConfig.company := EdtCompany.Text;
  MainForm.systemConfig.tel := EdtTel.Text;
  MainForm.setCompanyInfo;

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

  myini.WriteBool('system_set', 'use_standard', CBStandard.Checked);
  myini.WriteBool('system_set', 'use_simple', CBSimple.Checked);
  myini.WriteBool('system_set', 'use_once', CBOnce.Checked);
  MainForm.systemConfig.useStandard := CBStandard.Checked;
  MainForm.systemConfig.useSimple := CBSimple.Checked;
  MainForm.systemConfig.useOnce := CBOnce.Checked;
  MainForm.FrmWeight1.RBStandard.Enabled := CBStandard.Checked;
  MainForm.FrmWeight1.RBSimple.Enabled := CBSimple.Checked;
  MainForm.FrmWeight1.RBOnce.Enabled := CBOnce.Checked;
end;

function TSoftwareSetForm.writeCostSet: Boolean;
begin
{
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
  MainForm.FrmWeight1.EdtCost.Enabled := CBManualInput.Checked;
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
}
end;

function TSoftwareSetForm.writeWeightSet: Boolean;
begin
  //��������
  myini.WriteBool('system_set', 'autoDropDown', CBAutoDropDown.Checked);
  myini.WriteBool('system_set', 'enterAsTab', CBEnterAsTab.Checked);
  //�Զ�����
  MainForm.FrmWeight1.CBCar.AutoDropDown := CBAutoDropDown.Checked;
  MainForm.FrmWeight1.CBFaHuo.AutoDropDown := CBAutoDropDown.Checked;
  MainForm.FrmWeight1.CBShouHuo.AutoDropDown := CBAutoDropDown.Checked;
  MainForm.FrmWeight1.CBGoods.AutoDropDown := CBAutoDropDown.Checked;
  MainForm.FrmWeight1.CBSpec.AutoDropDown := CBAutoDropDown.Checked;
  MainForm.FrmWeight1.CBBackup1.AutoDropDown := CBAutoDropDown.Checked;
  MainForm.FrmWeight1.CBBackup2.AutoDropDown := CBAutoDropDown.Checked;
  MainForm.FrmWeight1.CBBackup3.AutoDropDown := CBAutoDropDown.Checked;
  MainForm.FrmWeight1.CBBackup4.AutoDropDown := CBAutoDropDown.Checked;
  MainForm.FrmWeight1.CBBackup5.AutoDropDown := CBAutoDropDown.Checked;

  MainForm.systemConfig.EnterTab := CBEnterAsTab.Checked;
  //�Զ���ȫ�б��
  myini.WriteBool('system_set', 'autoComplete', CBAutoComplete.Checked);
  MainForm.FrmWeight1.CBCar.AutoComplete := CBAutoComplete.Checked;
  MainForm.FrmWeight1.CBFaHuo.AutoComplete := CBAutoComplete.Checked;
  MainForm.FrmWeight1.CBShouHuo.AutoComplete := CBAutoComplete.Checked;
  MainForm.FrmWeight1.CBGoods.AutoComplete := CBAutoComplete.Checked;
  MainForm.FrmWeight1.CBSpec.AutoComplete := CBAutoComplete.Checked;
  MainForm.FrmWeight1.CBBackup1.AutoComplete := CBAutoComplete.Checked;
  MainForm.FrmWeight1.CBBackup2.AutoComplete := CBAutoComplete.Checked;
  MainForm.FrmWeight1.CBBackup3.AutoComplete := CBAutoComplete.Checked;
  MainForm.FrmWeight1.CBBackup4.AutoComplete := CBAutoComplete.Checked;
  MainForm.FrmWeight1.CBBackup5.AutoComplete := CBAutoComplete.Checked;
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
  MainForm.FrmWeight1.EdtPrice.ReadOnly := not CBAllowModifyPrice.Checked;
  MainForm.FrmWeight1.EdtScale.ReadOnly := not CBAllowModifyPrice.Checked;
  //�Զ�����ģʽ�±�����Զ���ӡ
  myini.WriteBool('system_set', 'print_after_save', CBPrintAfterSave.Checked);
  MainForm.systemConfig.printAfterSave := CBPrintAfterSave.Checked; ;
  //���ó�ʱ����
  myini.WriteBool('system_set', 'use_timeout_limit', CBUseTimeoutLimit.Checked);
  MainForm.systemConfig.useTimeOutLimit := CBUseTimeoutLimit.Checked;
  //Ԥ����������ʹ�����100�εĳ���
  myini.WriteBool('system_set', 'use_last_100_carNo', CBUseLast100CarNo.Checked);
  MainForm.systemConfig.useLast100CarNo := CBUseLast100CarNo.Checked;
  //���ó�ʱ����
  myini.WriteBool('system_set', 'use_timeout_limit', CBUseTimeoutLimit.Checked);
  MainForm.systemConfig.useTimeOutLimit := CBUseTimeoutLimit.Checked;
  //����ʱ�Զ�ˢ������
  myini.WriteBool('system_set', 'auto_refresh', CBAutoRefresh.Checked);
  MainForm.systemConfig.autoRefresh := CBAutoRefresh.Checked;
  //����غ���������
  myini.WriteBool('system_set', 'weight_one_click', CBWeightOneClick.Checked);
  MainForm.systemConfig.weightOneClick := CBWeightOneClick.Checked;
  //��ʾ�ϼ���Ϣ
  myini.WriteBool('system_set', 'show_total', CBShowTotal.Checked);
  MainForm.systemConfig.showTotal := CBShowTotal.Checked;
  //�Ǳ���߹���
  myini.WriteBool('system_set', 'disconnect_to_zero', CBDisconnectToZero.Checked);
  MainForm.systemConfig.disconnectToZero := CBDisconnectToZero.Checked;
  //��¼ʣ����
  myini.WriteBool('system_set', 'record_left', CBRecordLeft.Checked);
  MainForm.systemConfig.recordLeft := CBRecordLeft.Checked;
  //ʹ�ó�����ˮ��
  myini.WriteBool('system_set', 'use_out_glide_no', CBUseOutGlideNo.Checked);
  MainForm.systemConfig.useOutGlideNo := CBUseOutGlideNo.Checked;
  //�б���˿�
  myini.WriteBool('system_set', 'use_filter_form', CBUseFilterForm.Checked);
  MainForm.systemConfig.useFilterForm := CBUseFilterForm.Checked;
  //��ӡ��ѡ��Ի���
  myini.WriteBool('system_set', 'show_print_dialog', CBShowPrintDialog.Checked);
  MainForm.systemConfig.showPrintDialog := CBShowPrintDialog.Checked;
  //�����ظ�����ʱ������
  myini.WriteBool('system_set', 'use_save_interval', CBUseSaveInterval.Checked);
  MainForm.systemConfig.useSaveInterval := CBUseSaveInterval.Checked;
  //˫�Ǳ��ۼ�
  myini.WriteBool('system_set', 'double_add', CBDoubleAdd.Checked);
  MainForm.systemConfig.doubleAdd := CBDoubleAdd.Checked;
  //ͬʱ����̨��ӡ����ӡ
  myini.WriteBool('system_set', 'print_two', CBPrintTwo.Checked);
  MainForm.systemConfig.printTwo := CBPrintTwo.Checked;
  //����ϵͳ��־
  myini.WriteBool('system_set', 'use_log', CBUseLog.Checked);
  MainForm.systemConfig.useLog := CBUseLog.Checked;
  //ֻ��������δ��ɼ�¼
  myini.WriteBool('system_set', 'only_allow_invalid_not_finished',
    CBOnlyAllowInvalidNotFinished.Checked);
  MainForm.systemConfig.onlyAllowInvalidNotFinished := CBOnlyAllowInvalidNotFinished.Checked;
  //�����޸���ˮ��
  myini.WriteBool('system_set', 'allow_modify_glideNo', CBAllowModifyGlideNo.Checked);
  MainForm.systemConfig.allowModifyGlideNo := CBAllowModifyGlideNo.Checked;
  //ʹ�ò�����־
  myini.WriteBool('system_set', 'use_manual_flag', CBUseManualFlag.Checked);
  MainForm.systemConfig.useManualFlag := CBUseManualFlag.Checked;
  //Ĭ�ϴ�ӡͼ�ΰ���
  myini.WriteBool('system_set', 'default_print_pic_ticket', CBDefaultPrintPicTicket.Checked);
  MainForm.systemConfig.defaultPrintPicTicket := CBDefaultPrintPicTicket.Checked;
  //ʵʱ�����Զ��幫ʽ
  myini.WriteBool('system_set', 'auto_update_expression', CBAutoUpdateExpression.Checked);
  MainForm.systemConfig.autoUpdateExpression := CBAutoUpdateExpression.Checked;
  //��¼������
  myini.WriteBool('system_set', 'record_correct', CBRecordCorrect.Checked);
  MainForm.systemConfig.recordCorrect := CBRecordCorrect.Checked;
  //�б�˫������δ��ɼ�¼
  myini.WriteBool('system_set', 'only_show_not_finished_record', CBOnlyShowNotFinishedRecord.Checked);
  MainForm.systemConfig.onlyShowNotFinishedRecord := CBOnlyShowNotFinishedRecord.Checked;
  //��ʾ�ϼ���
  myini.WriteBool('system_set', 'show_sum_list', CBShowSumList.Checked);
  MainForm.systemConfig.showSumList := CBShowSumList.Checked;
  //˫���޸ĳ��ؽ����б��¼
  myini.WriteBool('system_set', 'double_click_modify_record', CBDoubleClickModifyRecord.Checked);
  MainForm.systemConfig.doubleClickModifyRecord := CBDoubleClickModifyRecord.Checked;
  //�������Ƥ����Ԥ��Ƥ��
  myini.WriteBool('system_set', 'not_allow_tare_exceed', CBNotAllowTareExceed.Checked);
  MainForm.systemConfig.notAllowTareExceed := CBNotAllowTareExceed.Checked;

end;

procedure TSoftwareSetForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  myini.Free;
end;

function TSoftwareSetForm.loadWeightSetII: Boolean;
begin
  //��ˮ�Ź���
  CBGlideCode1.ItemIndex := myini.ReadInteger('system_set', 'glide_code1', 1);
  CBGlideCode2.ItemIndex := myini.ReadInteger('system_set', 'glide_code2', 1);
  EdtGlideLength.Text := myini.ReadString('system_set', 'glide_length', '4');
  SEDropDownCount.Value := myini.ReadInteger('system_set', 'dropDownCount', 10);
  LEReturnZero.Text := myini.ReadString('system_set', 'returnZero', '100');
  //���ݴ�ӡ����̧ͷ
  LEReportTitle.Text := myini.ReadString('system_set', 'dataReportTitle', '���ݱ���');
  //���С����λ��
  LESumDivide.Text := myini.ReadString('system_set', 'sumDivide', '1');
  LESumPoint.Text := myini.ReadString('system_set', 'sumPoint', '0');
  LEQuanterDivide.Text := myini.ReadString('system_set', 'quanterDivide', '1');
  LEQuanterPoint.Text := myini.ReadString('system_set', 'quanterPoint', '2');
  LERealPoint.Text := myini.ReadString('system_set', 'real_point', '2');
  //�ȶ�����
  SESteadyCount.Value := myini.ReadInteger('system_set', 'steadyCount', 2);
  LETareDiff.Text := myini.ReadString('system_set', 'tareDiff', '5');
  //���ι�����ʱʱ������
  EdtMinUpdateTime.Text := myini.ReadString('system_set', 'min_update_time', '0');
  EdtMaxUpdateTime.Text := myini.ReadString('system_set', 'max_update_time', '12000');
  //�������
  LEMax.Text := myini.ReadString('system_set', 'max', '150000');
  //���ú�̨���ݼ�¼
  CBBackRecord.Checked := myini.ReadBool('system_set', 'backRecord', False);
  LEDatabaseAlarm.Text := myini.ReadString('system_set', 'database_alarm_value', '2048');
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
  LEPicCount.Text := myini.ReadString('system_set', 'pic_count', '2000');
  //�۷ѷ�ʽ
  RGSumType.ItemIndex := myini.ReadInteger('system_set', 'sum_type', 1);
  CBPayType.Items.Clear;
  CBPayType.Items.Add('���');
  CBPayType.Items.Add('ʵ��');
  CBPayType.Items.Add('����');
  CBPayType.Items.Add(MainForm.poWeightSetConfig.backup6Caption);
  CBPayType.Items.Add(MainForm.poWeightSetConfig.backup7Caption);
  CBPayType.Items.Add(MainForm.poWeightSetConfig.backup8Caption);
  CBPayType.Items.Add(MainForm.poWeightSetConfig.backup9Caption);
  CBPayType.Items.Add(MainForm.poWeightSetConfig.backup15Caption);
  CBPayType.Items.Add(MainForm.poWeightSetConfig.backup16Caption);
  CBPayType.Items.Add(MainForm.poWeightSetConfig.backup17Caption);
  CBPayType.Items.Add(MainForm.poWeightSetConfig.backup18Caption);
  CBPayType.ItemIndex := myini.ReadInteger('system_set', 'pay_type', 0);
  //����ͼƬ·��
  LEPicPath.Text := myini.ReadString('system_set', 'pic_path',
    ExtractFilePath(ParamStr(0)) + '\WeightImg\');
  //�򵥹�����һ�ι�ë���߹�Ƥ
  RGSimpleMode.ItemIndex := myini.ReadInteger('system_set', 'simple_mode', 0);
  //�Զ�ˢ��Ƶ��
  LEAutoRefreshInterval.Text := myini.ReadString('system_set', 'auto_refresh_interval', '60');
  //�Ǳ���߼�����
  LEDisconectCheckCount.Text := myini.ReadString('system_set', 'disconnect_check_count', '10');
  //�������ݱ�����
  LEWeightSaveInterval.Text := myini.ReadString('system_set', 'weight_save_interval', '0');
  //����������
  LENotVisibleWeight.Text := myini.ReadString('system_set', 'not_visible_weight', '150000');
  //�б�˫����ɫ
  SpOddColor.Brush.Color := myini.ReadInteger('system_set', 'odd_color', clBtnFace);
  SpEvenColor.Brush.Color := myini.ReadInteger('system_set', 'even_color', clBtnFace);
  //ÿ����ʼʱ��
  MEDayStart.Text := myini.ReadString('system_set', 'day_start', '00:00:00');
end;

function TSoftwareSetForm.writeWeightSetII: Boolean;
begin
  myini.WriteInteger('system_set', 'glide_code1', CBGlideCode1.ItemIndex);
  myini.WriteInteger('system_set', 'glide_code2', CBGlideCode2.ItemIndex);
  myini.WriteString('system_set', 'glide_length', EdtGlideLength.Text);
  MainForm.systemConfig.glideCode1 := CBGlideCode1.ItemIndex;
  MainForm.systemConfig.glideCode2 := CBGlideCode2.ItemIndex;
  MainForm.systemConfig.glideLength := StrToIntDef(EdtGlideLength.Text, 6);

  myini.Writeinteger('system_set', 'dropDownCount', SEDropDownCount.Value);
  //������Ŀ
  MainForm.FrmWeight1.CBCar.DropDownCount := SEDropDownCount.Value;
  MainForm.FrmWeight1.CBFaHuo.DropDownCount := SEDropDownCount.Value;
  MainForm.FrmWeight1.CBShouHuo.DropDownCount := SEDropDownCount.Value;
  MainForm.FrmWeight1.CBGoods.DropDownCount := SEDropDownCount.Value;
  MainForm.FrmWeight1.CBSpec.DropDownCount := SEDropDownCount.Value;
  MainForm.FrmWeight1.CBBackup1.DropDownCount := SEDropDownCount.Value;
  MainForm.FrmWeight1.CBBackup2.DropDownCount := SEDropDownCount.Value;
  MainForm.FrmWeight1.CBBackup3.DropDownCount := SEDropDownCount.Value;
  MainForm.FrmWeight1.CBBackup4.DropDownCount := SEDropDownCount.Value;
  MainForm.FrmWeight1.CBBackup5.DropDownCount := SEDropDownCount.Value;
  MainForm.FrmWeight1.CBBackup10.DropDownCount := SEDropDownCount.Value;
  MainForm.FrmWeight1.CBBackup11.DropDownCount := SEDropDownCount.Value;
  MainForm.FrmWeight1.CBBackup12.DropDownCount := SEDropDownCount.Value;
  MainForm.FrmWeight1.CBBackup13.DropDownCount := SEDropDownCount.Value;
  MainForm.FrmWeight1.CBBackup14.DropDownCount := SEDropDownCount.Value;
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

  myini.WriteString('system_set', 'quanterDivide', LEQuanterDivide.Text);
  MainForm.systemConfig.quanterDivide := StrToIntDef(LEQuanterDivide.Text, 1);
  myini.WriteString('system_set', 'quanterPoint', LEQuanterPoint.Text);
  MainForm.systemConfig.quanterPoint := StrToIntDef(LEQuanterPoint.Text, 2);

  myini.WriteString('system_set', 'real_point', LERealPoint.Text);
  MainForm.systemConfig.realPoint := StrToIntDef(LERealPoint.Text, 2);

  //�ȶ�����
  myini.WriteInteger('system_set', 'steadyCount', SESteadyCount.Value);
  MainForm.systemConfig.steadyCount := SESteadyCount.Value;
  //Ƥ�س���
  myini.WriteFloat('system_set', 'tareDiff', StrToFloatDef(LETareDiff.Text, 0));
  MainForm.systemConfig.tareDiff := StrToFloatDef(LETareDiff.Text, 0);
  //���ι�����ʱʱ������
  myini.WriteInteger('system_set', 'min_update_time', StrToIntDef(EdtMinUpdateTime.Text, 0));
  myini.WriteInteger('system_set', 'max_update_time', StrToIntDef(EdtMaxUpdateTime.Text, 12000));
  MainForm.systemConfig.minUpdateTime := StrToIntDef(EdtMinUpdateTime.Text, 0);
  MainForm.systemConfig.maxUpdateTime := StrToIntDef(EdtMaxUpdateTime.Text, 12000);
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
  myini.WriteInteger('system_set', 'printerBackRow', StrToIntDef(LEPrinterBackRow.Text, 0));
  MainForm.systemConfig.printerBackRow := StrToIntDef(LEPrinterBackRow.Text, 0);
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
  myini.WriteInteger('system_set', 'pic_count', StrToIntDef(LEPicCount.Text, 2000));
  MainForm.systemConfig.picCount := StrToIntDef(LEPicCount.Text, 2000);
  //����ͼƬ·��
  if not DirectoryExists(LEPicPath.Text) then
  begin
    if not ForceDirectories(LEPicPath.Text) then
      LEPicPath.Text := ExtractFilePath(ParamStr(0)) + 'WeightImg\';
  end;
  myini.WriteString('system_set', 'pic_path', LEPicPath.Text);
  MainForm.systemConfig.picPath := LEPicPath.Text;
  //�򵥹�����һ�ι�ë���߹�Ƥ
  myini.WriteInteger('system_set', 'simple_mode', RGSimpleMode.ItemIndex);
  MainForm.systemConfig.simpleMode := RGSimpleMode.ItemIndex;
  //�Զ�ˢ��Ƶ��
  myini.WriteInteger('system_set', 'auto_refresh_interval', StrToIntDef(LEAutoRefreshInterval.Text, 60));
  MainForm.systemConfig.autoRefreshInterval := StrToIntDef(LEAutoRefreshInterval.Text, 60) * 1000;
  //�Ǳ���߼�����
  myini.WriteInteger('system_set', 'disconnect_check_count', StrToIntDef(LEDisconectCheckCount.Text, 10));
  MainForm.systemConfig.disconnectCheckCount := StrToIntDef(LEDisconectCheckCount.Text, 10);
  //�������ݱ�����
  myini.WriteString('system_set', 'weight_save_interval', LEWeightSaveInterval.Text);
  MainForm.systemConfig.weightSaveInterval := StrToIntDef(LEWeightSaveInterval.Text, 0);
  //����������
  myini.WriteString('system_set', 'not_visible_weight', LENotVisibleWeight.Text);
  MainForm.systemConfig.notVisibleWeight := StrToFloatDef(LENotVisibleWeight.Text, 150000);
  //�б�˫����ɫ
  myini.WriteInteger('system_set', 'odd_color', SpOddColor.Brush.Color);
  myini.WriteInteger('system_set', 'even_color', SpEvenColor.Brush.Color);
  MainForm.systemConfig.oddColor := SpOddColor.Brush.Color;
  MainForm.systemConfig.evenColor := SpEvenColor.Brush.Color;
  //�б�˫����ɫ����
  myini.WriteBool('system_set', 'grid_odd_even_color', CBGridOddEvenColor.Checked);
  MainForm.systemConfig.gridOddEvenColor := CBGridOddEvenColor.Checked;
  //ÿ����ʼʱ��
  myini.WriteString('system_set', 'day_start', MEDayStart.Text);
  MainForm.systemConfig.dayStart := MEDayStart.Text;
  MainForm.systemConfig.dayStartDiff :=
    SecondsBetween(StrToTime(MainForm.systemConfig.dayStart), StrToTime('00:00:00'));
end;

function TSoftwareSetForm.loadOther: Boolean;
begin
  CBAutoRun.Checked := myini.ReadBool('system_set', 'autoRun', False);

  CBXMLExport.Checked := myini.ReadBool('system_set', 'export_XML', False);
  RBAttr.Checked := myini.Readinteger('system_set', 'XML_type', 0) = 0;

  case myini.ReadInteger('system_set', 'save_by_steady', 0) of
    0: RBSaveBySteady.Checked := True;
    1: RBSaveByTime.Checked := True;
    2: RBSaveByQuantity.Checked := True;
  else
    RBSaveByQuantity.Checked := True;
  end;
  SEInterval.Value := myini.ReadInteger('system_set', 'save_interval', 5);
  LEQuantity.Text := myini.ReadString('system_set', 'save_quantity', '10000');
  CBSaveAfterReturnZero.Checked := myini.ReadBool('system_set', 'save_after_return_zero', False);
  LEUpperLimit.Text := myini.ReadString('system_set', 'upper_limit', '10');
  LELowerLimit.Text := myini.ReadString('system_set', 'lower_limit', '10');

  LETicketSelHeight.Text := myini.ReadString('system_set', 'ticket_sel_height', '25');

  CBAutoLogin.Checked := myini.ReadBool('system_set', 'auto_login', False);
  LELoginName.Text := myini.ReadString('system_set', 'login_name', '');
  LELoginPass.Text := TCommonUtil.deBase64AndDecompress(
    myini.ReadString('system_set', 'login_pass', 'eJwDAAAAAAE='));
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

  //�Զ��ػ�
  if CBAutoShutdown.Checked then
  begin
    MainForm.systemConfig.CloseTime := FormatDateTime('hns', DTPClose.DateTime);
    MainForm.TAutoShut.Enabled := True;
  end;

  if RBSaveBySteady.Checked then
  begin
    myini.WriteInteger('system_set', 'save_by_steady', 0);
    MainForm.systemConfig.saveByInterval := 0;
  end
  else if RBSaveByTime.Checked then
  begin
    myini.WriteInteger('system_set', 'save_by_steady', 1);
    MainForm.systemConfig.saveByInterval := 1;
  end
  else if RBSaveByQuantity.Checked then
  begin
    myini.WriteInteger('system_set', 'save_by_steady', 2);
    MainForm.systemConfig.saveByInterval := 2;
  end;
  myini.WriteInteger('system_set', 'save_interval', SEInterval.Value);
  myini.WriteFloat('system_set', 'save_quantity', StrToFloatDef(LEQuantity.Text, 10000));
  MainForm.systemConfig.saveInterval := SEInterval.Value;
  MainForm.systemConfig.saveQuantity := StrToFloatDef(LEQuantity.Text, 10000);
  myini.WriteBool('system_set', 'save_after_return_zero', CBSaveAfterReturnZero.Checked);
  MainForm.systemConfig.saveAfterReturnZero := CBSaveAfterReturnZero.Checked;
  myini.WriteFloat('system_set', 'upper_limit', StrToFloatDef(LEUpperLimit.Text, 10));
  myini.WriteFloat('system_set', 'lower_limit', StrToFloatDef(LELowerLimit.Text, 10));
  MainForm.systemConfig.upperLimit := StrToFloatDef(LEUpperLimit.Text, 10);
  MainForm.systemConfig.lowerLimit := StrToFloatDef(LELowerLimit.Text, 10);

  myini.WriteInteger('system_set', 'ticket_sel_height',
    StrToIntDef(LETicketSelHeight.Text, 25));
  MainForm.systemConfig.ticketSelHeight := StrToIntDef(LETicketSelHeight.Text, 25);

  myini.WriteInteger('system_set', 'sum_type', RGSumType.ItemIndex);
  MainForm.systemConfig.sumType := RGSumType.ItemIndex;

  myini.WriteInteger('system_set', 'pay_type', CBPayType.ItemIndex);
  MainForm.systemConfig.payType := CBPayType.ItemIndex;

  myini.WriteBool('system_set', 'auto_login', CBAutoLogin.Checked);
  MainForm.systemConfig.autoLogin := CBAutoLogin.Checked;
  myini.WriteString('system_set', 'login_name', LELoginName.Text);
  MainForm.systemConfig.loginName := LELoginName.Text;
  myini.WriteString('system_set', 'login_pass', TCommonUtil.compressAndBase64(LELoginPass.Text));
  MainForm.systemConfig.loginPass := TCommonUtil.compressAndBase64(LELoginPass.Text);
end;

procedure TSoftwareSetForm.CBAutoShutdownClick(Sender: TObject);
begin
  DTPClose.Enabled := CBAutoShutdown.Checked;
end;

procedure TSoftwareSetForm.BtnTestPrinterClick(Sender: TObject);
begin
  TCommonUtil.printerBack(MainForm.systemConfig.printer1, StrToIntDef(LEPrinterBackRow.Text, 60));
end;

procedure TSoftwareSetForm.LEPicPathDblClick(Sender: TObject);
begin
  LEPicPath.Text := ExtractFilePath(ParamStr(0)) + '\WeightImg\';
end;

procedure TSoftwareSetForm.SpOddColorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var colorDialog: TColorDialog;
begin
  colorDialog := TColorDialog.Create(nil);
  try
    colorDialog.Color := SpOddColor.Brush.Color;
    if colorDialog.Execute then
    begin
      (Sender as TShape).Brush.Color := colorDialog.Color;
    end;
  finally
    colorDialog.Free;
  end;
end;

end.

