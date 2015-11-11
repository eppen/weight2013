unit PrepareUtil;

interface

uses SysUtils, StdCtrls, DB, RzCmboBx, Classes;

type
  //Ԥ�ñ������
  TPrepareUtil = class
  private
  public
    //ѭ����ӷ�����λ,�ջ���λ�����������
    class procedure addCarStrings(sl: TStrings);
    class procedure addCar(cb: TComboBox); overload;
    class procedure addCar(cb: TRzComboBox); overload;
    class procedure addWeightCarStrings(sl: TStrings);
    class procedure addWeightCar(cb: TComboBox); overload;
    class procedure addWeightCar(cb: TRzComboBox); overload;
    class procedure addFaHuoStrings(sl: TStrings);
    class procedure addFaHuo(cb: TComboBox); overload;
    class procedure addFaHuo(cb: TRzComboBox); overload;
    class procedure addShouHuoStrings(sl: TStrings);
    class procedure addShouHuo(cb: TComboBox); overload;
    class procedure addShouHuo(cb: TRzComboBox); overload;
    class procedure addGoodsStrings(sl: TStrings);
    class procedure addGoods(cb: TComboBox); overload;
    class procedure addGoods(cb: TRzComboBox); overload;
    class procedure addSpecStrings(sl: TStrings);
    class procedure addSpec(cb: TComboBox); overload;
    class procedure addSpec(cb: TRzComboBox); overload;
    class procedure addBackup1Strings(sl: TStrings);
    class procedure addBackup1(cb: TComboBox); overload;
    class procedure addBackup1(cb: TRzComboBox); overload;
    class procedure addBackup2Strings(sl: TStrings);
    class procedure addBackup2(cb: TComboBox); overload;
    class procedure addBackup2(cb: TRzComboBox); overload;
    class procedure addBackup3Strings(sl: TStrings);
    class procedure addBackup3(cb: TComboBox); overload;
    class procedure addBackup3(cb: TRzComboBox); overload;
    class procedure addBackup4Strings(sl: TStrings);
    class procedure addBackup4(cb: TComboBox); overload;
    class procedure addBackup4(cb: TRzComboBox); overload;
    class procedure addBackup5Strings(sl: TStrings);
    class procedure addBackup5(cb: TComboBox); overload;
    class procedure addBackup5(cb: TRzComboBox); overload;
    class procedure addBackup10Strings(sl: TStrings);
    class procedure addBackup10(cb: TComboBox); overload;
    class procedure addBackup10(cb: TRzComboBox); overload;
    class procedure addBackup11Strings(sl: TStrings);
    class procedure addBackup11(cb: TComboBox); overload;
    class procedure addBackup11(cb: TRzComboBox); overload;
    class procedure addBackup12Strings(sl: TStrings);
    class procedure addBackup12(cb: TComboBox); overload;
    class procedure addBackup12(cb: TRzComboBox); overload;
    class procedure addBackup13Strings(sl: TStrings);
    class procedure addBackup13(cb: TComboBox); overload;
    class procedure addBackup13(cb: TRzComboBox); overload;
    class procedure addBackup14Strings(sl: TStrings);
    class procedure addBackup14(cb: TComboBox); overload;
    class procedure addBackup14(cb: TRzComboBox); overload;
    //������һ�κ�ĳ��ţ�������������λ���ջ���λд��Ԥ�ñ�
    class procedure prepareInfo(Car, faHuo, shouHuo, goods, spec: string);
    class procedure prepareBackupInfo(backup1, backup2, backup3, backup4, backup5: string);
    class procedure prepareBackupInfo2(backup10, backup11, backup12, backup13, backup14: string);
    //��ȡ�������������(����)����
    class function getCarCheat(carNo: string): Double;
    class function getCarTare(carNo: string): Double;
    class function updateCarTare(carNo, tare: string): Boolean; //���³�����Ԥ��Ƥ��
    class function getBaseInfoByCode(field: string; code: string): string;
    class function getFaHuoByCode(code: string): string; //���ݴ���ȡ������λ
    class function getShouHuoByCode(code: string): string; //���ݴ���ȡ�ջ���λ
    class function getGoodsByCode(code: string): string; //���ݴ���ȡ����
    class function getSpecByCode(code: string): string; //���ݴ���ȡ���
    class function getBackup1ByCode(code: string): string; //���ݴ���ȡ����1
    class function getBackup2ByCode(code: string): string; //���ݴ���ȡ����2
    class function getBackup3ByCode(code: string): string; //���ݴ���ȡ����3
    class function getBackup4ByCode(code: string): string; //���ݴ���ȡ����4
    class function getBackup5ByCode(code: string): string; //���ݴ���ȡ����5
    class function getBackup10ByCode(code: string): string; //���ݴ���ȡ����10
    class function getBackup11ByCode(code: string): string; //���ݴ���ȡ����11
    class function getBackup12ByCode(code: string): string; //���ݴ���ȡ����12
    class function getBackup13ByCode(code: string): string; //���ݴ���ȡ����13
    class function getBackup14ByCode(code: string): string; //���ݴ���ȡ����14
    class function getGoodsInfo(goods: string; var price: Double; var scale: Double): Boolean; //���ݻ���ȡ���ۺ��۷�ϵ��

    class function getGoodsId(goods: string): Integer;

    class function searchCarNo(search: string): Boolean;
    class function searchFaHuo(search: string): Boolean;
    class function searchShouHuo(search: string): Boolean;
    class function searchGoods(search: string): Boolean;
    class function searchSpec(search: string): Boolean;
    class function searchBackup1(search: string): Boolean;
    class function searchBackup2(search: string): Boolean;
    class function searchBackup3(search: string): Boolean;
    class function searchBackup4(search: string): Boolean;
    class function searchBackup5(search: string): Boolean;
    class function searchBackup10(search: string): Boolean;
    class function searchBackup11(search: string): Boolean;
    class function searchBackup12(search: string): Boolean;
    class function searchBackup13(search: string): Boolean;
    class function searchBackup14(search: string): Boolean;

    class function getGoodsCode(goods: string): string;
    class function getShouHuoCode(shouHuo: string): string;

    class function importCar(strCar: string): Boolean;
    class function importFaHuo(strFaHuo: string): Boolean;
    class function importShouHuo(strShouHuo: string): Boolean;
    class function importGoods(strGoods: string): Boolean;
    class function importSpec(strSpec: string): Boolean;
    class function importBackup1(strBackup: string): Boolean;
    class function importBackup2(strBackup: string): Boolean;
    class function importBackup3(strBackup: string): Boolean;
    class function importBackup4(strBackup: string): Boolean;
    class function importBackup5(strBackup: string): Boolean;
    class function importBackup10(strBackup: string): Boolean;
    class function importBackup11(strBackup: string): Boolean;
    class function importBackup12(strBackup: string): Boolean;
    class function importBackup13(strBackup: string): Boolean;
    class function importBackup14(strBackup: string): Boolean;

    class function lookupCarNo(carNo: string): Boolean;
    class function getCarByFilter(code: string): string;
    class function getBaseInfoByFilter(field: string; code: string): string;
  end;

implementation

uses
  QueryDM, Main, Forms, BaseInfoSel, Consts, Controls;

{ TPrepareUtil }

class procedure TPrepareUtil.addBackup1(cb: TComboBox);
begin
  addBackup1Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup1(cb: TRzComboBox);
begin
  addBackup1Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup10(cb: TComboBox);
begin
  addBackup10Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup10(cb: TRzComboBox);
begin
  addBackup10Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup10Strings(sl: TStrings);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select ����10 from ����10 order by ����10');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('����10').AsString <> '' then
          sl.Add(FieldByName('����10').AsString);
        Next
      end
    end
  end;
end;

class procedure TPrepareUtil.addBackup11(cb: TRzComboBox);
begin
  addBackup11Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup11(cb: TComboBox);
begin
  addBackup11Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup11Strings(sl: TStrings);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select ����11 from ����11 order by ����11');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('����11').AsString <> '' then
          sl.Add(FieldByName('����11').AsString);
        Next
      end
    end
  end;
end;

class procedure TPrepareUtil.addBackup12(cb: TComboBox);
begin
  addBackup12Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup12(cb: TRzComboBox);
begin
  addBackup12Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup12Strings(sl: TStrings);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select ����12 from ����12 order by ����12');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('����12').AsString <> '' then
          sl.Add(FieldByName('����12').AsString);
        Next
      end
    end
  end;
end;

class procedure TPrepareUtil.addBackup13(cb: TComboBox);
begin
  addBackup13Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup13(cb: TRzComboBox);
begin
  addBackup13Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup13Strings(sl: TStrings);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select ����13 from ����13 order by ����13');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('����13').AsString <> '' then
          sl.Add(FieldByName('����13').AsString);
        Next
      end
    end
  end;
end;

class procedure TPrepareUtil.addBackup14(cb: TRzComboBox);
begin
  addBackup14Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup14(cb: TComboBox);
begin
  addBackup14Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup14Strings(sl: TStrings);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select ����14 from ����14 order by ����14');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('����14').AsString <> '' then
          sl.Add(FieldByName('����14').AsString);
        Next
      end
    end
  end;
end;

class procedure TPrepareUtil.addBackup1Strings(sl: TStrings);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select ����1 from ����1 order by ����1');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('����1').AsString <> '' then
          sl.Add(FieldByName('����1').AsString);
        Next
      end
    end
  end;
end;

class procedure TPrepareUtil.addBackup2(cb: TComboBox);
begin
  addBackup2Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup2(cb: TRzComboBox);
begin
  addBackup2Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup2Strings(sl: TStrings);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select ����2 from ����2 order by ����2');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('����2').AsString <> '' then
          sl.Add(FieldByName('����2').AsString);
        Next
      end
    end
  end;
end;

class procedure TPrepareUtil.addBackup3(cb: TComboBox);
begin
  addBackup3Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup3(cb: TRzComboBox);
begin
  addBackup3Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup3Strings(sl: TStrings);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select ����3 from ����3 order by ����3');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('����3').AsString <> '' then
          sl.Add(FieldByName('����3').AsString);
        Next
      end
    end
  end;
end;

class procedure TPrepareUtil.addBackup4(cb: TRzComboBox);
begin
  addBackup4Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup4(cb: TComboBox);
begin
  addBackup4Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup4Strings(sl: TStrings);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select ����4 from ����4 order by ����4');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('����4').AsString <> '' then
          sl.Add(FieldByName('����4').AsString);
        Next
      end
    end
  end;
end;

class procedure TPrepareUtil.addBackup5(cb: TRzComboBox);
begin
  addBackup5Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup5(cb: TComboBox);
begin
  addBackup5Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup5Strings(sl: TStrings);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select ����5 from ����5 order by ����5');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('����5').AsString <> '' then
          sl.Add(FieldByName('����5').AsString);
        Next
      end
    end
  end;
end;

class procedure TPrepareUtil.addCar(cb: TComboBox);
begin
  addCarStrings(cb.Items);
end;

class procedure TPrepareUtil.addCar(cb: TRzComboBox);
begin
  addCarStrings(cb.Items);
end;

class procedure TPrepareUtil.addCarStrings(sl: TStrings);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;

    sl.Clear;

    SQL.Text := 'select ���� from ������Ϣ where ����=0 order by ���';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        sl.Add(FieldByName('����').AsString);
        Next;
      end;
    end;

    SQL.Clear;
    if MainForm.systemConfig.useLast100CarNo then
      SQL.Add('SELECT DISTINCT TOP 100 ���� FROM ('
        + 'SELECT TOP 100 * FROM ������Ϣ ORDER BY ��� DESC) AS A')
    else
      SQL.Add('Select ���� from ���� order by ����');
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        if FieldByName('����').AsString <> '' then
          sl.Add(FieldByName('����').AsString);
        Next
      end
    end
  end;
end;

class procedure TPrepareUtil.addFaHuo(cb: TComboBox);
begin
  addFaHuoStrings(cb.Items);
end;

class procedure TPrepareUtil.addFaHuo(cb: TRzComboBox);
begin
  addFaHuoStrings(cb.Items);
end;

class procedure TPrepareUtil.addFaHuoStrings(sl: TStrings);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select ������λ from ������λ order by ������λ');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('������λ').AsString <> '' then
          sl.Add(FieldByName('������λ').AsString);
        Next
      end
    end
  end
end;

class procedure TPrepareUtil.addGoods(cb: TComboBox);
begin
  addGoodsStrings(cb.Items);
end;

class procedure TPrepareUtil.addGoods(cb: TRzComboBox);
begin
  addGoodsStrings(cb.Items);
end;

class procedure TPrepareUtil.addGoodsStrings(sl: TStrings);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select ���� from ���� order by ����');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('����').AsString <> '' then
          sl.Add(FieldByName('����').AsString);
        Next
      end
    end
  end
end;

class procedure TPrepareUtil.addShouHuo(cb: TRzComboBox);
begin
  addShouHuoStrings(cb.Items);
end;

class procedure TPrepareUtil.addShouHuo(cb: TComboBox);
begin
  addShouHuoStrings(cb.Items);
end;

class procedure TPrepareUtil.addShouHuoStrings(sl: TStrings);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select �ջ���λ from �ջ���λ order by �ջ���λ');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('�ջ���λ').AsString <> '' then
          sl.Add(FieldByName('�ջ���λ').AsString);
        Next
      end
    end
  end
end;

class procedure TPrepareUtil.addSpec(cb: TComboBox);
begin
  addSpecStrings(cb.Items);
end;

class procedure TPrepareUtil.addSpec(cb: TRzComboBox);
begin
  addSpecStrings(cb.Items);
end;

class procedure TPrepareUtil.addSpecStrings(sl: TStrings);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select distinct ��� from ���');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('���').AsString <> '' then
          sl.Add(FieldByName('���').AsString);
        Next
      end
    end
  end
end;

class procedure TPrepareUtil.addWeightCar(cb: TComboBox);
begin
  addWeightCarStrings(cb.Items);
end;

class procedure TPrepareUtil.addWeightCar(cb: TRzComboBox);
begin
  addWeightCarStrings(cb.Items);
end;

class procedure TPrepareUtil.addWeightCarStrings(sl: TStrings);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select distinct ���� from ������Ϣ order by ����');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('����').AsString <> '' then
          sl.Add(FieldByName('����').AsString);
        Next
      end
    end
  end;
end;

class function TPrepareUtil.getBackup10ByCode(code: string): string;
begin
  if MainForm.systemConfig.useFilterForm then
    Result := getBaseInfoByFilter('����10', code)
  else
    Result := getBaseInfoByCode('����10', code);
end;

class function TPrepareUtil.getBackup11ByCode(code: string): string;
begin
  if MainForm.systemConfig.useFilterForm then
    Result := getBaseInfoByFilter('����11', code)
  else
    Result := getBaseInfoByCode('����11', code);
end;

class function TPrepareUtil.getBackup12ByCode(code: string): string;
begin
  if MainForm.systemConfig.useFilterForm then
    Result := getBaseInfoByFilter('����12', code)
  else
    Result := getBaseInfoByCode('����12', code);
end;

class function TPrepareUtil.getBackup13ByCode(code: string): string;
begin
  if MainForm.systemConfig.useFilterForm then
    Result := getBaseInfoByFilter('����13', code)
  else
    Result := getBaseInfoByCode('����13', code);
end;

class function TPrepareUtil.getBackup14ByCode(code: string): string;
begin
  if MainForm.systemConfig.useFilterForm then
    Result := getBaseInfoByFilter('����14', code)
  else
    Result := getBaseInfoByCode('����14', code);
end;

class function TPrepareUtil.getBackup1ByCode(code: string): string;
begin
  if MainForm.systemConfig.useFilterForm then
    Result := getBaseInfoByFilter('����1', code)
  else
    Result := getBaseInfoByCode('����1', code);
end;

class function TPrepareUtil.getBackup2ByCode(code: string): string;
begin
  if MainForm.systemConfig.useFilterForm then
    Result := getBaseInfoByFilter('����2', code)
  else
    Result := getBaseInfoByCode('����2', code);
end;

class function TPrepareUtil.getBackup3ByCode(code: string): string;
begin
  if MainForm.systemConfig.useFilterForm then
    Result := getBaseInfoByFilter('����3', code)
  else
    Result := getBaseInfoByCode('����3', code);
end;

class function TPrepareUtil.getBackup4ByCode(code: string): string;
begin
  if MainForm.systemConfig.useFilterForm then
    Result := getBaseInfoByFilter('����4', code)
  else
    Result := getBaseInfoByCode('����4', code);
end;

class function TPrepareUtil.getBackup5ByCode(code: string): string;
begin
  if MainForm.systemConfig.useFilterForm then
    Result := getBaseInfoByFilter('����5', code)
  else
    Result := getBaseInfoByCode('����5', code);
end;

class function TPrepareUtil.getBaseInfoByCode(field, code: string): string;
begin
  if code = '' then
    Exit;
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select ' + field + ' from ' + field + ' where ����=:code';
    Parameters.ParamByName('code').Value := code;
    Open;
    if not IsEmpty then
    begin
      Result := FieldByName(field).AsString;
    end
    else
    begin
      Result := code;
    end;
  end;
end;

class function TPrepareUtil.getBaseInfoByFilter(field,
  code: string): string;
begin
  if code = '' then
    Exit;
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select ' + field + ' from ' + field + ' where ���� like :code';
    Parameters.ParamByName('code').Value := '%' + code + '%';
    Open;
    if not IsEmpty then
    begin
      if RecordCount = 1 then
      begin
        Result := FieldByName(field).AsString;
      end
      else
      begin
        Application.CreateForm(TBaseInfoSelForm, BaseInfoSelForm);
        try
          First;
          BaseInfoSelForm.LBBaseInfo.Items.Clear;
          while not eof do
          begin
            BaseInfoSelForm.LBBaseInfo.Items.Add(FieldByName(field).AsString);
            Next;
          end;
          BaseInfoSelForm.LBBaseInfo.ItemIndex := 0;
          BaseInfoSelForm.ShowModal;
          if BaseInfoSelForm.ModalResult = mrOK then
          begin
            if BaseInfoSelForm.LBBaseInfo.ItemIndex <> -1 then
              Result := BaseInfoSelForm.LBBaseInfo.Items[BaseInfoSelForm.LBBaseInfo.ItemIndex]
            else
              Result := code;
          end
          else
          begin
            Result := code;
          end;
        finally
          BaseInfoSelForm.Free;
        end;
      end;
    end
    else
    begin
      Result := code;
    end;
  end;
end;

class function TPrepareUtil.getCarByFilter(code: string): string;
begin
  if code = '' then
    Exit;
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select ���� from ���� where ���� like :code';
    Parameters.ParamByName('code').Value := '%' + code + '%';
    Open;
    if not IsEmpty then
    begin
      if RecordCount = 1 then
      begin
        Result := FieldByName('����').AsString;
      end
      else
      begin
        Application.CreateForm(TBaseInfoSelForm, BaseInfoSelForm);
        try
          First;
          BaseInfoSelForm.LBBaseInfo.Items.Clear;
          while not eof do
          begin
            BaseInfoSelForm.LBBaseInfo.Items.Add(FieldByName('����').AsString);
            Next;
          end;
          BaseInfoSelForm.LBBaseInfo.ItemIndex := 0;
          BaseInfoSelForm.ShowModal;
          if BaseInfoSelForm.ModalResult = mrOK then
          begin
            if BaseInfoSelForm.LBBaseInfo.ItemIndex <> -1 then
              Result := BaseInfoSelForm.LBBaseInfo.Items[BaseInfoSelForm.LBBaseInfo.ItemIndex]
            else
              Result := code;
          end
          else
          begin
            Result := code;
          end;
        finally
          BaseInfoSelForm.Free;
        end;
      end;
    end
    else
    begin
      Result := code;
    end;
  end;
end;

class function TPrepareUtil.getCarCheat(carNo: string): Double;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select ���� from ���� where ����=:car';
    Parameters.ParamByName('car').Value := carNo;
    Open;
    if not IsEmpty then
    begin
      Result := StrToFloatDef(FieldByName('����').AsString, 0);
    end
    else
    begin
      Result := 0;
    end;
  end;
end;

class function TPrepareUtil.getCarTare(carNo: string): Double;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select Ƥ�� from ���� where ����=:car';
    //SQL.Text := 'select top 1 Ƥ�� from ������Ϣ where (����=:car) and (����<>0) order by ��� desc';
    Parameters.ParamByName('car').Value := carNo;
    Open;
    if not IsEmpty then
    begin
      Result := StrToFloatDef(FieldByName('Ƥ��').AsString, 0);
    end
    else
    begin
      Result := 0;
    end;
  end;
end;

class function TPrepareUtil.getFaHuoByCode(code: string): string;
begin
  if MainForm.systemConfig.useFilterForm then
    Result := getBaseInfoByFilter('������λ', code)
  else
    Result := getBaseInfoByCode('������λ', code);
end;

class function TPrepareUtil.getGoodsByCode(code: string): string;
begin
  if MainForm.systemConfig.useFilterForm then
    Result := getBaseInfoByFilter('����', code)
  else
    Result := getBaseInfoByCode('����', code);
end;

class function TPrepareUtil.getGoodsCode(goods: string): string;
begin
  with QueryDataModule.ADOQExec2 do
  begin
    Close;
    SQL.Text := 'select ���� from ���� where ����=:goods';
    Parameters.ParamByName('goods').Value := goods;
    Open;
    if not IsEmpty then
    begin
      Result := FieldByName('����').AsString;
    end
    else
    begin
      Result := '00';
    end;
  end;
end;

class function TPrepareUtil.getGoodsId(goods: string): Integer;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select ��� from ���� where ����=:goods';
    Parameters.ParamByName('goods').Value := goods;
    Open;
    if not IsEmpty then
      Result := FieldByName('���').AsInteger;
  end;
end;

class function TPrepareUtil.getGoodsInfo(goods: string; var price,
  scale: Double): Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select * from ���� where ����=:goods';
    Parameters.ParamByName('goods').Value := goods;
    Open;
    if not IsEmpty then
    begin
      price := FieldByName('����').AsFloat;
      scale := FieldByName('�۷�ϵ��').AsFloat;
    end;
  end;
end;

class function TPrepareUtil.getShouHuoByCode(code: string): string;
begin
  if MainForm.systemConfig.useFilterForm then
    Result := getBaseInfoByFilter('�ջ���λ', code)
  else
    Result := getBaseInfoByCode('�ջ���λ', code);
end;

class function TPrepareUtil.getShouHuoCode(shouHuo: string): string;
begin
  with QueryDataModule.ADOQExec2 do
  begin
    Close;
    SQL.Text := 'select ���� from �ջ���λ where �ջ���λ=:shouHuo';
    Parameters.ParamByName('shouHuo').Value := shouHuo;
    Open;
    if not IsEmpty then
    begin
      Result := FieldByName('����').AsString;
    end
    else
    begin
      Result := '00';
    end;
  end;
end;

class function TPrepareUtil.getSpecByCode(code: string): string;
begin
  if MainForm.systemConfig.useFilterForm then
    Result := getBaseInfoByFilter('���', code)
  else
    Result := getBaseInfoByCode('���', code);
end;

class function TPrepareUtil.importBackup1(strBackup: string): Boolean;
var sr: TStringList;
begin
  sr := TStringList.Create;
  try
    if ExtractStrings([',', #9], [], PChar(strBackup), sr) > 0 then
    begin
      with QueryDataModule.ADOQExec do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select ����1 from ����1 where ����1=:backup1');
        Parameters.ParamByName('backup1').Value := sr.Strings[1];
        Open;
        if RecordCount = 0 then
        begin
          Close;
          SQL.Clear;
          SQL.Add('insert into ����1(����,����1) values(:code,:backup1)');
          Parameters.ParamByName('code').Value := sr.Strings[0];
          Parameters.ParamByName('backup1').Value := sr.Strings[1];
          ExecSQL;
        end
      end;
    end;
  finally
    sr.Free;
  end;
end;

class function TPrepareUtil.importBackup10(strBackup: string): Boolean;
var sr: TStringList;
begin
  sr := TStringList.Create;
  try
    if ExtractStrings([',', #9], [], PChar(strBackup), sr) > 0 then
    begin
      with QueryDataModule.ADOQExec do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select ����10 from ����10 where ����10=:backup1');
        Parameters.ParamByName('backup1').Value := sr.Strings[1];
        Open;
        if RecordCount = 0 then
        begin
          Close;
          SQL.Clear;
          SQL.Add('insert into ����10(����,����10) values(:code,:backup1)');
          Parameters.ParamByName('code').Value := sr.Strings[0];
          Parameters.ParamByName('backup1').Value := sr.Strings[1];
          ExecSQL;
        end
      end;
    end;
  finally
    sr.Free;
  end;
end;

class function TPrepareUtil.importBackup11(strBackup: string): Boolean;
var sr: TStringList;
begin
  sr := TStringList.Create;
  try
    if ExtractStrings([',', #9], [], PChar(strBackup), sr) > 0 then
    begin
      with QueryDataModule.ADOQExec do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select ����11 from ����11 where ����11=:backup1');
        Parameters.ParamByName('backup1').Value := sr.Strings[1];
        Open;
        if RecordCount = 0 then
        begin
          Close;
          SQL.Clear;
          SQL.Add('insert into ����11(����,����11) values(:code,:backup1)');
          Parameters.ParamByName('code').Value := sr.Strings[0];
          Parameters.ParamByName('backup1').Value := sr.Strings[1];
          ExecSQL;
        end
      end;
    end;
  finally
    sr.Free;
  end;
end;

class function TPrepareUtil.importBackup12(strBackup: string): Boolean;
var sr: TStringList;
begin
  sr := TStringList.Create;
  try
    if ExtractStrings([',', #9], [], PChar(strBackup), sr) > 0 then
    begin
      with QueryDataModule.ADOQExec do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select ����12 from ����12 where ����12=:backup1');
        Parameters.ParamByName('backup1').Value := sr.Strings[1];
        Open;
        if RecordCount = 0 then
        begin
          Close;
          SQL.Clear;
          SQL.Add('insert into ����12(����,����12) values(:code,:backup1)');
          Parameters.ParamByName('code').Value := sr.Strings[0];
          Parameters.ParamByName('backup1').Value := sr.Strings[1];
          ExecSQL;
        end
      end;
    end;
  finally
    sr.Free;
  end;
end;

class function TPrepareUtil.importBackup13(strBackup: string): Boolean;
var sr: TStringList;
begin
  sr := TStringList.Create;
  try
    if ExtractStrings([',', #9], [], PChar(strBackup), sr) > 0 then
    begin
      with QueryDataModule.ADOQExec do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select ����13 from ����13 where ����13=:backup1');
        Parameters.ParamByName('backup1').Value := sr.Strings[1];
        Open;
        if RecordCount = 0 then
        begin
          Close;
          SQL.Clear;
          SQL.Add('insert into ����13(����,����13) values(:code,:backup1)');
          Parameters.ParamByName('code').Value := sr.Strings[0];
          Parameters.ParamByName('backup1').Value := sr.Strings[1];
          ExecSQL;
        end
      end;
    end;
  finally
    sr.Free;
  end;
end;

class function TPrepareUtil.importBackup14(strBackup: string): Boolean;
var sr: TStringList;
begin
  sr := TStringList.Create;
  try
    if ExtractStrings([',', #9], [], PChar(strBackup), sr) > 0 then
    begin
      with QueryDataModule.ADOQExec do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select ����14 from ����14 where ����14=:backup1');
        Parameters.ParamByName('backup1').Value := sr.Strings[1];
        Open;
        if RecordCount = 0 then
        begin
          Close;
          SQL.Clear;
          SQL.Add('insert into ����14(����,����14) values(:code,:backup1)');
          Parameters.ParamByName('code').Value := sr.Strings[0];
          Parameters.ParamByName('backup1').Value := sr.Strings[1];
          ExecSQL;
        end
      end;
    end;
  finally
    sr.Free;
  end;
end;

class function TPrepareUtil.importBackup2(strBackup: string): Boolean;
var sr: TStringList;
begin
  sr := TStringList.Create;
  try
    if ExtractStrings([',', #9], [], PChar(strBackup), sr) > 0 then
    begin
      with QueryDataModule.ADOQExec do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select ����2 from ����2 where ����2=:backup2');
        Parameters.ParamByName('backup2').Value := sr.Strings[1];
        Open;
        if RecordCount = 0 then
        begin
          Close;
          SQL.Clear;
          SQL.Add('insert into ����2(����,����2) values(:code,:backup2)');
          Parameters.ParamByName('code').Value := sr.Strings[0];
          Parameters.ParamByName('backup2').Value := sr.Strings[1];
          ExecSQL;
        end
      end;
    end;
  finally
    sr.Free;
  end;
end;

class function TPrepareUtil.importBackup3(strBackup: string): Boolean;
var sr: TStringList;
begin
  sr := TStringList.Create;
  try
    if ExtractStrings([',', #9], [], PChar(strBackup), sr) > 0 then
    begin
      with QueryDataModule.ADOQExec do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select ����3 from ����3 where ����3=:backup3');
        Parameters.ParamByName('backup3').Value := sr.Strings[1];
        Open;
        if RecordCount = 0 then
        begin
          Close;
          SQL.Clear;
          SQL.Add('insert into ����3(����,����3) values(:code,:backup3)');
          Parameters.ParamByName('code').Value := sr.Strings[0];
          Parameters.ParamByName('backup3').Value := sr.Strings[1];
          ExecSQL;
        end
      end;
    end;
  finally
    sr.Free;
  end;
end;

class function TPrepareUtil.importBackup4(strBackup: string): Boolean;
var sr: TStringList;
begin
  sr := TStringList.Create;
  try
    if ExtractStrings([',', #9], [], PChar(strBackup), sr) > 0 then
    begin
      with QueryDataModule.ADOQExec do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select ����4 from ����4 where ����4=:backup4');
        Parameters.ParamByName('backup4').Value := sr.Strings[1];
        Open;
        if RecordCount = 0 then
        begin
          SQL.Clear;
          SQL.Add('insert into ����4(����,����4) values(:code,:backup4)');
          Parameters.ParamByName('code').Value := sr.Strings[0];
          Parameters.ParamByName('backup4').Value := sr.Strings[1];
          ExecSQL;
        end
      end;
    end;
  finally
    sr.Free;
  end;
end;

class function TPrepareUtil.importBackup5(strBackup: string): Boolean;
var sr: TStringList;
begin
  sr := TStringList.Create;
  try
    if ExtractStrings([',', #9], [], PChar(strBackup), sr) > 0 then
    begin
      with QueryDataModule.ADOQExec do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select ����5 from ����5 where ����5=:backup5');
        Parameters.ParamByName('backup5').Value := sr.Strings[1];
        Open;
        if RecordCount = 0 then
        begin
          SQL.Clear;
          SQL.Add('insert into ����5(����,����5) values(:code,:backup5)');
          Parameters.ParamByName('code').Value := sr.Strings[0];
          Parameters.ParamByName('backup5').Value := sr.Strings[1];
          ExecSQL;
        end
      end;
    end;
  finally
    sr.Free;
  end;
end;

class function TPrepareUtil.importCar(strCar: string): Boolean;
var sr: TStringList;
begin
  sr := TStringList.Create;
  try
    if ExtractStrings([',', #9], [], PChar(strCar), sr) > 0 then
    begin
      updateCarTare(sr.Strings[0], sr.Strings[1]);
    end
    else
    begin
      updateCarTare(sr.Strings[0], '0');
    end;
  finally
    sr.Free;
  end;
end;

class function TPrepareUtil.importFaHuo(strFaHuo: string): Boolean;
var sr: TStringList;
begin
  sr := TStringList.Create;
  try
    if ExtractStrings([',', #9], [], PChar(strFaHuo), sr) > 0 then
    begin
      with QueryDataModule.ADOQExec do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select ������λ from ������λ where ������λ=:faHuo');
        Parameters.ParamByName('faHuo').Value := sr.Strings[1];
        Open;
        if RecordCount = 0 then
        begin
          SQL.Clear;
          SQL.Add('insert into ������λ(����,������λ) values(:code,:faHuo)');
          Parameters.ParamByName('code').Value := sr.Strings[0];
          Parameters.ParamByName('faHuo').Value := sr.Strings[1];
          ExecSQL;
        end
      end;
    end;
  finally
    sr.Free;
  end;
end;

class function TPrepareUtil.importGoods(strGoods: string): Boolean;
var sr: TStringList;
begin
  sr := TStringList.Create;
  try
    if ExtractStrings([',', #9], [], PChar(strGoods), sr) > 0 then
    begin
      with QueryDataModule.ADOQExec do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select ���� from ���� where ����=:goods');
        Parameters.ParamByName('goods').Value := sr.Strings[1];
        Open;
        if RecordCount = 0 then
        begin
          SQL.Clear;
          SQL.Add('insert into ����(����,����) values(:code,:goods)');
          Parameters.ParamByName('code').Value := sr.Strings[0];
          Parameters.ParamByName('goods').Value := sr.Strings[1];
          ExecSQL;
        end
      end;
    end;
  finally
    sr.Free;
  end;
end;

class function TPrepareUtil.importShouHuo(strShouHuo: string): Boolean;
var sr: TStringList;
begin
  sr := TStringList.Create;
  try
    if ExtractStrings([',', #9], [], PChar(strShouHuo), sr) > 0 then
    begin
      with QueryDataModule.ADOQExec do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select �ջ���λ from �ջ���λ where �ջ���λ=:shouHuo');
        Parameters.ParamByName('shouHuo').Value := sr.Strings[1];
        Open;
        if RecordCount = 0 then
        begin
          SQL.Clear;
          SQL.Add('insert into �ջ���λ(����,�ջ���λ) values(:code,:shouHuo)');
          Parameters.ParamByName('code').Value := sr.Strings[0];
          Parameters.ParamByName('shouHuo').Value := sr.Strings[1];
          ExecSQL;
        end
      end;
    end;
  finally
    sr.Free;
  end;
end;

class function TPrepareUtil.importSpec(strSpec: string): Boolean;
var sr: TStringList;
begin
  sr := TStringList.Create;
  try
    if ExtractStrings([',', #9], [], PChar(strSpec), sr) > 0 then
    begin
      with QueryDataModule.ADOQExec do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select ��� from ��� where ���=:spec');
        Parameters.ParamByName('spec').Value := sr.Strings[1];
        Open;
        if RecordCount = 0 then
        begin
          SQL.Clear;
          SQL.Add('insert into ���(����,���) values(:code,:spec)');
          Parameters.ParamByName('code').Value := sr.Strings[0];
          Parameters.ParamByName('spec').Value := sr.Strings[1];
          ExecSQL;
        end
      end;
    end;
  finally
    sr.Free;
  end;
end;

class function TPrepareUtil.lookupCarNo(carNo: string): Boolean;
begin
  with QueryDataModule.ADOQCarFilter do
  begin
    Close;
    SQL.Text := 'select ���� from ���� where ���� like :carNo';
    Parameters.ParamByName('carNo').Value := '%' + carNo + '%';
    Open;
  end;
end;

class procedure TPrepareUtil.prepareBackupInfo(backup1, backup2, backup3,
  backup4, backup5: string);
begin
  with QueryDataModule.ADOQExec do
  begin
    if backup1 <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select ����1 from ����1 where ����1=:backup1');
      Parameters.ParamByName('backup1').Value := backup1;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into ����1(����1) values(:backup1)');
        Parameters.ParamByName('backup1').Value := backup1;
        ExecSQL
      end
    end;
    if backup2 <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select ����2 from ����2 where ����2=:backup2');
      Parameters.ParamByName('backup2').Value := backup2;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into ����2(����2) values(:backup2)');
        Parameters.ParamByName('backup2').Value := backup2;
        ExecSQL
      end
    end;
    if backup3 <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select ����3 from ����3 where ����3=:backup3');
      Parameters.ParamByName('backup3').Value := backup3;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into ����3(����3) values(:backup3)');
        Parameters.ParamByName('backup3').Value := backup3;
        ExecSQL
      end
    end;
    if backup4 <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select ����4 from ����4 where ����4=:backup4');
      Parameters.ParamByName('backup4').Value := backup4;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into ����4(����4) values(:backup4)');
        Parameters.ParamByName('backup4').Value := backup4;
        ExecSQL
      end
    end;
    if backup5 <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select ����5 from ����5 where ����5=:backup5');
      Parameters.ParamByName('backup5').Value := backup5;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into ����5(����5) values(:backup5)');
        Parameters.ParamByName('backup5').Value := backup5;
        ExecSQL
      end
    end;
  end
end;

class procedure TPrepareUtil.prepareBackupInfo2(backup10, backup11,
  backup12, backup13, backup14: string);
begin
  with QueryDataModule.ADOQExec do
  begin
    if backup10 <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select ����10 from ����10 where ����10=:backup10');
      Parameters.ParamByName('backup10').Value := backup10;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into ����10(����10) values(:backup10)');
        Parameters.ParamByName('backup10').Value := backup10;
        ExecSQL
      end
    end;
    if backup11 <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select ����11 from ����11 where ����11=:backup11');
      Parameters.ParamByName('backup11').Value := backup11;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into ����11(����11) values(:backup11)');
        Parameters.ParamByName('backup11').Value := backup11;
        ExecSQL
      end
    end;
    if backup12 <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select ����12 from ����12 where ����12=:backup12');
      Parameters.ParamByName('backup12').Value := backup12;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into ����12(����12) values(:backup12)');
        Parameters.ParamByName('backup12').Value := backup12;
        ExecSQL
      end
    end;
    if backup13 <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select ����13 from ����13 where ����13=:backup13');
      Parameters.ParamByName('backup13').Value := backup13;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into ����13(����13) values(:backup13)');
        Parameters.ParamByName('backup13').Value := backup13;
        ExecSQL
      end
    end;
    if backup14 <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select ����14 from ����14 where ����14=:backup14');
      Parameters.ParamByName('backup14').Value := backup14;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into ����14(����14) values(:backup14)');
        Parameters.ParamByName('backup14').Value := backup14;
        ExecSQL
      end
    end;
  end
end;

class procedure TPrepareUtil.prepareInfo(Car, faHuo, shouHuo, goods,
  spec: string);
begin
  with QueryDataModule.ADOQExec do
  begin
    if car <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select ���� from ���� where ����=:car');
      Parameters.ParamByName('car').Value := car;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into ����(����) values(:car)');
        Parameters.ParamByName('car').Value := car;
        ExecSQL
      end
    end;
    if faHuo <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select ������λ from ������λ where ������λ=:fahuo');
      Parameters.ParamByName('faHuo').Value := faHuo;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into ������λ(������λ) values(:fahuo)');
        Parameters.ParamByName('fahuo').Value := faHuo;
        ExecSQL
      end
    end;
    if shouHuo <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select �ջ���λ from �ջ���λ where �ջ���λ=:shouhuo');
      Parameters.ParamByName('shouhuo').Value := shouHuo;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into �ջ���λ(�ջ���λ) values(:shouhuo)');
        Parameters.ParamByName('shouhuo').Value := shouHuo;
        ExecSQL
      end
    end;
    if goods <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select ���� from ���� where ����=:goods');
      Parameters.ParamByName('goods').Value := goods;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into ����(����) values(:goods)');
        Parameters.ParamByName('goods').Value := goods;
        ExecSQL
      end
    end;
    if spec <> '' then
    begin
      Close;
      SQL.Text := 'select ��� from ��� where ���=:spec';
      Parameters.ParamByName('spec').Value := spec;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Text := 'insert into ���(���) values(:spec)';
        Parameters.ParamByName('spec').Value := spec;
        ExecSQL;
      end;
    end;
  end
end;

class function TPrepareUtil.searchBackup1(search: string): Boolean;
begin
  with QueryDataModule.PrepareMaintainQuery do
  begin
    Close;
    SQL.Text := 'select ����,����1 as [' + MainForm.poWeightSetConfig.backup1Caption +
      '] from ����1 where ����1 like :search';
    Parameters.ParamByName('search').Value := '%' + search + '%';
    Open;
  end;
end;

class function TPrepareUtil.searchBackup10(search: string): Boolean;
begin
  with QueryDataModule.PrepareMaintainQuery do
  begin
    Close;
    SQL.Text := 'select ����,����10 as [' + MainForm.poWeightSetConfig.backup10Caption
      + '] from ����10 where ����10 like :search';
    Parameters.ParamByName('search').Value := '%' + search + '%';
    Open;
  end;
end;

class function TPrepareUtil.searchBackup11(search: string): Boolean;
begin
  with QueryDataModule.PrepareMaintainQuery do
  begin
    Close;
    SQL.Text := 'select ����,����11 as [' + MainForm.poWeightSetConfig.backup11Caption
      + '] from ����11 where ����11 like :search';
    Parameters.ParamByName('search').Value := '%' + search + '%';
    Open;
  end;
end;

class function TPrepareUtil.searchBackup12(search: string): Boolean;
begin
  with QueryDataModule.PrepareMaintainQuery do
  begin
    Close;
    SQL.Text := 'select ����,����12 as [' + MainForm.poWeightSetConfig.backup12Caption
      + '] from ����12 where ����12 like :search';
    Parameters.ParamByName('search').Value := '%' + search + '%';
    Open;
  end;
end;

class function TPrepareUtil.searchBackup13(search: string): Boolean;
begin
  with QueryDataModule.PrepareMaintainQuery do
  begin
    Close;
    SQL.Text := 'select ����,����13 as [' + MainForm.poWeightSetConfig.backup13Caption
      + '] from ����13 where ����13 like :search';
    Parameters.ParamByName('search').Value := '%' + search + '%';
    Open;
  end;
end;

class function TPrepareUtil.searchBackup14(search: string): Boolean;
begin
  with QueryDataModule.PrepareMaintainQuery do
  begin
    Close;
    SQL.Text := 'select ����,����14 as [' + MainForm.poWeightSetConfig.backup14Caption
      + '] from ����14 where ����14 like :search';
    Parameters.ParamByName('search').Value := '%' + search + '%';
    Open;
  end;
end;

class function TPrepareUtil.searchBackup2(search: string): Boolean;
begin
  with QueryDataModule.PrepareMaintainQuery do
  begin
    Close;
    SQL.Text := 'select ����,����2 as [' + MainForm.poWeightSetConfig.backup2Caption
      + '] from ����2 where ����2 like :search';
    Parameters.ParamByName('search').Value := '%' + search + '%';
    Open;
  end;
end;

class function TPrepareUtil.searchBackup3(search: string): Boolean;
begin
  with QueryDataModule.PrepareMaintainQuery do
  begin
    Close;
    SQL.Text := 'select ����,����3 as [' + MainForm.poWeightSetConfig.backup3Caption
      + '] from ����3 where ����3 like :search';
    Parameters.ParamByName('search').Value := '%' + search + '%';
    Open;
  end;
end;

class function TPrepareUtil.searchBackup4(search: string): Boolean;
begin
  with QueryDataModule.PrepareMaintainQuery do
  begin
    Close;
    SQL.Text := 'select ����,����4 as [' + MainForm.poWeightSetConfig.backup4Caption
      + '] from ����4 where ����4 like :search';
    Parameters.ParamByName('search').Value := '%' + search + '%';
    Open;
  end;
end;

class function TPrepareUtil.searchBackup5(search: string): Boolean;
begin
  with QueryDataModule.PrepareMaintainQuery do
  begin
    Close;
    SQL.Text := 'select ����,����5 as [' + MainForm.poWeightSetConfig.backup5Caption
      + '] from ����5 where ����5 like :search';
    Parameters.ParamByName('search').Value := '%' + search + '%';
    Open;
  end;
end;

class function TPrepareUtil.searchCarNo(search: string): Boolean;
begin
  with QueryDataModule.PrepareMaintainQuery do
  begin
    Close;
    SQL.Text := 'select ���� as [' + MainForm.poWeightSetConfig.carCaption
      + '],Ƥ��,��ע from ���� where ���� like :search';
    Parameters.ParamByName('search').Value := '%' + search + '%';
    Open;
  end;
end;

class function TPrepareUtil.searchFaHuo(search: string): Boolean;
begin
  with QueryDataModule.PrepareMaintainQuery do
  begin
    Close;
    SQL.Text := 'select ����,������λ as [' + MainForm.poWeightSetConfig.faHuoCaption
      + '] from ������λ where ������λ like :search';
    Parameters.ParamByName('search').Value := '%' + search + '%';
    Open;
  end;
end;

class function TPrepareUtil.searchGoods(search: string): Boolean;
begin
  with QueryDataModule.PrepareMaintainQuery do
  begin
    Close;
    SQL.Text := 'select ����,���� as [' + MainForm.poWeightSetConfig.goodsCaption
      + '],���� as [' + MainForm.poWeightSetConfig.priceCaption + '],�۷�ϵ�� as ['
      + MainForm.poWeightSetConfig.scaleCaption + '] from ���� where ���� like :search';
    Parameters.ParamByName('search').Value := '%' + search + '%';
    Open;
  end;
end;

class function TPrepareUtil.searchShouHuo(search: string): Boolean;
begin
  with QueryDataModule.PrepareMaintainQuery do
  begin
    Close;
    SQL.Text := 'select ����,�ջ���λ as [' + MainForm.poWeightSetConfig.shouHuoCaption
      + '],��ǰ���,���ö�� from �ջ���λ where �ջ���λ like :search';
    Parameters.ParamByName('search').Value := '%' + search + '%';
    Open;
  end;
end;

class function TPrepareUtil.searchSpec(search: string): Boolean;
begin
  with QueryDataModule.PrepareMaintainQuery do
  begin
    Close;
    SQL.Text := 'select ����,��� as [' + MainForm.poWeightSetConfig.specCaption
      + '] from ��� where ��� like :search';
    Parameters.ParamByName('search').Value := '%' + search + '%';
    Open;
  end;
end;

class function TPrepareUtil.updateCarTare(carNo, tare: string): Boolean;
begin
  if carNo = '' then
  begin
    Result := False;
    Exit;
  end;
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select ���� from ���� where ����=:carNo';
    Parameters.ParamByName('carNo').Value := carNo;
    Open;
    if IsEmpty then
    begin
      SQL.Text := 'insert into ����(����,Ƥ��) values (:carNo,:tare)';
      Parameters.ParamByName('tare').Value := StrToFloatDef(tare, 0);
      Parameters.ParamByName('carNo').Value := carNo;
      Result := ExecSQL = 1;
    end
    else
    begin
      SQL.Text := 'update ���� set Ƥ�� = :tare where ����=:carNo';
      Parameters.ParamByName('tare').Value := StrToFloatDef(tare, 0);
      Parameters.ParamByName('carNo').Value := carNo;
      Result := ExecSQL = 1;
    end;
  end;
end;

end.
