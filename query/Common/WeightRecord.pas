unit WeightRecord;

interface

uses SysUtils, Variants, Dialogs;

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
  end;

  TWeightRecordUtil = class
  private
  public
    class function save(var w: TWeightRecord): Boolean; //������ؼ�¼
    class function get(glideNo: string; var w: TWeightRecord): Boolean;
  end;

implementation

uses
  QueryDM, WeightUtil, Classes;

{ TWeightUtil }

class function TWeightRecordUtil.get(glideNo: string;
  var w: TWeightRecord): Boolean;
begin
  Result := False;
  with QueryDataModule.ADOQExec do
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
end;

class function TWeightRecordUtil.save(var w: TWeightRecord): Boolean;
var sqlStr: string;
begin
  if w.glideNo = '' then
  begin
    sqlStr := 'insert into ������Ϣ(��ˮ��,����,��������,������λ,�ջ���λ,'
      + '����,���,ë��,Ƥ��,����,����,ʵ��,����,���,�۷�ϵ��,����,������,'
      + 'ë��˾��Ա,Ƥ��˾��Ա,ë�ذ���,Ƥ�ذ���,ë��ʱ��,Ƥ��ʱ��,һ�ι���ʱ��,'
      + '���ι���ʱ��,������,����ʱ��,��ע,��ӡ����,�ϴ���,����1,����2,����3,'
      + '����4,����5,����6,����7,����8,����9,����10,����11,����12,����13,'
      + '����14,����15,����16,����17,����18)';

    sqlStr := sqlStr + ' values(:glideNo,:car,:weightType,:fahuo,:shouhuo,:goods,'
      + ':spec,:gross,:tare,:net,:bundle,:real,:price,:sum,:scale,:quanter,:cost,'
      + ':grossMan,:tareMan,:grossAddr,:tareAddr,:grosstime,:taretime,:firstTime,:secondTime,'
      + ':updateUser,:updateTime,:memo,:printCount,:upload,:backup1,:backup2,:backup3,'
      + ':backup4,:backup5,:backup6,:backup7,:backup8,:backup9,:backup10,:backup11,:backup12,'
      + ':backup13,:backup14,:backup15,:backup16,:backup17,:backup18)';
    w.glideNo := TWeightUtil.getMaxGlideNo;
  end
  else
  begin
    sqlStr := 'update ������Ϣ set ��ˮ��=:glideNo,����=:car,��������=:weightType,'
      + '������λ=:fahuo,�ջ���λ=:shouhuo,����=:goods,���=:spec,ë��=:gross,'
      + 'Ƥ��=:tare,����=:net,����=:bundle,ʵ��=:real,����=:price,���=:sum,'
      + '�۷�ϵ��=:scale,����=:quanter,������=:cost,ë��˾��Ա=:grossMan,'
      + 'Ƥ��˾��Ա=:tareMan,ë�ذ���=:grossAddr,Ƥ�ذ���=:tareAddr,ë��ʱ��=:grosstime,'
      + 'Ƥ��ʱ��=:taretime,һ�ι���ʱ��=:firstTime,���ι���ʱ��=:secondTime,'
      + '������=:updateUser,����ʱ��=:updateTime,��ע=:memo,��ӡ����=:printCount,'
      + '�ϴ���=:upload,����1=:backup1,����2=:backup2,����3=:backup3,'
      + '����4=:backup4,����5=:backup5,����6=:backup6,����7=:backup7,����8=:backup8,'
      + '����9=:backup9,����10=:backup10,����11=:backup11,����12=:backup12,����13=:backup13,'
      + '����14=:backup14,����15=:backup15,����16=:backup16,����17=:backup17,����18=:backup18 '
      + 'where ���=:id';
  end;
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := sqlStr;
    if w.id <> 0 then
      Parameters.ParamByName('id').Value := w.id;
    Parameters.ParamByName('glideno').Value := w.glideNo;
    Parameters.ParamByName('car').Value := w.carNo;
    Parameters.ParamByName('weightType').Value := w.weightType;
    Parameters.ParamByName('fahuo').Value := w.faHuo;
    Parameters.ParamByName('shouhuo').Value := w.shouHuo;
    Parameters.ParamByName('goods').Value := w.goods;
    Parameters.ParamByName('spec').Value := w.spec;
    Parameters.ParamByName('gross').Value := w.gross;
    Parameters.ParamByName('tare').Value := w.tare;
    Parameters.ParamByName('net').Value := w.net;
    Parameters.ParamByName('bundle').Value := w.bundle;
    Parameters.ParamByName('real').Value := w.real;
    Parameters.ParamByName('price').Value := w.price;
    Parameters.ParamByName('sum').Value := w.sum;
    Parameters.ParamByName('cost').Value := w.cost;
    Parameters.ParamByName('scale').Value := w.scale;
    Parameters.ParamByName('quanter').Value := w.quanter;
    if (w.gross <> 0) and (w.tare <> 0) then
    begin
      Parameters.ParamByName('grossMan').Value := w.grossMan;
      Parameters.ParamByName('tareMan').Value := w.tareMan;
      Parameters.ParamByName('grosstime').Value := w.grossTime;
      Parameters.ParamByName('taretime').Value := w.tareTime;
      Parameters.ParamByName('grossAddr').Value := w.grossAddr;
      Parameters.ParamByName('tareAddr').Value := w.tareAddr;
    end
    else if (w.gross <> 0) then
    begin
      Parameters.ParamByName('grossMan').Value := w.grossMan;
      Parameters.ParamByName('grosstime').Value := w.grossTime;
      Parameters.ParamByName('taretime').Value := null;
      Parameters.ParamByName('grossAddr').Value := w.grossAddr;
    end
    else if (w.tare <> 0) then
    begin
      Parameters.ParamByName('tareMan').Value := w.tareMan;
      Parameters.ParamByName('grosstime').Value := null;
      Parameters.ParamByName('taretime').Value := w.tareTime;
      Parameters.ParamByName('tareAddr').Value := w.tareAddr;
    end;
    Parameters.ParamByName('updateUser').Value := w.updateUser;
    Parameters.ParamByName('updateTime').Value := Now;
    Parameters.ParamByName('memo').Value := w.memo;
    Parameters.ParamByName('printCount').Value := w.printCount;
    Parameters.ParamByName('upload').Value := w.upload;
    Parameters.ParamByName('backup1').Value := w.backup1;
    Parameters.ParamByName('backup2').Value := w.backup2;
    Parameters.ParamByName('backup3').Value := w.backup3;
    Parameters.ParamByName('backup4').Value := w.backup4;
    Parameters.ParamByName('backup5').Value := w.backup5;
    Parameters.ParamByName('backup6').Value := w.backup6;
    Parameters.ParamByName('backup7').Value := w.backup7;
    Parameters.ParamByName('backup8').Value := w.backup8;
    Parameters.ParamByName('backup9').Value := w.backup9;
    Parameters.ParamByName('backup10').Value := w.backup10;
    Parameters.ParamByName('backup11').Value := w.backup11;
    Parameters.ParamByName('backup12').Value := w.backup12;
    Parameters.ParamByName('backup13').Value := w.backup13;
    Parameters.ParamByName('backup14').Value := w.backup14;
    Parameters.ParamByName('backup15').Value := w.backup15;
    Parameters.ParamByName('backup16').Value := w.backup16;
    Parameters.ParamByName('backup17').Value := w.backup17;
    Parameters.ParamByName('backup18').Value := w.backup18;

    try
      ExecSQL;
      Result := True;
    except on e: Exception do
      begin
        MessageDlg(PChar(Format('���ݱ���ʧ��!%s', [e.Message])), mtError, [mbOK], 0);
        Result := False;
      end;
    end;
  end;
end;

{ TWeightRecord }

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

