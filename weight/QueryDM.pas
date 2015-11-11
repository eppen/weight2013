unit QueryDM;

interface

uses
  SysUtils, Classes, ADODB, DB, Dialogs, IniFiles,
  frxDesgn, frxClass, frxDBSet, frxBarcode, StrUtils, frxChart, frxCross,
  frxExportImage, frxExportXLS, Math, RM_DsgGridReport,
  RM_e_Jpeg, RM_e_Xls, RM_e_bmp, RM_DBChart,
  RM_Chart, RM_Cross, RM_BarCode, RM_AsBarView, RM_ChineseMoneyMemo,
  RM_Dataset, RM_GridReport, RM_Class, RM_Common, RM_e_Graphic, RM_System,
  frx2DBarcode;

type
  TQueryDataModule = class(TDataModule)
    DBConnection: TADOConnection;
    WeightMaintainDS: TDataSource;
    DSUser: TDataSource;
    ADOQUser: TADOQuery;
    PrepareMaintainQuery: TADOQuery;
    PrepareMaintainDS: TDataSource;
    ADOQExec: TADOQuery;
    WeightMaintainQuery: TADOQuery;
    ADOQueryPrintTicket: TADOQuery;
    StatisticsDS: TDataSource;
    StatisticsQuery: TADOQuery;
    ADOQLog: TADOQuery;
    ADOQMultiGross: TADOQuery;
    DSMultiGross: TDataSource;
    DSLog: TDataSource;
    ADOQBackRecord: TADOQuery;
    DSBackRecord: TDataSource;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    frxDBDatasetReport: TfrxDBDataset;
    frxReportReport: TfrxReport;
    ADOQCard: TADOQuery;
    DSCard: TDataSource;
    DSTao: TDataSource;
    ADOQTao: TADOQuery;
    frxDBDataset2: TfrxDBDataset;
    frxReport2: TfrxReport;
    DSPayHistory: TDataSource;
    ADOQPay: TADOQuery;
    DSPay: TDataSource;
    ADOQPayHistory: TADOQuery;
    ADOQStaticChart: TADOQuery;
    RMGridReport1: TRMGridReport;
    RMDBDataSet1: TRMDBDataSet;
    ADOQChart: TADOQuery;
    DSChart: TDataSource;
    ADOQStorage: TADOQuery;
    DSStorage: TDataSource;
    ADOQExec2: TADOQuery;
    ADOQExec3: TADOQuery;
    ADOQPriceShouHuo: TADOQuery;
    ADOQPrice: TADOQuery;
    DSPriceShouHuo: TDataSource;
    DSPrice: TDataSource;
    ADOQExceed: TADOQuery;
    ADOQInvalid: TADOQuery;
    DSExceed: TDataSource;
    DSInvalid: TDataSource;
    ADOQExport: TADOQuery;
    ADOQMail: TADOQuery;
    DSMail: TDataSource;
    ADOQCarFilter: TADOQuery;
    DSCarFilter: TDataSource;
    procedure ADOQUserBeforePost(DataSet: TDataSet);
    procedure ADOQUserAfterPost(DataSet: TDataSet);
    procedure ADOQUserAfterEdit(DataSet: TDataSet);
    procedure ADOQUserBeforeDelete(DataSet: TDataSet);
    procedure WeightMaintainQueryBeforePost(DataSet: TDataSet);
    procedure WeightMaintainQueryBeforeEdit(DataSet: TDataSet);
    procedure WeightMaintainQueryAfterPost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    function frxReport1UserFunction(const MethodName: string;
      var Params: Variant): Variant;
    function frxReportReportUserFunction(const MethodName: string;
      var Params: Variant): Variant;
    procedure WeightMaintainQueryBeforeDelete(DataSet: TDataSet);
  private
    ChangeName: boolean;
    XuHao: string;
    Car, FaHuo, ShouHuo, Goods, Spec, Mao, Kong, Jing, Kou, Shi, Dangjia, Jinger: string;
    { Private declarations }
  public
    { Public declarations }
    ConnectFlag: Boolean;
    procedure ConnectDatabase; //�������ݿ�
  end;

var
  QueryDataModule: TQueryDataModule;

const DB_PASSWORD = 'www.fzatw.com';

implementation

uses Main, CommonUtil, OtherUtil;

{$R *.dfm}

function MoneyToCn(sourcemoney: Double): string;
var
  strsourcemoney, strobjectmoney: string;
  thiswei, thispos: string[2];
  //thisweiΪ��ǰλ�Ĵ�д��thisposΪ��ǰλ������ҵ�λ
  iwei, pospoint: Integer;
  //iweiΪ��ǰλ�ã�pospointΪС�����λ��
begin
  strsourcemoney := formatfloat('0.00', sourcemoney);
  //��������ת����ָ����ʽ�ַ���
  if Length(strsourcemoney) > 15 then //����ǧ��Ԫ
  begin
    ShowMessage('��������ȷ�����֣���Ҫ����ǧ�ڣ�15λ������');
    Exit;
  end;
  pospoint := Pos('.', strsourcemoney); //С����λ��
  for iwei := Length(strsourcemoney) downto 1 do //���磺500.8 = 5 X=4
  begin
    case pospoint - iwei of //С����λ�� - �ܳ��� �� ���һλ��λ
      -3: thispos := '��';
      -2: thispos := '��';
      -1: thispos := '��';
      1: if (pospoint > 2) or (strsourcemoney[iwei] <> '0') then //С����λ�ô�����
          thispos := 'Ԫ';
      2: thispos := 'ʰ';
      3: thispos := '��';
      4: thispos := 'Ǫ';
      5: thispos := '��';
      6: thispos := 'ʰ';
      7: thispos := '��';
      8: thispos := 'Ǫ';
      9: thispos := '��';
      10: thispos := 'ʮ';
      11: thispos := '��';
      12: thispos := 'Ǫ';
    end;
    case strsourcemoney[iwei] of //��ǰ����ת��������Һ���
      '.': Continue;
      '1': thiswei := 'Ҽ';
      '2': thiswei := '��';
      '3': thiswei := '��';
      '4': thiswei := '��';
      '5': thiswei := '��';
      '6': thiswei := '½';
      '7': thiswei := '��';
      '8': thiswei := '��';
      '9': thiswei := '��';
      '0':
        begin
          thiswei := '';
          if iwei < Length(strsourcemoney) then //���ǵ�һλ��ʱ��
            if (strsourcemoney[iwei + 1] <> '0') and (strsourcemoney[iwei + 1] <> '.') then
              //��ǰһλ�������㣬��5005 Ϊ��ǧ���塣���� ǰһλ����. ���� 5.05 Ϊ��Ԫ���
              thiswei := '��';
          if (thispos <> '��') and (thispos <> '��') and (thispos <> 'Ԫ') then
            thispos := '' //��λ��ʮ���١�Ǫ   �ģ�Ϊ0������ʾ��λ��
          else
            thiswei := ''; //����λΪ�ڡ���Ԫ����ǰһλ0������ʾ'��'
        end;
    end;
    strobjectmoney := thiswei + thispos + strobjectmoney; //��ϳɴ�д���
  end;
  strobjectmoney := ansireplacetext(strobjectmoney, '����', '��'); //ȥ��'����'�е�'��'
  if ansicontainsstr(strobjectmoney, '��') then
    Result := strobjectmoney
  else
  begin
    Result := strobjectmoney;
  end;
end;


function Num2CNum(dblArabic: double): string;
const
  _ChineseNumeric = '��Ҽ��������½��ƾ�';
var
  sArabic: string;
  sIntArabic: string;
  iPosOfDecimalPoint: integer;
  i: integer;
  iDigit: integer;
  iSection: integer;
  sSectionArabic: string;
  sSection: string;
  bInZero: boolean;
  bMinus: boolean;
  (* ���ִ�����, ����: ���� '1234', ���� '4321' *)
  function ConvertStr(const sBeConvert: string): string;
  var
    x: integer;
  begin
    Result := '';
    for x := Length(sBeConvert) downto 1 do
      Result := Result + sBeConvert[x];
  end;
  { of ConvertStr }
begin
  Result := '';
  bInZero := True;
  sArabic := FloatToStr(dblArabic); (* ������ת�ɰ����������ִ� *)
  if sArabic[1] = '-' then
  begin
    bMinus := True;
    sArabic := Copy(sArabic, 2, 254);
  end
  else
    bMinus := False;
  iPosOfDecimalPoint := Pos('.', sArabic); (* ȡ��С�����λ�� *)

  (* �ȴ��������Ĳ��� *)
  if iPosOfDecimalPoint = 0 then
    sIntArabic := ConvertStr(sArabic)
  else
    sIntArabic := ConvertStr(Copy(sArabic, 1, iPosOfDecimalPoint - 1));
  (* �Ӹ�λ������ÿ��λ��ΪһС�� *)
  for iSection := 0 to ((Length(sIntArabic) - 1) div 4) do
  begin
    sSectionArabic := Copy(sIntArabic, iSection * 4 + 1, 4);
    sSection := '';
      (* ���µ� i ����: ��ʮ��ǧλ�ĸ�λ�� *)
    for i := 1 to Length(sSectionArabic) do
    begin
      iDigit := Ord(sSectionArabic[i]) - 48;
      if iDigit = 0 then
      begin
              (* 1. ���� '��' ���ظ����� *)
              (* 2. ��λ���� 0 ����ת�� '��' *)
        if (not bInZero) and (i <> 1) then sSection := '��' + sSection;
        bInZero := True;
      end
      else
      begin
        case i of
          2: sSection := 'ʰ' + sSection;
          3: sSection := '��' + sSection;
          4: sSection := 'Ǫ' + sSection;
        end;
        sSection := Copy(_ChineseNumeric, 2 * iDigit + 1, 2) +
          sSection;
        bInZero := False;
      end;
    end;

      (* ���ϸ�С�ڵ�λ�� *)
    if Length(sSection) = 0 then
    begin
      if (Length(Result) > 0) and (Copy(Result, 1, 2) <> '��') then
        Result := '��' + Result;
    end
    else
    begin
      case iSection of
        0: Result := sSection;
        1: Result := sSection + '��' + Result;
        2: Result := sSection + '��' + Result;
        3: Result := sSection + '��' + Result;
      end;
    end;
  end;

  (* ����С�����ұߵĲ��� *)
  if iPosOfDecimalPoint > 0 then
  begin
    Result := Result + '��';
    //AppendStr(Result, '��');
    for i := iPosOfDecimalPoint + 1 to Length(sArabic) do
    begin
      iDigit := Ord(sArabic[i]) - 48;
      //AppendStr(Result, Copy(_ChineseNumeric, 2 * iDigit + 1, 2));
      Result := Result + Copy(_ChineseNumeric, 2 * iDigit + 1, 2);
    end;
  end;
  (* ��������״���Ĵ��� *)
  if Length(Result) = 0 then Result := '��';
  if Copy(Result, 1, 4) = 'һʮ' then Result := Copy(Result, 3, 254);
  if Copy(Result, 1, 2) = '��' then Result := '��' + Result;

  (* �Ƿ�Ϊ���� *)
  if bMinus then Result := '��' + Result;
end;

procedure TQueryDataModule.ADOQUserBeforePost(DataSet: TDataSet);
begin
  if DataSet.FieldByName('����Ա').AsBoolean then
  begin
    DataSet.Edit;
    DataSet['�û�����'] := True;
  end;
end;

procedure TQueryDataModule.ADOQUserAfterPost(DataSet: TDataSet);
begin
  if ChangeName then
  begin
    MainForm.CurrentUser := DataSet.FieldByName('�û���').AsString;
  end;
end;

procedure TQueryDataModule.ADOQUserAfterEdit(DataSet: TDataSet);
begin
  if (MainForm.CurrentUser = DataSet.FieldByName('�û���').AsString) then
    ChangeName := True
  else
    ChangeName := False;
end;

procedure TQueryDataModule.ADOQUserBeforeDelete(DataSet: TDataSet);
begin
  if DataSet.FieldByName('����Ա').AsBoolean then
  begin
    MessageDlg('����ɾ������Ա!', mtWarning, [mbOK, mbCancel], 0);
    Abort;
  end;
end;

procedure TQueryDataModule.WeightMaintainQueryBeforePost(
  DataSet: TDataSet);
var gross, tare, buckle, price: Double;
  net, actual, sum: Double;
  scale, quanter: Double;
begin

  gross := DataSet.FieldByName('ë��').AsFloat;
  tare := DataSet.FieldByName('Ƥ��').AsFloat;
  buckle := DataSet.FieldByName('����').AsFloat;
  price := DataSet.FieldByName('����').AsFloat;
  scale := DataSet.FieldByName('�۷�ϵ��').AsFloat;

  DataSet.Edit;
  if gross - tare > 0 then
  begin
    if (gross = 0) or (tare = 0) then
      DataSet['����'] := 0
    else
      DataSet['����'] := gross - tare;
    if not MainForm.systemConfig.useBundleRate then
    begin
      DataSet['ʵ��'] := gross - tare - buckle;
      DataSet['���'] := (gross - tare - buckle) * price;
    end
    else
    begin
      DataSet['ʵ��'] := RoundTo((gross - tare) * (1 - buckle / 100), -3);
      DataSet['���'] := RoundTo((gross - tare) * (1 - buckle / 100), -3) * price;
    end;
    if scale > 0 then
      DataSet['����'] := RoundTo(net / scale, -2);

    net := DataSet['����'];
    actual := DataSet['ʵ��'];
    sum := DataSet['���'];
    quanter := DataSet['����'];

  end
end;

procedure TQueryDataModule.WeightMaintainQueryBeforeEdit(
  DataSet: TDataSet);
begin
  XuHao := DataSet.FieldByName('��ˮ��').AsString;
  Car := DataSet.FieldByName('����').AsString;
  FaHuo := DataSet.FieldByName('������λ').AsString;
  ShouHuo := DataSet.FieldByName('�ջ���λ').AsString;
  Goods := DataSet.FieldByName('����').AsString;
  Spec := DataSet.FieldByName('���').AsString;
  Mao := DataSet.FieldByName('ë��').AsString;
  Kong := DataSet.FieldByName('Ƥ��').AsString;
  Jing := DataSet.FieldByName('����').AsString;
  Kou := DataSet.FieldByName('����').AsString;
  Shi := DataSet.FieldByName('ʵ��').AsString;
  Dangjia := DataSet.FieldByName('����').AsString;
  Jinger := DataSet.FieldByName('���').AsString;
end;

procedure TQueryDataModule.WeightMaintainQueryAfterPost(DataSet: TDataSet);
var Log: string;
begin
  Log := '��ˮ��Ϊ' + XuHao + '�ļ�¼:';
  if Car <> DataSet.FieldByName('����').AsString then
    Log := Log + '������ ' + Car + ' �޸�Ϊ '
      + DataSet.FieldByName('����').AsString + ',';
  if FaHuo <> DataSet.FieldByName('������λ').AsString then
    Log := Log + '������λ�� ' + FaHuo + ' �޸�Ϊ '
      + DataSet.FieldByName('������λ').AsString + ',';
  if ShouHuo <> DataSet.FieldByName('�ջ���λ').AsString then
    Log := Log + '�ջ���λ�� ' + ShouHuo + ' �޸�Ϊ '
      + DataSet.FieldByName('�ջ���λ').AsString + ',';
  if Goods <> DataSet.FieldByName('����').AsString then
    Log := Log + '������ ' + Goods + ' �޸�Ϊ '
      + DataSet.FieldByName('����').AsString + ',';
  if Spec <> DataSet.FieldByName('���').AsString then
    Log := Log + '����� ' + Spec + ' �޸�Ϊ '
      + DataSet.FieldByName('���').AsString + ',';
  if Mao <> DataSet.FieldByName('ë��').AsString then
    Log := Log + 'ë���� ' + Mao + ' �޸�Ϊ '
      + DataSet.FieldByName('ë��').AsString + ',';
  if Kong <> DataSet.FieldByName('Ƥ��').AsString then
    Log := Log + 'Ƥ���� ' + Kong + ' �޸�Ϊ '
      + DataSet.FieldByName('Ƥ��').AsString + ',';
  if Jing <> DataSet.FieldByName('����').AsString then
    Log := Log + '������ ' + Jing + ' �޸�Ϊ '
      + DataSet.FieldByName('����').AsString + ',';
  if Kou <> DataSet.FieldByName('����').AsString then
    Log := Log + '������ ' + Kou + ' �޸�Ϊ '
      + DataSet.FieldByName('����').AsString + ',';
  if Shi <> DataSet.FieldByName('ʵ��').AsString then
    Log := Log + 'ʵ���� ' + Shi + ' �޸�Ϊ '
      + DataSet.FieldByName('ʵ��').AsString + ',';
  if Dangjia <> DataSet.FieldByName('����').AsString then
    Log := Log + '������ ' + Dangjia + ' �޸�Ϊ '
      + DataSet.FieldByName('����').AsString + ',';
  if Jinger <> DataSet.FieldByName('���').AsString then
    Log := Log + '����� ' + Jinger + ' �޸�Ϊ '
      + DataSet.FieldByName('���').AsString;

  with ADOQLog do
  begin
    Close;
    SQL.Clear;
    SQL.Add('insert into ��־(�޸���,ʱ��,��־) values(:user,:time,:content)');
    Parameters.ParamByName('user').Value := MainForm.CurrentUser;
    Parameters.ParamByName('time').Value := FormatDateTime('yyyy-mm-dd hh:nn:ss', Now);
    Parameters.ParamByName('content').Value := Log;
    ExecSQL
  end;
end;

procedure TQueryDataModule.ConnectDatabase; //�������ݿ�
var ConnectedIP, Database, user, pass: string;
  myini: TIniFile;
  ConnStr: string;
begin
  ConnectFlag := False;
  myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'db.ini');
  try
    ConnectedIP := myini.ReadString('db', 'IP', '.');
    Database := myini.ReadString('db', 'DBName', 'weight20');
    user := myini.ReadString('db', 'User', 'sa');
    pass := TCommonUtil.deBase64(myini.ReadString('db', 'Pass', 'MTIz'));
    ConnStr := 'Provider=SQLOLEDB.1;'; //OLE����
    if myini.ReadBool('db', 'Integrated', True) then //ʹ�õĵ�¼ģʽ��SA����NT��֤
      ConnStr := ConnStr + 'Integrated Security=SSPI;'
    else
      ConnStr := ConnStr + 'User ID=' + user + ';Password=' + pass + ';';
    ConnStr := ConnStr + 'Persist Security Info=True;'
      + 'Initial Catalog=' + Database + ';Data Source=' + ConnectedIP;

    with QueryDataModule.DBConnection do //�������ݿ�
    try
      Close;
      LoginPrompt := False;
      ConnectionTimeout := 10;
      ConnectionString := ConnStr;
      Open;
      ConnectFlag := True;
    except
      on E: Exception do
      begin
        //MessageDlg(pchar(E.Message), mtError, [mbOK], 0);
        MessageDlg('���ݿ�����ʧ��,����������', mtError, [mbOK], 0);
        ConnectFlag := False;
      end;
    end
  finally
    myini.Free;
  end;
end;

procedure TQueryDataModule.DataModuleCreate(Sender: TObject);
var FileName: string;
  myini: TiniFile;
begin
  myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'db.ini');
  try
    //�������Access���ݿ�
    if myini.ReadInteger('db', 'type', 0) = 0 then
    begin
      FileName := myini.ReadString('db', 'addr',
        ExtractFilePath(ParamStr(0)) + '\Database\Database.mdb');
      ConnectFlag := True;
      if not FileExists(FileName) then
      begin
        FileName := ExtractFilePath(ParamStr(0)) + '\Database\Database.mdb';
        myini.WriteString('db', 'addr', FileName)
      end;
      if FileExists(FileName) then
      try
        with QueryDataModule.DBConnection do
        begin
          Close;
          ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='
            + FileName + ';Persist Security Info=False;Jet OLEDB:Database Password=' + DB_PASSWORD;
          Open
        end;
      except
        ConnectFlag := False;
      end
      else
        ConnectFlag := False;
    end
    else //����SQL����
    begin
      ConnectDatabase;
    end;
  finally
    myini.Free;
  end;
  frxReport1.AddFunction('function MoneyToCn(ANumberic: Double): String;', 'Myfunction', '����Ҵ�д���ת������');
  frxReport1.AddFunction('function Num2CNum(dblArabic: Double): String;', 'Myfunction', '��������д���ת������');
  frxReportReport.AddFunction('function MoneyToCn(ANumberic: Double): String;', 'Myfunction', '����Ҵ�д���ת������');
  frxReportReport.AddFunction('function Num2CNum(dblArabic: Double): String;', 'Myfunction', '��������д���ת������');
end;

function TQueryDataModule.frxReport1UserFunction(const MethodName: string;
  var Params: Variant): Variant;
begin
  if UpperCase(MethodName) = UpperCase('MoneyToCn') then
    Result := MoneyToCn(Params[0]);
  if UpperCase(MethodName) = UpperCase('Num2CNum') then
    Result := Num2CNum(Params[0]);
end;

function TQueryDataModule.frxReportReportUserFunction(
  const MethodName: string; var Params: Variant): Variant;
begin
  if UpperCase(MethodName) = UpperCase('MoneyToCn') then
    Result := MoneyToCn(Params[0]);
  if UpperCase(MethodName) = UpperCase('Num2CNum') then
    Result := Num2CNum(Params[0]);
end;

procedure TQueryDataModule.WeightMaintainQueryBeforeDelete(
  DataSet: TDataSet);
begin
  TLogUtil.AddLog('��ˮ��Ϊ' + DataSet.FieldByName('��ˮ��').AsString + '�ļ�¼��ɾ��');
end;

end.

