unit SysConfig;

interface

uses IniFiles, SysUtils;

type

  TWeightSetConfig = class
  private
  public
    ///////////////////////////////////////////////////////////
    //��ʽ�༭��ر���
    useExpression6, useExpression7, useExpression8, useExpression9,
      useExpression15, useExpression16, useExpression17, useExpression18: Boolean; //�Ƿ����ù�ʽ
    expression6, expression7, expression8, expression9,
      expression15, expression16, expression17, expression18: string; //��ʽ���ʽ
    point6, point7, point8, point9,
      point15, point16, point17, point18: Integer; //С����λ
    min6, min7, min8, min9,
      min15, min16, min17, min18: Double; //��Сֵ
    sumType6, sumType7, sumType8, sumType9, sumType15, sumType16, sumType17, sumType18: Integer;
    divide6, divide7, divide8, divide9, divide15, divide16, divide17, divide18: Integer;
    /////////////////////////////////////////////////////////////////////////////
    rule61, rule71, rule81, rule91, rule151, rule161, rule171, rule181: Integer;
    rule62, rule72, rule82, rule92, rule152, rule162, rule172, rule182: Integer;
    group6, group7, group8, group9, group15, group16, group17, group18: Integer;
    ////////////////////////////////////////////////////////////
    //��Ŀ�ɼ���
    noVisible, glideNoVisible, carVisible, weightTypeVisible,
      faHuoVisible, shouHuoVisible, goodsVisible, specVisible, grossVisible,
      tareVisible, netVisible, bundleVisible, realVisible, priceVisible, sumVisible,
      scaleVisible, quanterVisible, costVisible, grossManVisible, tareManVisible,
      grossAddrVisible, tareAddrVisible, grossTimeVisible, tareTimeVisible,
      firstTimeVisible, secondTimeVisible, updateUserVisible, updateTimeVisible,
      memoVisible, printCountVisible, uploadVisible, backup1Visible,
      backup2Visible, backup3Visible, backup4Visible, backup5Visible,
      backup6Visible, backup7Visible, backup8Visible, backup9Visible,
      backup10Visible, backup11Visible, backup12Visible, backup13Visible,
      backup14Visible, backup15Visible, backup16Visible, backup17Visible,
      backup18Visible: Boolean;
    //��Ŀ��ʾ����
    noCaption, glideNoCaption, carCaption, weightTypeCaption,
      faHuoCaption, shouHuoCaption, goodsCaption, specCaption, grossCaption,
      tareCaption, netCaption, bundleCaption, realCaption, priceCaption, sumCaption,
      scaleCaption, quanterCaption, costCaption, grossManCaption, tareManCaption,
      grossAddrCaption, tareAddrCaption, grossTimeCaption, tareTimeCaption,
      firstTimeCaption, secondTimeCaption, updateUserCaption, updateTimeCaption,
      memoCaption, printCountCaption, uploadCaption, backup1Caption,
      backup2Caption, backup3Caption, backup4Caption, backup5Caption,
      backup6Caption, backup7Caption, backup8Caption, backup9Caption,
      backup10Caption, backup11Caption, backup12Caption, backup13Caption,
      backup14Caption, backup15Caption, backup16Caption, backup17Caption,
      backup18Caption: string;
    //��ĿĬ��ֵ
    nodefault, glideNoDefault, carDefault, weightTypeDefault,
      faHuoDefault, shouHuoDefault, goodsDefault, specDefault, grossDefault,
      tareDefault, netDefault, bundleDefault, realDefault, priceDefault, sumDefault,
      scaleDefault, quanterDefault, costDefault, grossManDefault, tareManDefault,
      grossAddrDefault, tareAddrDefault, grossTimeDefault, tareTimeDefault,
      firstTimeDefault, secondTimeDefault, updateUserDefault, updateTimeDefault,
      memoDefault, printCountDefault, uploadDefault, backup1Default,
      backup2Default, backup3Default, backup4Default, backup5Default,
      backup6Default, backup7Default, backup8Default, backup9Default,
      backup10Default, backup11Default, backup12Default, backup13Default,
      backup14Default, backup15Default, backup16Default, backup17Default,
      backup18Default: string;
    //�Զ����ѡ��
    noClear, glideNoClear, carClear, weightTypeClear,
      faHuoClear, shouHuoClear, goodsClear, specClear, grossClear,
      tareClear, netClear, bundleClear, realClear, priceClear, sumClear,
      scaleClear, quanterClear, costClear, grossManClear, tareManClear,
      grossAddrClear, tareAddrClear, grossTimeClear, tareTimeClear,
      firstTimeClear, secondTimeClear, updateUserClear, updateTimeClear,
      memoClear, printCountClear, uploadClear, backup1Clear,
      backup2Clear, backup3Clear, backup4Clear, backup5Clear,
      backup6Clear, backup7Clear, backup8Clear, backup9Clear,
      backup10Clear, backup11Clear, backup12Clear, backup13Clear,
      backup14Clear, backup15Clear, backup16Clear, backup17Clear,
      backup18Clear: Boolean;
    //����ѡ��
    noMust, glideNoMust, carMust, weightTypeMust,
      faHuoMust, shouHuoMust, goodsMust, specMust,
      grossMust, tareMust, netMust, bundleMust,
      realMust, priceMust, sumMust, scaleMust,
      quanterMust, costMust, grossManMust, tareManMust,
      grossAddrMust, tareAddrMust, grossTimeMust, tareTimeMust,
      firstTimeMust, secondTimeMust, updateUserMust, updateTimeMust,
      memoMust, printCountMust, uploadMust, backup1Must,
      backup2Must, backup3Must, backup4Must, backup5Must,
      backup6Must, backup7Must, backup8Must, backup9Must,
      backup10Must, backup11Must, backup12Must, backup13Must,
      backup14Must, backup15Must, backup16Must, backup17Must,
      backup18Must: Boolean;
    /////////////////////////////////////////////////////////////////////////////
    //���������λ��
    pv00, pv01, pv02, pv03, pv04, pv05, pv06, pv07, pv08: string;
    pv10, pv11, pv12, pv13, pv14, pv15, pv16, pv17, pv18: string;
    pv20, pv21, pv22, pv23, pv24, pv25, pv26, pv27, pv28: string;
    pv30, pv31, pv32, pv33, pv34, pv35, pv36, pv37, pv38: string;
  end;

  TSysConfig = class
  private
  public
    company, tel: string; //��˾���ƣ���ϵ�绰
    metricUnit: string; // ������λ
    metricPoint: Integer; //������λ����
    meterUnitIndex, softUnitIndex: Integer; //������λ���
    dropCount: Integer; //������Ŀ��
    dropAuto: Boolean; //�Ƿ��Զ�����
    autoComplete: Boolean; //�б���Զ����
    autoClear: Boolean; //�Զ����
    enterTab: boolean; //�س�����
    useVoice: boolean; //������������
    deleteHistory: Boolean; //�����Զ�ɾ�����еļ�¼
    steadyCount: integer; //�ȶ�����
    returnZero: Double; //���ۻ�������
    waitForZero: Boolean; //ÿ�ι���֮��Ҫ��������ٴι���
    backRecordWeight: Double; //�Զ���¼������ʼ����
    sumDivide, sumPoint: Integer; //���С��λ
    backupType: Integer; //��������
    showPrepare: Boolean; //�Զ���������ѡ���
    allowSecondGross, allowSecondTare: Boolean; //������ι�ë�͹�Ƥ
    autoWriteTare: Boolean; //�Զ�Ԥ��Ƥ��
    useCode: Boolean; //ʹ�ô������Ǵ�
    printer1, printer2: string; //��ӡ��
    sayCombo: Boolean; //�뿪ʱ�������������
    previewTicket, simpleWeight: Boolean; //Ԥ������ //�򵥹���
    //////////////////////////////////////////////////////////
    //����������
    manualInputPound: boolean; //���ʻ��ֹ�����
    usePound: Boolean; //���ù�����
    basicPound, unitPound1, unitPound2: Double; //��������
    poundGrade1, poundGrade2, poundGrade3, poundGrade4, poundGrade5, poundGrade6: Double; //�ּ����ǰ���
    chargeType, scalePoint: Integer; //�ƷѴ���,С����λ��,ë�ؼƷѣ���Ϊë�ؼƷѣ�0Ϊ���ؼƷ�
    /////////////////////////////////////////////////////////////
    cheat, carCheat: Double; //��������
    databaseInUse: Boolean; //����ʹ�õ����ݿ�,�����Access����True,SQL����False
    ////////////////////////////////////////////////////////////////////////
    //��������
    useCorrect: Boolean;
    cheat1ShortCut, cheat2ShortCut, cheat3ShortCut, cheat4ShortCut, cheatCloseShortCut: Integer;
    cweight1, cweight2, cweight3, cweight4: Double;
    cweightFlag1, cweightFlag2, cweightFlag3, cweightFlag4: Boolean;
    cheatType: Boolean;
    startCheat: Double;
    useFix: Boolean; //ʹ�ù̶�������
    fix: Double;
    ////////////////////////////////////////////////////////////////////////
    useBundleRate: Boolean; //ʹ�ÿ��ʴ������
    allowNotSteady: Boolean; //�����ȶ���������
    selectTicketBeforePrint: Boolean; //��ӡʱѡ�����
    useTareDiff: Boolean;
    tareDiff: Double; //�Ƿ�����Ƥ��Ԥ��,������Ƥ�س��Χ
    addr: string; //�����ص�
    glideCode1, glideCode2, glideLength: Integer; //��ˮ�Ź���
    usePay: Boolean; //���ð��ջ���λ�۷ѹ���
    savePicLocal: Boolean; //�������ͼƬ�ڱ��ء�
    updateTimeOut: Integer; //���ι�����ʱʱ��
    useLastTare: Boolean; //��ë��ʱ��ʾ�Ƿ�ʹ���ϴ�Ƥ��
    ticketFormat, ticketFormat2: string; ///��ǰ������ʽ
    ticketType: Integer; //��������
    max: Double; //�Ǳ��������
    useBackRecord: Boolean; //���ú�̨��¼
    dataReportTitle: string; //���ݱ���̧ͷ
    skinFile: string; //Ƥ���ļ�
    databaseAlarm: Double; //���ݿ��С�������ޡ�
    voiceRate: Integer; //���������ٶ�
    weightType, weightMode, recordTime, recordType: Integer; //����ģʽ,��������,��ʾ��¼��Χ,��ʾ��¼����
    printerBackRow: Double; //��ӡ����ֽ����
    autoSendMail: Boolean; //�Զ������ʼ�
    autoSavePrepare: Boolean; //�����Զ�����Ԥ����Ϣ
    useWeightLine: Boolean; //������������
    useExceed: Boolean; //ʹ�ó�������ת��
    exceedStart: Double; //���޵�
    meterShowMode: string; //�Ǳ���ʾ��ʽ
    closeTime: string; //�ػ�ʱ��
    range: Double; //������Χ
    showMeter2: Boolean; //�Ƿ�һ��˫��
    allowModifyPrice: Boolean; //�����޸�Ԥ����Ϣ�����ĵ��ۺ��۷�ϵ��
    printNet: Boolean; //ֻ�����ӡ��ɼ�¼
    readLocal: Boolean; //ֻ�����ȡ��վ��¼
    completeHint, carOutHint: string; //�Զ��°������ʾ
    printAfterSave: Boolean; //������Զ���ӡ
    fiveTen: Boolean; //5�����10��
    useTimeOutLimit: Boolean; //���ó�ʱ����
    picCount: Integer; //ͼƬ��������
    saveByInterval: Boolean; //�Զ�����
    saveInterval: Integer;
    showTotal: Boolean; //��ʾ�ϼ���Ϣ
    ticketSelHeight: Integer;
    sumType: Integer; //����������뷽ʽ
    payType: Integer; //���ջ���λ�۷ѷ�ʽ
  end;

  TSysConfigUtil = class
  private
  public
    class function loadSoftConfig(var systemConfig: TSysConfig): Boolean;
    class function loadFormConfig(var weightSetConfig: TWeightSetConfig): Boolean;
    class function loadConfig(var systemConfig: TSysConfig; var weightSetConfig: TWeightSetConfig): Boolean;
    class function saveConfig(var systemConfig: TSysConfig): Boolean;
  end;

implementation

{ TSysConfigUtil }

class function TSysConfigUtil.loadConfig(
  var systemConfig: TSysConfig; var weightSetConfig: TWeightSetConfig): Boolean;
begin
  Result := loadSoftConfig(systemConfig) and loadFormConfig(weightSetConfig);
end;

class function TSysConfigUtil.loadFormConfig(
  var weightSetConfig: TWeightSetConfig): Boolean;
var myini: TiniFile;
begin
  myini := Tinifile.Create(ExtractFilePath(ParamStr(0)) + '\design.ini');
  try
    weightSetConfig.carVisible := myini.ReadBool('formDesign', 'car', True);
    weightSetConfig.faHuoVisible := myini.ReadBool('formDesign', 'faHuo', True);
    weightSetConfig.shouHuoVisible := myini.ReadBool('formDesign', 'shouHuo', True);
    weightSetConfig.goodsVisible := myini.ReadBool('formDesign', 'goods', True);
    weightSetConfig.specVisible := myini.ReadBool('formDesign', 'spec', True);
    weightSetConfig.grossVisible := myini.ReadBool('formDesign', 'gross', True);
    weightSetConfig.tareVisible := myini.ReadBool('formDesign', 'tare', True);
    weightSetConfig.netVisible := myini.ReadBool('formDesign', 'net', True);
    weightSetConfig.bundleVisible := myini.ReadBool('formDesign', 'bundle', True);
    weightSetConfig.realVisible := myini.ReadBool('formDesign', 'real', True);
    weightSetConfig.priceVisible := myini.ReadBool('formDesign', 'price', True);
    weightSetConfig.sumVisible := myini.ReadBool('formDesign', 'sum', True);
    weightSetConfig.scaleVisible := myini.ReadBool('formDesign', 'scale', True);
    weightSetConfig.quanterVisible := myini.ReadBool('formDesign', 'quanter', True);
    weightSetConfig.costVisible := myini.ReadBool('formDesign', 'cost', True);
    weightSetConfig.grossTimeVisible := myini.ReadBool('formDesign', 'grossTime', True);
    weightSetConfig.tareTimeVisible := myini.ReadBool('formDesign', 'tareTime', True);
    weightSetConfig.memoVisible := myini.ReadBool('formDesign', 'memo', True);
    weightSetConfig.backup1Visible := myini.ReadBool('formDesign', 'backup1', False);
    weightSetConfig.backup2Visible := myini.ReadBool('formDesign', 'backup2', False);
    weightSetConfig.backup3Visible := myini.ReadBool('formDesign', 'backup3', False);
    weightSetConfig.backup4Visible := myini.ReadBool('formDesign', 'backup4', False);
    weightSetConfig.backup5Visible := myini.ReadBool('formDesign', 'backup5', False);
    weightSetConfig.backup6Visible := myini.ReadBool('formDesign', 'backup6', False);
    weightSetConfig.backup7Visible := myini.ReadBool('formDesign', 'backup7', False);
    weightSetConfig.backup8Visible := myini.ReadBool('formDesign', 'backup8', False);
    weightSetConfig.backup9Visible := myini.ReadBool('formDesign', 'backup9', False);
    weightSetConfig.backup10Visible := myini.ReadBool('formDesign', 'backup10', False);
    weightSetConfig.backup11Visible := myini.ReadBool('formDesign', 'backup11', False);
    weightSetConfig.backup12Visible := myini.ReadBool('formDesign', 'backup12', False);
    weightSetConfig.backup13Visible := myini.ReadBool('formDesign', 'backup13', False);
    weightSetConfig.backup14Visible := myini.ReadBool('formDesign', 'backup14', False);
    weightSetConfig.backup15Visible := myini.ReadBool('formDesign', 'backup15', False);
    weightSetConfig.backup16Visible := myini.ReadBool('formDesign', 'backup16', False);
    weightSetConfig.backup17Visible := myini.ReadBool('formDesign', 'backup17', False);
    weightSetConfig.backup18Visible := myini.ReadBool('formDesign', 'backup18', False);
    ////////////////////////////////////////////////////////////////////
    //����ʾ����
    weightSetConfig.carCaption := myini.ReadString('formDesign', 'carCaption', '��  ��');
    weightSetConfig.faHuoCaption := myini.ReadString('formDesign', 'faHuoCaption', '������λ');
    weightSetConfig.shouHuoCaption := myini.ReadString('formDesign', 'shouHuoCaption', '�ջ���λ');
    weightSetConfig.goodsCaption := myini.ReadString('formDesign', 'goodsCaption', '��  ��');
    weightSetConfig.specCaption := myini.ReadString('formDesign', 'specCaption', '��  ��');
    weightSetConfig.grossCaption := myini.ReadString('formDesign', 'grosssCaption', 'ë  ��');
    weightSetConfig.tareCaption := myini.ReadString('formDesign', 'tareCaption', 'Ƥ  ��');
    weightSetConfig.netCaption := myini.ReadString('formDesign', 'netCaption', '��  ��');
    weightSetConfig.bundleCaption := myini.ReadString('formDesign', 'bundleCaption', '��  ��');
    weightSetConfig.realCaption := myini.ReadString('formDesign', 'realCaption', 'ʵ  ��');
    weightSetConfig.priceCaption := myini.ReadString('formDesign', 'priceCaption', '��  ��');
    weightSetConfig.sumCaption := myini.ReadString('formDesign', 'sumCaption', '��  ��');
    weightSetConfig.scaleCaption := myini.ReadString('formDesign', 'scaleCaption', '�۷�ϵ��');
    weightSetConfig.quanterCaption := myini.ReadString('formDesign', 'quanterCaption', '����');
    weightSetConfig.costCaption := myini.ReadString('formDesign', 'costCaption', '������');
    weightSetConfig.grossTimeCaption := myini.ReadString('formDesign', 'grossTimeCaption', 'ë��ʱ��');
    weightSetConfig.tareTimeCaption := myini.ReadString('formDesign', 'tareTimeCaption', 'Ƥ��ʱ��');
    weightSetConfig.memoCaption := myini.ReadString('formDesign', 'memoCaption', '��  ע');
    weightSetConfig.backup1Caption := myini.ReadString('formDesign', 'backup1Caption', '����1');
    weightSetConfig.backup2Caption := myini.ReadString('formDesign', 'backup2Caption', '����2');
    weightSetConfig.backup3Caption := myini.ReadString('formDesign', 'backup3Caption', '����3');
    weightSetConfig.backup4Caption := myini.ReadString('formDesign', 'backup4Caption', '����4');
    weightSetConfig.backup5Caption := myini.ReadString('formDesign', 'backup5Caption', '����5');
    weightSetConfig.backup6Caption := myini.ReadString('formDesign', 'backup6Caption', '����6');
    weightSetConfig.backup7Caption := myini.ReadString('formDesign', 'backup7Caption', '����7');
    weightSetConfig.backup8Caption := myini.ReadString('formDesign', 'backup8Caption', '����8');
    weightSetConfig.backup9Caption := myini.ReadString('formDesign', 'backup9Caption', '����9');
    weightSetConfig.backup10Caption := myini.ReadString('formDesign', 'backup10Caption', '����10');
    weightSetConfig.backup11Caption := myini.ReadString('formDesign', 'backup11Caption', '����11');
    weightSetConfig.backup12Caption := myini.ReadString('formDesign', 'backup12Caption', '����12');
    weightSetConfig.backup13Caption := myini.ReadString('formDesign', 'backup13Caption', '����13');
    weightSetConfig.backup14Caption := myini.ReadString('formDesign', 'backup14Caption', '����14');
    weightSetConfig.backup15Caption := myini.ReadString('formDesign', 'backup15Caption', '����15');
    weightSetConfig.backup16Caption := myini.ReadString('formDesign', 'backup16Caption', '����16');
    weightSetConfig.backup17Caption := myini.ReadString('formDesign', 'backup17Caption', '����17');
    weightSetConfig.backup18Caption := myini.ReadString('formDesign', 'backup18Caption', '����18');
    ////////////////////////////////////////////////////////////////////
    //��Ĭ��ֵ
    weightSetConfig.carDefault := myini.ReadString('formDesign', 'carDefault', '');
    weightSetConfig.faHuoDefault := myini.ReadString('formDesign', 'faHuoDefault', '');
    weightSetConfig.shouHuoDefault := myini.ReadString('formDesign', 'shouHuoDefault', '');
    weightSetConfig.goodsDefault := myini.ReadString('formDesign', 'goodsDefault', '');
    weightSetConfig.specDefault := myini.ReadString('formDesign', 'specDefault', '');
    weightSetConfig.bundleDefault := myini.ReadString('formDesign', 'bundleDefault', '0');
    weightSetConfig.priceDefault := myini.ReadString('formDesign', 'priceDefault', '0');
    weightSetConfig.scaleDefault := myini.ReadString('formDesign', 'scaleDefault', '1');
    weightSetConfig.memoDefault := myini.ReadString('formDesign', 'memoDefault', '');
    weightSetConfig.backup1Default := myini.ReadString('formDesign', 'backup1Default', '');
    weightSetConfig.backup2Default := myini.ReadString('formDesign', 'backup2Default', '');
    weightSetConfig.backup3Default := myini.ReadString('formDesign', 'backup3Default', '');
    weightSetConfig.backup4Default := myini.ReadString('formDesign', 'backup4Default', '');
    weightSetConfig.backup5Default := myini.ReadString('formDesign', 'backup5Default', '');
    weightSetConfig.backup6Default := myini.ReadString('formDesign', 'backup6Default', '0');
    weightSetConfig.backup7Default := myini.ReadString('formDesign', 'backup7Default', '0');
    weightSetConfig.backup8Default := myini.ReadString('formDesign', 'backup8Default', '0');
    weightSetConfig.backup9Default := myini.ReadString('formDesign', 'backup9Default', '0');
    weightSetConfig.backup10Default := myini.ReadString('formDesign', 'backup10Default', '');
    weightSetConfig.backup11Default := myini.ReadString('formDesign', 'backup11Default', '');
    weightSetConfig.backup12Default := myini.ReadString('formDesign', 'backup12Default', '');
    weightSetConfig.backup13Default := myini.ReadString('formDesign', 'backup13Default', '');
    weightSetConfig.backup14Default := myini.ReadString('formDesign', 'backup14Default', '');
    weightSetConfig.backup15Default := myini.ReadString('formDesign', 'backup15Default', '0');
    weightSetConfig.backup16Default := myini.ReadString('formDesign', 'backup16Default', '0');
    weightSetConfig.backup17Default := myini.ReadString('formDesign', 'backup17Default', '0');
    weightSetConfig.backup18Default := myini.ReadString('formDesign', 'backup18Default', '0');
    //��������ù�ʽ,�����Ͳ���������
    weightSetConfig.useExpression6 := myini.ReadBool('formDesign', 'useExpression6', False);
    weightSetConfig.expression6 := myini.ReadString('formDesign', 'expression6', '');
    weightSetConfig.useExpression7 := myini.ReadBool('formDesign', 'useExpression7', False);
    weightSetConfig.expression7 := myini.ReadString('formDesign', 'expression7', '');
    weightSetConfig.useExpression8 := myini.ReadBool('formDesign', 'useExpression8', False);
    weightSetConfig.expression8 := myini.ReadString('formDesign', 'expression8', '');
    weightSetConfig.useExpression9 := myini.ReadBool('formDesign', 'useExpression9', False);
    weightSetConfig.expression9 := myini.ReadString('formDesign', 'expression9', '');
    weightSetConfig.point6 := myini.ReadInteger('formDesign', 'point6', 0);
    weightSetConfig.point7 := myini.ReadInteger('formDesign', 'point7', 0);
    weightSetConfig.point8 := myini.ReadInteger('formDesign', 'point8', 0);
    weightSetConfig.point9 := myini.ReadInteger('formDesign', 'point9', 0);
    weightSetConfig.min6 := myini.ReadFloat('formDesign', 'min6', 0);
    weightSetConfig.min7 := myini.ReadFloat('formDesign', 'min7', 0);
    weightSetConfig.min8 := myini.ReadFloat('formDesign', 'min8', 0);
    weightSetConfig.min9 := myini.ReadFloat('formDesign', 'min9', 0);

    weightSetConfig.useExpression15 := myini.ReadBool('formDesign', 'useExpression15', False);
    weightSetConfig.expression15 := myini.ReadString('formDesign', 'expression15', '');
    weightSetConfig.useExpression16 := myini.ReadBool('formDesign', 'useExpression16', False);
    weightSetConfig.expression16 := myini.ReadString('formDesign', 'expression16', '');
    weightSetConfig.useExpression17 := myini.ReadBool('formDesign', 'useExpression17', False);
    weightSetConfig.expression17 := myini.ReadString('formDesign', 'expression17', '');
    weightSetConfig.useExpression18 := myini.ReadBool('formDesign', 'useExpression18', False);
    weightSetConfig.expression18 := myini.ReadString('formDesign', 'expression18', '');
    weightSetConfig.point15 := myini.ReadInteger('formDesign', 'point15', 0);
    weightSetConfig.point16 := myini.ReadInteger('formDesign', 'point16', 0);
    weightSetConfig.point17 := myini.ReadInteger('formDesign', 'point17', 0);
    weightSetConfig.point18 := myini.ReadInteger('formDesign', 'point18', 0);
    weightSetConfig.min15 := myini.ReadFloat('formDesign', 'min15', 0);
    weightSetConfig.min16 := myini.ReadFloat('formDesign', 'min16', 0);
    weightSetConfig.min17 := myini.ReadFloat('formDesign', 'min17', 0);
    weightSetConfig.min18 := myini.ReadFloat('formDesign', 'min18', 0);

    weightSetConfig.sumType6 := myini.ReadInteger('formDesign', 'sumType6', 1);
    weightSetConfig.sumType7 := myini.ReadInteger('formDesign', 'sumType7', 1);
    weightSetConfig.sumType8 := myini.ReadInteger('formDesign', 'sumType8', 1);
    weightSetConfig.sumType9 := myini.ReadInteger('formDesign', 'sumType9', 1);
    weightSetConfig.sumType15 := myini.ReadInteger('formDesign', 'sumType15', 1);
    weightSetConfig.sumType16 := myini.ReadInteger('formDesign', 'sumType16', 1);
    weightSetConfig.sumType17 := myini.ReadInteger('formDesign', 'sumType17', 1);
    weightSetConfig.sumType18 := myini.ReadInteger('formDesign', 'sumType18', 1);

    weightSetConfig.divide6 := myini.ReadInteger('formDesign', 'divide6', 1);
    weightSetConfig.divide7 := myini.ReadInteger('formDesign', 'divide7', 1);
    weightSetConfig.divide8 := myini.ReadInteger('formDesign', 'divide8', 1);
    weightSetConfig.divide9 := myini.ReadInteger('formDesign', 'divide9', 1);
    weightSetConfig.divide15 := myini.ReadInteger('formDesign', 'divide15', 1);
    weightSetConfig.divide16 := myini.ReadInteger('formDesign', 'divide16', 1);
    weightSetConfig.divide17 := myini.ReadInteger('formDesign', 'divide17', 1);
    weightSetConfig.divide18 := myini.ReadInteger('formDesign', 'divide18', 1);

    //ͳ��ѡ��
    weightSetConfig.Rule61 := myini.ReadInteger('formDesign', 'rule6', 0);
    weightSetConfig.Rule62 := myini.ReadInteger('formDesign', 'rule62', 0);
    weightSetConfig.Rule71 := myini.ReadInteger('formDesign', 'rule7', 0);
    weightSetConfig.Rule72 := myini.ReadInteger('formDesign', 'rule72', 0);
    weightSetConfig.Rule81 := myini.ReadInteger('formDesign', 'rule8', 0);
    weightSetConfig.Rule82 := myini.ReadInteger('formDesign', 'rule82', 0);
    weightSetConfig.Rule91 := myini.ReadInteger('formDesign', 'rule9', 0);
    weightSetConfig.Rule92 := myini.ReadInteger('formDesign', 'rule92', 0);
    weightSetConfig.Rule151 := myini.ReadInteger('formDesign', 'rule15', 0);
    weightSetConfig.Rule152 := myini.ReadInteger('formDesign', 'rule152', 0);
    weightSetConfig.Rule161 := myini.ReadInteger('formDesign', 'rule16', 0);
    weightSetConfig.Rule162 := myini.ReadInteger('formDesign', 'rule162', 0);
    weightSetConfig.Rule171 := myini.ReadInteger('formDesign', 'rule17', 0);
    weightSetConfig.Rule172 := myini.ReadInteger('formDesign', 'rule172', 0);
    weightSetConfig.Rule181 := myini.ReadInteger('formDesign', 'rule18', 0);
    weightSetConfig.Rule182 := myini.ReadInteger('formDesign', 'rule182', 0);

    weightSetConfig.Group6 := myini.ReadInteger('formDesign', 'group6', 0);
    weightSetConfig.Group7 := myini.ReadInteger('formDesign', 'group7', 0);
    weightSetConfig.Group8 := myini.ReadInteger('formDesign', 'group8', 0);
    weightSetConfig.Group9 := myini.ReadInteger('formDesign', 'group9', 0);
    weightSetConfig.Group15 := myini.ReadInteger('formDesign', 'group15', 0);
    weightSetConfig.Group16 := myini.ReadInteger('formDesign', 'group16', 0);
    weightSetConfig.Group17 := myini.ReadInteger('formDesign', 'group17', 0);
    weightSetConfig.Group18 := myini.ReadInteger('formDesign', 'group18', 0);

    //�Զ����ѡ��
    weightSetConfig.carClear := myini.ReadBool('formDesign', 'clearCar', True);
    weightSetConfig.faHuoClear := myini.ReadBool('formDesign', 'clearFaHuo', True);
    weightSetConfig.shouHuoClear := myini.ReadBool('formDesign', 'clearShouHuo', True);
    weightSetConfig.goodsClear := myini.ReadBool('formDesign', 'clearGoods', True);
    weightSetConfig.specClear := myini.ReadBool('formDesign', 'clearSpec', True);
    weightSetConfig.bundleClear := myini.ReadBool('formDesign', 'clearBundle', True);
    weightSetConfig.priceClear := myini.ReadBool('formDesign', 'clearPrice', True);
    weightSetConfig.scaleClear := myini.ReadBool('formDesign', 'clearScale', True);
    weightSetConfig.memoClear := myini.ReadBool('formDesign', 'memoRemark', True);
    weightSetConfig.backup1Clear := myini.ReadBool('formDesign', 'clearBackup1', True);
    weightSetConfig.backup2Clear := myini.ReadBool('formDesign', 'clearBackup2', True);
    weightSetConfig.backup3Clear := myini.ReadBool('formDesign', 'clearBackup3', True);
    weightSetConfig.backup4Clear := myini.ReadBool('formDesign', 'clearBackup4', True);
    weightSetConfig.backup5Clear := myini.ReadBool('formDesign', 'clearBackup5', True);
    weightSetConfig.backup6Clear := myini.ReadBool('formDesign', 'clearBackup6', True);
    weightSetConfig.backup7Clear := myini.ReadBool('formDesign', 'clearBackup7', True);
    weightSetConfig.backup8Clear := myini.ReadBool('formDesign', 'clearBackup8', True);
    weightSetConfig.backup9Clear := myini.ReadBool('formDesign', 'clearBackup9', True);
    weightSetConfig.backup10Clear := myini.ReadBool('formDesign', 'clearBackup10', True);
    weightSetConfig.backup11Clear := myini.ReadBool('formDesign', 'clearBackup11', True);
    weightSetConfig.backup12Clear := myini.ReadBool('formDesign', 'clearBackup12', True);
    weightSetConfig.backup13Clear := myini.ReadBool('formDesign', 'clearBackup13', True);
    weightSetConfig.backup14Clear := myini.ReadBool('formDesign', 'clearBackup14', True);
    weightSetConfig.backup15Clear := myini.ReadBool('formDesign', 'clearBackup15', True);
    weightSetConfig.backup16Clear := myini.ReadBool('formDesign', 'clearBackup16', True);
    weightSetConfig.backup17Clear := myini.ReadBool('formDesign', 'clearBackup17', True);
    weightSetConfig.backup18Clear := myini.ReadBool('formDesign', 'clearBackup18', True);

    weightSetConfig.carMust := myini.ReadBool('formDesign', 'mustCar', True);
    weightSetConfig.faHuoMust := myini.ReadBool('formDesign', 'mustFaHuo', False);
    weightSetConfig.shouHuoMust := myini.ReadBool('formDesign', 'mustShouHuo', False);
    weightSetConfig.goodsMust := myini.ReadBool('formDesign', 'mustGoods', False);
    weightSetConfig.specMust := myini.ReadBool('formDesign', 'mustSpec', False);
    weightSetConfig.bundleMust := myini.ReadBool('formDesign', 'mustBundle', False);
    weightSetConfig.priceMust := myini.ReadBool('formDesign', 'mustPrice', False);
    weightSetConfig.scaleMust := myini.ReadBool('formDesign', 'mustScale', False);
    weightSetConfig.memoMust := myini.ReadBool('formDesign', 'mustMemo', False);
    weightSetConfig.backup1Must := myini.ReadBool('formDesign', 'mustBackup1', False);
    weightSetConfig.backup2Must := myini.ReadBool('formDesign', 'mustBackup2', False);
    weightSetConfig.backup3Must := myini.ReadBool('formDesign', 'mustBackup3', False);
    weightSetConfig.backup4Must := myini.ReadBool('formDesign', 'mustBackup4', False);
    weightSetConfig.backup5Must := myini.ReadBool('formDesign', 'mustBackup5', False);
    weightSetConfig.backup6Must := myini.ReadBool('formDesign', 'mustBackup6', False);
    weightSetConfig.backup7Must := myini.ReadBool('formDesign', 'mustBackup7', False);
    weightSetConfig.backup8Must := myini.ReadBool('formDesign', 'mustBackup8', False);
    weightSetConfig.backup9Must := myini.ReadBool('formDesign', 'mustBackup9', False);
    weightSetConfig.backup10Must := myini.ReadBool('formDesign', 'mustBackup10', False);
    weightSetConfig.backup11Must := myini.ReadBool('formDesign', 'mustBackup11', False);
    weightSetConfig.backup12Must := myini.ReadBool('formDesign', 'mustBackup12', False);
    weightSetConfig.backup13Must := myini.ReadBool('formDesign', 'mustBackup13', False);
    weightSetConfig.backup14Must := myini.ReadBool('formDesign', 'mustBackup14', False);
    weightSetConfig.backup15Must := myini.ReadBool('formDesign', 'mustBackup15', False);
    weightSetConfig.backup16Must := myini.ReadBool('formDesign', 'mustBackup16', False);
    weightSetConfig.backup17Must := myini.ReadBool('formDesign', 'mustBackup17', False);
    weightSetConfig.backup18Must := myini.ReadBool('formDesign', 'mustBackup18', False);
    weightSetConfig.grossMust := myini.ReadBool('formDesign', 'mustGross', False);
    weightSetConfig.tareMust := myini.ReadBool('formDesign', 'mustTare', False);
    weightSetConfig.netMust := myini.ReadBool('formDesign', 'mustNet', False);
    weightSetConfig.realMust := myini.ReadBool('formDesign', 'mustReal', False);
    weightSetConfig.sumMust := myini.ReadBool('formDesign', 'mustSum', False);
    weightSetConfig.costMust := myini.ReadBool('formDesign', 'mustCost', False);
    weightSetConfig.quanterMust := myini.ReadBool('formDesign', 'mustQuanter', False);

    weightSetConfig.pv00 := myini.ReadString('position', 'cb00', '����');
    weightSetConfig.pv01 := myini.ReadString('position', 'cb01', '������λ');
    weightSetConfig.pv02 := myini.ReadString('position', 'cb02', '�ջ���λ');
    weightSetConfig.pv03 := myini.ReadString('position', 'cb03', '����');
    weightSetConfig.pv04 := myini.ReadString('position', 'cb04', '���');
    weightSetConfig.pv05 := myini.ReadString('position', 'cb05', '��ע');
    weightSetConfig.pv06 := myini.ReadString('position', 'cb06', 'ë��');
    weightSetConfig.pv07 := myini.ReadString('position', 'cb07', 'Ƥ��');
    weightSetConfig.pv08 := myini.ReadString('position', 'cb08', '����');

    weightSetConfig.pv10 := myini.ReadString('position', 'cb10', '');
    weightSetConfig.pv11 := myini.ReadString('position', 'cb11', '');
    weightSetConfig.pv12 := myini.ReadString('position', 'cb12', '');
    weightSetConfig.pv13 := myini.ReadString('position', 'cb13', '');
    weightSetConfig.pv14 := myini.ReadString('position', 'cb14', '');
    weightSetConfig.pv15 := myini.ReadString('position', 'cb15', '');
    weightSetConfig.pv16 := myini.ReadString('position', 'cb16', '');
    weightSetConfig.pv17 := myini.ReadString('position', 'cb17', '');
    weightSetConfig.pv18 := myini.ReadString('position', 'cb18', '');

    weightSetConfig.pv20 := myini.ReadString('position', 'cb20', '');
    weightSetConfig.pv21 := myini.ReadString('position', 'cb21', '');
    weightSetConfig.pv22 := myini.ReadString('position', 'cb22', '');
    weightSetConfig.pv23 := myini.ReadString('position', 'cb23', '');
    weightSetConfig.pv24 := myini.ReadString('position', 'cb24', '');
    weightSetConfig.pv25 := myini.ReadString('position', 'cb25', '');
    weightSetConfig.pv26 := myini.ReadString('position', 'cb26', '');
    weightSetConfig.pv27 := myini.ReadString('position', 'cb27', '');
    weightSetConfig.pv28 := myini.ReadString('position', 'cb28', '');

    weightSetConfig.pv30 := myini.ReadString('position', 'cb30', '');
    weightSetConfig.pv31 := myini.ReadString('position', 'cb31', '');
    weightSetConfig.pv32 := myini.ReadString('position', 'cb32', '');
    weightSetConfig.pv33 := myini.ReadString('position', 'cb33', '');
    weightSetConfig.pv34 := myini.ReadString('position', 'cb34', '');
    weightSetConfig.pv35 := myini.ReadString('position', 'cb35', '');
    weightSetConfig.pv36 := myini.ReadString('position', 'cb36', '');
  finally
    myini.Free;
  end;
end;

class function TSysConfigUtil.loadSoftConfig(
  var systemConfig: TSysConfig): Boolean;
var myini: TiniFile;
begin
  myini := Tinifile.Create(ExtractFilePath(ParamStr(0)) + '\setup.ini');
  try
    systemConfig.backupType := myini.ReadInteger('db', 'backup_type', 3);
    systemConfig.company := myini.ReadString('system_set', 'company', '');
    systemConfig.tel := myini.ReadString('system_set', 'tel', '');
    systemConfig.metricUnit := myini.ReadString('system_set', 'soft_unit', '��  ��');
    systemConfig.meterUnitIndex := myini.ReadInteger('system_set', 'meter_unit_index', 0);
    systemConfig.softUnitIndex := myini.ReadInteger('system_set', 'soft_unit_index', 0);
    if (systemConfig.meterUnitIndex < 3) then
    begin
      if (systemConfig.softUnitIndex < 3) then systemConfig.metricPoint := 0
      else systemConfig.metricPoint := -3;
    end
    else
    begin
      if (systemConfig.softUnitIndex < 3) then systemConfig.metricPoint := 3
      else systemConfig.metricPoint := 0;
    end;

    systemConfig.dropCount := myini.ReadInteger('system_set', 'dropDownCount', 5);
    systemConfig.dropAuto := myini.ReadBool('system_set', 'autoDropDown', True);
    systemConfig.autoComplete := myini.ReadBool('system_set', 'autoComplete', False);
    systemConfig.ReturnZero := myini.ReadFloat('system_set', 'returnZero', 100);
    //ÿ�ι���֮��Ҫ��������ٴ����복��
    systemConfig.waitForZero := myini.ReadBool('system_set', 'waitForZero', False);
    systemConfig.printer1 := myini.ReadString('system_set', 'printer1', 'Default');
    systemConfig.printer2 := myini.ReadString('system_set', 'printer2', 'Default');

    systemConfig.AllowSecondTare := myini.ReadBool('system_set', 'allowSecondTare', False);
    systemConfig.AllowSecondGross := myini.ReadBool('system_set', 'allowSecondGross', False);
    systemConfig.autoWriteTare := myini.ReadBool('system_set', 'autoWriteTare', False);
    //������λ,�ջ���λ����Ϣ�ô�������
    systemConfig.useCode := myini.ReadBool('system_set', 'useCode', True);
    systemConfig.EnterTab := myini.ReadBool('system_set', 'enterAsTab', True);
    systemConfig.usePound := myini.ReadBool('system_set', 'useCost', False);
    systemConfig.ManualInputPound := myini.ReadBool('system_set', 'manualInputCost', False);
    systemConfig.BasicPound := StrToFloat(myini.ReadString('system_set', 'initCost', '5'));
    systemConfig.UnitPound1 := StrToFloat(myini.ReadString('system_set', 'unitCost1', '2'));
    systemConfig.UnitPound2 := StrToFloat(myini.ReadString('system_set', 'unitCost2', '2'));

    systemConfig.poundGrade1 := myini.ReadFloat('system_set', 'grade1', 0);
    systemConfig.poundGrade2 := myini.ReadFloat('system_set', 'grade2', 10000);
    systemConfig.poundGrade3 := myini.ReadFloat('system_set', 'grade3', 10000);
    systemConfig.poundGrade4 := myini.ReadFloat('system_set', 'grade4', 100000);
    systemConfig.poundGrade5 := myini.ReadFloat('system_set', 'grade5', 100000);
    systemConfig.poundGrade6 := myini.ReadFloat('system_set', 'grade6', 120000);

    systemConfig.ChargeType := Myini.ReadInteger('system_set', 'costType', 1);
    systemConfig.scalePoint := myini.ReadInteger('system_set', 'point', 0);

    systemConfig.ShowPrepare := myini.ReadBool('system_set', 'showPrepare', False);

    systemConfig.useVoice := myini.ReadBool('system_set', 'useVoice', False);
    //�Ƿ��̨�Զ�����
    systemConfig.backRecordWeight := myini.ReadFloat('system_set', 'back_record_weight', 1000);
    systemConfig.useBackRecord := myini.ReadBool('system_set', 'backRecord', False);
    //���С����λ��
    systemConfig.sumDivide := myini.ReadInteger('system_set', 'sumDivide', 1);
    systemConfig.sumPoint := myini.ReadInteger('system_set', 'sumPoint', 0);
    //�Զ�ɾ����ʷ��¼
    systemConfig.deleteHistory := myini.ReadBool('system_set', 'delHistory', False);
    //�ȶ�����
    systemConfig.steadyCount := myini.ReadInteger('system_set', 'steadyCount', 4);
    //���۲���
    systemConfig.useCorrect := myini.ReadBool('correct', 'use', False);
    systemConfig.cheat1ShortCut := myini.ReadInteger('correct', 'weight1-key', 0);
    systemConfig.cheat2ShortCut := myini.ReadInteger('correct', 'weight2-key', 0);
    systemConfig.cheat3ShortCut := myini.ReadInteger('correct', 'weight3-key', 0);
    systemConfig.cheat4ShortCut := myini.ReadInteger('correct', 'weight4-key', 0);
    systemConfig.cheatCloseShortCut := myini.ReadInteger('correct', 'weight-close', 0);


    systemConfig.useFix := myini.ReadBool('correct', 'use_fix', False);
    systemConfig.fix := myini.ReadFloat('correct', 'fix', 0);

    systemConfig.cweight1 := myini.ReadFloat('correct', 'weight1', 1000);
    systemConfig.cweight2 := myini.ReadFloat('correct', 'weight2', 1500);
    systemConfig.cweight3 := myini.ReadFloat('correct', 'weight3', 2000);
    systemConfig.cweight4 := myini.ReadFloat('correct', 'weight4', 2500);
    systemConfig.cweightFlag1 := False;
    systemConfig.cweightFlag2 := False;
    systemConfig.cweightFlag3 := False;
    systemConfig.cweightFlag4 := False;
    systemConfig.cheatType := myini.ReadBool('correct', 'correctType', True);
    systemConfig.startCheat := myini.ReadFloat('correct', 'startCheat', 10000);

    systemConfig.useBundleRate := myini.ReadBool('system_set', 'useBundleRate', False);
    //�����ȶ���������
    systemConfig.allowNotSteady := myini.ReadBool('system_set', 'allowNotSteady', False);
    //ÿ�γ��ش�ӡʱѡ�����
    systemConfig.selectTicketBeforePrint := myini.ReadBool('system_set', 'selectTicketBeforePrint', False);
    //Ƥ�س���Ԥ��
    systemConfig.useTareDiff := myini.ReadBool('system_set', 'useTareDiff', False);
    systemConfig.tareDiff := myini.ReadFloat('system_set', 'tareDiff', 5);
    //�����ص�
    systemConfig.addr := myini.ReadString('system_set', 'addr', 'A');
    //��ˮ�Ź���
    systemConfig.glideCode1 := myini.ReadInteger('system_set', 'glide_code1', 0);
    systemConfig.glideCode2 := myini.ReadInteger('system_set', 'glide_code2', 1);
    systemConfig.glideLength := myini.ReadInteger('system_set', 'glide_length', 4);
    //�Ƿ����ÿ۷ѹ���
    systemConfig.usePay := myini.ReadBool('system_set', 'pay', False);
    //���ݿ����ڱ���
    systemConfig.savePicLocal := myini.ReadBool('system_set', 'savePicLocal', True);
    //���ι�����ʱʱ������
    systemConfig.updateTimeOut := myini.ReadInteger('system_set', 'updateTimeOut', 12000);
    //���ó�ʱ����
    systemConfig.useTimeOutLimit := myini.ReadBool('system_set', 'use_timeout_limit', False);
    //��ë��ʱ��ʾ�Ƿ�ʹ���ϴ�Ƥ��
    systemConfig.useLastTare := myini.ReadBool('system_set', 'useLastTare', False);
    //��������
    systemConfig.ticketType := myini.ReadInteger('system_set', 'ticket_type', 1);
    //��ǰ������ʽ
    systemConfig.ticketFormat := myini.ReadString('system_set', 'ticketFormat',
      ExtractFilePath(ParamStr(0)) + '\Ticket\��׼���.fr3');
    systemConfig.ticketFormat2 := myini.ReadString('system_set', 'ticketFormat2',
      ExtractFilePath(ParamStr(0)) + '\TicketII\��ʽ����.rmf');
    //����
    systemConfig.max := myini.ReadFloat('system_set', 'max', 200000);
    systemConfig.dataReportTitle := myini.ReadString('system_set', 'dataReportTitle', '���ݱ���');
    //ϵͳƤ��
    systemConfig.skinFile := myini.ReadString('system_set', 'skin_file', '');
    //���ݿ��С��������
    systemConfig.databaseAlarm := myini.ReadInteger('system_set', 'database_alarm_value', 1024);
    //�������ͼ�����ģʽ
    systemConfig.weightType := myini.ReadInteger('system_set', 'weight_type', 0);
    systemConfig.weightMode := myini.ReadInteger('system_set', 'weight_mode', 0);
    //��¼ʱ��ͼ�¼����
    systemConfig.recordTime := myini.ReadInteger('system_set', 'record_time', 1);
    systemConfig.recordType := myini.ReadInteger('system_set', 'record_type', 0);
    //�������������
    systemConfig.sayCombo := myini.ReadBool('system_set', 'say', False);
    //���������ٶ�
    systemConfig.voiceRate := myini.ReadInteger('system_set', 'voice_rate', 0);
    //��ӡ����ֽ����
    systemConfig.printerBackRow := myini.ReadFloat('system_set', 'printerBackRow', 0);
    //�Զ�����Ԥ����Ϣ
    systemConfig.autoSavePrepare := myini.ReadBool('system_set', 'auto_save_prepare', True);
    //������������
    systemConfig.useWeightLine := myini.ReadBool('system_set', 'use_weight_line', False);
    //��������
    systemConfig.useExceed := myini.ReadBool('system_set', 'use_exceed', False);
    systemConfig.exceedStart := myini.ReadFloat('system_set', 'exceed_start', 55000);
    //�Ǳ���ʾ��ʽ
    systemConfig.meterShowMode := myini.ReadString('system_set', 'meter_show_mode', '0');
    systemConfig.range := myini.ReadFloat('system_set', 'range', 20);
    systemConfig.showMeter2 := myini.ReadBool('system_set', 'show_meter2', False);
    //�����޸�Ԥ����Ϣ�����ĵ��ۺ��۷�ϵ��
    systemConfig.allowModifyPrice := myini.ReadBool('system_set', 'allow_modify_price', True);
    //ֻ�����ӡ��ɼ�¼
    systemConfig.printNet := myini.ReadBool('system_set', 'print_net', False);
    //ֻ�����ȡ��������
    systemConfig.readLocal := myini.ReadBool('system_set', 'read_local', False);
    //�Զ�������ɺ��������ʾ
    systemConfig.completeHint := myini.ReadString('system_set', 'complete_hint', 'ȡ��������³�');
    systemConfig.carOutHint := myini.ReadString('system_set', 'car_out_hint', '�������³�');
    //������Զ���ӡ
    systemConfig.printAfterSave := myini.ReadBool('system_set', 'print_after_save', False);
    //������ݿ�ͼƬ��������
    systemConfig.picCount := myini.ReadInteger('system_set', 'pic_count', 20000);
    //�Զ�����
    systemConfig.saveByInterval := myini.ReadBool('system_set', 'save_by_steady', True);
    systemConfig.saveInterval := myini.ReadInteger('system_set', 'save_interval', 5);
    //��ʾ�ϼ�
    systemConfig.showTotal := myini.ReadBool('system_set', 'show_total', True);
    systemConfig.ticketSelHeight := myini.ReadInteger('system_set', 'ticket_sel_height', 25);
    //����λ��ʽ
    systemConfig.sumType := myini.ReadInteger('system_set', 'sum_type', 1);
    systemConfig.payType := myini.ReadInteger('system_set', 'pay_type', 0);
  finally
    myini.Free;
  end;
  myini := Tinifile.Create(ExtractFilePath(ParamStr(0)) + '\db.ini');
  try
    //���ݿ�����
    systemConfig.databaseInUse := myini.ReadInteger('db', 'type', 0) = 0;
  finally
    myini.Free;
  end;
  Result := True;
end;

class function TSysConfigUtil.saveConfig(var systemConfig: TSysConfig): Boolean;
begin
  Result := False;
end;

end.

