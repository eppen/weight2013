unit SysConfig;

interface

uses IniFiles, SysUtils, Graphics, Windows;

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
    //DBGrid����
    noIndex, glideNoIndex, carIndex, weightTypeIndex,
      faHuoIndex, shouHuoIndex, goodsIndex, specIndex, grossIndex,
      tareIndex, netIndex, bundleIndex, realIndex, priceIndex, sumIndex,
      scaleIndex, quanterIndex, costIndex, grossManIndex, tareManIndex,
      grossAddrIndex, tareAddrIndex, grossTimeIndex, tareTimeIndex,
      firstTimeIndex, secondTimeIndex, updateUserIndex, updateTimeIndex,
      memoIndex, printCountIndex, uploadIndex, backup1Index,
      backup2Index, backup3Index, backup4Index, backup5Index,
      backup6Index, backup7Index, backup8Index, backup9Index,
      backup10Index, backup11Index, backup12Index, backup13Index,
      backup14Index, backup15Index, backup16Index, backup17Index,
      backup18Index: Integer;
    //DBGrid���
    noWidth, glideNoWidth, carWidth, weightTypeWidth,
      faHuoWidth, shouHuoWidth, goodsWidth, specWidth, grossWidth,
      tareWidth, netWidth, bundleWidth, realWidth, priceWidth, sumWidth,
      scaleWidth, quanterWidth, costWidth, grossManWidth, tareManWidth,
      grossAddrWidth, tareAddrWidth, grossTimeWidth, tareTimeWidth,
      firstTimeWidth, secondTimeWidth, updateUserWidth, updateTimeWidth,
      memoWidth, printCountWidth, uploadWidth, backup1Width,
      backup2Width, backup3Width, backup4Width, backup5Width,
      backup6Width, backup7Width, backup8Width, backup9Width,
      backup10Width, backup11Width, backup12Width, backup13Width,
      backup14Width, backup15Width, backup16Width, backup17Width,
      backup18Width: Integer;
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
    //////////////////////////////////////////////////////////////
    //Ψһ��
    carUnique,
      faHuoUnique, shouHuoUnique, goodsUnique, specUnique, grossUnique,
      tareUnique, netUnique, bundleUnique, realUnique, priceUnique, sumUnique,
      scaleUnique, quanterUnique, costUnique, grossManUnique, tareManUnique,
      grossAddrUnique, tareAddrUnique, grossTimeUnique, tareTimeUnique,
      firstTimeUnique, secondTimeUnique, updateUserUnique, updateTimeUnique,
      memoUnique, printCountUnique, uploadUnique, backup1Unique,
      backup2Unique, backup3Unique, backup4Unique, backup5Unique,
      backup6Unique, backup7Unique, backup8Unique, backup9Unique,
      backup10Unique, backup11Unique, backup12Unique, backup13Unique,
      backup14Unique, backup15Unique, backup16Unique, backup17Unique,
      backup18Unique: Boolean;
    ///////////////////////////////////////////////////////////////////
    //���ι������ɱ��ѡ��
    carNotChange,
      faHuoNotChange, shouHuoNotChange, goodsNotChange, specNotChange, grossNotChange,
      tareNotChange, netNotChange, bundleNotChange, realNotChange, priceNotChange, sumNotChange,
      scaleNotChange, quanterNotChange, costNotChange, grossManNotChange, tareManNotChange,
      grossAddrNotChange, tareAddrNotChange, grossTimeNotChange, tareTimeNotChange,
      firstTimeNotChange, secondTimeNotChange, updateUserNotChange, updateTimeNotChange,
      memoNotChange, printCountNotChange, uploadNotChange, backup1NotChange,
      backup2NotChange, backup3NotChange, backup4NotChange, backup5NotChange,
      backup6NotChange, backup7NotChange, backup8NotChange, backup9NotChange,
      backup10NotChange, backup11NotChange, backup12NotChange, backup13NotChange,
      backup14NotChange, backup15NotChange, backup16NotChange, backup17NotChange,
      backup18NotChange: Boolean;
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
    softUnit1, softUnit2: string;
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
    quanterDivide, quanterPoint: Integer;
    realPoint: Integer;

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
    useCost: Boolean; //���ù�����
    manualInputPound: boolean; //���ʻ��ֹ�����
    basicPound, unitPound1, unitPound2: Double; //��������
    poundGrade1, poundGrade2, poundGrade3, poundGrade4, poundGrade5, poundGrade6: Double; //�ּ����ǰ���
    chargeType, costType, scalePoint: Integer; //�ƷѴ���,С����λ��,ë�ؼƷѣ���Ϊë�ؼƷѣ�0Ϊ���ؼƷ�
    ladder: Boolean; //�����շ�
    grade11, grade12, grade21, grade22, grade31, grade32,
      grade41, grade42, grade51, grade52, grade61, grade62, grade71, grade72,
      grade81, grade82, grade91, grade92, grade101, grade102, grade111, grade112,
      grade121, grade122, grade131, grade132,
      cost1, cost2, cost3, cost4, cost5, cost6, cost7, cost8,
      cost9, cost10, cost11, cost12, cost13: Double;
    /////////////////////////////////////////////////////////////
    cheat, carCheat: Double; //��������
    databaseInUse: Boolean; //����ʹ�õ����ݿ�,�����Access����True,SQL����False
    ////////////////////////////////////////////////////////////////////////
    //��������
    useCorrect: Boolean;
    cheat1ShortCut, cheat2ShortCut, cheat3ShortCut, cheat4ShortCut,
      cheat5ShortCut, cheat6ShortCut, cheat7ShortCut, cheat8ShortCut,
      cheatCloseShortCut: Integer;
    cweight1, cweight2, cweight3, cweight4,
      cweight5, cweight6, cweight7, cweight8: Double;
    cweightFlag1, cweightFlag2, cweightFlag3, cweightFlag4,
      cweightFlag5, cweightFlag6, cweightFlag7, cweightFlag8: Boolean;
    fixCheatFlag: Boolean;
    cheatType: Boolean;
    startCheat: Double;
    useFix: Boolean; //ʹ�ù̶�������
    fix: Double;
    correctOnce: Boolean;
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
    minUpdateTime, maxUpdateTime: Integer; //���ι�����ʱʱ��
    useLastTare: Boolean; //��ë��ʱ��ʾ�Ƿ�ʹ���ϴ�Ƥ��
    poTicketFormat, soTicketFormat, ioTicketFormat, ooTicketFormat: string;
    poTicketFormat2, soTicketFormat2, ioTicketFormat2, ooTicketFormat2: string;
    ticketType: Integer; //��������
    max: Double; //�Ǳ��������
    useBackRecord: Boolean; //���ú�̨��¼
    dataReportTitle: string; //���ݱ���̧ͷ
    skinFile: string; //Ƥ���ļ�
    databaseAlarm: Double; //���ݿ��С�������ޡ�
    voiceRate: Integer; //���������ٶ�
    weightType, weightMode, recordTime, recordType: Integer; //����ģʽ,��������,��ʾ��¼��Χ,��ʾ��¼����
    printerBackRow: Integer; //��ӡ����ֽ����
    autoSendMail: Boolean; //�Զ������ʼ�
    autoSavePrepare: Boolean; //�����Զ�����Ԥ����Ϣ
    useWeightLine: Boolean; //������������
    useExceed: Boolean; //ʹ�ó�������ת��
    exceedStart: Double; //���޵�
    meterShowMode1, meterShowMode2: string; //�Ǳ���ʾ��ʽ
    meterDivide1, meterDivide2: Integer; //�Ǳ�ֶ�ֵ
    closeTime: string; //�ػ�ʱ��
    range: Double; //������Χ
    showMeter2: Boolean; //�Ƿ�һ��˫��
    allowModifyPrice: Boolean; //�����޸�Ԥ����Ϣ�����ĵ��ۺ��۷�ϵ��
    printNet: Boolean; //ֻ�����ӡ��ɼ�¼
    completeHint, carOutHint: string; //�Զ��°������ʾ
    printAfterSave: Boolean; //������Զ���ӡ
    fiveTen: Boolean; //5�����10��
    useTimeOutLimit: Boolean; //���ó�ʱ����
    picCount: Integer; //ͼƬ��������
    saveByInterval: Integer; //�Զ���������
    saveInterval: Integer;
    saveQuantity: Double; //����������
    upperLimit, lowerLimit: Double;

    showTotal: Boolean; //��ʾ�ϼ���Ϣ
    ticketSelHeight: Integer;
    sumType: Integer; //����������뷽ʽ
    payType: Integer; //���ջ���λ�۷ѷ�ʽ
    useLast100CarNo: Boolean; //ʹ�����100����������
    //�Զ���½
    autoLogin: Boolean;
    loginName, loginPass: string;
    //�Զ�ˢ������
    autoRefresh: Boolean;
    autoRefreshInterval: Integer;
    picPath: string; //����ͼƬ���·��
    simpleMode: Integer; //�򵥹���ʱ����һ���ǹ�ë�ػ��ǹ�Ƥ��
    useStandard, useSimple, useOnce: Boolean;
    weightOneClick: Boolean; //����غ���������
    saveAfterReturnZero: Boolean;
    taoPrimayKey: Integer; //�ױ�����
    disconnectToZero: Boolean;
    disconnectCheckCount: Integer; //�Ǳ���߹�����Դ���
    recordLeft: Boolean; //��¼ʣ����
    useOutGlideNo: Boolean; //ʹ�ó�����ˮ��
    useFilterForm: Boolean; //ʹ���б���˿�
    exportToWeight: Boolean; //���������������
    exportItem: Integer;
    showPrintDialog: Boolean; //��ʾ��ӡ��ѡ��Ի���
    weightSaveInterval: Integer; //�ظ��������
    useSaveInterval: Boolean; //ʹ���ظ������������
    doubleAdd: Boolean; //��̨�Ǳ������ۼ�
    printTwo: Boolean; //ͬʱ����̨��ӡ���ϴ�ӡ
    useLog: Boolean; //������־����
    notVisibleWeight: Double;
    autoMode: Boolean;
    onlyAllowInvalidNotFinished: Boolean; //ֻ��������δ��ɼ�¼
    allowModifyGlideNo: Boolean; //�����޸İ�����ˮ��
    useManualFlag: Boolean; //ʹ�ò�����־
    defaultPrintPicTicket: Boolean; //Ĭ�ϴ�ӡͼƬ����
    autoUpdateExpression: Boolean; //ʵʱ�����Զ��幫ʽ
    recordCorrect: Boolean; //��¼������
    onlyShowNotFinishedRecord: Boolean; //�б�˫������δ��ɼ�¼
    oddColor, evenColor: Integer;
    gridOddEvenColor: Boolean; //�б�˫����ɫ
    dayStart: string;
    dayStartDiff: Integer;
    showSumList: Boolean;
    doubleClickModifyRecord: Boolean; //˫���޸��������б���¼
    notAllowTareExceed: Boolean;
    loginTitle, loginInfo, mainTitle: string; //�û��Զ�����Ϣ
    compareLast: Boolean;
  end;

  TSysConfigUtil = class
  private
  public
    class function loadSoftConfig(var systemConfig: TSysConfig): Boolean;
    class function loadFormConfig(var poWeightSetConfig: TWeightSetConfig;
      var soWeightSetConfig: TWeightSetConfig;
      var ioWeightSetConfig: TWeightSetConfig;
      var ooWeightSetConfig: TWeightSetConfig): Boolean;
    class function loadConfig(var systemConfig: TSysConfig;
      var poWeightSetConfig: TWeightSetConfig;
      var soWeightSetConfig: TWeightSetConfig;
      var ioWeightSetConfig: TWeightSetConfig;
      var ooWeightSetConfig: TWeightSetConfig): Boolean;
    class function saveConfig(var systemConfig: TSysConfig): Boolean;
  end;

implementation

uses
  CommonUtil, DateUtils;

{ TSysConfigUtil }

class function TSysConfigUtil.loadConfig(
  var systemConfig: TSysConfig;
  var poWeightSetConfig: TWeightSetConfig;
  var soWeightSetConfig: TWeightSetConfig;
  var ioWeightSetConfig: TWeightSetConfig;
  var ooWeightSetConfig: TWeightSetConfig): Boolean;
begin
  Result := loadSoftConfig(systemConfig)
    and loadFormConfig(poWeightSetConfig, soWeightSetConfig,
    ioWeightSetConfig, ooWeightSetConfig);
end;

class function TSysConfigUtil.loadFormConfig(
  var poWeightSetConfig: TWeightSetConfig;
  var soWeightSetConfig: TWeightSetConfig;
  var ioWeightSetConfig: TWeightSetConfig;
  var ooWeightSetConfig: TWeightSetConfig): Boolean;

  procedure loadConfig(var weightSetConfig: TWeightSetConfig; prex: string);
  var myini: TiniFile;
  begin
    myini := Tinifile.Create(ExtractFilePath(ParamStr(0)) + '\design.ini');
    try

      weightSetConfig.noVisible := myini.ReadBool(prex + 'formDesign', 'no', False);
      weightSetConfig.glideNoVisible := myini.ReadBool(prex + 'formDesign', 'glideNo', True);
      weightSetConfig.carVisible := myini.ReadBool(prex + 'formDesign', 'car', True);
      weightSetConfig.weightTypeVisible := myini.ReadBool(prex + 'formDesign', 'weightType', False);
      weightSetConfig.faHuoVisible := myini.ReadBool(prex + 'formDesign', 'faHuo', True);
      weightSetConfig.shouHuoVisible := myini.ReadBool(prex + 'formDesign', 'shouHuo', True);
      weightSetConfig.goodsVisible := myini.ReadBool(prex + 'formDesign', 'goods', True);
      weightSetConfig.specVisible := myini.ReadBool(prex + 'formDesign', 'spec', True);
      weightSetConfig.grossVisible := myini.ReadBool(prex + 'formDesign', 'gross', True);
      weightSetConfig.tareVisible := myini.ReadBool(prex + 'formDesign', 'tare', True);
      weightSetConfig.netVisible := myini.ReadBool(prex + 'formDesign', 'net', True);
      weightSetConfig.bundleVisible := myini.ReadBool(prex + 'formDesign', 'bundle', False);
      weightSetConfig.realVisible := myini.ReadBool(prex + 'formDesign', 'real', False);
      weightSetConfig.priceVisible := myini.ReadBool(prex + 'formDesign', 'price', False);
      weightSetConfig.sumVisible := myini.ReadBool(prex + 'formDesign', 'sum', False);
      weightSetConfig.scaleVisible := myini.ReadBool(prex + 'formDesign', 'scale', False);
      weightSetConfig.quanterVisible := myini.ReadBool(prex + 'formDesign', 'quanter', False);
      weightSetConfig.costVisible := myini.ReadBool(prex + 'formDesign', 'cost', False);
      weightSetConfig.grossManVisible := myini.ReadBool(prex + 'formDesign', 'grossMan', False);
      weightSetConfig.tareManVisible := myini.ReadBool(prex + 'formDesign', 'tareMan', False);
      weightSetConfig.grossAddrVisible := myini.ReadBool(prex + 'formDesign', 'grossAddr', False);
      weightSetConfig.tareAddrVisible := myini.ReadBool(prex + 'formDesign', 'tareAddr', False);
      weightSetConfig.grossTimeVisible := myini.ReadBool(prex + 'formDesign', 'grossTime', True);
      weightSetConfig.tareTimeVisible := myini.ReadBool(prex + 'formDesign', 'tareTime', True);
      weightSetConfig.firstTimeVisible := myini.ReadBool(prex + 'formDesign', 'firstTime', False);
      weightSetConfig.secondTimeVisible := myini.ReadBool(prex + 'formDesign', 'secondTime', False);
      weightSetConfig.updateUserVisible := myini.ReadBool(prex + 'formDesign', 'updateUser', False);
      weightSetConfig.updateTimeVisible := myini.ReadBool(prex + 'formDesign', 'updateTime', False);
      weightSetConfig.memoVisible := myini.ReadBool(prex + 'formDesign', 'remark', True);
      weightSetConfig.printCountVisible := myini.ReadBool(prex + 'formDesign', 'printCount', False);
      weightSetConfig.uploadVisible := myini.ReadBool(prex + 'formDesign', 'upload', False);
      weightSetConfig.backup1Visible := myini.ReadBool(prex + 'formDesign', 'backup1', False);
      weightSetConfig.backup2Visible := myini.ReadBool(prex + 'formDesign', 'backup2', False);
      weightSetConfig.backup3Visible := myini.ReadBool(prex + 'formDesign', 'backup3', False);
      weightSetConfig.backup4Visible := myini.ReadBool(prex + 'formDesign', 'backup4', False);
      weightSetConfig.backup5Visible := myini.ReadBool(prex + 'formDesign', 'backup5', False);
      weightSetConfig.backup6Visible := myini.ReadBool(prex + 'formDesign', 'backup6', False);
      weightSetConfig.backup7Visible := myini.ReadBool(prex + 'formDesign', 'backup7', False);
      weightSetConfig.backup8Visible := myini.ReadBool(prex + 'formDesign', 'backup8', False);
      weightSetConfig.backup9Visible := myini.ReadBool(prex + 'formDesign', 'backup9', False);
      weightSetConfig.backup10Visible := myini.ReadBool(prex + 'formDesign', 'backup10', False);
      weightSetConfig.backup11Visible := myini.ReadBool(prex + 'formDesign', 'backup11', False);
      weightSetConfig.backup12Visible := myini.ReadBool(prex + 'formDesign', 'backup12', False);
      weightSetConfig.backup13Visible := myini.ReadBool(prex + 'formDesign', 'backup13', False);
      weightSetConfig.backup14Visible := myini.ReadBool(prex + 'formDesign', 'backup14', False);
      weightSetConfig.backup15Visible := myini.ReadBool(prex + 'formDesign', 'backup15', False);
      weightSetConfig.backup16Visible := myini.ReadBool(prex + 'formDesign', 'backup16', False);
      weightSetConfig.backup17Visible := myini.ReadBool(prex + 'formDesign', 'backup17', False);
      weightSetConfig.backup18Visible := myini.ReadBool(prex + 'formDesign', 'backup18', False);

      weightSetConfig.noCaption := myini.ReadString(prex + 'formDesign', 'noCaption', '���');
      weightSetConfig.glideNoCaption := myini.ReadString(prex + 'formDesign', 'glideNoCaption', '��ˮ��');
      weightSetConfig.carCaption := myini.ReadString(prex + 'formDesign', 'carCaption', '����');
      weightSetConfig.weightTypeCaption := myini.ReadString(prex + 'formDesign', 'weightTypeCaption', '��������');
      weightSetConfig.faHuoCaption := myini.ReadString(prex + 'formDesign', 'faHuoCaption', '������λ');
      weightSetConfig.shouHuoCaption := myini.ReadString(prex + 'formDesign', 'shouHuoCaption', '�ջ���λ');
      weightSetConfig.goodsCaption := myini.ReadString(prex + 'formDesign', 'goodsCaption', '����');
      weightSetConfig.specCaption := myini.ReadString(prex + 'formDesign', 'specCaption', '���');
      weightSetConfig.grossCaption := myini.ReadString(prex + 'formDesign', 'grossCaption', 'ë��');
      weightSetConfig.tareCaption := myini.ReadString(prex + 'formDesign', 'tareCaption', 'Ƥ��');
      weightSetConfig.netCaption := myini.ReadString(prex + 'formDesign', 'netCaption', '����');
      weightSetConfig.bundleCaption := myini.ReadString(prex + 'formDesign', 'bundleCaption', '����');
      weightSetConfig.realCaption := myini.ReadString(prex + 'formDesign', 'realCaption', 'ʵ��');
      weightSetConfig.priceCaption := myini.ReadString(prex + 'formDesign', 'priceCaption', '����');
      weightSetConfig.sumCaption := myini.ReadString(prex + 'formDesign', 'sumCaption', '���');
      weightSetConfig.scaleCaption := myini.ReadString(prex + 'formDesign', 'scaleCaption', '�۷�ϵ��');
      weightSetConfig.quanterCaption := myini.ReadString(prex + 'formDesign', 'quanterCaption', '����');
      weightSetConfig.costCaption := myini.ReadString(prex + 'formDesign', 'costCaption', '������');
      weightSetConfig.grossManCaption := myini.ReadString(prex + 'formDesign', 'grossManCaption', 'ë��˾��Ա');
      weightSetConfig.tareManCaption := myini.ReadString(prex + 'formDesign', 'tareManCaption', 'Ƥ��˾��Ա');
      weightSetConfig.grossAddrCaption := myini.ReadString(prex + 'formDesign', 'grossAddrCaption', 'ë�ذ���');
      weightSetConfig.tareAddrCaption := myini.ReadString(prex + 'formDesign', 'tareAddrCaption', 'Ƥ�ذ���');
      weightSetConfig.grossTimeCaption := myini.ReadString(prex + 'formDesign', 'grossTimeCaption', 'ë��ʱ��');
      weightSetConfig.tareTimeCaption := myini.ReadString(prex + 'formDesign', 'tareTimeCaption', 'Ƥ��ʱ��');
      weightSetConfig.firstTimeCaption := myini.ReadString(prex + 'formDesign', 'firstTimeCaption', 'һ�ι���ʱ��');
      weightSetConfig.secondTimeCaption := myini.ReadString(prex + 'formDesign', 'secondTimeCaption', '���ι���ʱ��');
      weightSetConfig.updateUserCaption := myini.ReadString(prex + 'formDesign', 'updateUserCaption', '������');
      weightSetConfig.updateTimeCaption := myini.ReadString(prex + 'formDesign', 'updateTimeCaption', '����ʱ��');
      weightSetConfig.memoCaption := myini.ReadString(prex + 'formDesign', 'remarkCaption', '��ע');
      weightSetConfig.printCountCaption := myini.ReadString(prex + 'formDesign', 'printCountCaption', '��ӡ����');
      weightSetConfig.uploadCaption := myini.ReadString(prex + 'formDesign', 'uploadCaption', '�ϴ���');
      weightSetConfig.backup1Caption := myini.ReadString(prex + 'formDesign', 'backup1Caption', '����1');
      weightSetConfig.backup2Caption := myini.ReadString(prex + 'formDesign', 'backup2Caption', '����2');
      weightSetConfig.backup3Caption := myini.ReadString(prex + 'formDesign', 'backup3Caption', '����3');
      weightSetConfig.backup4Caption := myini.ReadString(prex + 'formDesign', 'backup4Caption', '����4');
      weightSetConfig.backup5Caption := myini.ReadString(prex + 'formDesign', 'backup5Caption', '����5');
      weightSetConfig.backup6Caption := myini.ReadString(prex + 'formDesign', 'backup6Caption', '����6');
      weightSetConfig.backup7Caption := myini.ReadString(prex + 'formDesign', 'backup7Caption', '����7');
      weightSetConfig.backup8Caption := myini.ReadString(prex + 'formDesign', 'backup8Caption', '����8');
      weightSetConfig.backup9Caption := myini.ReadString(prex + 'formDesign', 'backup9Caption', '����9');
      weightSetConfig.backup10Caption := myini.ReadString(prex + 'formDesign', 'backup10Caption', '����10');
      weightSetConfig.backup11Caption := myini.ReadString(prex + 'formDesign', 'backup11Caption', '����11');
      weightSetConfig.backup12Caption := myini.ReadString(prex + 'formDesign', 'backup12Caption', '����12');
      weightSetConfig.backup13Caption := myini.ReadString(prex + 'formDesign', 'backup13Caption', '����13');
      weightSetConfig.backup14Caption := myini.ReadString(prex + 'formDesign', 'backup14Caption', '����14');
      weightSetConfig.backup15Caption := myini.ReadString(prex + 'formDesign', 'backup15Caption', '����15');
      weightSetConfig.backup16Caption := myini.ReadString(prex + 'formDesign', 'backup16Caption', '����16');
      weightSetConfig.backup17Caption := myini.ReadString(prex + 'formDesign', 'backup17Caption', '����17');
      weightSetConfig.backup18Caption := myini.ReadString(prex + 'formDesign', 'backup18Caption', '����18');

      weightSetConfig.noIndex := myini.ReadInteger(prex + 'formDesign', 'noIndex', 0);
      weightSetConfig.glideNoIndex := myini.ReadInteger(prex + 'formDesign', 'glideNoIndex', 1);
      weightSetConfig.carIndex := myini.ReadInteger(prex + 'formDesign', 'carIndex', 2);
      weightSetConfig.weightTypeIndex := myini.ReadInteger(prex + 'formDesign', 'weightTypeIndex', 3);
      weightSetConfig.faHuoIndex := myini.ReadInteger(prex + 'formDesign', 'faHuoIndex', 4);
      weightSetConfig.shouHuoIndex := myini.ReadInteger(prex + 'formDesign', 'shouHuoIndex', 5);
      weightSetConfig.goodsIndex := myini.ReadInteger(prex + 'formDesign', 'goodsIndex', 6);
      weightSetConfig.specIndex := myini.ReadInteger(prex + 'formDesign', 'specIndex', 7);
      weightSetConfig.grossIndex := myini.ReadInteger(prex + 'formDesign', 'grossIndex', 8);
      weightSetConfig.tareIndex := myini.ReadInteger(prex + 'formDesign', 'tareIndex', 9);
      weightSetConfig.netIndex := myini.ReadInteger(prex + 'formDesign', 'netIndex', 10);
      weightSetConfig.bundleIndex := myini.ReadInteger(prex + 'formDesign', 'bundleIndex', 11);
      weightSetConfig.realIndex := myini.ReadInteger(prex + 'formDesign', 'realIndex', 12);
      weightSetConfig.priceIndex := myini.ReadInteger(prex + 'formDesign', 'priceIndex', 13);
      weightSetConfig.sumIndex := myini.ReadInteger(prex + 'formDesign', 'sumIndex', 14);
      weightSetConfig.scaleIndex := myini.ReadInteger(prex + 'formDesign', 'scaleIndex', 15);
      weightSetConfig.quanterIndex := myini.ReadInteger(prex + 'formDesign', 'quanterIndex', 16);
      weightSetConfig.costIndex := myini.ReadInteger(prex + 'formDesign', 'costIndex', 17);
      weightSetConfig.grossManIndex := myini.ReadInteger(prex + 'formDesign', 'grossManIndex', 18);
      weightSetConfig.tareManIndex := myini.ReadInteger(prex + 'formDesign', 'tareManIndex', 19);
      weightSetConfig.grossAddrIndex := myini.ReadInteger(prex + 'formDesign', 'grossAddrIndex', 20);
      weightSetConfig.tareAddrIndex := myini.ReadInteger(prex + 'formDesign', 'tareAddrIndex', 21);
      weightSetConfig.grossTimeIndex := myini.ReadInteger(prex + 'formDesign', 'grossTimeIndex', 22);
      weightSetConfig.tareTimeIndex := myini.ReadInteger(prex + 'formDesign', 'tareTimeIndex', 23);
      weightSetConfig.firstTimeIndex := myini.ReadInteger(prex + 'formDesign', 'firstTimeIndex', 24);
      weightSetConfig.secondTimeIndex := myini.ReadInteger(prex + 'formDesign', 'secondTimeIndex', 25);
      weightSetConfig.updateUserIndex := myini.ReadInteger(prex + 'formDesign', 'updateUserIndex', 26);
      weightSetConfig.updateTimeIndex := myini.ReadInteger(prex + 'formDesign', 'updateTimeIndex', 27);
      weightSetConfig.memoIndex := myini.ReadInteger(prex + 'formDesign', 'remarkIndex', 28);
      weightSetConfig.printCountIndex := myini.ReadInteger(prex + 'formDesign', 'printCountIndex', 29);
      weightSetConfig.uploadIndex := myini.ReadInteger(prex + 'formDesign', 'uploadIndex', 30);
      weightSetConfig.backup1Index := myini.ReadInteger(prex + 'formDesign', 'backup1Index', 31);
      weightSetConfig.backup2Index := myini.ReadInteger(prex + 'formDesign', 'backup2Index', 32);
      weightSetConfig.backup3Index := myini.ReadInteger(prex + 'formDesign', 'backup3Index', 33);
      weightSetConfig.backup4Index := myini.ReadInteger(prex + 'formDesign', 'backup4Index', 34);
      weightSetConfig.backup5Index := myini.ReadInteger(prex + 'formDesign', 'backup5Index', 35);
      weightSetConfig.backup6Index := myini.ReadInteger(prex + 'formDesign', 'backup6Index', 36);
      weightSetConfig.backup7Index := myini.ReadInteger(prex + 'formDesign', 'backup7Index', 37);
      weightSetConfig.backup8Index := myini.ReadInteger(prex + 'formDesign', 'backup8Index', 38);
      weightSetConfig.backup9Index := myini.ReadInteger(prex + 'formDesign', 'backup9Index', 39);
      weightSetConfig.backup10Index := myini.ReadInteger(prex + 'formDesign', 'backup10Index', 40);
      weightSetConfig.backup11Index := myini.ReadInteger(prex + 'formDesign', 'backup11Index', 41);
      weightSetConfig.backup12Index := myini.ReadInteger(prex + 'formDesign', 'backup12Index', 42);
      weightSetConfig.backup13Index := myini.ReadInteger(prex + 'formDesign', 'backup13Index', 43);
      weightSetConfig.backup14Index := myini.ReadInteger(prex + 'formDesign', 'backup14Index', 44);
      weightSetConfig.backup15Index := myini.ReadInteger(prex + 'formDesign', 'backup15Index', 45);
      weightSetConfig.backup16Index := myini.ReadInteger(prex + 'formDesign', 'backup16Index', 46);
      weightSetConfig.backup17Index := myini.ReadInteger(prex + 'formDesign', 'backup17Index', 47);
      weightSetConfig.backup18Index := myini.ReadInteger(prex + 'formDesign', 'backup18Index', 48);

      weightSetConfig.noWidth := myini.ReadInteger(prex + 'formDesign', 'noWidth', 100);
      weightSetConfig.glideNoWidth := myini.ReadInteger(prex + 'formDesign', 'glideNoWidth', 100);
      weightSetConfig.carWidth := myini.ReadInteger(prex + 'formDesign', 'carWidth', 100);
      weightSetConfig.weightTypeWidth := myini.ReadInteger(prex + 'formDesign', 'weightTypeWidth', 100);
      weightSetConfig.faHuoWidth := myini.ReadInteger(prex + 'formDesign', 'faHuoWidth', 100);
      weightSetConfig.shouHuoWidth := myini.ReadInteger(prex + 'formDesign', 'shouHuoWidth', 100);
      weightSetConfig.goodsWidth := myini.ReadInteger(prex + 'formDesign', 'goodsWidth', 100);
      weightSetConfig.specWidth := myini.ReadInteger(prex + 'formDesign', 'specWidth', 100);
      weightSetConfig.grossWidth := myini.ReadInteger(prex + 'formDesign', 'grossWidth', 100);
      weightSetConfig.tareWidth := myini.ReadInteger(prex + 'formDesign', 'tareWidth', 100);
      weightSetConfig.netWidth := myini.ReadInteger(prex + 'formDesign', 'netWidth', 100);
      weightSetConfig.bundleWidth := myini.ReadInteger(prex + 'formDesign', 'bundleWidth', 100);
      weightSetConfig.realWidth := myini.ReadInteger(prex + 'formDesign', 'realWidth', 100);
      weightSetConfig.priceWidth := myini.ReadInteger(prex + 'formDesign', 'priceWidth', 100);
      weightSetConfig.sumWidth := myini.ReadInteger(prex + 'formDesign', 'sumWidth', 100);
      weightSetConfig.scaleWidth := myini.ReadInteger(prex + 'formDesign', 'scaleWidth', 100);
      weightSetConfig.quanterWidth := myini.ReadInteger(prex + 'formDesign', 'quanterWidth', 100);
      weightSetConfig.costWidth := myini.ReadInteger(prex + 'formDesign', 'costWidth', 100);
      weightSetConfig.grossManWidth := myini.ReadInteger(prex + 'formDesign', 'grossManWidth', 100);
      weightSetConfig.tareManWidth := myini.ReadInteger(prex + 'formDesign', 'tareManWidth', 100);
      weightSetConfig.grossAddrWidth := myini.ReadInteger(prex + 'formDesign', 'grossAddrWidth', 100);
      weightSetConfig.tareAddrWidth := myini.ReadInteger(prex + 'formDesign', 'tareAddrWidth', 100);
      weightSetConfig.grossTimeWidth := myini.ReadInteger(prex + 'formDesign', 'grossTimeWidth', 100);
      weightSetConfig.tareTimeWidth := myini.ReadInteger(prex + 'formDesign', 'tareTimeWidth', 100);
      weightSetConfig.firstTimeWidth := myini.ReadInteger(prex + 'formDesign', 'firstTimeWidth', 100);
      weightSetConfig.secondTimeWidth := myini.ReadInteger(prex + 'formDesign', 'secondTimeWidth', 100);
      weightSetConfig.updateUserWidth := myini.ReadInteger(prex + 'formDesign', 'updateUserWidth', 100);
      weightSetConfig.updateTimeWidth := myini.ReadInteger(prex + 'formDesign', 'updateTimeWidth', 100);
      weightSetConfig.memoWidth := myini.ReadInteger(prex + 'formDesign', 'remarkWidth', 100);
      weightSetConfig.printCountWidth := myini.ReadInteger(prex + 'formDesign', 'printCountWidth', 100);
      weightSetConfig.uploadWidth := myini.ReadInteger(prex + 'formDesign', 'uploadWidth', 100);
      weightSetConfig.backup1Width := myini.ReadInteger(prex + 'formDesign', 'backup1Width', 100);
      weightSetConfig.backup2Width := myini.ReadInteger(prex + 'formDesign', 'backup2Width', 100);
      weightSetConfig.backup3Width := myini.ReadInteger(prex + 'formDesign', 'backup3Width', 100);
      weightSetConfig.backup4Width := myini.ReadInteger(prex + 'formDesign', 'backup4Width', 100);
      weightSetConfig.backup5Width := myini.ReadInteger(prex + 'formDesign', 'backup5Width', 100);
      weightSetConfig.backup6Width := myini.ReadInteger(prex + 'formDesign', 'backup6Width', 100);
      weightSetConfig.backup7Width := myini.ReadInteger(prex + 'formDesign', 'backup7Width', 100);
      weightSetConfig.backup8Width := myini.ReadInteger(prex + 'formDesign', 'backup8Width', 100);
      weightSetConfig.backup9Width := myini.ReadInteger(prex + 'formDesign', 'backup9Width', 100);
      weightSetConfig.backup10Width := myini.ReadInteger(prex + 'formDesign', 'backup10Width', 100);
      weightSetConfig.backup11Width := myini.ReadInteger(prex + 'formDesign', 'backup11Width', 100);
      weightSetConfig.backup12Width := myini.ReadInteger(prex + 'formDesign', 'backup12Width', 100);
      weightSetConfig.backup13Width := myini.ReadInteger(prex + 'formDesign', 'backup13Width', 100);
      weightSetConfig.backup14Width := myini.ReadInteger(prex + 'formDesign', 'backup14Width', 100);
      weightSetConfig.backup15Width := myini.ReadInteger(prex + 'formDesign', 'backup15Width', 100);
      weightSetConfig.backup16Width := myini.ReadInteger(prex + 'formDesign', 'backup16Width', 100);
      weightSetConfig.backup17Width := myini.ReadInteger(prex + 'formDesign', 'backup17Width', 100);
      weightSetConfig.backup18Width := myini.ReadInteger(prex + 'formDesign', 'backup18Width', 100);

      ////////////////////////////////////////////////////////////////////
      //��Ĭ��ֵ
      weightSetConfig.carDefault := myini.ReadString(prex + 'formDesign', 'carDefault', '');
      weightSetConfig.faHuoDefault := myini.ReadString(prex + 'formDesign', 'faHuoDefault', '');
      weightSetConfig.shouHuoDefault := myini.ReadString(prex + 'formDesign', 'shouHuoDefault', '');
      weightSetConfig.goodsDefault := myini.ReadString(prex + 'formDesign', 'goodsDefault', '');
      weightSetConfig.specDefault := myini.ReadString(prex + 'formDesign', 'specDefault', '');
      weightSetConfig.bundleDefault := myini.ReadString(prex + 'formDesign', 'bundleDefault', '0');
      weightSetConfig.priceDefault := myini.ReadString(prex + 'formDesign', 'priceDefault', '0');
      weightSetConfig.scaleDefault := myini.ReadString(prex + 'formDesign', 'scaleDefault', '1');
      weightSetConfig.memoDefault := myini.ReadString(prex + 'formDesign', 'memoDefault', '');
      weightSetConfig.backup1Default := myini.ReadString(prex + 'formDesign', 'backup1Default', '');
      weightSetConfig.backup2Default := myini.ReadString(prex + 'formDesign', 'backup2Default', '');
      weightSetConfig.backup3Default := myini.ReadString(prex + 'formDesign', 'backup3Default', '');
      weightSetConfig.backup4Default := myini.ReadString(prex + 'formDesign', 'backup4Default', '');
      weightSetConfig.backup5Default := myini.ReadString(prex + 'formDesign', 'backup5Default', '');
      weightSetConfig.backup6Default := myini.ReadString(prex + 'formDesign', 'backup6Default', '0');
      weightSetConfig.backup7Default := myini.ReadString(prex + 'formDesign', 'backup7Default', '0');
      weightSetConfig.backup8Default := myini.ReadString(prex + 'formDesign', 'backup8Default', '0');
      weightSetConfig.backup9Default := myini.ReadString(prex + 'formDesign', 'backup9Default', '0');
      weightSetConfig.backup10Default := myini.ReadString(prex + 'formDesign', 'backup10Default', '');
      weightSetConfig.backup11Default := myini.ReadString(prex + 'formDesign', 'backup11Default', '');
      weightSetConfig.backup12Default := myini.ReadString(prex + 'formDesign', 'backup12Default', '');
      weightSetConfig.backup13Default := myini.ReadString(prex + 'formDesign', 'backup13Default', '');
      weightSetConfig.backup14Default := myini.ReadString(prex + 'formDesign', 'backup14Default', '');
      weightSetConfig.backup15Default := myini.ReadString(prex + 'formDesign', 'backup15Default', '0');
      weightSetConfig.backup16Default := myini.ReadString(prex + 'formDesign', 'backup16Default', '0');
      weightSetConfig.backup17Default := myini.ReadString(prex + 'formDesign', 'backup17Default', '0');
      weightSetConfig.backup18Default := myini.ReadString(prex + 'formDesign', 'backup18Default', '0');
      //��������ù�ʽ,�����Ͳ���������
      weightSetConfig.useExpression6 := myini.ReadBool(prex + 'formDesign', 'useExpression6', False);
      weightSetConfig.expression6 := myini.ReadString(prex + 'formDesign', 'expression6', '');
      weightSetConfig.useExpression7 := myini.ReadBool(prex + 'formDesign', 'useExpression7', False);
      weightSetConfig.expression7 := myini.ReadString(prex + 'formDesign', 'expression7', '');
      weightSetConfig.useExpression8 := myini.ReadBool(prex + 'formDesign', 'useExpression8', False);
      weightSetConfig.expression8 := myini.ReadString(prex + 'formDesign', 'expression8', '');
      weightSetConfig.useExpression9 := myini.ReadBool(prex + 'formDesign', 'useExpression9', False);
      weightSetConfig.expression9 := myini.ReadString(prex + 'formDesign', 'expression9', '');
      weightSetConfig.point6 := myini.ReadInteger(prex + 'formDesign', 'point6', 0);
      weightSetConfig.point7 := myini.ReadInteger(prex + 'formDesign', 'point7', 0);
      weightSetConfig.point8 := myini.ReadInteger(prex + 'formDesign', 'point8', 0);
      weightSetConfig.point9 := myini.ReadInteger(prex + 'formDesign', 'point9', 0);
      weightSetConfig.min6 := myini.ReadFloat(prex + 'formDesign', 'min6', 0);
      weightSetConfig.min7 := myini.ReadFloat(prex + 'formDesign', 'min7', 0);
      weightSetConfig.min8 := myini.ReadFloat(prex + 'formDesign', 'min8', 0);
      weightSetConfig.min9 := myini.ReadFloat(prex + 'formDesign', 'min9', 0);

      weightSetConfig.useExpression15 := myini.ReadBool(prex + 'formDesign', 'useExpression15', False);
      weightSetConfig.expression15 := myini.ReadString(prex + 'formDesign', 'expression15', '');
      weightSetConfig.useExpression16 := myini.ReadBool(prex + 'formDesign', 'useExpression16', False);
      weightSetConfig.expression16 := myini.ReadString(prex + 'formDesign', 'expression16', '');
      weightSetConfig.useExpression17 := myini.ReadBool(prex + 'formDesign', 'useExpression17', False);
      weightSetConfig.expression17 := myini.ReadString(prex + 'formDesign', 'expression17', '');
      weightSetConfig.useExpression18 := myini.ReadBool(prex + 'formDesign', 'useExpression18', False);
      weightSetConfig.expression18 := myini.ReadString(prex + 'formDesign', 'expression18', '');
      weightSetConfig.point15 := myini.ReadInteger(prex + 'formDesign', 'point15', 0);
      weightSetConfig.point16 := myini.ReadInteger(prex + 'formDesign', 'point16', 0);
      weightSetConfig.point17 := myini.ReadInteger(prex + 'formDesign', 'point17', 0);
      weightSetConfig.point18 := myini.ReadInteger(prex + 'formDesign', 'point18', 0);
      weightSetConfig.min15 := myini.ReadFloat(prex + 'formDesign', 'min15', 0);
      weightSetConfig.min16 := myini.ReadFloat(prex + 'formDesign', 'min16', 0);
      weightSetConfig.min17 := myini.ReadFloat(prex + 'formDesign', 'min17', 0);
      weightSetConfig.min18 := myini.ReadFloat(prex + 'formDesign', 'min18', 0);

      weightSetConfig.sumType6 := myini.ReadInteger(prex + 'formDesign', 'sumType6', 1);
      weightSetConfig.sumType7 := myini.ReadInteger(prex + 'formDesign', 'sumType7', 1);
      weightSetConfig.sumType8 := myini.ReadInteger(prex + 'formDesign', 'sumType8', 1);
      weightSetConfig.sumType9 := myini.ReadInteger(prex + 'formDesign', 'sumType9', 1);
      weightSetConfig.sumType15 := myini.ReadInteger(prex + 'formDesign', 'sumType15', 1);
      weightSetConfig.sumType16 := myini.ReadInteger(prex + 'formDesign', 'sumType16', 1);
      weightSetConfig.sumType17 := myini.ReadInteger(prex + 'formDesign', 'sumType17', 1);
      weightSetConfig.sumType18 := myini.ReadInteger(prex + 'formDesign', 'sumType18', 1);

      weightSetConfig.divide6 := myini.ReadInteger(prex + 'formDesign', 'divide6', 1);
      weightSetConfig.divide7 := myini.ReadInteger(prex + 'formDesign', 'divide7', 1);
      weightSetConfig.divide8 := myini.ReadInteger(prex + 'formDesign', 'divide8', 1);
      weightSetConfig.divide9 := myini.ReadInteger(prex + 'formDesign', 'divide9', 1);
      weightSetConfig.divide15 := myini.ReadInteger(prex + 'formDesign', 'divide15', 1);
      weightSetConfig.divide16 := myini.ReadInteger(prex + 'formDesign', 'divide16', 1);
      weightSetConfig.divide17 := myini.ReadInteger(prex + 'formDesign', 'divide17', 1);
      weightSetConfig.divide18 := myini.ReadInteger(prex + 'formDesign', 'divide18', 1);

      //ͳ��ѡ��
      weightSetConfig.Rule61 := myini.ReadInteger(prex + 'formDesign', 'rule6', 0);
      weightSetConfig.Rule62 := myini.ReadInteger(prex + 'formDesign', 'rule62', 0);
      weightSetConfig.Rule71 := myini.ReadInteger(prex + 'formDesign', 'rule7', 0);
      weightSetConfig.Rule72 := myini.ReadInteger(prex + 'formDesign', 'rule72', 0);
      weightSetConfig.Rule81 := myini.ReadInteger(prex + 'formDesign', 'rule8', 0);
      weightSetConfig.Rule82 := myini.ReadInteger(prex + 'formDesign', 'rule82', 0);
      weightSetConfig.Rule91 := myini.ReadInteger(prex + 'formDesign', 'rule9', 0);
      weightSetConfig.Rule92 := myini.ReadInteger(prex + 'formDesign', 'rule92', 0);
      weightSetConfig.Rule151 := myini.ReadInteger(prex + 'formDesign', 'rule15', 0);
      weightSetConfig.Rule152 := myini.ReadInteger(prex + 'formDesign', 'rule152', 0);
      weightSetConfig.Rule161 := myini.ReadInteger(prex + 'formDesign', 'rule16', 0);
      weightSetConfig.Rule162 := myini.ReadInteger(prex + 'formDesign', 'rule162', 0);
      weightSetConfig.Rule171 := myini.ReadInteger(prex + 'formDesign', 'rule17', 0);
      weightSetConfig.Rule172 := myini.ReadInteger(prex + 'formDesign', 'rule172', 0);
      weightSetConfig.Rule181 := myini.ReadInteger(prex + 'formDesign', 'rule18', 0);
      weightSetConfig.Rule182 := myini.ReadInteger(prex + 'formDesign', 'rule182', 0);

      weightSetConfig.Group6 := myini.ReadInteger(prex + 'formDesign', 'group6', 0);
      weightSetConfig.Group7 := myini.ReadInteger(prex + 'formDesign', 'group7', 0);
      weightSetConfig.Group8 := myini.ReadInteger(prex + 'formDesign', 'group8', 0);
      weightSetConfig.Group9 := myini.ReadInteger(prex + 'formDesign', 'group9', 0);
      weightSetConfig.Group15 := myini.ReadInteger(prex + 'formDesign', 'group15', 0);
      weightSetConfig.Group16 := myini.ReadInteger(prex + 'formDesign', 'group16', 0);
      weightSetConfig.Group17 := myini.ReadInteger(prex + 'formDesign', 'group17', 0);
      weightSetConfig.Group18 := myini.ReadInteger(prex + 'formDesign', 'group18', 0);

      //�Զ����ѡ��
      weightSetConfig.carClear := myini.ReadBool(prex + 'formDesign', 'clearCar', True);
      weightSetConfig.faHuoClear := myini.ReadBool(prex + 'formDesign', 'clearFaHuo', True);
      weightSetConfig.shouHuoClear := myini.ReadBool(prex + 'formDesign', 'clearShouHuo', True);
      weightSetConfig.goodsClear := myini.ReadBool(prex + 'formDesign', 'clearGoods', True);
      weightSetConfig.specClear := myini.ReadBool(prex + 'formDesign', 'clearSpec', True);
      weightSetConfig.bundleClear := myini.ReadBool(prex + 'formDesign', 'clearBundle', True);
      weightSetConfig.priceClear := myini.ReadBool(prex + 'formDesign', 'clearPrice', True);
      weightSetConfig.scaleClear := myini.ReadBool(prex + 'formDesign', 'clearScale', True);
      weightSetConfig.memoClear := myini.ReadBool(prex + 'formDesign', 'memoRemark', True);
      weightSetConfig.backup1Clear := myini.ReadBool(prex + 'formDesign', 'clearBackup1', True);
      weightSetConfig.backup2Clear := myini.ReadBool(prex + 'formDesign', 'clearBackup2', True);
      weightSetConfig.backup3Clear := myini.ReadBool(prex + 'formDesign', 'clearBackup3', True);
      weightSetConfig.backup4Clear := myini.ReadBool(prex + 'formDesign', 'clearBackup4', True);
      weightSetConfig.backup5Clear := myini.ReadBool(prex + 'formDesign', 'clearBackup5', True);
      weightSetConfig.backup6Clear := myini.ReadBool(prex + 'formDesign', 'clearBackup6', True);
      weightSetConfig.backup7Clear := myini.ReadBool(prex + 'formDesign', 'clearBackup7', True);
      weightSetConfig.backup8Clear := myini.ReadBool(prex + 'formDesign', 'clearBackup8', True);
      weightSetConfig.backup9Clear := myini.ReadBool(prex + 'formDesign', 'clearBackup9', True);
      weightSetConfig.backup10Clear := myini.ReadBool(prex + 'formDesign', 'clearBackup10', True);
      weightSetConfig.backup11Clear := myini.ReadBool(prex + 'formDesign', 'clearBackup11', True);
      weightSetConfig.backup12Clear := myini.ReadBool(prex + 'formDesign', 'clearBackup12', True);
      weightSetConfig.backup13Clear := myini.ReadBool(prex + 'formDesign', 'clearBackup13', True);
      weightSetConfig.backup14Clear := myini.ReadBool(prex + 'formDesign', 'clearBackup14', True);
      weightSetConfig.backup15Clear := myini.ReadBool(prex + 'formDesign', 'clearBackup15', True);
      weightSetConfig.backup16Clear := myini.ReadBool(prex + 'formDesign', 'clearBackup16', True);
      weightSetConfig.backup17Clear := myini.ReadBool(prex + 'formDesign', 'clearBackup17', True);
      weightSetConfig.backup18Clear := myini.ReadBool(prex + 'formDesign', 'clearBackup18', True);

      weightSetConfig.carMust := myini.ReadBool(prex + 'formDesign', 'mustCar', True);
      weightSetConfig.faHuoMust := myini.ReadBool(prex + 'formDesign', 'mustFaHuo', False);
      weightSetConfig.shouHuoMust := myini.ReadBool(prex + 'formDesign', 'mustShouHuo', False);
      weightSetConfig.goodsMust := myini.ReadBool(prex + 'formDesign', 'mustGoods', False);
      weightSetConfig.specMust := myini.ReadBool(prex + 'formDesign', 'mustSpec', False);
      weightSetConfig.bundleMust := myini.ReadBool(prex + 'formDesign', 'mustBundle', False);
      weightSetConfig.priceMust := myini.ReadBool(prex + 'formDesign', 'mustPrice', False);
      weightSetConfig.scaleMust := myini.ReadBool(prex + 'formDesign', 'mustScale', False);
      weightSetConfig.memoMust := myini.ReadBool(prex + 'formDesign', 'mustMemo', False);
      weightSetConfig.backup1Must := myini.ReadBool(prex + 'formDesign', 'mustBackup1', False);
      weightSetConfig.backup2Must := myini.ReadBool(prex + 'formDesign', 'mustBackup2', False);
      weightSetConfig.backup3Must := myini.ReadBool(prex + 'formDesign', 'mustBackup3', False);
      weightSetConfig.backup4Must := myini.ReadBool(prex + 'formDesign', 'mustBackup4', False);
      weightSetConfig.backup5Must := myini.ReadBool(prex + 'formDesign', 'mustBackup5', False);
      weightSetConfig.backup6Must := myini.ReadBool(prex + 'formDesign', 'mustBackup6', False);
      weightSetConfig.backup7Must := myini.ReadBool(prex + 'formDesign', 'mustBackup7', False);
      weightSetConfig.backup8Must := myini.ReadBool(prex + 'formDesign', 'mustBackup8', False);
      weightSetConfig.backup9Must := myini.ReadBool(prex + 'formDesign', 'mustBackup9', False);
      weightSetConfig.backup10Must := myini.ReadBool(prex + 'formDesign', 'mustBackup10', False);
      weightSetConfig.backup11Must := myini.ReadBool(prex + 'formDesign', 'mustBackup11', False);
      weightSetConfig.backup12Must := myini.ReadBool(prex + 'formDesign', 'mustBackup12', False);
      weightSetConfig.backup13Must := myini.ReadBool(prex + 'formDesign', 'mustBackup13', False);
      weightSetConfig.backup14Must := myini.ReadBool(prex + 'formDesign', 'mustBackup14', False);
      weightSetConfig.backup15Must := myini.ReadBool(prex + 'formDesign', 'mustBackup15', False);
      weightSetConfig.backup16Must := myini.ReadBool(prex + 'formDesign', 'mustBackup16', False);
      weightSetConfig.backup17Must := myini.ReadBool(prex + 'formDesign', 'mustBackup17', False);
      weightSetConfig.backup18Must := myini.ReadBool(prex + 'formDesign', 'mustBackup18', False);
      weightSetConfig.grossMust := myini.ReadBool(prex + 'formDesign', 'mustGross', False);
      weightSetConfig.tareMust := myini.ReadBool(prex + 'formDesign', 'mustTare', False);
      weightSetConfig.netMust := myini.ReadBool(prex + 'formDesign', 'mustNet', False);
      weightSetConfig.realMust := myini.ReadBool(prex + 'formDesign', 'mustReal', False);
      weightSetConfig.sumMust := myini.ReadBool(prex + 'formDesign', 'mustSum', False);
      weightSetConfig.costMust := myini.ReadBool(prex + 'formDesign', 'mustCost', False);
      weightSetConfig.quanterMust := myini.ReadBool(prex + 'formDesign', 'mustQuanter', False);
      //Ψһ��ѡ��
      weightSetConfig.carUnique := myini.ReadBool(prex + 'formDesign', 'UniqueCar', False);
      weightSetConfig.faHuoUnique := myini.ReadBool(prex + 'formDesign', 'UniqueFaHuo', False);
      weightSetConfig.shouHuoUnique := myini.ReadBool(prex + 'formDesign', 'UniqueShouHuo', False);
      weightSetConfig.goodsUnique := myini.ReadBool(prex + 'formDesign', 'UniqueGoods', False);
      weightSetConfig.specUnique := myini.ReadBool(prex + 'formDesign', 'UniqueSpec', False);
      weightSetConfig.bundleUnique := myini.ReadBool(prex + 'formDesign', 'UniqueBundle', False);
      weightSetConfig.priceUnique := myini.ReadBool(prex + 'formDesign', 'UniquePrice', False);
      weightSetConfig.scaleUnique := myini.ReadBool(prex + 'formDesign', 'UniqueScale', False);
      weightSetConfig.memoUnique := myini.ReadBool(prex + 'formDesign', 'UniqueMemo', False);
      weightSetConfig.backup1Unique := myini.ReadBool(prex + 'formDesign', 'UniqueBackup1', False);
      weightSetConfig.backup2Unique := myini.ReadBool(prex + 'formDesign', 'UniqueBackup2', False);
      weightSetConfig.backup3Unique := myini.ReadBool(prex + 'formDesign', 'UniqueBackup3', False);
      weightSetConfig.backup4Unique := myini.ReadBool(prex + 'formDesign', 'UniqueBackup4', False);
      weightSetConfig.backup5Unique := myini.ReadBool(prex + 'formDesign', 'UniqueBackup5', False);
      weightSetConfig.backup6Unique := myini.ReadBool(prex + 'formDesign', 'UniqueBackup6', False);
      weightSetConfig.backup7Unique := myini.ReadBool(prex + 'formDesign', 'UniqueBackup7', False);
      weightSetConfig.backup8Unique := myini.ReadBool(prex + 'formDesign', 'UniqueBackup8', False);
      weightSetConfig.backup9Unique := myini.ReadBool(prex + 'formDesign', 'UniqueBackup9', False);
      weightSetConfig.backup10Unique := myini.ReadBool(prex + 'formDesign', 'UniqueBackup10', False);
      weightSetConfig.backup11Unique := myini.ReadBool(prex + 'formDesign', 'UniqueBackup11', False);
      weightSetConfig.backup12Unique := myini.ReadBool(prex + 'formDesign', 'UniqueBackup12', False);
      weightSetConfig.backup13Unique := myini.ReadBool(prex + 'formDesign', 'UniqueBackup13', False);
      weightSetConfig.backup14Unique := myini.ReadBool(prex + 'formDesign', 'UniqueBackup14', False);
      weightSetConfig.backup15Unique := myini.ReadBool(prex + 'formDesign', 'UniqueBackup15', False);
      weightSetConfig.backup16Unique := myini.ReadBool(prex + 'formDesign', 'UniqueBackup16', False);
      weightSetConfig.backup17Unique := myini.ReadBool(prex + 'formDesign', 'UniqueBackup17', False);
      weightSetConfig.backup18Unique := myini.ReadBool(prex + 'formDesign', 'UniqueBackup18', False);
      //���ι������ɱ��ѡ��
      weightSetConfig.carNotChange := myini.ReadBool(prex + 'formDesign', 'NotChangeCar', True);
      weightSetConfig.faHuoNotChange := myini.ReadBool(prex + 'formDesign', 'NotChangeFaHuo', False);
      weightSetConfig.shouHuoNotChange := myini.ReadBool(prex + 'formDesign', 'NotChangeShouHuo', False);
      weightSetConfig.goodsNotChange := myini.ReadBool(prex + 'formDesign', 'NotChangeGoods', False);
      weightSetConfig.specNotChange := myini.ReadBool(prex + 'formDesign', 'NotChangeSpec', False);
      weightSetConfig.bundleNotChange := myini.ReadBool(prex + 'formDesign', 'NotChangeBundle', False);
      weightSetConfig.priceNotChange := myini.ReadBool(prex + 'formDesign', 'NotChangePrice', False);
      weightSetConfig.scaleNotChange := myini.ReadBool(prex + 'formDesign', 'NotChangeScale', False);
      weightSetConfig.memoNotChange := myini.ReadBool(prex + 'formDesign', 'NotChangeMemo', False);
      weightSetConfig.backup1NotChange := myini.ReadBool(prex + 'formDesign', 'NotChangeBackup1', False);
      weightSetConfig.backup2NotChange := myini.ReadBool(prex + 'formDesign', 'NotChangeBackup2', False);
      weightSetConfig.backup3NotChange := myini.ReadBool(prex + 'formDesign', 'NotChangeBackup3', False);
      weightSetConfig.backup4NotChange := myini.ReadBool(prex + 'formDesign', 'NotChangeBackup4', False);
      weightSetConfig.backup5NotChange := myini.ReadBool(prex + 'formDesign', 'NotChangeBackup5', False);
      weightSetConfig.backup6NotChange := myini.ReadBool(prex + 'formDesign', 'NotChangeBackup6', False);
      weightSetConfig.backup7NotChange := myini.ReadBool(prex + 'formDesign', 'NotChangeBackup7', False);
      weightSetConfig.backup8NotChange := myini.ReadBool(prex + 'formDesign', 'NotChangeBackup8', False);
      weightSetConfig.backup9NotChange := myini.ReadBool(prex + 'formDesign', 'NotChangeBackup9', False);
      weightSetConfig.backup10NotChange := myini.ReadBool(prex + 'formDesign', 'NotChangeBackup10', False);
      weightSetConfig.backup11NotChange := myini.ReadBool(prex + 'formDesign', 'NotChangeBackup11', False);
      weightSetConfig.backup12NotChange := myini.ReadBool(prex + 'formDesign', 'NotChangeBackup12', False);
      weightSetConfig.backup13NotChange := myini.ReadBool(prex + 'formDesign', 'NotChangeBackup13', False);
      weightSetConfig.backup14NotChange := myini.ReadBool(prex + 'formDesign', 'NotChangeBackup14', False);
      weightSetConfig.backup15NotChange := myini.ReadBool(prex + 'formDesign', 'NotChangeBackup15', False);
      weightSetConfig.backup16NotChange := myini.ReadBool(prex + 'formDesign', 'NotChangeBackup16', False);
      weightSetConfig.backup17NotChange := myini.ReadBool(prex + 'formDesign', 'NotChangeBackup17', False);
      weightSetConfig.backup18NotChange := myini.ReadBool(prex + 'formDesign', 'NotChangeBackup18', False);

      weightSetConfig.pv00 := myini.ReadString(prex + 'position', 'cb00', '����');
      weightSetConfig.pv01 := myini.ReadString(prex + 'position', 'cb01', '������λ');
      weightSetConfig.pv02 := myini.ReadString(prex + 'position', 'cb02', '�ջ���λ');
      weightSetConfig.pv03 := myini.ReadString(prex + 'position', 'cb03', '����');
      weightSetConfig.pv04 := myini.ReadString(prex + 'position', 'cb04', '���');
      weightSetConfig.pv05 := myini.ReadString(prex + 'position', 'cb05', '��ע');
      weightSetConfig.pv06 := myini.ReadString(prex + 'position', 'cb06', 'ë��');
      weightSetConfig.pv07 := myini.ReadString(prex + 'position', 'cb07', 'Ƥ��');
      weightSetConfig.pv08 := myini.ReadString(prex + 'position', 'cb08', '����');

      weightSetConfig.pv10 := myini.ReadString(prex + 'position', 'cb10', '');
      weightSetConfig.pv11 := myini.ReadString(prex + 'position', 'cb11', '');
      weightSetConfig.pv12 := myini.ReadString(prex + 'position', 'cb12', '');
      weightSetConfig.pv13 := myini.ReadString(prex + 'position', 'cb13', '');
      weightSetConfig.pv14 := myini.ReadString(prex + 'position', 'cb14', '');
      weightSetConfig.pv15 := myini.ReadString(prex + 'position', 'cb15', '');
      weightSetConfig.pv16 := myini.ReadString(prex + 'position', 'cb16', '');
      weightSetConfig.pv17 := myini.ReadString(prex + 'position', 'cb17', '');
      weightSetConfig.pv18 := myini.ReadString(prex + 'position', 'cb18', '');

      weightSetConfig.pv20 := myini.ReadString(prex + 'position', 'cb20', '');
      weightSetConfig.pv21 := myini.ReadString(prex + 'position', 'cb21', '');
      weightSetConfig.pv22 := myini.ReadString(prex + 'position', 'cb22', '');
      weightSetConfig.pv23 := myini.ReadString(prex + 'position', 'cb23', '');
      weightSetConfig.pv24 := myini.ReadString(prex + 'position', 'cb24', '');
      weightSetConfig.pv25 := myini.ReadString(prex + 'position', 'cb25', '');
      weightSetConfig.pv26 := myini.ReadString(prex + 'position', 'cb26', '');
      weightSetConfig.pv27 := myini.ReadString(prex + 'position', 'cb27', '');
      weightSetConfig.pv28 := myini.ReadString(prex + 'position', 'cb28', '');

      weightSetConfig.pv30 := myini.ReadString(prex + 'position', 'cb30', '');
      weightSetConfig.pv31 := myini.ReadString(prex + 'position', 'cb31', '');
      weightSetConfig.pv32 := myini.ReadString(prex + 'position', 'cb32', '');
      weightSetConfig.pv33 := myini.ReadString(prex + 'position', 'cb33', '');
      weightSetConfig.pv34 := myini.ReadString(prex + 'position', 'cb34', '');
      weightSetConfig.pv35 := myini.ReadString(prex + 'position', 'cb35', '');
      weightSetConfig.pv36 := myini.ReadString(prex + 'position', 'cb36', '');
    finally
      myini.Free;
    end;
  end;
begin
  loadConfig(poWeightSetConfig, ''); //�ɹ�����
  loadConfig(soWeightSetConfig, 'SO');
  loadConfig(ioWeightSetConfig, 'IO');
  loadConfig(ooWeightSetConfig, 'OO');
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

    systemConfig.dropCount := myini.ReadInteger('system_set', 'dropDownCount', 10);
    systemConfig.dropAuto := myini.ReadBool('system_set', 'autoDropDown', False);
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
    systemConfig.useCode := myini.ReadBool('system_set', 'useCode', False);
    systemConfig.EnterTab := myini.ReadBool('system_set', 'enterAsTab', True);
    //������
    systemConfig.useCost := myini.ReadBool('cost_set', 'useCost', False);
    systemConfig.ManualInputPound := myini.ReadBool('cost_set', 'manualInputCost', False);
    systemConfig.BasicPound := StrToFloat(myini.ReadString('cost_set', 'initCost', '5'));
    systemConfig.UnitPound1 := StrToFloat(myini.ReadString('cost_set', 'unitCost1', '2'));
    systemConfig.UnitPound2 := StrToFloat(myini.ReadString('cost_set', 'unitCost2', '2'));
    systemConfig.poundGrade1 := myini.ReadFloat('cost_set', 'grade1', 0);
    systemConfig.poundGrade2 := myini.ReadFloat('cost_set', 'grade2', 10000);
    systemConfig.poundGrade3 := myini.ReadFloat('cost_set', 'grade3', 10000);
    systemConfig.poundGrade4 := myini.ReadFloat('cost_set', 'grade4', 100000);
    systemConfig.poundGrade5 := myini.ReadFloat('cost_set', 'grade5', 100000);
    systemConfig.poundGrade6 := myini.ReadFloat('cost_set', 'grade6', 120000);
    systemConfig.chargeType := myini.ReadInteger('cost_set', 'chargeType', 0);
    systemConfig.costType := myini.ReadInteger('cost_set', 'costType', 0);
    systemConfig.scalePoint := myini.ReadInteger('cost_set', 'point', 0);
    systemConfig.ladder := myini.ReadBool('cost_set', 'ladder', False);

    systemConfig.grade11 := myini.ReadFloat('cost_set', 'grade11', 0);
    systemConfig.grade12 := myini.ReadFloat('cost_set', 'grade12', 10000);
    systemConfig.grade21 := myini.ReadFloat('cost_set', 'grade21', 10000);
    systemConfig.grade22 := myini.ReadFloat('cost_set', 'grade22', 23000);
    systemConfig.grade31 := myini.ReadFloat('cost_set', 'grade31', 23000);
    systemConfig.grade32 := myini.ReadFloat('cost_set', 'grade32', 30000);
    systemConfig.grade41 := myini.ReadFloat('cost_set', 'grade41', 30000);
    systemConfig.grade42 := myini.ReadFloat('cost_set', 'grade42', 40000);
    systemConfig.grade51 := myini.ReadFloat('cost_set', 'grade51', 40000);
    systemConfig.grade52 := myini.ReadFloat('cost_set', 'grade52', 50000);
    systemConfig.grade61 := myini.ReadFloat('cost_set', 'grade61', 50000);
    systemConfig.grade62 := myini.ReadFloat('cost_set', 'grade62', 60000);
    systemConfig.grade71 := myini.ReadFloat('cost_set', 'grade71', 60000);
    systemConfig.grade72 := myini.ReadFloat('cost_set', 'grade72', 70000);
    systemConfig.grade81 := myini.ReadFloat('cost_set', 'grade81', 70000);
    systemConfig.grade82 := myini.ReadFloat('cost_set', 'grade82', 80000);
    systemConfig.grade91 := myini.ReadFloat('cost_set', 'grade91', 80000);
    systemConfig.grade92 := myini.ReadFloat('cost_set', 'grade92', 90000);
    systemConfig.grade101 := myini.ReadFloat('cost_set', 'grade101', 90000);
    systemConfig.grade102 := myini.ReadFloat('cost_set', 'grade102', 100000);
    systemConfig.grade111 := myini.ReadFloat('cost_set', 'grade111', 100000);
    systemConfig.grade112 := myini.ReadFloat('cost_set', 'grade112', 110000);
    systemConfig.grade121 := myini.ReadFloat('cost_set', 'grade121', 110000);
    systemConfig.grade122 := myini.ReadFloat('cost_set', 'grade122', 120000);
    systemConfig.grade131 := myini.ReadFloat('cost_set', 'grade131', 120000);
    systemConfig.grade132 := myini.ReadFloat('cost_set', 'grade132', 200000);

    systemConfig.cost1 := myini.ReadFloat('cost_set', 'cost1', 5);
    systemConfig.cost2 := myini.ReadFloat('cost_set', 'cost2', 15);
    systemConfig.cost3 := myini.ReadFloat('cost_set', 'cost3', 20);
    systemConfig.cost4 := myini.ReadFloat('cost_set', 'cost4', 25);
    systemConfig.cost5 := myini.ReadFloat('cost_set', 'cost5', 30);
    systemConfig.cost6 := myini.ReadFloat('cost_set', 'cost6', 35);
    systemConfig.cost7 := myini.ReadFloat('cost_set', 'cost7', 40);
    systemConfig.cost8 := myini.ReadFloat('cost_set', 'cost8', 45);
    systemConfig.cost9 := myini.ReadFloat('cost_set', 'cost9', 50);
    systemConfig.cost10 := myini.ReadFloat('cost_set', 'cost10', 55);
    systemConfig.cost11 := myini.ReadFloat('cost_set', 'cost11', 60);
    systemConfig.cost12 := myini.ReadFloat('cost_set', 'cost12', 65);
    systemConfig.cost13 := myini.ReadFloat('cost_set', 'cost13', 70);

    systemConfig.scalePoint := myini.ReadInteger('system_set', 'point', 0);
    systemConfig.ShowPrepare := myini.ReadBool('system_set', 'showPrepare', False);
    systemConfig.useVoice := myini.ReadBool('system_set', 'useVoice', False);
    //�Ƿ��̨�Զ�����
    systemConfig.backRecordWeight := myini.ReadFloat('system_set', 'back_record_weight', 1000);
    systemConfig.useBackRecord := myini.ReadBool('system_set', 'backRecord', False);
    //���С����λ��
    systemConfig.sumDivide := myini.ReadInteger('system_set', 'sumDivide', 1);
    systemConfig.sumPoint := myini.ReadInteger('system_set', 'sumPoint', 0);
    systemConfig.quanterDivide := myini.ReadInteger('system_set', 'quanterDivide', 1);
    systemConfig.quanterPoint := myini.ReadInteger('system_set', 'quanterPoint', 2);
    systemConfig.realPoint := myini.ReadInteger('system_set', 'real_point', 2);

    //�Զ�ɾ����ʷ��¼
    systemConfig.deleteHistory := myini.ReadBool('system_set', 'delHistory', False);
    //�ȶ�����
    systemConfig.steadyCount := myini.ReadInteger('system_set', 'steadyCount', 4);
    //���۲���
    systemConfig.useCorrect := myini.ReadBool('correct', 'use', False);
    systemConfig.cheat1ShortCut := myini.ReadInteger('correct', 'weight1-key', VK_F1);
    systemConfig.cheat2ShortCut := myini.ReadInteger('correct', 'weight2-key', VK_F2);
    systemConfig.cheat3ShortCut := myini.ReadInteger('correct', 'weight3-key', VK_F3);
    systemConfig.cheat4ShortCut := myini.ReadInteger('correct', 'weight4-key', VK_F4);
    systemConfig.cheat5ShortCut := myini.ReadInteger('correct', 'weight5-key', VK_F5);
    systemConfig.cheat6ShortCut := myini.ReadInteger('correct', 'weight6-key', VK_F6);
    systemConfig.cheat7ShortCut := myini.ReadInteger('correct', 'weight7-key', VK_F7);
    systemConfig.cheat8ShortCut := myini.ReadInteger('correct', 'weight8-key', VK_F9);
    systemConfig.cheatCloseShortCut := myini.ReadInteger('correct', 'weight-close', VK_F12);
    systemConfig.correctOnce := myini.ReadBool('correct', 'correct_once', True);
    systemConfig.useFix := myini.ReadBool('correct', 'use_fix', False);
    systemConfig.fix := myini.ReadFloat('correct', 'fix', 0);

    systemConfig.cweight1 := myini.ReadFloat('correct', 'weight1', 500);
    systemConfig.cweight2 := myini.ReadFloat('correct', 'weight2', 1000);
    systemConfig.cweight3 := myini.ReadFloat('correct', 'weight3', 1500);
    systemConfig.cweight4 := myini.ReadFloat('correct', 'weight4', 2000);
    systemConfig.cweight5 := myini.ReadFloat('correct', 'weight5', -500);
    systemConfig.cweight6 := myini.ReadFloat('correct', 'weight6', -1000);
    systemConfig.cweight7 := myini.ReadFloat('correct', 'weight7', -1500);
    systemConfig.cweight8 := myini.ReadFloat('correct', 'weight8', -2000);
    systemConfig.cweightFlag1 := False;
    systemConfig.cweightFlag2 := False;
    systemConfig.cweightFlag3 := False;
    systemConfig.cweightFlag4 := False;
    systemConfig.cweightFlag5 := False;
    systemConfig.cweightFlag6 := False;
    systemConfig.cweightFlag7 := False;
    systemConfig.cweightFlag8 := False;
    systemConfig.cheatType := myini.ReadBool('correct', 'correctType', True);
    systemConfig.startCheat := myini.ReadFloat('correct', 'startCheat', 10000);
    systemConfig.exportToWeight := myini.ReadBool('correct', 'export_to_weight', False);
    systemConfig.exportItem := myini.ReadInteger('correct', 'export_item', -1);

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
    systemConfig.glideCode1 := myini.ReadInteger('system_set', 'glide_code1', 1);
    systemConfig.glideCode2 := myini.ReadInteger('system_set', 'glide_code2', 1);
    systemConfig.glideLength := myini.ReadInteger('system_set', 'glide_length', 4);
    //�Ƿ����ÿ۷ѹ���
    systemConfig.usePay := myini.ReadBool('system_set', 'pay', False);
    //���ݿ����ڱ���
    systemConfig.savePicLocal := myini.ReadBool('system_set', 'savePicLocal', True);
    //���ι�����ʱʱ������
    systemConfig.minUpdateTime := myini.ReadInteger('system_set', 'min_update_time', 0);
    systemConfig.maxUpdateTime := myini.ReadInteger('system_set', 'max_update_time', 12000);
    //���ó�ʱ����
    systemConfig.useTimeOutLimit := myini.ReadBool('system_set', 'use_timeout_limit', False);
    //��ë��ʱ��ʾ�Ƿ�ʹ���ϴ�Ƥ��
    systemConfig.useLastTare := myini.ReadBool('system_set', 'useLastTare', False);
    //��������
    systemConfig.ticketType := myini.ReadInteger('system_set', 'ticket_type', 1);
    //��ǰ������ʽ
    systemConfig.poTicketFormat := myini.ReadString('system_set', 'poTicketFormat',
      '\Ticket\��׼���.fr3');
    systemConfig.soTicketFormat := myini.ReadString('system_set', 'soTicketFormat',
      '\Ticket\��׼���.fr3');
    systemConfig.ioTicketFormat := myini.ReadString('system_set', 'ioTicketFormat',
      '\Ticket\��׼���.fr3');
    systemConfig.ooTicketFormat := myini.ReadString('system_set', 'ooTicketFormat',
      '\Ticket\��׼���.fr3');

    systemConfig.poTicketFormat2 := myini.ReadString('system_set', 'poTicketFormat2',
      '\TicketII\��ʽ����.rmf');
    systemConfig.soTicketFormat2 := myini.ReadString('system_set', 'soTicketFormat2',
      '\TicketII\��ʽ����.rmf');
    systemConfig.ioTicketFormat2 := myini.ReadString('system_set', 'ioTicketFormat2',
      '\TicketII\��ʽ����.rmf');
    systemConfig.ooTicketFormat2 := myini.ReadString('system_set', 'ooTicketFormat2',
      '\TicketII\��ʽ����.rmf');

    //����
    systemConfig.max := myini.ReadFloat('system_set', 'max', 150000);
    systemConfig.dataReportTitle := myini.ReadString('system_set', 'dataReportTitle', '���ݱ���');
    //ϵͳƤ��
    systemConfig.skinFile := myini.ReadString('system_set', 'skin_file', '');
    //���ݿ��С��������
    systemConfig.databaseAlarm := myini.ReadInteger('system_set', 'database_alarm_value', 2048);
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
    systemConfig.printerBackRow := myini.ReadInteger('system_set', 'printerBackRow', 0);
    //�Զ�����Ԥ����Ϣ
    systemConfig.autoSavePrepare := myini.ReadBool('system_set', 'auto_save_prepare', True);
    //������������
    systemConfig.useWeightLine := myini.ReadBool('system_set', 'use_weight_line', False);
    //��������
    systemConfig.useExceed := myini.ReadBool('system_set', 'use_exceed', False);
    systemConfig.exceedStart := myini.ReadFloat('system_set', 'exceed_start', 55000);
    //�Ǳ���ʾ��ʽ
    systemConfig.range := myini.ReadFloat('system_set', 'range', 20);
    systemConfig.showMeter2 := myini.ReadBool('system_set', 'show_meter2', False);
    //�����޸�Ԥ����Ϣ�����ĵ��ۺ��۷�ϵ��
    systemConfig.allowModifyPrice := myini.ReadBool('system_set', 'allow_modify_price', True);
    //ֻ�����ӡ��ɼ�¼
    systemConfig.printNet := myini.ReadBool('system_set', 'print_net', False);
    //�Զ�������ɺ��������ʾ
    systemConfig.completeHint := myini.ReadString('system_set', 'complete_hint', 'ȡ��������³�');
    systemConfig.carOutHint := myini.ReadString('system_set', 'car_out_hint', '�������³�');
    //������Զ���ӡ
    systemConfig.printAfterSave := myini.ReadBool('system_set', 'print_after_save', False);
    //������ݿ�ͼƬ��������
    systemConfig.picCount := myini.ReadInteger('system_set', 'pic_count', 10000);
    //�Զ�����
    systemConfig.saveByInterval := myini.ReadInteger('system_set', 'save_by_steady', 0);
    systemConfig.saveInterval := myini.ReadInteger('system_set', 'save_interval', 5);
    systemConfig.saveQuantity := myini.ReadFloat('system_set', 'save_quantity', 10000);
    systemConfig.saveAfterReturnZero := myini.ReadBool('system_set', 'save_after_return_zero', False);
    systemConfig.upperLimit := myini.ReadFloat('system_set', 'upper_limit', 10);
    systemConfig.lowerLimit := myini.ReadFloat('system_set', 'lower_limit', 10);

    //��ʾ�ϼ�
    systemConfig.showTotal := myini.ReadBool('system_set', 'show_total', True);
    systemConfig.ticketSelHeight := myini.ReadInteger('system_set', 'ticket_sel_height', 25);
    //����λ��ʽ
    systemConfig.sumType := myini.ReadInteger('system_set', 'sum_type', 1);
    systemConfig.payType := myini.ReadInteger('system_set', 'pay_type', 0);
    //Ԥ����������ʹ�����100�εĳ���
    systemConfig.useLast100CarNo := myini.ReadBool('system_set', 'use_last_100_carNo', False);
    //�Զ���¼
    systemConfig.autoLogin := myini.ReadBool('system_set', 'auto_login', False);
    systemConfig.loginName := myini.ReadString('system_set', 'login_name', '');
    systemConfig.loginPass := TCommonUtil.deBase64AndDecompress(
      myini.ReadString('system_set', 'login_pass', 'eJwDAAAAAAE='));

    //����ͼƬ·��
    systemConfig.picPath := myini.ReadString('system_set', 'pic_path',
      ExtractFilePath(ParamStr(0)) + 'WeightImg\');
    //�򵥹�����һ�ι�ë���߹�Ƥ
    systemConfig.simpleMode := myini.ReadInteger('system_set', 'simple_mode', 0);

    //����ʱ�Զ�ˢ������
    systemConfig.autoRefresh := myini.ReadBool('system_set', 'auto_refresh', False);
    systemConfig.autoRefreshInterval := myini.ReadInteger('system_set', 'auto_refresh_interval', 60);

    systemConfig.useStandard := myini.ReadBool('system_set', 'use_standard', True);
    systemConfig.useSimple := myini.ReadBool('system_set', 'use_simple', False);
    systemConfig.useOnce := myini.ReadBool('system_set', 'use_once', False);

    //����غ���������
    systemConfig.weightOneClick := myini.ReadBool('system_set', 'weight_one_click', False);
    systemConfig.previewTicket := myini.ReadBool('system_set', 'previewTicket', False);
    systemConfig.taoPrimayKey := myini.ReadInteger('system_set', 'tao_primary_key', 1);

    //�Ǳ���߹���
    systemConfig.disconnectToZero := myini.ReadBool('system_set', 'disconnect_to_zero', False);

    //�Ǳ���߼�����
    systemConfig.disconnectCheckCount := myini.ReadInteger('system_set', 'disconnect_check_count', 10);
    if systemConfig.disconnectCheckCount < 1 then systemConfig.disconnectCheckCount := 10;
    //��¼ʣ����
    systemConfig.recordLeft := myini.ReadBool('system_set', 'record_left', False);
    //ʹ�ó�����ˮ��
    systemConfig.useOutGlideNo := myini.ReadBool('system_set', 'use_out_glide_no', False);
    //�б���˿�
    systemConfig.useFilterForm := myini.ReadBool('system_set', 'use_filter_form', False);
    //��ӡ��ѡ��Ի���
    systemConfig.showPrintDialog := myini.ReadBool('system_set', 'show_print_dialog', False);
    //�������ݱ�����
    systemConfig.weightSaveInterval := myini.ReadInteger('system_set', 'weight_save_interval', 0);
    //�����ظ�����ʱ������
    systemConfig.useSaveInterval := myini.ReadBool('system_set', 'use_save_interval', False);
    //˫�Ǳ��ۼ�
    systemConfig.doubleAdd := myini.ReadBool('system_set', 'double_add', False);
    //ͬʱ����̨��ӡ����ӡ
    systemConfig.printTwo := myini.ReadBool('system_set', 'print_two', False);
    //����ϵͳ��־
    systemConfig.useLog := myini.ReadBool('system_set', 'use_log', True);
    //����������
    systemConfig.notVisibleWeight := myini.ReadFloat('system_set', 'not_visible_weight', 150000);
    //�����Զ�����
    systemConfig.autoMode := myini.ReadBool('system_set', 'auto_mode', False);
    //ֻ��������δ��ɼ�¼
    systemConfig.onlyAllowInvalidNotFinished :=
      myini.ReadBool('system_set', 'only_allow_invalid_not_finished', False);
    //�����޸���ˮ��
    systemConfig.allowModifyGlideNo := myini.ReadBool('system_set', 'allow_modify_glideNo', False);
    //ʹ�ò�����־
    systemConfig.useManualFlag := myini.ReadBool('system_set', 'use_manual_flag', False);
    //Ĭ�ϴ�ӡͼ�ΰ���
    systemConfig.defaultPrintPicTicket := myini.ReadBool('system_set', 'default_print_pic_ticket', False);
    //ʵʱ�����Զ��幫ʽ
    systemConfig.autoUpdateExpression := myini.ReadBool('system_set', 'auto_update_expression', False);
    //��¼������
    systemConfig.recordCorrect := myini.ReadBool('system_set', 'record_correct', False);
    //�б�˫������δ��ɼ�¼
    systemConfig.onlyShowNotFinishedRecord := myini.ReadBool('system_set', 'only_show_not_finished_record', False);
    //�б�˫����ɫ����
    systemConfig.gridOddEvenColor := myini.ReadBool('system_set', 'grid_odd_even_color', False);
    systemConfig.oddColor := myini.ReadInteger('system_set', 'odd_color', clBtnFace);
    systemConfig.evenColor := myini.ReadInteger('system_set', 'even_color', clBtnFace);
    //ÿ����ʼʱ��
    systemConfig.dayStart := myini.ReadString('system_set', 'day_start', '00:00:00');
    systemConfig.dayStartDiff := SecondsBetween(StrToTime(systemConfig.dayStart),
      StrToTime('00:00:00'));
    //��ʾ�ϼ���
    systemConfig.showSumList := myini.ReadBool('system_set', 'show_sum_list', True);
    //˫���޸ĳ��ؽ����б��¼
    systemConfig.doubleClickModifyRecord := myini.ReadBool('system_set', 'double_click_modify_record', False);
    //�������Ƥ����Ԥ��Ƥ��
    systemConfig.notAllowTareExceed := myini.ReadBool('system_set', 'not_allow_tare_exceed', False);
    //�����һ�ο۷ѶԱ�
    systemConfig.compareLast := myini.ReadBool('system_set', 'compare_last', False);
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
  myini := Tinifile.Create(ExtractFilePath(ParamStr(0)) + '\meter.ini');
  try
    systemConfig.softUnit1 := myini.ReadString('meter1', 'soft_unit', '����');
    systemConfig.softUnit2 := myini.ReadString('meter2', 'soft_unit', '����');
    systemConfig.meterShowMode1 := myini.ReadString('meter1', 'meter_show_mode', '0');
    systemConfig.meterDivide1 := myini.ReadInteger('meter1', 'meter_divide', 1);
    systemConfig.meterShowMode2 := myini.ReadString('meter2', 'meter_show_mode', '0');
    systemConfig.meterDivide2 := myini.ReadInteger('meter2', 'meter_divide', 1);
  finally
    myini.Free;
  end;
  myini := Tinifile.Create('weightSysInfo.ini');
  try
    //�û��Զ�����Ϣ
    systemConfig.loginTitle := myini.ReadString('system_set', 'login_title', '���ع���ϵͳ');
    systemConfig.loginInfo := myini.ReadString('system_set', 'login_info', '');
    systemConfig.mainTitle := myini.ReadString('system_set', 'main_title', '���ع���ϵͳ');
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

