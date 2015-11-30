unit PayUtil;

interface

uses SysUtils, DB, Variants, ADODB;

type
  TPayUtil = class
  private
  public
    class function showHistory(): Boolean; overload;
    class function showHistory(startDate, endDate: TDateTime): Boolean; overload;
    class function showCompany(): Boolean;
    class function charge(shouHuo, p: string): Boolean; //��ֵ
    class function pay(shouHuo, sum: string): Boolean; //�۷�
    class function lowCredit(shouHuo: string; sum: Double): Boolean; //���õȼ�����
    class function getLeft(shouHuo: string): Double;

    class function getLastSum(carNo: string): Double;
    class function getLastNet(carNo: string): Double;
    class function getLastQuanter(carNo: string): Double;
    class function getLastBackup6(carNo: string): Double;
    class function getLastBackup7(carNo: string): Double;
    class function getLastBackup8(carNo: string): Double;
    class function getLastBackup9(carNo: string): Double;
    class function getLastBackup15(carNo: string): Double;
    class function getLastBackup16(carNo: string): Double;
    class function getLastBackup17(carNo: string): Double;
    class function getLastBackup18(carNo: string): Double;



  end;

implementation

uses QueryDM;

{ TPayUtil }

class function TPayUtil.charge(shouHuo, p: string): Boolean;
var sum, credit: string;
begin
  if shouHuo = '' then
  begin
    Result := True;
    Exit;
  end;
  QueryDataModule.DBConnection.BeginTrans;
  try
    with QueryDataModule.ADOQExec do
    begin
      Close;
      SQL.Text := 'select * from �ջ���λ where �ջ���λ = :shouHuo';
      Parameters.ParamByName('shouHuo').Value := shouHuo;
      Open;
      if RecordCount > 0 then
      begin
        sum := FieldByName('��ǰ���').AsString;
        credit := FieldByName('���ö��').AsString;
        if sum = '' then
        begin
          SQL.Text := 'update �ջ���λ set ��ǰ���=0 where �ջ���λ = :shouHuo';
          Parameters.ParamByName('shouHuo').Value := shouHuo;
          ExecSQL;
        end;
        if credit = '' then
        begin
          SQL.Text := 'update �ջ���λ set ���ö��=0 where �ջ���λ = :shouHuo';
          Parameters.ParamByName('shouHuo').Value := shouHuo;
          ExecSQL;
        end;
        SQL.Text := 'update �ջ���λ set ��ǰ���=��ǰ���+:sum where �ջ���λ=:shouHuo';
        Parameters.ParamByName('sum').Value := StrToFloatDef(p, 0);
        Parameters.ParamByName('shouHuo').Value := shouHuo;
        ExecSQL;
        //д���ֵ��ʷ
        SQL.Text := 'insert into tbl_pay_history(shouHuo,updateTime,price) '
          + 'values(:shouHuo,:update_time,:price)';
        Parameters.ParamByName('shouHuo').Value := shouHuo;
        Parameters.ParamByName('update_time').Value := Now;
        Parameters.ParamByName('price').Value := StrToFloatDef(p, 0);
        ExecSQL;
        Result := True;
      end
      else
      begin
        Result := False;
      end;
    end;
    QueryDataModule.DBConnection.CommitTrans;
  except
    QueryDataModule.DBConnection.RollbackTrans;
    Result := False;
  end;
end;

class function TPayUtil.getLastBackup15(carNo: string): Double;
var adoq: TADOQuery;
begin
  Result := 0;
  adoq := TADOQuery.Create(nil);
  try
    adoq.Connection := QueryDataModule.DBConnection;
    with adoq do
    begin
      Close;
      SQL.Text := 'select top 1 ����15 from ������Ϣ where (����=:carNo) and (����<>0) order by ��� desc';  
      Parameters.ParamByName('carNo').Value := carNo;
      Open;
      if not IsEmpty then
      begin
        Result := FieldByName('����15').AsFloat;
      end;
    end;
  finally
    adoq.Free;
  end;
end;

class function TPayUtil.getLastBackup16(carNo: string): Double;
var adoq: TADOQuery;
begin       
  Result := 0;
  adoq := TADOQuery.Create(nil);
  try
    adoq.Connection := QueryDataModule.DBConnection;
    with adoq do
    begin
      Close;
      SQL.Text := 'select top 1 ����16 from ������Ϣ where (����=:carNo) and (����<>0) order by ��� desc';
      Parameters.ParamByName('carNo').Value := carNo;
      Open;
      if not IsEmpty then
      begin
        Result := FieldByName('����16').AsFloat;
      end;
    end;
  finally
    adoq.Free;
  end;
end;

class function TPayUtil.getLastBackup17(carNo: string): Double;
var adoq: TADOQuery;
begin     
  Result := 0;
  adoq := TADOQuery.Create(nil);
  try
    adoq.Connection := QueryDataModule.DBConnection;
    with adoq do
    begin
      Close;
      SQL.Text := 'select top 1 ����17 from ������Ϣ where (����=:carNo) and (����<>0) order by ��� desc'; 
      Parameters.ParamByName('carNo').Value := carNo;
      Open;
      if not IsEmpty then
      begin
        Result := FieldByName('����17').AsFloat;
      end;
    end;
  finally
    adoq.Free;
  end;
end;

class function TPayUtil.getLastBackup18(carNo: string): Double;
var adoq: TADOQuery;
begin        
  Result := 0;
  adoq := TADOQuery.Create(nil);
  try
    adoq.Connection := QueryDataModule.DBConnection;
    with adoq do
    begin
      Close;
      SQL.Text := 'select Max(����18) from ������Ϣ where (����=:carNo) and (����<>0) order by ��� desc';   
      Parameters.ParamByName('carNo').Value := carNo;
      Open;
      if not IsEmpty then
      begin
        Result := FieldByName('����18').AsFloat;
      end;
    end;
  finally
    adoq.Free;
  end;
end;

class function TPayUtil.getLastBackup6(carNo: string): Double;
var adoq: TADOQuery;
begin        
  Result := 0;
  adoq := TADOQuery.Create(nil);
  try
    adoq.Connection := QueryDataModule.DBConnection;
    with adoq do
    begin
      Close;
      SQL.Text := 'select top 1 ����6 from ������Ϣ where (����=:carNo) and (����<>0) order by ��� desc';   
      Parameters.ParamByName('carNo').Value := carNo;
      Open;
      if not IsEmpty then
      begin
        Result := FieldByName('����6').AsFloat;
      end;
    end;
  finally
    adoq.Free;
  end;
end;

class function TPayUtil.getLastBackup7(carNo: string): Double;
var adoq: TADOQuery;
begin      
  Result := 0;
  adoq := TADOQuery.Create(nil);
  try
    adoq.Connection := QueryDataModule.DBConnection;
    with adoq do
    begin
      Close;
      SQL.Text := 'select top 1 ����7 from ������Ϣ where (����=:carNo) and (����<>0) order by ��� desc'; 
      Parameters.ParamByName('carNo').Value := carNo;
      Open;
      if not IsEmpty then
      begin
        Result := FieldByName('����7').AsFloat;
      end;
    end;
  finally
    adoq.Free;
  end;
end;

class function TPayUtil.getLastBackup8(carNo: string): Double;
var adoq: TADOQuery;
begin           
  Result := 0;
  adoq := TADOQuery.Create(nil);
  try
    adoq.Connection := QueryDataModule.DBConnection;
    with adoq do
    begin
      Close;
      SQL.Text := 'select top 1 ����8 from ������Ϣ where (����=:carNo) and (����<>0) order by ��� desc'; 
      Parameters.ParamByName('carNo').Value := carNo;
      Open;
      if not IsEmpty then
      begin
        Result := FieldByName('����8').AsFloat;
      end;
    end;
  finally
    adoq.Free;
  end;
end;

class function TPayUtil.getLastBackup9(carNo: string): Double;
var adoq: TADOQuery;
begin                 
  Result := 0;
  adoq := TADOQuery.Create(nil);
  try
    adoq.Connection := QueryDataModule.DBConnection;
    with adoq do
    begin
      Close;
      SQL.Text := 'select top 1 ����9 from ������Ϣ where (����=:carNo) and (����<>0) order by ��� desc';
      Parameters.ParamByName('carNo').Value := carNo;
      Open;
      if not IsEmpty then
      begin
        Result := FieldByName('����9').AsFloat;
      end;
    end;
  finally
    adoq.Free;
  end;
end;

class function TPayUtil.getLastNet(carNo: string): Double;
var adoq: TADOQuery;
begin             
  Result := 0;
  adoq := TADOQuery.Create(nil);
  try
    adoq.Connection := QueryDataModule.DBConnection;
    with adoq do
    begin
      Close;
      SQL.Text := 'select top 1 ʵ�� from ������Ϣ where (����=:carNo) and (����<>0) order by ��� desc';  
      Parameters.ParamByName('carNo').Value := carNo;
      Open;
      if not IsEmpty then
      begin
        Result := FieldByName('ʵ��').AsFloat;
      end;
    end;
  finally
    adoq.Free;
  end;
end;

class function TPayUtil.getLastQuanter(carNo: string): Double;
var adoq: TADOQuery;
begin                
  Result := 0;
  adoq := TADOQuery.Create(nil);
  try
    adoq.Connection := QueryDataModule.DBConnection;
    with adoq do
    begin
      Close;
      SQL.Text := 'select top 1 ���� from ������Ϣ where (����=:carNo) and (����<>0) order by ��� desc'; 
      Parameters.ParamByName('carNo').Value := carNo;
      Open;
      if not IsEmpty then
      begin
        Result := FieldByName('����').AsFloat;
      end;
    end;
  finally
    adoq.Free;
  end;
end;

class function TPayUtil.getLastSum(carNo: string): Double;
var adoq: TADOQuery;
begin               
  Result := 0;
  adoq := TADOQuery.Create(nil);
  try
    adoq.Connection := QueryDataModule.DBConnection;
    with adoq do
    begin
      Close;
      SQL.Text := 'select top 1 ��� from ������Ϣ where (����=:carNo) and (����<>0) order by ��� desc';
      Parameters.ParamByName('carNo').Value := carNo;
      Open;
      if not IsEmpty then
      begin
        Result := FieldByName('���').AsFloat;
      end;
    end;
  finally
    adoq.Free;
  end;
end;

class function TPayUtil.getLeft(shouHuo: string): Double;
begin
  if shouHuo = '' then
  begin
    Result := 0;
    Exit;
  end;
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select ��ǰ��� from �ջ���λ where �ջ���λ=:shouHuo';
    Parameters.ParamByName('shouHuo').Value := shouHuo;
    Open;
    if not IsEmpty then
    begin
      Result := FieldByName('��ǰ���').AsFloat;
    end;
  end;
end;

class function TPayUtil.lowCredit(shouHuo: string; sum: Double): Boolean;
begin
  if shouHuo = '' then
  begin
    Result := False;
    Exit;
  end;
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select ��ǰ���,���ö�� from �ջ���λ where �ջ���λ=:shouHuo';
    Parameters.ParamByName('shouHuo').Value := shouHuo;
    Open;
    if not IsEmpty then
    begin
      Result := FieldByName('��ǰ���').AsFloat - sum < FieldByName('���ö��').AsFloat;
    end;
  end;
end;

class function TPayUtil.pay(shouHuo, sum: string): Boolean;
begin
  if shouHuo = '' then
  begin
    Result := True;
    Exit;
  end;
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'update �ջ���λ set ��ǰ��� = ��ǰ��� - :sum where �ջ���λ = :shouHuo';
    Parameters.ParamByName('sum').Value := StrToFloatDef(sum, 0);
    Parameters.ParamByName('shouHuo').Value := shouHuo;
    Result := ExecSQL > 0;

    //д���ֵ��ʷ
    SQL.Text := 'insert into tbl_pay_history(shouHuo,updateTime,price) '
      + 'values(:shouHuo,:update_time,:price)';
    Parameters.ParamByName('shouHuo').Value := shouHuo;
    Parameters.ParamByName('update_time').Value := Now;
    Parameters.ParamByName('price').Value := 0 - StrToFloatDef(sum, 0);
    ExecSQL;
  end;
end;

class function TPayUtil.showCompany: Boolean;
begin
  with QueryDataModule.ADOQPay do
  begin
    Close;
    SQL.Text := 'select * from �ջ���λ';
    Open;
  end;
end;

class function TPayUtil.showHistory: Boolean;
begin
  with QueryDataModule.ADOQPayHistory do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from tbl_pay_history order by id desc');
    Open
  end
end;

class function TPayUtil.showHistory(startDate,
  endDate: TDateTime): Boolean;
begin
  with QueryDataModule.ADOQPayHistory do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from tbl_pay_history '
      + 'where updateTime between :start and :end order by id desc');
    Parameters.ParamByName('start').Value := FormatDateTime('yyyy-MM-dd 00:00:00', startDate);
    Parameters.ParamByName('end').Value := FormatDateTime('yyyy-MM-dd 23:59:59', endDate);
    Open
  end
end;


end.

