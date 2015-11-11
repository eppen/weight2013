unit ReportSys;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, RzTreeVw, frxClass, RzButton, StdCtrls,
  ExtCtrls, RzPanel, RzSplit, frxDBSet, frxDesgn, DB, ADODB,
  Menus, RzRadChk;

type
  TReportSysForm = class(TForm)
    tvReport: TRzTreeView;
    PTool: TRzSizePanel;
    MemoSQL: TMemo;
    BtnSave: TRzBitBtn;
    ADOQReport: TADOQuery;
    frxReport3: TfrxReport;
    frxDBDataset3: TfrxDBDataset;
    PMReport: TPopupMenu;
    NModifyTicket: TMenuItem;
    NRename: TMenuItem;
    NDelete: TMenuItem;
    N4: TMenuItem;
    NCopy: TMenuItem;
    N6: TMenuItem;
    NRefresh: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure tvReportDblClick(Sender: TObject);
    procedure NModifyTicketClick(Sender: TObject);
    procedure NRenameClick(Sender: TObject);
    procedure tvReportChange(Sender: TObject; Node: TTreeNode);
    procedure NDeleteClick(Sender: TObject);
    procedure NCopyClick(Sender: TObject);
    procedure NRefreshClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function frxReport3UserFunction(const MethodName: String;
      var Params: Variant): Variant;
  private
    { Private declarations }
    currentNode: string;
  public
    { Public declarations }
    procedure refreshTree;
    procedure GetDirectories(Tree: TRzTreeView; Directory: string;
      Item: TTreeNode; IncludeFiles: Boolean);
    function reportFileExists(filename: string): Boolean;
    function renameReportFile(filename, newFilename: string): Boolean;
    function readReportSQL(filename: string): string;
    procedure updateReportSQL(filename: string; sql: string);
    procedure DeleteReportFile(filename: string);
    procedure CopyReportFile(filename, newFilename: string);
  end;

var
  ReportSysForm: TReportSysForm;

implementation

uses
  StrUtils, QueryDM, Filter;

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

procedure TReportSysForm.GetDirectories(Tree: TRzTreeView; Directory: string;
  Item: TTreeNode; IncludeFiles: Boolean);
var
  SearchRec: TSearchRec;
  ItemTemp: TTreeNode;
begin
  Tree.Items.BeginUpdate;
  if Directory[Length(Directory)] <> '\' then
    Directory := Directory + '\';
  if FindFirst(Directory + '*.*', faDirectory, SearchRec) = 0 then
  begin
    repeat
      if (SearchRec.Attr and faDirectory = faDirectory) and (SearchRec.Name[1] <> '.') then
      begin
        if (SearchRec.Attr and faDirectory > 0) then
          Item := Tree.Items.AddChild(Item, SearchRec.Name);
        ItemTemp := Item.Parent;
        GetDirectories(Tree, Directory + SearchRec.Name, Item, IncludeFiles);
        Item := ItemTemp;
      end
      else
      begin
        if IncludeFiles then
        begin
          if (SearchRec.Name[1] <> '.') and (RightStr(SearchRec.Name, 3) = 'fr3') then
          begin
            Tree.Items.AddChild(Item, SearchRec.Name);
          end;
        end;
      end;
    until FindNext(SearchRec) <> 0;
    FindClose(SearchRec);
    Tree.Items.EndUpdate;
  end;
end;


procedure TReportSysForm.FormShow(Sender: TObject);
begin
  ADOQReport.Connection := QueryDataModule.DBConnection;
  RefreshTree();
end;

procedure TReportSysForm.BtnSaveClick(Sender: TObject);
begin
  if currentNode = '' then
    Exit;
  try
    updateReportSQL(currentNode, MemoSQL.Text);
    Application.MessageBox('�ű����³ɹ���', '��ʾ', MB_OK + MB_ICONINFORMATION
      + MB_DEFBUTTON2 + MB_TOPMOST);
  except
  end;
end;

procedure TReportSysForm.tvReportDblClick(Sender: TObject);
var s: string;
  n: TTreeNode;
begin
  MemoSQL.Clear;
  if RightStr(tvReport.Selected.Text, 3) = 'fr3' then
  begin
    n := tvReport.Selected;
    while n.Parent <> nil do
    begin
      s := n.Parent.Text + '\' + s;
      n := n.Parent;
    end;
    currentNode := s + tvReport.Selected.Text;
    if ReportFileExists(currentNode) then
    begin
      MemoSQL.Text := readReportSQL(currentNode);
      Application.CreateForm(TFilterForm, FilterForm);
      try

        with ADOQReport do
        begin
          Close;
          SQL.Clear;
          FilterForm.adoqReport := ADOQReport;
          FilterForm.ShowModal;
          if FilterForm.ret = '' then
            Exit;
          SQL.Text := Format(MemoSQL.Text, [FilterForm.ret]);
          Open;

          if FileExists(ExtractFilePath(ParamStr(0)) + 'ReportII\' + currentNode) then
          begin
            frxReport3.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'ReportII\' + currentNode);

            frxReport3.Variables['startDate1'] := FilterForm.DTPStartDate1.Date;
            frxReport3.Variables['startTime1'] := FilterForm.DTPStartTime1.Time;
            frxReport3.Variables['endDate1'] := FilterForm.DTPEndDate1.Date;
            frxReport3.Variables['endTime1'] := FilterForm.DTPEndTime1.Time;
            frxReport3.Variables['startDate2'] := FilterForm.DTPStartDate2.Date;
            frxReport3.Variables['startTime2'] := FilterForm.DTPStartTime2.Time;
            frxReport3.Variables['endDate2'] := FilterForm.DTPEndDate2.Date;
            frxReport3.Variables['endDate2'] := FilterForm.DTPEndTime2.Time;

            frxReport3.ShowReport();
          end;

        end;

      finally
        FilterForm.Free;
      end;
    end;
  end;
end;

procedure TReportSysForm.NModifyTicketClick(Sender: TObject);
begin
  if FileExists(ExtractFilePath(ParamStr(0)) + 'ReportII\' + currentNode) then
  begin
    frxReport3.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'ReportII\' + currentNode);
    frxReport3.DesignReport();
  end;
end;

procedure TReportSysForm.NRenameClick(Sender: TObject);
var newNode: string;
begin
  //������:�ļ�������+INI�ļ�Section����
  if currentNode <> '' then
  begin
    newNode := InputBox('������������      ', '', currentNode);
    renameReportFile(currentNode, newNode);
    if FileExists(ExtractFilePath(ParamStr(0)) + 'ReportII\' + currentNode) then
    begin
      RenameFile(ExtractFilePath(ParamStr(0)) + 'ReportII\' + currentNode,
        ExtractFilePath(ParamStr(0)) + 'ReportII\' + newNode);
    end;
    RefreshTree();
  end;
end;

procedure TReportSysForm.tvReportChange(Sender: TObject; Node: TTreeNode);
var s: string;
  n: TTreeNode;
begin
  MemoSQL.Clear;
  if RightStr(tvReport.Selected.Text, 3) = 'fr3' then
  begin
    n := tvReport.Selected;
    while n.Parent <> nil do
    begin
      s := n.Parent.Text + '\' + s;
      n := n.Parent;
    end;
    currentNode := s + tvReport.Selected.Text;
    MemoSQL.Text := readReportSQL(currentNode);
  end;
end;

procedure TReportSysForm.NDeleteClick(Sender: TObject);
begin
  if Application.MessageBox('��ȷ��Ҫɾ�����ű�����?', '����', MB_YESNO +
    MB_ICONWARNING + MB_DEFBUTTON2 + MB_TOPMOST) = IDNO then
  begin
    Exit;
  end;

  if currentNode <> '' then
  begin
    DeleteReportFile(currentNode);
    if FileExists(ExtractFilePath(ParamStr(0)) + 'ReportII\' + currentNode) then
    begin
      DeleteFile(ExtractFilePath(ParamStr(0)) + 'ReportII\' + currentNode);
    end;
    RefreshTree();
  end;
end;

procedure TReportSysForm.NCopyClick(Sender: TObject);
var newNode: string;
begin
  //������:�ļ�������+INI�ļ�Section����
  if currentNode <> '' then
  begin
    newNode := InputBox('������������      ', '', currentNode);
    CopyReportFile(currentNode, newNode);
    if FileExists(ExtractFilePath(ParamStr(0)) + 'ReportII\' + currentNode) then
    begin
      CopyFile(PAnsiChar(ExtractFilePath(ParamStr(0)) + 'ReportII\' + currentNode),
        PAnsiChar(ExtractFilePath(ParamStr(0)) + 'ReportII\' + newNode), False);
    end;
    RefreshTree();
  end;
end;

procedure TReportSysForm.NRefreshClick(Sender: TObject);
begin
  RefreshTree();
end;

procedure TReportSysForm.refreshTree;
begin
  tvReport.Items.Clear;
  GetDirectories(tvReport, ExtractFilePath(ParamStr(0)) + 'ReportII', nil, True);
end;

procedure TReportSysForm.updateReportSQL(filename, sql: string);
var sl: TStringList;
begin
  filename := Copy(filename, 1, Length(filename) - 4);
  filename := ExtractFilePath(ParamStr(0)) + 'ReportII\'
    + filename + '.sql';
  sl := TStringList.Create;
  try
    if FileExists(filename) then
      sl.LoadFromFile(filename);
    sl.Text := AnsiToUtf8(sql);
    sl.SaveToFile(filename);
  finally
    sl.Free;
  end;
end;

function TReportSysForm.readReportSQL(filename: string): string;
var sl: TStringList;
begin
  filename := Copy(filename, 1, Length(filename) - 4);
  filename := ExtractFilePath(ParamStr(0)) + 'ReportII\'
    + filename + '.sql';
  sl := TStringList.Create;
  try
    if FileExists(filename) then
      sl.LoadFromFile(filename);
    Result := Utf8ToAnsi(sl.Text);
  finally
    sl.Free;
  end;
end;

function TReportSysForm.reportFileExists(filename: string): Boolean;
begin
  filename := Copy(filename, 1, Length(filename) - 4);
  filename := ExtractFilePath(ParamStr(0)) + 'ReportII\'
    + filename + '.sql';
  Result := FileExists(filename);
end;

function TReportSysForm.renameReportFile(filename,
  newFilename: string): Boolean;
begin
  filename := Copy(filename, 1, Length(filename) - 4);
  filename := ExtractFilePath(ParamStr(0)) + 'ReportII\'
    + filename + '.sql';

  newFilename := Copy(newFilename, 1, Length(newFilename) - 4);
  newFilename := ExtractFilePath(ParamStr(0)) + 'ReportII\'
    + newFilename + '.sql';

  CopyFile(PAnsiChar(filename), PAnsiChar(newFilename), False);

  if FileExists(filename) then
  begin
    DeleteFile(filename);
  end;
end;

procedure TReportSysForm.DeleteReportFile(filename: string);
begin
  filename := Copy(filename, 1, Length(filename) - 4);
  filename := ExtractFilePath(ParamStr(0)) + 'ReportII\'
    + filename + '.sql';
  if FileExists(filename) then
  begin
    DeleteFile(filename);
  end;
end;

procedure TReportSysForm.CopyReportFile(filename, newFilename: string);
begin
  filename := Copy(filename, 1, Length(filename) - 4);
  filename := ExtractFilePath(ParamStr(0)) + 'ReportII\'
    + filename + '.sql';

  newFilename := Copy(newFilename, 1, Length(newFilename) - 4);
  newFilename := ExtractFilePath(ParamStr(0)) + 'ReportII\'
    + newFilename + '.sql';

  CopyFile(PAnsiChar(filename), PAnsiChar(newFilename), False);
end;

procedure TReportSysForm.FormCreate(Sender: TObject);
begin
  frxReport3.AddFunction('function MoneyToCn(ANumberic: Double): String;', 'Myfunction', '����Ҵ�д���ת������');
  frxReport3.AddFunction('function Num2CNum(dblArabic: Double): String;', 'Myfunction', '��������д���ת������');
end;

function TReportSysForm.frxReport3UserFunction(const MethodName: String;
  var Params: Variant): Variant;
begin 
  if UpperCase(MethodName) = UpperCase('MoneyToCn') then
    Result := MoneyToCn(Params[0]);
  if UpperCase(MethodName) = UpperCase('Num2CNum') then
    Result := Num2CNum(Params[0]);
end;

end.

