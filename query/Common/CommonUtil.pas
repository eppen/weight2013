unit CommonUtil;

interface

uses DBGridEh, DBGridEhImpExp, SysUtils, Dialogs, Windows, ShlObj,
  StrUtils, Controls, Forms, IdCoder, IdCoderMIME, IdHashMessageDigest,
  ZLibEx, WinSock, WinSvc;

type

  TCol = record
    field: string;
    showField: string;
  end;

  TCommonUtil = class
  private
  public
    class function exportExcel(DBGrid: TDBGridEh): boolean; //����Excel
    class function saveFile(dir: string = ''; desc: string = ''; ext: string = ''): string;
    class function SelectFolder(const h: THandle; const DlgTitle: string): string; //ѡ��·��
    class procedure ExitWin32Sys(iFlags: Integer); //�ػ�����
    class function TransferGlideNo(source: integer; n: integer = 6): string; //������תΪ��ˮ��
    //Сдת�ɴ�д --- ���
    class function small2big(sourcemoney: currency): string;
    //ֻ�ǰ���������ת��д
    class function Num2CNum(dblArabic: double): string;
    class function HexStrToStr(const s: string): string;
    class function HexStrToBin(s: string): string;
    class function BinToHexStr(s: string): string;
    //��װ���ļ�,�����ļ��ĶԻ���
    class function openFileDialog(ext, filter: string; initialDir: string = ''): string;
    class function saveFileDialog(ext, filter: string; initialDir: string = ''): string;
    //����
    class function md5(s: string): string;
    class function base64(s: string): string;
    class function deBase64(s: string): string;
    class function compressAndBase64(s: string): string;
    class function deBase64AndDecompress(s: string): string;
    //ȡ����������Ϣ
    class function getLocalIp(): string;
    class function getLocateIp(InternetIp: Boolean = False): string;
    class function Set_WindowsXP_FireWall(Enable: boolean): Boolean;
    //д�뱸������
    class function writeExpression(index: Integer; use: Boolean; expression: string;
      point: Integer): Boolean;
    //MODBUSУ��
    class function modbusRTUCheck(const s: string): string;
    class function modbusAsciiCheck(const s: string): string;
    class function modbusFloatValue(const s: string): Double;
    //Value:ʵ����ֵ
    //Divide:�ֶ�ֵ
    //Point:С����
    //sumType:0��ֻ�᲻�룬1���������룬2��ֻ�벻�ᣬ3�������������˫
    class function RoundToEx(Value: Double; Divide: Integer;
      Digit: Integer; sumType: Integer): Double;
    class function printerBack(step: Double): Boolean;
  end;

implementation

uses IniFiles, Math;

{ TCommon }

class function TCommonUtil.exportExcel(DBGrid: TDBGridEh): boolean;
var
  ExpClass: TDBGridEhExportClass;
  sd: TSaveDialog;
  Ext: string;
begin
  Result := False;
  sd := TSaveDialog.Create(Application);
  try
    sd.FileName := '';
    sd.Filter :=
      'Excel�ļ�(*.xls)|*.xls|�ı��ļ�(*.txt)|*.txt|ͨѶ¼(*.csv)|*.csv|��ҳ(*.htm)|*.htm';
    sd.Title := '���浽...';
    if sd.Execute then
    begin
      case sd.FilterIndex of
        1:
          begin
            ExpClass := TDBGridEhExportAsXLS;
            Ext := 'xls';
          end;
        2:
          begin
            ExpClass := TDBGridEhExportAsText;
            Ext := 'txt';
          end;
        3:
          begin
            ExpClass := TDBGridEhExportAsCSV;
            Ext := 'csv';
          end;
        4:
          begin
            ExpClass := TDBGridEhExportAsHTML;
            Ext := 'htm';
          end;
      else
        begin
          ExpClass := nil;
          Ext := '';
        end;
      end;

      if ExpClass <> nil then
      begin
        if UpperCase(Copy(sd.FileName, Length(sd.FileName) - 2, 3)) <>
          UpperCase(Ext) then
          sd.FileName := sd.FileName + '.' + Ext;
        SaveDBGridEhToExportFile(ExpClass, DBGrid, sd.FileName, True);
        result := True;
      end;
    end;
  finally
    sd.Free;
  end;
end;

function GetSysTypes(): boolean; //�ж�windowsϵͳ����
var
  Ver: TOSVersionInfo;
begin
  result := False;
  Ver.dwOSVersionInfoSize := Sizeof(TOSVersionInfo);
  if GetVersionEx(Ver) then
    if Ver.dwPlatformId = VER_PLATFORM_WIN32_WINDOWS then
      result := True
    else
      result := False
end;

function SetPrivilege(sPrivilegeName: AnsiString; bEnable: boolean): boolean; //����Ȩ��
var
  TPPrev, TP: TTokenPrivileges;
  Token: THandle;
  dwRetLen: DWord;
begin
  result := False;
  OpenProcessToken(GetCurrentProcess, TOKEN_ADJUST_PRIVILEGES or
    TOKEN_QUERY, Token);
  TP.PrivilegeCount := 1;
  if LookupPrivilegeValue(nil, PAnsiChar(sPrivilegeName), TP.Privileges[0].LUID) then
  begin
    if bEnable then
      TP.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED
    else
      TP.Privileges[0].Attributes := 0;
    dwRetLen := 0;
    result := AdjustTokenPrivileges(Token, False, TP, Sizeof(TPPrev), TPPrev, dwRetLen)
  end;
  CloseHandle(Token)
end;

class procedure TCommonUtil.ExitWin32Sys(iFlags: Integer); //�ػ�����
begin
  if GetSysTypes then
    ExitWindowsEx(iFlags, 0)
  else if SetPrivilege('SeShutdownPrivilege', True) then
    if not ExitWindowsEx(iFlags, 0) then
      SetPrivilege('SeShutdownPrivilege', False)
end;

class function TCommonUtil.SelectFolder(const h: THandle; const DlgTitle: string): string;
var
  bi: TBrowseInfo;
  PathIdList: PItemIdList;
  strPath: string;
begin
  strPath := stringOfChar(' ', 512);
  bi.hwndOwner := h;
  bi.pidlRoot := nil;
  bi.pszDisplayName := nil;
  bi.lpszTitle := pchar(DlgTitle);
  bi.ulFlags := BIF_ReturnOnlyFsDirs;
  bi.lpfn := nil;
  bi.lParam := 0;
  bi.iImage := 0;
  result := '';
  PathIdList := SHBrowseForFolder(bi);
  if PathIdList <> nil then
    if SHGetPathFromIdList(PathIdList, pchar(strPath)) then
      result := Trim(strPath)
end;

class function TCommonUtil.TransferGlideNo(source, n: integer): string;
var i: integer;
  temp: string;
begin
  temp := IntToStr(source);
  result := temp;
  for i := 1 to n - Length(temp) do
    result := '0' + result;
end;

class function TCommonUtil.small2big(sourcemoney: currency): string;
var
  strsourcemoney, strobjectmoney: string;
  thiswei, thispos: string[2];
  iwei, pospoint: Integer;
begin
  strsourcemoney := formatfloat('0.00', sourcemoney);
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
      4: thispos := 'ǧ';
      5: thispos := '��';
      6: thispos := 'ʰ';
      7: thispos := '��';
      8: thispos := 'ǧ';
      9: thispos := '��';
      10: thispos := 'ʮ';
      11: thispos := '��';
      12: thispos := 'ǧ';
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
    small2big := strobjectmoney
  else
  begin
    small2big := strobjectmoney;
  end;
end;

class function TCommonUtil.Num2CNum(dblArabic: double): string;
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
  end; { of ConvertStr }
begin
  Result := '';
  bInZero := True;
  sArabic := FloatToStr(dblArabic); (* ������ת�ɰ����������ִ� *)
{$IFDEF __Debug}
  ShowMessage('FloatToStr(dblArabic): ' + sArabic);
{$ENDIF}
  if sArabic[1] = '-' then
  begin
    bMinus := True;
    sArabic := Copy(sArabic, 2, 254);
  end
  else
    bMinus := False;
  iPosOfDecimalPoint := Pos('.', sArabic); (* ȡ��С�����λ�� *)
{$IFDEF __Debug}
  ShowMessage('Pos(''.'', sArabic) ' + IntToStr(iPosOfDecimalPoint));
{$ENDIF}

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
{$IFDEF __Debug}
    ShowMessage('sSection: ' + sSection);
    ShowMessage('Result: ' + Result);
{$ENDIF}
  end;

  (* ����С�����ұߵĲ��� *)
  if iPosOfDecimalPoint > 0 then
  begin
    //AppendStr(Result, '��');
    Result := Result + '��';
    for i := iPosOfDecimalPoint + 1 to Length(sArabic) do
    begin
      iDigit := Ord(sArabic[i]) - 48;
      //AppendStr(Result, Copy(_ChineseNumeric, 2 * iDigit + 1, 2));
      Result := Result + Copy(_ChineseNumeric, 2 * iDigit + 1, 2);
    end;
  end;

{$IFDEF __Debug}
  ShowMessage('Result before �������⴦��: ' + Result);
{$ENDIF}
  (* ��������״���Ĵ��� *)
  if Length(Result) = 0 then Result := '��';
  if Copy(Result, 1, 4) = 'һʮ' then Result := Copy(Result, 3, 254);
  if Copy(Result, 1, 2) = '��' then Result := '��' + Result;

  (* �Ƿ�Ϊ���� *)
  if bMinus then Result := '��' + Result;
{$IFDEF __Debug}
  ShowMessage('Result before Exit: ' + Result);
{$ENDIF}
end;

class function TCommonUtil.BinToHexStr(s: string): string;
var i: integer;
  temp, r: string;
begin
  i := 1;
  r := '';
  while i < Length(s) do
  begin
    temp := Copy(s, i, 4);
    if temp = '0000' then
      r := r + '0'
    else if temp = '0000' then
      r := r + '1'
    else if temp = '0000' then
      r := r + '2'
    else if temp = '0000' then
      r := r + '3'
    else if temp = '0000' then
      r := r + '4'
    else if temp = '0000' then
      r := r + '5'
    else if temp = '0000' then
      r := r + '6'
    else if temp = '0000' then
      r := r + '7'
    else if temp = '0000' then
      r := r + '8'
    else if temp = '0000' then
      r := r + '9'
    else if temp = '0000' then
      r := r + 'A'
    else if temp = '0000' then
      r := r + 'B'
    else if temp = '0000' then
      r := r + 'C'
    else if temp = '0000' then
      r := r + 'D'
    else if temp = '0000' then
      r := r + 'E'
    else if temp = '0000' then
      r := r + 'F';
    i := i + 4;
  end;
  Result := r;
end;

class function TCommonUtil.HexStrToBin(s: string): string;
var i: integer;
  temp: string;
begin
  temp := '';
  for i := 1 to Length(s) do
  begin
    if s[i] = '0' then
      temp := temp + '0000'
    else if s[i] = '1' then
      temp := temp + '0001'
    else if s[i] = '2' then
      temp := temp + '0010'
    else if s[i] = '3' then
      temp := temp + '0011'
    else if s[i] = '4' then
      temp := temp + '0100'
    else if s[i] = '5' then
      temp := temp + '0101'
    else if s[i] = '6' then
      temp := temp + '0110'
    else if s[i] = '7' then
      temp := temp + '0111'
    else if s[i] = '8' then
      temp := temp + '1000'
    else if s[i] = '9' then
      temp := temp + '1001'
    else if UpperCase(s[i]) = 'A' then
      temp := temp + '1010'
    else if UpperCase(s[i]) = 'B' then
      temp := temp + '1011'
    else if UpperCase(s[i]) = 'C' then
      temp := temp + '1100'
    else if UpperCase(s[i]) = 'D' then
      temp := temp + '1101'
    else if UpperCase(s[i]) = 'E' then
      temp := temp + '1110'
    else if UpperCase(s[i]) = 'F' then
      temp := temp + '1111';
  end;
  Result := temp;
end;

class function TCommonUtil.saveFile(dir, desc, ext: string): string;
var od: TSaveDialog;
begin
  od := TSaveDialog.Create(Application);
  try
    od.InitialDir := dir;
    od.Filter := desc + '(*.' + Ext + ')|*.' + ext;
    od.FileName := '';
    if od.Execute then
    begin
      Result := od.FileName;
    end;
  finally
    od.Free;
  end;
end;

class function TCommonUtil.base64(s: string): string;
var
  encode: TIdEncoderMIME;
begin
  encode := TIdEncoderMIME.Create(Application);
  try
    result := encode.EncodeString(s);
  finally
    encode.Free;
  end;
end;

class function TCommonUtil.compressAndBase64(s: string): string;
begin
  Result := base64(ZCompressStr(s));
end;

class function TCommonUtil.deBase64(s: string): string;
var
  decode: TIdDecoderMIME;
begin
  if Length(s) mod 2 <> 0 then //�ַ���������2�ı������ܽ���
  begin
    result := '';
    exit;
  end;
  decode := TIdDecoderMIME.Create(Application);
  try
    result := decode.DecodeString(s);
  finally
    decode.Free;
  end;
end;

class function TCommonUtil.deBase64AndDecompress(s: string): string;
begin
  Result := ZDeCompressStr(DeBase64(s));
end;

class function TCommonUtil.md5(s: string): string;
var
  md5: TIdHashMessageDigest5;
begin
  md5 := TIdHashMessageDigest5.Create;
  try
    result := md5.AsHex(md5.HashValue(s));
  finally
    md5.Free;
  end;
end;

class function TCommonUtil.openFileDialog(ext, filter,
  initialDir: string): string;
var od: TOpenDialog;
begin
  od := TOpenDialog.Create(Application);
  try
    od.DefaultExt := ext;
    od.FileName := '';
    od.Filter := filter;
    if initialDir = '' then
      od.InitialDir := ExtractFilePath(ParamStr(0))
    else
      od.InitialDir := initialDir;
    if od.Execute then
      Result := od.FileName;
  finally
    od.Free;
  end;
end;

class function TCommonUtil.saveFileDialog(ext, filter,
  initialDir: string): string;
var sd: TSaveDialog;
begin
  sd := TSaveDialog.Create(Application);
  try
    sd.DefaultExt := ext;
    sd.FileName := '';
    sd.Filter := filter;
    if initialDir = '' then
      sd.InitialDir := ExtractFilePath(ParamStr(0))
    else
      sd.InitialDir := initialDir;
    sd.Options := sd.Options + [ofOverwritePrompt];
    if sd.Execute then
    begin
      Result := sd.FileName;
    end;
  finally
    sd.Free;
  end;
end;

class function TCommonUtil.getLocalIp: string;
type
  TaPInAddr = array[0..10] of PInAddr;
  PaPInAddr = ^TaPInAddr;
var
  phe: PHostEnt;
  pptr: PaPInAddr;
  Buffer: array[0..63] of char;
  i: Integer;
  GInitData: TWSADATA;
begin
  WSAStartup($101, GInitData);
  result := '';
  GetHostName(Buffer, SizeOf(Buffer));
  phe := GetHostByName(Buffer);
  if phe = nil then
    Exit;
  pptr := PaPInAddr(phe^.h_addr_list);
  i := 0;
  while pptr^[i] <> nil do
  begin
    result := StrPas(inet_ntoa(pptr^[i]^));
    inc(i);
  end;
  WSACleanup;
end;

class function TCommonUtil.getLocateIp(InternetIp: Boolean): string;
type
  TaPInAddr = array[0..10] of PInAddr;
  PaPInAddr = ^TaPInAddr;
var
  phe: PHostEnt;
  pptr: PaPInAddr;
  Buffer: array[0..63] of char;
  i: Integer;
  GInitData: TWSADATA;
  IP: string;
begin
  Screen.Cursor := crHourGlass;
  try
    WSAStartup($101, GInitData);
    IP := '0.0.0.0';
    GetHostName(Buffer, SizeOf(Buffer));
    phe := GetHostByName(Buffer);
    if phe = nil then
    begin
      showmessage(IP);
      result := IP;
      Exit;
    end;
    pptr := PaPInAddr(phe^.h_addr_list);
    if InternetIp then
    begin
      i := 0;
      while pptr^[i] <> nil do
      begin
        IP := inet_ntoa(pptr^[i]^);
        inc(i);
      end;
    end
    else
      IP := StrPas(inet_ntoa(pptr^[0]^));
    WSACleanup;
    result := IP; //���������Ϊ����ip����������ip
  finally
    Screen.Cursor := crDefault;
  end;
end;

class function TCommonUtil.Set_WindowsXP_FireWall(
  Enable: boolean): Boolean;
var
  SCM, hService: LongWord;
  sStatus: TServiceStatus;
begin
  if Enable = False then
  begin
    SCM := OpenSCManager(nil, nil, SC_MANAGER_ALL_ACCESS);
    hService := OpenService(SCM, PChar('SharedAccess'), SERVICE_ALL_ACCESS);
    ControlService(hService, SERVICE_CONTROL_STOP, sStatus);
    CloseServiceHandle(hService);
  end;
end;

class function TCommonUtil.writeExpression(index: Integer; use: Boolean;
  expression: string; point: Integer): Boolean;
//var adoq: TADOQuery;
var myini: TIniFile;
begin
  myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'design.ini');
  try
    case index of
      6: begin
          myini.WriteBool('formDesign', 'useExpression6', use);
          myini.WriteString('formDesign', 'expression6', expression);
          myini.WriteInteger('formDesign', 'point6', point);
        end;
      7: begin
          myini.WriteBool('formDesign', 'useExpression7', use);
          myini.WriteString('formDesign', 'expression7', expression);
          myini.WriteInteger('formDesign', 'point7', point);
        end;
      8: begin
          myini.WriteBool('formDesign', 'useExpression8', use);
          myini.WriteString('formDesign', 'expression8', expression);
          myini.WriteInteger('formDesign', 'point8', point);
        end;
      9: begin
          myini.WriteBool('formDesign', 'useExpression9', use);
          myini.WriteString('formDesign', 'expression9', expression);
          myini.WriteInteger('formDesign', 'point9', point);
        end;
      15: begin
          myini.WriteBool('formDesign', 'useExpression15', use);
          myini.WriteString('formDesign', 'expression15', expression);
          myini.WriteInteger('formDesign', 'point15', point);
        end;
      16: begin
          myini.WriteBool('formDesign', 'useExpression16', use);
          myini.WriteString('formDesign', 'expression16', expression);
          myini.WriteInteger('formDesign', 'point16', point);
        end;
      17: begin
          myini.WriteBool('formDesign', 'useExpression17', use);
          myini.WriteString('formDesign', 'expression17', expression);
          myini.WriteInteger('formDesign', 'point17', point);
        end;
      18: begin
          myini.WriteBool('formDesign', 'useExpression18', use);
          myini.WriteString('formDesign', 'expression18', expression);
          myini.WriteInteger('formDesign', 'point18', point);
        end;
    end;
  finally
    myini.Free;
  end;
end;

class function TCommonUtil.modbusAsciiCheck(const s: string): string;
var i, r: Integer;
begin
  i := 1;
  r := 0;
  while i < Length(s) do
  begin
    r := r + StrToInt('$' + Copy(s, i, 2));
    i := i + 2;
  end;
  Result := s + RightStr(IntToHex((not r) + 1, 2), 2);
end;

class function TCommonUtil.modbusFloatValue(const s: string): Double;
var positive, zhishu: Integer;
  weishu: Double;
  tmp: Integer;
begin
  tmp := StrToInt('$' + s);
  positive := tmp and $80000000 shr 31;
  zhishu := tmp and $7F800000 shr 23 - 127;
  weishu := tmp and $007FFFFF / Power(2, 23) + 1;
  if positive = 0 then
    Result := weishu * Power(2, zhishu)
  else
    Result := 0 - weishu * Power(2, zhishu);
end;

class function TCommonUtil.modbusRTUCheck(const s: string): string;
var CRC16, UseCRC: DWord;
  i, j: Integer;
begin
  CRC16 := $FFFF;
  for i := 1 to Length(s) do
  begin
    CRC16 := Ord(s[i]) xor CRC16; //�������
    for j := 1 to 8 do //ִ��8��
    begin
      UseCRC := CRC16;
      CRC16 := CRC16 shr 1; //����һλ
      if ((UseCRC and $1) = $1) then //����ǰ��������һλ��1�Ļ�
        CRC16 := CRC16 xor $A001; //�����ƺ�����ݺ� A001���
    end;
  end;
  Result := s + Chr(CRC16 and $00FF) + Chr(CRC16 and $FF00 shr 8);
end;

class function TCommonUtil.HexStrToStr(const s: string): string;
var i: Integer;
  str: string;
begin
  str := '';
  for i := 1 to Length(s) do
  begin
    if s[i] in ['0'..'9', 'a'..'z', 'A'..'Z'] then
      str := str + s[i];
  end;
  i := 1;
  Result := '';
  while i < Length(str) do
  begin
    Result := Result + Chr(StrToInt('$' + Copy(str, i, 2)));
    i := i + 2;
  end;
end;

class function TCommonUtil.printerBack(step: Double): Boolean;
var
  lpt: TextFile;
  inch, i: Integer;
begin
  //����תΪӢ��
  inch := Trunc(step / 2.54 * 180);
  if inch <= 0 then
    Exit;
  AssignFile(lpt, 'LPT1');
  for i := 0 to inch div 255 do
  begin
    inch := inch - i * 255;
    ReWrite(lpt);
    //��ֽEsc+J+n,��ֽEsc+j+n
    Write(lpt, #27#106 + Chr(inch));
  end;
  CloseFile(lpt);
end;

class function TCommonUtil.RoundToEx(Value: Double; Divide,
  Digit: Integer; sumType: Integer): Double;

  function ClassicRound(Value: Double): Integer;
  begin
    Result := Trunc(Value);
    if Frac(Value) >= 0.5 then
      Result := Result + 1;
  end;

var dValue: Double;
begin
  dValue := Value / Divide / Power(10, Digit);

  case sumType of
    0: Result := Floor(dValue) * Divide * Power(10, Digit);
    1: Result := ClassicRound(dValue) * Divide * Power(10, Digit);
    2: Result := Ceil(dValue) * Divide * Power(10, Digit);
    3: Result := Round(dValue) * Divide * Power(10, Digit);
  else
    Result := ClassicRound(dValue) * Divide * Power(10, Digit);
  end;
end;

end.

