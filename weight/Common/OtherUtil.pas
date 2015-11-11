unit OtherUtil;

interface

uses SysUtils, DB, Classes, Variants, RzCmboBx, ADODB, IdMessage, SpeechLib_TLB;

type

  TUserUtil = class
  private
  public
    //��ѯ�û��Ƿ���Ȩ��
    class function HasAuthority(Authority: string): Boolean;
    class function addUserStrings(sl: TStrings): Boolean;
    class function addUser(cb: TRzComboBox): Boolean;
    class function getModAuthority(username: string;
      var car: Boolean; var faHuo: Boolean; var shouHuo: Boolean; var goods: Boolean;
      var spec: Boolean; var gross: Boolean; var tare: Boolean;
      var bundle: Boolean; var price: Boolean; var scale: Boolean; var cost: Boolean;
      var backup1: Boolean; var backup2: Boolean; var backup3: Boolean;
      var backup4: Boolean; var backup5: Boolean; var backup6: Boolean;
      var backup7: Boolean; var backup8: Boolean; var backup9: Boolean;
      var backup10: Boolean; var backup11: Boolean; var backup12: Boolean;
      var backup13: Boolean; var backup14: Boolean;
      var backup15: Boolean; var backup16: Boolean; var backup17: Boolean;
      var backup18: Boolean): Boolean;
    class function isDefaultPass(): Boolean;
    class function resetPass(user: string): Boolean;
    class function getPassword(user: string): string;
  end;

  TLogUtil = class
  private
  public
    //��¼��־
    class procedure AddLog(content: string);
  end;

  TMailUtil = class
  private
  public
    class function showTodayRecord(): Boolean;
    class function showToWeekRecord(): Boolean;
    class function showToMonthRecord(): Boolean;
    class function showToYearRecord(): Boolean;
  end;

  TPriceUtil = class
  private
  public
    class function showShouHuo(): Boolean;
    class function showPrice(shouHuo: Integer): Boolean;
    class function savePrice(shouHuo, goods: Integer; price: Double = 0): Boolean;
    class function deletePrice(shouHuo, goods: Integer): Boolean;
    class function getPrice(shouHuo, goods: string): Double;
    class function resetPrice(): Boolean;
  end;

implementation

uses QueryDM, Main, CommonUtil, DateUtils, Dialogs;

{ TUserUtil }

class function TUserUtil.addUser(cb: TRzComboBox): Boolean;
begin
  addUserStrings(cb.Items);
end;

class function TUserUtil.addUserStrings(sl: TStrings): Boolean;
begin
  with QueryDataModule.ADOQUser do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select �û��� from �û���Ϣ order by �û���');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        sl.Add(FieldByName('�û���').AsString);
        Next
      end
    end
  end;
end;

class function TUserUtil.getModAuthority(username: string;
  var car, faHuo, shouHuo, goods, spec,
  gross, tare, bundle, price, scale, cost, backup1, backup2, backup3,
  backup4, backup5, backup6, backup7, backup8, backup9, backup10, backup11,
  backup12, backup13, backup14, backup15, backup16, backup17,
  backup18: Boolean): Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select * from �û���Ϣ where �û���=:user';
    Parameters.ParamByName('user').Value := username;
    Open;
    if not IsEmpty then
    begin
      car := FieldByName('�޸ĳ���').AsBoolean;
      faHuo := FieldByName('�޸ķ�����λ').AsBoolean;
      shouHuo := FieldByName('�޸��ջ���λ').AsBoolean;
      goods := FieldByName('�޸Ļ���').AsBoolean;
      spec := FieldByName('�޸Ĺ��').AsBoolean;
      gross := FieldByName('�޸�ë��').AsBoolean;
      tare := FieldByName('�޸�Ƥ��').AsBoolean;
      bundle := FieldByName('�޸Ŀ���').AsBoolean;
      price := FieldByName('�޸ĵ���').AsBoolean;
      scale := FieldByName('�޸��۷�ϵ��').AsBoolean;
      cost := FieldByName('�޸Ĺ�����').AsBoolean;
      backup1 := FieldByName('�޸ı���1').AsBoolean;
      backup2 := FieldByName('�޸ı���2').AsBoolean;
      backup3 := FieldByName('�޸ı���3').AsBoolean;
      backup4 := FieldByName('�޸ı���4').AsBoolean;
      backup5 := FieldByName('�޸ı���5').AsBoolean;
      backup6 := FieldByName('�޸ı���6').AsBoolean;
      backup7 := FieldByName('�޸ı���7').AsBoolean;
      backup8 := FieldByName('�޸ı���8').AsBoolean;
      backup9 := FieldByName('�޸ı���9').AsBoolean;
      backup10 := FieldByName('�޸ı���10').AsBoolean;
      backup11 := FieldByName('�޸ı���11').AsBoolean;
      backup12 := FieldByName('�޸ı���12').AsBoolean;
      backup13 := FieldByName('�޸ı���13').AsBoolean;
      backup14 := FieldByName('�޸ı���14').AsBoolean;
      backup15 := FieldByName('�޸ı���15').AsBoolean;
      backup16 := FieldByName('�޸ı���16').AsBoolean;
      backup17 := FieldByName('�޸ı���17').AsBoolean;
      backup18 := FieldByName('�޸ı���18').AsBoolean;
    end;
  end;
end;

class function TUserUtil.getPassword(user: string): string;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select ���� from �û���Ϣ where �û���=:u';
    Parameters.ParamByName('u').Value := user;
    Open;
    if not IsEmpty then
    begin
      Result := FieldByName('����').AsString;
    end;
  end;
end;

class function TUserUtil.HasAuthority(Authority: string): boolean;
begin
  result := False;
  with QueryDataModule.ADOQUser do
  begin
    Close;
    SQL.Text := 'select ' + Authority + ' from �û���Ϣ where �û���=:user';
    Parameters.ParamByName('user').Value := MainForm.CurrentUser;
    Open;
    if not IsEmpty then
    begin
      result := FieldByName(Authority).AsBoolean;
    end
  end;
end;

class function TUserUtil.isDefaultPass: Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select �û���,���� from �û���Ϣ where �û���=:u';
    Parameters.ParamByName('u').Value := '����Ա';
    Open;
    if not IsEmpty then
    begin
      Result := UpperCase(FieldByName('����').AsString) = TCommonUtil.md5('123');
    end
    else
    begin
      Result := False;
    end;
  end;
end;

class function TUserUtil.resetPass(user: string): Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'update �û���Ϣ set ����=:p where �û���=:u';
    Parameters.ParamByName('p').Value := TCommonUtil.md5('123');
    Parameters.ParamByName('u').Value := user;
    ExecSQL;
  end;
end;

{ TLogUtil }

class procedure TLogUtil.AddLog(content: string);
var i, j: Integer;
  s: string;
begin
  if MainForm.systemConfig.useLog then
  begin
    j := 1;
    with QueryDataModule.ADOQLog do
    begin
      Close;
      for i := 1 to Length(content) do
      begin
        s := s + content[i];
        Inc(j);
        if j = 200 then
        begin
          SQL.Text := 'insert into ��־(�޸���,ʱ��,��־) values(:user,:time,:content)';
          Parameters.ParamByName('user').Value := MainForm.CurrentUser;
          Parameters.ParamByName('time').Value := Now;
          Parameters.ParamByName('content').Value := s;
          ExecSQL;
          j := 1;
          s := '';
        end;
      end;
      SQL.Text := 'insert into ��־(�޸���,ʱ��,��־) values(:user,:time,:content)';
      Parameters.ParamByName('user').Value := MainForm.CurrentUser;
      Parameters.ParamByName('time').Value := Now;
      Parameters.ParamByName('content').Value := s;
      ExecSQL;
    end;
  end;
end;

{ TPriceUtil }

class function TPriceUtil.deletePrice(shouHuo, goods: Integer): Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'delete from tbl_price where shouHuo=:shouHuo and goods=:goods';
    Parameters.ParamByName('shouHuo').Value := shouHuo;
    Parameters.ParamByName('goods').Value := goods;
    ExecSQL;
    Result := True;
  end;
end;

class function TPriceUtil.getPrice(shouHuo, goods: string): Double;
var shouHuoId, goodsId: Integer;
begin
  if (shouHuo = '') and (goods = '') then
  begin
    Result := 0;
    Exit;
  end;
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select ��� from ���� where ����=:goods';
    Parameters.ParamByName('goods').Value := goods;
    Open;
    if not IsEmpty then
    begin
      goodsId := FieldByName('���').AsInteger;
    end
    else
    begin
      goodsId := 0;
    end;

    SQL.Text := 'select ��� from �ջ���λ where �ջ���λ=:shouHuo';
    Parameters.ParamByName('shouHuo').Value := shouHuo;
    Open;
    if not IsEmpty then
    begin
      shouHuoId := FieldByName('���').AsInteger;
    end
    else
    begin
      shouHuoId := 0;
    end;

    Close;
    SQL.Text := 'select [price] from tbl_price where (shouHuo=:s) and ([goods]=:goods)';
    Parameters.ParamByName('goods').Value := goodsId;
    Parameters.ParamByName('s').Value := shouHuoId;
    try
      Open;
      if not IsEmpty then
      begin
        Result := FieldByName('price').AsFloat;
      end
      else
      begin
        SQL.Text := 'select ���� from ���� where ����=:goods';
        Parameters.ParamByName('goods').Value := goods;
        Open;
        if not IsEmpty then
        begin
          Result := FieldByName('����').AsFloat;
        end
        else
        begin
          Result := 0;
        end;
      end;
    except
      SQL.Text := 'select ���� from ���� where ����=:goods';
      Parameters.ParamByName('goods').Value := goods;
      Open;
      if not IsEmpty then
      begin
        Result := FieldByName('����').AsFloat;
      end
      else
      begin
        Result := 0;
      end;
    end;
  end;
end;

class function TPriceUtil.resetPrice: Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'delete from tbl_price';
    ExecSQL;

    SQL.Text := 'select ��� from �ջ���λ';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin

        with QueryDataModule.ADOQExec2 do
        begin
          Close;
          SQL.Text := 'select ���,���� from ����';
          Open;
          if not IsEmpty then
          begin
            First;
            while not Eof do
            begin

              with QueryDataModule.ADOQExec3 do
              begin
                Close;
                SQL.Text := 'insert into tbl_price(shouHuo,goods,price) values (:shouHuo,:goods,:price)';
                Parameters.ParamByName('shouHuo').Value := QueryDataModule.ADOQExec.FieldByName('���').AsInteger;
                Parameters.ParamByName('goods').Value := QueryDataModule.ADOQExec2.FieldByName('���').AsInteger;
                Parameters.ParamByName('price').Value := QueryDataModule.ADOQExec2.FieldByName('����').AsFloat;
                ExecSQL;
              end;

              Next;
            end;
          end;
        end;

        Next;
      end;
    end;
    Result := True;
  end;
end;

class function TPriceUtil.savePrice(shouHuo, goods: Integer;
  price: Double): Boolean;
begin
  with QueryDataModule.ADOQExec2 do
  begin
    Close;
    SQL.Text := 'select id from tbl_price where (shouHuo=:shouHuo) and (goods=:goods)';
    Parameters.ParamByName('shouHuo').Value := shouHuo;
    Parameters.ParamByName('goods').Value := goods;
    Open;
    if IsEmpty then
    begin
      SQL.Text := 'insert into tbl_price(shouHuo,goods,price) values (:shouHuo,:goods,:price)';
      Parameters.ParamByName('shouHuo').Value := shouHuo;
      Parameters.ParamByName('goods').Value := goods;
      Parameters.ParamByName('price').Value := price;
      ExecSQL;
      Result := True;
    end
    else
    begin
      SQL.Text := 'update tbl_price set price=:price where (shouHuo=:shouHuo) and (goods=:goods)';
      Parameters.ParamByName('shouHuo').Value := shouHuo;
      Parameters.ParamByName('goods').Value := goods;
      Parameters.ParamByName('price').Value := price;
      ExecSQL;
      Result := True;
    end;
  end;
end;

class function TPriceUtil.showPrice(shouHuo: Integer): Boolean;
begin
  with QueryDataModule.ADOQPrice do
  begin
    Close;
    SQL.Text := 'select t1.shouHuo,t1.goods as goodsId,t1.price,t2.���� as goods '
      + 'from tbl_price as t1,���� as t2 where (t1.shouHuo=:shouHuo) and (t1.goods=t2.���)';
    Parameters.ParamByName('shouHuo').Value := shouHuo;
    Open;
  end;
end;

class function TPriceUtil.showShouHuo: Boolean;
begin
  with QueryDataModule.ADOQPriceShouHuo do
  begin
    Close;
    SQL.Text := 'select * from �ջ���λ';
    Open;
  end;
end;

{ TMailUtil }

class function TMailUtil.showTodayRecord: Boolean;
begin
  with QueryDataModule.ADOQMail do
  begin
    Close;
    SQL.Text := 'select * from ������Ϣ where ����ʱ�� between :startDate and :endDate';
    Parameters.ParamByName('startDate').Value := IncDay(Now, -1);
    Parameters.ParamByName('endDate').Value := Now;
    Open;
  end;
end;

class function TMailUtil.showToMonthRecord: Boolean;
begin
  with QueryDataModule.ADOQMail do
  begin
    Close;
    SQL.Text := 'select * from ������Ϣ where ����ʱ�� between :startDate and :endDate';
    Parameters.ParamByName('startDate').Value := IncMonth(Now, -1);
    Parameters.ParamByName('endDate').Value := Now;
    Open;
  end;
end;

class function TMailUtil.showToWeekRecord: Boolean;
begin
  with QueryDataModule.ADOQMail do
  begin
    Close;
    SQL.Text := 'select * from ������Ϣ where ����ʱ�� between :startDate and :endDate';
    Parameters.ParamByName('startDate').Value := IncWeek(Now, -1);
    Parameters.ParamByName('endDate').Value := Now;
    Open;
  end;
end;

class function TMailUtil.showToYearRecord: Boolean;
begin
  with QueryDataModule.ADOQMail do
  begin
    Close;
    SQL.Text := 'select * from ������Ϣ where ����ʱ�� between :startDate and :endDate';
    Parameters.ParamByName('startDate').Value := IncYear(Now, -1);
    Parameters.ParamByName('endDate').Value := Now;
    Open;
  end;
end;

end.

