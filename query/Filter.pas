unit Filter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, DB, ADODB;

type
  TFilterForm = class(TForm)
    DTPStartTime1: TDateTimePicker;
    DTPStartDate1: TDateTimePicker;
    CBName1: TComboBox;
    CBOper1: TComboBox;
    CBName2: TComboBox;
    CBOper2: TComboBox;
    CBName3: TComboBox;
    CBOper3: TComboBox;
    CBName5: TComboBox;
    CBOper5: TComboBox;
    CBName6: TComboBox;
    CBOper6: TComboBox;
    DTPStartDate2: TDateTimePicker;
    DTPStartTime2: TDateTimePicker;
    EdtValue1: TComboBox;
    EdtValue2: TComboBox;
    EdtValue3: TComboBox;
    EdtValue4: TComboBox;
    DTPEndDate1: TDateTimePicker;
    DTPEndTime1: TDateTimePicker;
    DTPEndDate2: TDateTimePicker;
    DTPEndTime2: TDateTimePicker;
    GBFinishType: TGroupBox;
    RBFinish: TRadioButton;
    RBNotFinish: TRadioButton;
    RBAll: TRadioButton;
    EdtValue5: TComboBox;
    EdtValue6: TComboBox;
    CBName4: TComboBox;
    CBOper4: TComboBox;
    EdtValue7: TComboBox;
    EdtValue8: TComboBox;
    GBWeightType: TGroupBox;
    RBPurchase: TCheckBox;
    RBSale: TCheckBox;
    RBInner: TCheckBox;
    RBOther: TCheckBox;
    BtnOK: TBitBtn;
    BtnCancel: TBitBtn;
    GBTime: TGroupBox;
    RBDay: TRadioButton;
    RBMonth: TRadioButton;
    RBYear: TRadioButton;
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RBDayClick(Sender: TObject);
    procedure RBMonthClick(Sender: TObject);
    procedure RBYearClick(Sender: TObject);
  private
    { Private declarations }
    strShowName, strFieldName: TStrings; //��ѯ�ֶμ�����ʾ
    dateShowName, dateFieldName: TStrings; //���ڼ�����ʾ
    operShowName, operName: TStrings; //������������ʾ
  public
    { Public declarations }
    ret: string;
    adoqReport: TADOQuery;
    procedure loadField(); //��ʾ���Ĳ�����,�Լ���ʾ���ֶ���
    procedure getCondition(adoq: TADOQuery); //��ȡ��ѯ����
  end;

var
  FilterForm: TFilterForm;

implementation

uses Main, DateUtils;

{$R *.dfm}

procedure TFilterForm.BtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFilterForm.getCondition(adoq: TADOQuery);
var isFirst: Boolean;
begin
  with adoq do
  begin
    SQL.Add(' (���<>0)');

    if (CBName1.Text <> '') and (EdtValue1.Text <> '') then
    begin
      case CBOper1.ItemIndex of
        0, 1, 2, 3, 4, 5: begin
            SQL.Add(' and (' + strFieldName.Strings[CBName1.ItemIndex] + ' '
              + operName.Strings[CBOper1.ItemIndex] + ' :v1)');
            Parameters.ParamByName('v1').Value := EdtValue1.Text;
          end;
        6, 7: begin
            SQL.Add(' and (' + strFieldName.Strings[CBName1.ItemIndex] + ' '
              + operName.Strings[CBOper1.ItemIndex] + ' :v1)');
            Parameters.ParamByName('v1').Value := '%' + EdtValue1.Text + '%';
          end;
        8: begin
            SQL.Add(' and (' + strFieldName.Strings[CBName1.ItemIndex] + ' '
              + operName.Strings[CBOper1.ItemIndex] + ' :v1 and :v2)');
            Parameters.ParamByName('v1').Value := EdtValue1.Text;
            Parameters.ParamByName('v2').Value := EdtValue2.Text;
          end;
      end;
    end;

    if (CBName2.Text <> '') and (EdtValue3.Text <> '') then
    begin
      case CBOper2.ItemIndex of
        0, 1, 2, 3, 4, 5: begin
            SQL.Add(' and ( ' + strFieldName.Strings[CBName2.ItemIndex] + ' '
              + operName.Strings[CBOper2.ItemIndex] + ' :v3)');
            Parameters.ParamByName('v3').Value := EdtValue3.Text;
          end;
        6, 7: begin
            SQL.Add(' and (' + strFieldName.Strings[CBName2.ItemIndex] + ' '
              + operName.Strings[CBOper2.ItemIndex] + ' :v3)');
            Parameters.ParamByName('v3').Value := '%' + EdtValue3.Text + '%';
          end;
        8: begin
            SQL.Add(' and (' + strFieldName.Strings[CBName2.ItemIndex] + ' '
              + operName.Strings[CBOper2.ItemIndex] + ' :v3 and :v4)');
            Parameters.ParamByName('v3').Value := EdtValue3.Text;
            Parameters.ParamByName('v4').Value := EdtValue4.Text;
          end;
      end;
    end;

    if (CBName3.Text <> '') and (EdtValue5.Text <> '') then
    begin
      case CBOper3.ItemIndex of
        0, 1, 2, 3, 4, 5: begin
            SQL.Add(' and (' + strFieldName.Strings[CBName3.ItemIndex] + ' '
              + operName.Strings[CBOper3.ItemIndex] + ' :v5)');
            Parameters.ParamByName('v5').Value := EdtValue5.Text;
          end;
        6, 7: begin
            SQL.Add(' and (' + strFieldName.Strings[CBName3.ItemIndex] + ' '
              + operName.Strings[CBOper3.ItemIndex] + ' :v5)');
            Parameters.ParamByName('v5').Value := '%' + EdtValue5.Text + '%';
          end;
        8: begin
            SQL.Add(' and (' + strFieldName.Strings[CBName3.ItemIndex] + ' '
              + operName.Strings[CBOper3.ItemIndex] + ' :v5 and :v6)');
            Parameters.ParamByName('v5').Value := EdtValue5.Text;
            Parameters.ParamByName('v6').Value := EdtValue6.Text;
          end;
      end;
    end;

    if (CBName4.Text <> '') and (EdtValue7.Text <> '') then
    begin
      case CBOper4.ItemIndex of
        0, 1, 2, 3, 4, 5: begin
            SQL.Add(' and (' + strFieldName.Strings[CBName4.ItemIndex] + ' '
              + operName.Strings[CBOper4.ItemIndex] + ' :v7)');
            Parameters.ParamByName('v7').Value := EdtValue7.Text;
          end;
        6, 7: begin
            SQL.Add(' and (' + strFieldName.Strings[CBName4.ItemIndex] + ' '
              + operName.Strings[CBOper4.ItemIndex] + ' :v7)');
            Parameters.ParamByName('v7').Value := '%' + EdtValue7.Text + '%';
          end;
        8: begin
            SQL.Add(' and (' + strFieldName.Strings[CBName4.ItemIndex] + ' '
              + operName.Strings[CBOper4.ItemIndex] + ' :v7 and :v8)');
            Parameters.ParamByName('v7').Value := EdtValue7.Text;
            Parameters.ParamByName('v8').Value := EdtValue8.Text;
          end;
      end;
    end;

    if (CBName5.Text <> '') then
    begin
      case CBOper5.ItemIndex of
        0, 1, 2, 3, 4, 5: begin
            SQL.Add(' and (' + dateFieldName.Strings[CBName5.ItemIndex] + ' '
              + operName.Strings[CBOper5.ItemIndex] + ' :v9)');
            Parameters.ParamByName('v9').Value :=
              FormatDateTime('yyyy-MM-dd', DTPStartDate1.Date) + ' '
              + FormatDateTime('HH:mm:ss', DTPStartTime1.Time);
          end;
        6, 7: begin
            SQL.Add(' and (' + dateFieldName.Strings[CBName5.ItemIndex] + ' '
              + operName.Strings[CBOper5.ItemIndex] + ' :v9)');
            Parameters.ParamByName('v9').Value := FormatDateTime('yyyy-MM-dd', DTPStartDate1.Date) + ' '
              + FormatDateTime('HH:mm:ss', DTPStartTime1.Time);
          end;
        8: begin
            SQL.Add(' and (' + dateFieldName.Strings[CBName5.ItemIndex] + ' '
              + operName.Strings[CBOper5.ItemIndex] + ' :v9 and :v10)');
            Parameters.ParamByName('v9').Value := FormatDateTime('yyyy-MM-dd', DTPStartDate1.Date) + ' '
              + FormatDateTime('HH:mm:ss', DTPStartTime1.Time);
            Parameters.ParamByName('v10').Value := FormatDateTime('yyyy-MM-dd', DTPEndDate1.Date) + ' '
              + FormatDateTime('HH:mm:ss', DTPEndTime1.Time);
          end;
      end;
    end;

    if (CBName6.Text <> '') then
    begin
      case CBOper6.ItemIndex of
        0, 1, 2, 3, 4, 5: begin
            SQL.Add(' and (' + dateFieldName.Strings[CBName6.ItemIndex] + ' '
              + operName.Strings[CBOper6.ItemIndex] + ' :v11)');
            Parameters.ParamByName('v11').Value :=
              FormatDateTime('yyyy-MM-dd', DTPStartDate2.Date) + ' '
              + FormatDateTime('HH:mm:ss', DTPStartTime2.Time);
          end;
        6, 7: begin
            SQL.Add(' and (' + dateFieldName.Strings[CBName6.ItemIndex] + ' '
              + operName.Strings[CBOper6.ItemIndex] + ' :v11)');
            Parameters.ParamByName('v11').Value := FormatDateTime('yyyy-MM-dd', DTPStartDate2.Date) + ' '
              + FormatDateTime('HH:mm:ss', DTPStartTime2.Time);
          end;
        8: begin
            SQL.Add(' and (' + dateFieldName.Strings[CBName6.ItemIndex] + ' '
              + operName.Strings[CBOper6.ItemIndex] + ' :v11 and :v12)');
            Parameters.ParamByName('v11').Value := FormatDateTime('yyyy-MM-dd', DTPStartDate2.Date) + ' '
              + FormatDateTime('HH:mm:ss', DTPStartTime2.Time);
            Parameters.ParamByName('v12').Value := FormatDateTime('yyyy-MM-dd', DTPEndDate2.Date) + ' '
              + FormatDateTime('HH:mm:ss', DTPEndTime2.Time);
          end;
      end;
    end;

    if RBFinish.Checked then
    begin
      SQL.Add(' and (����<>0)');
    end
    else if RBNotFinish.Checked then
    begin
      SQL.Add(' and (����=0)');
    end;

    if RBPurchase.Checked or RBSale.Checked or RBInner.Checked or RBOther.Checked then
    begin
      SQL.Add(' and (');
      isFirst := True;
      if RBPurchase.Checked then
      begin
        if isFirst then
        begin
          SQL.Add(' (��������=:weightType1)');
          Parameters.ParamByName('weightType1').Value := 'PO';
          isFirst := False;
        end
        else
        begin
          SQL.Add(' or (��������=:weightType1)');
          Parameters.ParamByName('weightType1').Value := 'PO';
        end;
      end;
      if RBSale.Checked then
      begin
        if isFirst then
        begin
          SQL.Add(' (��������=:weightType2)');
          Parameters.ParamByName('weightType2').Value := 'SO';
          isFirst := False;
        end
        else
        begin
          SQL.Add(' or (��������=:weightType2)');
          Parameters.ParamByName('weightType2').Value := 'SO';
        end;
      end;
      if RBInner.Checked then
      begin
        if isFirst then
        begin
          SQL.Add(' (��������=:weightType3)');
          Parameters.ParamByName('weightType3').Value := 'IO';
          isFirst := False;
        end
        else
        begin
          SQL.Add(' or (��������=:weightType3)');
          Parameters.ParamByName('weightType3').Value := 'IO';
        end;
      end;
      if RBOther.Checked then
      begin
        if isFirst then
        begin
          SQL.Add(' (��������=:weightType4)');
          Parameters.ParamByName('weightType4').Value := 'OO';
          isFirst := False;
        end
        else
        begin
          SQL.Add(' or (��������=:weightType4)');
          Parameters.ParamByName('weightType4').Value := 'OO';
        end;
      end;
      SQL.Add(')');
    end;
  end;
end;

procedure TFilterForm.loadField;
begin
  if strShowName = nil then strShowName := TStringList.Create;
  if strFieldName = nil then strFieldName := TStringList.Create;
  if dateShowName = nil then dateShowName := TStringList.Create;
  if dateFieldName = nil then dateFieldName := TStringList.Create;
  if operShowName = nil then operShowName := TStringList.Create;
  if operName = nil then operName := TStringList.Create;

  operShowName.Add('����');
  operShowName.Add('����');
  operShowName.Add('�����');
  operShowName.Add('С��');
  operShowName.Add('С����');
  operShowName.Add('������');
  operShowName.Add('����');
  operShowName.Add('������');
  operShowName.Add('����֮��');

  operName.Add('=');
  operName.Add('>');
  operName.Add('>=');
  operName.Add('<');
  operName.Add('<=');
  operName.Add('<>');
  operName.Add('like');
  operName.Add('not like');
  operName.Add('between');

  strShowName.Add('��ˮ��'); strFieldName.Add('��ˮ��');
  strShowName.Add(MainForm.weightSetConfig.carCaption); strFieldName.Add('����');
  strShowName.Add(MainForm.weightSetConfig.faHuoCaption); strFieldName.Add('������λ');
  strShowName.Add(MainForm.weightSetConfig.shouHuoCaption); strFieldName.Add('�ջ���λ');
  strShowName.Add(MainForm.weightSetConfig.goodsCaption); strFieldName.Add('����');
  strShowName.Add(MainForm.weightSetConfig.specCaption); strFieldName.Add('���');
  strShowName.Add('ë��˾��Ա'); strFieldName.Add('ë��˾��Ա');
  strShowName.Add('Ƥ��˾��Ա'); strFieldName.Add('Ƥ��˾��Ա');
  strShowName.Add('ë�ذ���'); strFieldName.Add('ë�ذ���');
  strShowName.Add('Ƥ�ذ���'); strFieldName.Add('Ƥ�ذ���');
  strShowName.Add(MainForm.weightSetConfig.backup1Caption); strFieldName.Add('����1');
  strShowName.Add(MainForm.weightSetConfig.backup2Caption); strFieldName.Add('����2');
  strShowName.Add(MainForm.weightSetConfig.backup3Caption); strFieldName.Add('����3');
  strShowName.Add(MainForm.weightSetConfig.backup4Caption); strFieldName.Add('����4');
  strShowName.Add(MainForm.weightSetConfig.backup5Caption); strFieldName.Add('����5');
  strShowName.Add(MainForm.weightSetConfig.backup10Caption); strFieldName.Add('����10');
  strShowName.Add(MainForm.weightSetConfig.backup11Caption); strFieldName.Add('����11');
  strShowName.Add(MainForm.weightSetConfig.backup12Caption); strFieldName.Add('����12');
  strShowName.Add(MainForm.weightSetConfig.backup13Caption); strFieldName.Add('����13');
  strShowName.Add(MainForm.weightSetConfig.backup14Caption); strFieldName.Add('����14');
  strShowName.Add(MainForm.weightSetConfig.grossCaption); strFieldName.Add('ë��');
  strShowName.Add(MainForm.weightSetConfig.tareCaption); strFieldName.Add('Ƥ��');
  strShowName.Add(MainForm.weightSetConfig.netCaption); strFieldName.Add('����');
  strShowName.Add(MainForm.weightSetConfig.bundleCaption); strFieldName.Add('����');
  strShowName.Add(MainForm.weightSetConfig.realCaption); strFieldName.Add('ʵ��');
  strShowName.Add(MainForm.weightSetConfig.priceCaption); strFieldName.Add('����');
  strShowName.Add(MainForm.weightSetConfig.sumCaption); strFieldName.Add('���');
  strShowName.Add(MainForm.weightSetConfig.scaleCaption); strFieldName.Add('�۷�ϵ��');
  strShowName.Add(MainForm.weightSetConfig.quanterCaption); strFieldName.Add('����');
  strShowName.Add(MainForm.weightSetConfig.backup6Caption); strFieldName.Add('����6');
  strShowName.Add(MainForm.weightSetConfig.backup7Caption); strFieldName.Add('����7');
  strShowName.Add(MainForm.weightSetConfig.backup8Caption); strFieldName.Add('����8');
  strShowName.Add(MainForm.weightSetConfig.backup9Caption); strFieldName.Add('����9');
  strShowName.Add(MainForm.weightSetConfig.backup15Caption); strFieldName.Add('����15');
  strShowName.Add(MainForm.weightSetConfig.backup16Caption); strFieldName.Add('����16');
  strShowName.Add(MainForm.weightSetConfig.backup17Caption); strFieldName.Add('����17');
  strShowName.Add(MainForm.weightSetConfig.backup18Caption); strFieldName.Add('����18');

  dateShowName.Add('');
  dateShowName.Add(MainForm.weightSetConfig.grossTimeCaption);
  dateShowName.Add(MainForm.weightSetConfig.tareTimeCaption);
  dateShowName.Add('����ʱ��');

  dateFieldName.Add('');
  dateFieldName.Add('ë��ʱ��');
  dateFieldName.Add('Ƥ��ʱ��');
  dateFieldName.Add('����ʱ��');

  CBName1.Items := strShowName;
  CBName2.Items := strShowName;
  CBName3.Items := strShowName;
  CBName4.Items := strShowName;
  CBName5.Items := dateShowName;
  CBName6.Items := dateShowName;

  CBName1.ItemIndex := 1;
  CBName2.ItemIndex := 3;
  CBName3.ItemIndex := 4;
  CBName4.ItemIndex := 5;
  CBName5.ItemIndex := 1;
  CBName6.ItemIndex := 0;

  CBOper1.Items := operShowName;
  CBOper2.Items := operShowName;
  CBOper3.Items := operShowName;
  CBOper4.Items := operShowName;
  CBOper5.Items := operShowName;
  CBOper6.Items := operShowName;

  CBOper1.ItemIndex := 0;
  CBOper2.ItemIndex := 0;
  CBOper3.ItemIndex := 0;
  CBOper4.ItemIndex := 0;
  CBOper5.ItemIndex := 8;
  CBOper6.ItemIndex := 8;
end;

procedure TFilterForm.BtnOKClick(Sender: TObject);
begin
  getCondition(adoqReport);
  ret := adoqReport.SQL.Text;
  Close;
end;

procedure TFilterForm.FormShow(Sender: TObject);
begin
  DTPStartDate1.Date := StartOfTheDay(Now);
  DTPStartTime1.Time := StartOfTheDay(Now);
  DTPEndDate1.Date := EndOfTheDay(Now);
  DTPEndTime1.Time := EndOfTheDay(Now);

  DTPStartDate2.Date := StartOfTheDay(Now);
  DTPStartTime2.Time := StartOfTheDay(Now);
  DTPEndDate2.Date := EndOfTheDay(Now);
  DTPEndTime2.Time := EndOfTheDay(Now);

  loadField; //��ȡҪ��ѯ���ֶ���

  CBName1.SetFocus;
end;

procedure TFilterForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if strShowName <> nil then strShowName.Free;
  if strFieldName <> nil then strFieldName.Free;
  if dateShowName <> nil then dateShowName.Free;
  if dateFieldName <> nil then dateFieldName.Free;
  if operShowName <> nil then operShowName.Free;
  if operName <> nil then operName.Free;

end;

procedure TFilterForm.RBDayClick(Sender: TObject);
begin
  DTPStartDate1.Date := StartOfTheDay(Now);
  DTPStartTime1.Time := StartOfTheDay(Now);
  DTPStartDate2.Date := StartOfTheDay(Now);
  DTPStartTime2.Time := StartOfTheDay(Now);

  DTPEndDate1.Date := EndOfTheDay(Now);
  DTPEndTime1.Time := EndOfTheDay(Now);
  DTPEndDate2.Date := EndOfTheDay(Now);
  DTPEndTime2.Time := EndOfTheDay(Now);
end;

procedure TFilterForm.RBMonthClick(Sender: TObject);
begin
  DTPStartDate1.Date := StartOfTheMonth(Now);
  DTPStartTime1.Time := StartOfTheMonth(Now);
  DTPStartDate2.Date := StartOfTheMonth(Now);
  DTPStartTime2.Time := StartOfTheMonth(Now);

  DTPEndDate1.Date := EndOfTheMonth(Now);
  DTPEndTime1.Time := EndOfTheMonth(Now);
  DTPEndDate2.Date := EndOfTheMonth(Now);
  DTPEndTime2.Time := EndOfTheMonth(Now);
end;

procedure TFilterForm.RBYearClick(Sender: TObject);
begin
  DTPStartDate1.Date := StartOfTheYear(Now);
  DTPStartTime1.Time := StartOfTheYear(Now);
  DTPStartDate2.Date := StartOfTheYear(Now);
  DTPStartTime2.Time := StartOfTheYear(Now);

  DTPEndDate1.Date := EndOfTheYear(Now);
  DTPEndTime1.Time := EndOfTheYear(Now);
  DTPEndDate2.Date := EndOfTheYear(Now);
  DTPEndTime2.Time := EndOfTheYear(Now);
end;

end.

