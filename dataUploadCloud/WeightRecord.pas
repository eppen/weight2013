unit WeightRecord;

interface

uses SysUtils, Variants, Dialogs, ADODB, IdURI;

type
  TWeightRecord = class
  private
  public
    id: Integer;
    glideNo: string;
    carNo: string;
    weightType: string;
    faHuo: string;
    shouHuo: string;
    goods: string;
    spec: string;
    gross: Double;
    tare: Double;
    net: Double;
    bundle: Double;
    real: Double;
    price: Double;
    sum: Double;
    scale: Double;
    quanter: Double;
    cost: Double;
    grossMan: string;
    tareMan: string;
    grossAddr: string;
    tareAddr: string;
    grossTime: TDateTime;
    tareTime: TDateTime;
    firstTime: TDateTime;
    secondTime: TDateTime;
    updateUser: string;
    updateTime: TDateTime;
    memo: string;
    printCount: Integer;
    upload: Boolean;
    backup1: string;
    backup2: string;
    backup3: string;
    backup4: string;
    backup5: string;
    backup6: Double;
    backup7: Double;
    backup8: Double;
    backup9: Double;
    backup10: string;
    backup11: string;
    backup12: string;
    backup13: string;
    backup14: string;
    backup15: Double;
    backup16: Double;
    backup17: Double;
    backup18: Double;
    function toString(): string;
    function toJsonString(): string;
    function toEncodeJsonString(): string;
  end;

  TWeightRecordUtil = class
  private
  public
    class function get(glideNo: string; var w: TWeightRecord): Boolean;
  end;

implementation

uses
  Classes, CommonUtil, UploadCloud, superobject;

{ TWeightUtil }

class function TWeightRecordUtil.get(glideNo: string;
  var w: TWeightRecord): Boolean;
var adoq: TADOQuery;
begin
  Result := False;
  adoq := TADOQuery.Create(nil);
  try
    adoq.Connection := UploadCloudForm.ADOCLocal;
    with adoq do
    begin
      Close;
      SQL.Text := 'select * from ������Ϣ where ��ˮ��=:glideNo';
      Parameters.ParamByName('glideNo').Value := glideNo;
      Open;
      if not IsEmpty then
      begin
        w.id := FieldByName('���').AsInteger;
        w.glideNo := FieldByName('��ˮ��').AsString;
        w.carNo := FieldByName('����').AsString;
        w.weightType := FieldByName('��������').AsString;
        w.faHuo := FieldByName('������λ').AsString;
        w.shouHuo := FieldByName('�ջ���λ').AsString;
        w.goods := FieldByName('����').AsString;
        w.spec := FieldByName('���').AsString;
        w.grossMan := FieldByName('ë��˾��Ա').AsString;
        w.tareMan := FieldByName('Ƥ��˾��Ա').AsString;
        w.grossAddr := FieldByName('ë�ذ���').AsString;
        w.tareAddr := FieldByName('Ƥ�ذ���').AsString;
        if not FieldByName('ë��ʱ��').IsNull then
          w.grossTime := FieldByName('ë��ʱ��').AsDateTime;
        if not FieldByName('Ƥ��ʱ��').IsNull then
          w.tareTime := FieldByName('Ƥ��ʱ��').AsDateTime;
        w.gross := FieldByName('ë��').AsFloat;
        w.tare := FieldByName('Ƥ��').AsFloat;
        w.net := FieldByName('����').AsFloat;
        w.bundle := FieldByName('����').AsFloat;
        w.real := FieldByName('ʵ��').AsFloat;
        w.price := FieldByName('����').AsFloat;
        w.sum := FieldByName('���').AsFloat;
        w.scale := FieldByName('�۷�ϵ��').AsFloat;
        w.quanter := FieldByName('����').AsFloat;
        w.cost := FieldByName('������').AsFloat;
        w.firstTime := FieldByName('һ�ι���ʱ��').AsDateTime;
        w.secondTime := FieldByName('���ι���ʱ��').AsDateTime;
        w.updateUser := FieldByName('������').AsString;
        w.updateTime := FieldByName('����ʱ��').AsDateTime;
        w.memo := FieldByName('��ע').AsString;
        w.printCount := FieldByName('��ӡ����').AsInteger;
        w.upload := FieldByName('�ϴ���').AsBoolean;
        w.backup1 := FieldByName('����1').AsString;
        w.backup2 := FieldByName('����2').AsString;
        w.backup3 := FieldByName('����3').AsString;
        w.backup4 := FieldByName('����4').AsString;
        w.backup5 := FieldByName('����5').AsString;
        w.backup6 := FieldByName('����6').AsFloat;
        w.backup7 := FieldByName('����7').AsFloat;
        w.backup8 := FieldByName('����8').AsFloat;
        w.backup9 := FieldByName('����9').AsFloat;
        w.backup10 := FieldByName('����10').AsString;
        w.backup11 := FieldByName('����11').AsString;
        w.backup12 := FieldByName('����12').AsString;
        w.backup13 := FieldByName('����13').AsString;
        w.backup14 := FieldByName('����14').AsString;
        w.backup15 := FieldByName('����15').AsFloat;
        w.backup16 := FieldByName('����16').AsFloat;
        w.backup17 := FieldByName('����17').AsFloat;
        w.backup18 := FieldByName('����18').AsFloat;
        Result := True;
      end;
    end;
  finally
    adoq.Free;
  end;
end;

{ TWeightRecord }

function TWeightRecord.toEncodeJsonString: string;
begin
  Result := TCommonUtil.base64(toJsonString);
end;

function TWeightRecord.toJsonString: string;
var
  jo: ISuperObject;
begin
  jo := TSuperObject.Create();
 
  jo.I['id'] := id;
  jo.S['glideNo'] := glideNo;
  jo.S['carNo'] := carNo;
  jo.S['weightType'] := weightType;
  jo.S['faHuo'] := faHuo;
  jo.S['shouHuo'] := shouHuo;
  jo.S['goods'] := goods;
  jo.S['spec'] := spec;
  jo.S['gross'] := FloatToStr(gross);
  jo.S['tare'] := FloatToStr(tare);
  jo.S['net'] := FloatToStr(net);
  jo.S['bundle'] := FloatToStr(bundle);
  jo.S['real'] := FloatToStr(real);
  jo.S['price'] := FloatToStr(price);
  jo.S['sum'] := FloatToStr(sum);
  jo.S['scale'] := FloatToStr(scale);
  jo.S['quanter'] := FloatToStr(quanter);
  jo.S['cost'] := FloatToStr(cost);
  jo.S['grossMan'] := grossMan;
  jo.S['tareMan'] := tareMan;
  jo.S['grossAddr'] := grossAddr;
  jo.S['tareAddr'] := tareAddr;
  jo.S['grossTime'] := FormatDateTime('yyyy-MM-dd HH:mm:ss',grossTime);
  jo.S['tareTime'] := FormatDateTime('yyyy-MM-dd HH:mm:ss',tareTime);
  jo.S['firstTime'] := FormatDateTime('yyyy-MM-dd HH:mm:ss',firstTime);
  jo.S['secondTime'] := FormatDateTime('yyyy-MM-dd HH:mm:ss',secondTime);
  jo.S['updateUser'] := updateUser;
  jo.S['updateTime'] := FormatDateTime('yyyy-MM-dd HH:mm:ss',updateTime);
  jo.S['memo'] := memo;
  jo.I['printCount'] := printCount;
  jo.B['upload'] := upload;
  jo.S['backup1'] := backup1;
  jo.S['backup2'] := backup2;
  jo.S['backup3'] := backup3;
  jo.S['backup4'] := backup4;
  jo.S['backup5'] := backup5;
  jo.S['backup6'] := FloatToStr(backup6);
  jo.S['backup7'] := FloatToStr(backup7);
  jo.S['backup8'] := FloatToStr(backup8);
  jo.S['backup9'] := FloatToStr(backup9);
  jo.S['backup10'] := backup10;
  jo.S['backup11'] := backup11;
  jo.S['backup12'] := backup12;
  jo.S['backup13'] := backup13;
  jo.S['backup14'] := backup14;
  jo.S['backup15'] := FloatToStr(backup15);
  jo.S['backup16'] := FloatToStr(backup16);
  jo.S['backup17'] := FloatToStr(backup17);
  jo.S['backup18'] := FloatToStr(backup18);
  Result := jo.AsJSon(True);

  {Result := '{'
    + Format('''id'':%d,', [id])
    + Format('''glideNo'':''%s'',', [glideNo])
    + Format('''carNo'':''%s'',', [carNo])
    + Format('''weightType'':''%s'',', [weightType])
    + Format('''faHuo'':''%s'',', [faHuo])
    + Format('''shouHuo'':''%s'',', [shouHuo])
    + Format('''goods'':''%s'',', [goods])
    + Format('''spec'':''%s'',', [spec])
    + Format('''gross'':%f,', [gross])
    + Format('''tare'':%f,', [tare])
    + Format('''net'':%f,', [net])
    + Format('''bundle'':%f,', [bundle])
    + Format('''real'':%f,', [real])
    + Format('''price'':%f,', [price])
    + Format('''sum'':%f,', [sum])
    + Format('''scale'':%f,', [scale])
    + Format('''quanter'':%f,', [quanter])
    + Format('''cost'':%f,', [cost])
    + Format('''grossMan'':''%s'',', [grossMan])
    + Format('''tareMan'':''%s'',', [tareMan])
    + Format('''grossAddr'':''%s'',', [grossAddr])
    + Format('''tareAddr'':''%s'',', [tareAddr])
    + Format('''grossTime'':''%s'',',
    [FormatDateTime('yyyy-MM-dd HH:mm:ss', grossTime)])
  + Format('''tareTime'':''%s'',',
    [FormatDateTime('yyyy-MM-dd HH:mm:ss', tareTime)])
  + Format('''firstTime'':''%s'',',
    [FormatDateTime('yyyy-MM-dd HH:mm:ss', firstTime)])
  + Format('''secondTime'':''%s'',',
    [FormatDateTime('yyyy-MM-dd HH:mm:ss', secondTime)])
  + Format('''updateUser'':''%s'',', [updateUser])
    + Format('''updateTime'':''%s'',',
    [FormatDateTime('yyyy-MM-dd HH:mm:ss', updateTime)])
  + Format('''memo'':''%s'',', [memo])
    + Format('''printCount'':%d,', [printCount])
    + Format('''upload'':%s,', [LowerCase(BoolToStr(upload, True))])
  + Format('''backup1'':''%s'',', [backup1])
    + Format('''backup2'':''%s'',', [backup2])
    + Format('''backup3'':''%s'',', [backup3])
    + Format('''backup4'':''%s'',', [backup4])
    + Format('''backup5'':''%s'',', [backup5])
    + Format('''backup6'':%f,', [backup6])
    + Format('''backup7'':%f,', [backup7])
    + Format('''backup8'':%f,', [backup8])
    + Format('''backup9'':%f,', [backup9])
    + Format('''backup10'':''%s'',', [backup10])
    + Format('''backup11'':''%s'',', [backup11])
    + Format('''backup12'':''%s'',', [backup12])
    + Format('''backup13'':''%s'',', [backup13])
    + Format('''backup14'':''%s'',', [backup14])
    + Format('''backup15'':%f,', [backup15])
    + Format('''backup16'':%f,', [backup16])
    + Format('''backup17'':%f,', [backup17])
    + Format('''backup18'':%f', [backup18])
   }// + '}';
end;

function TWeightRecord.toString: string;
var s: string;
begin
  s := s + glideNo + ',' + carNo + ',' + faHuo + ',' + shouHuo + ','
    + goods + ',' + spec + ',' + FloatToStr(gross) + ',' + FloatToStr(tare) + ','
    + FloatToStr(net) + ',' + FloatToStr(bundle) + ',' + FloatToStr(real) + ','
    + FloatToStr(price) + ',' + FloatToStr(sum) + ',' + FloatToStr(scale) + ','
    + FloatToStr(quanter) + ',' + FloatToStr(cost) + ',' + grossMan + ','
    + tareMan + ',' + grossAddr + ',' + tareAddr + ',' + memo + ','
    + backup1 + ',' + backup2 + ',' + backup3 + ',' + backup4 + ',' + backup5 + ','
    + FloatToStr(backup6) + ',' + FloatToStr(backup7) + ','
    + FloatToStr(backup8) + ',' + FloatToStr(backup9) + ',' + backup10 + ','
    + backup11 + ',' + backup12 + ',' + backup13 + ',' + backup14 + ','
    + FloatToStr(backup15) + ',' + FloatToStr(backup16) + ','
    + FloatToStr(backup17) + ',' + FloatToStr(backup18);
  Result := s;
end;

end.

