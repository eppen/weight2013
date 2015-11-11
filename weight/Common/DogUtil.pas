unit DogUtil;

interface

uses SysUtils, Registry, Windows, DateUtils;

type
  TDog = class
  private
  public
    class function DogExists(): Boolean;
    class function Dog2(): Boolean;
    //û���ܹ�ֻ����15�����500����¼
    class function RegTimeOut(): Boolean;
  end;

  TFTDog = class
  private
  public
    class function DogExists(): Boolean;
    class function R1sReadKey(offset, length: integer): string;
    class function R1SDogExists(): Boolean;
    class function R1SDog2(): Boolean;
  end;

  TETDog = class
  private
  public
    class function readKey(offset, length: integer): string;
    class function DogExists(): Boolean;
    class function Dog2(): Boolean;
  end;

implementation

uses helpRy3, et_api, FT_RY1S_API;

const
  R3_VENDOR = '497E0D64';
  R3_NEW_DEV_PIN = 'a0b9c8d7e6f5g4h3i2j1knlm';

var
  OLD_PID: string = 'FFFFFFFF';
  PID: string = '4D30E7FD';
  PID_SEED: string = 'www.autocontrol.com';

  OLD_USER_PIN: string = 'FFFFFFFFFFFFFFFF';
  USER_PIN: string = 'ACE1357908642FDB';

  OLD_SO_PIN: string = 'FFFFFFFFFFFFFFFF';
  SO_PIN: string = '6FEA94373B754DB8';
  SO_PIN_SEED: string = 'www.atw.com';

  keyCount: Integer; //���ܹ�����
  retCode: Integer; //��������ֵ
  keyHandle: PET_HANDLE; //���������

{ TFTDog }

class function TFTDog.DogExists(): Boolean;
var
  retcode: integer; //��������ֵ
  count: integer; //�ҵ����ܹ��ĸ���
  handle: integer; //���ܹ����
  offset: integer; //�����ܹ�ʱ��ƫ�Ƶ�ַ
  RemainCount: integer; //���Դ���
  //bufID: array[0..15] of Char;
  first_point: array[0..2] of Byte;
  second_point: array[0..10] of Byte;
  third_point: array[0..2] of Byte;
  InBuf, OutBuf: array[0..15] of Byte;
  i, OutSize: integer;
  p1, p2, p3: pchar;
begin
  //������(����ָ�����ַ�����ʽ��8�ֽ�VendorID, �����ҵ���VendorID�ļ���������)
  retcode := RY3_Find(R3_VENDOR, @count);
  if (retcode <> 0) then
  begin
    Result := False;
    Exit;
  end;
  //����(������Ŀ, ���ҵ��ĵ�1֧Rockey3������,������)
  retcode := RY3_Open(@handle, 1);
  if (retcode <> 0) then
  begin
    Result := False;
    Exit;
  end;
  //У�鿪��������(�����ַ�����ʽ�Ŀ�����pin��,���ȱ�����24�ֽ�)
  //У��ɹ�ʱ���ص�RemainCount  0
  //У��ʧ��ʱ���ص�RemainCount  0:������  1-254:ʣ�����  255:������
  retcode := RY3_VerifyDevPin(handle, R3_NEW_DEV_PIN, @RemainCount);
  if (retcode <> 0) then
  begin
    Result := False;
    Exit;
  end;
  //��ȡ�������ܵ�
  offset := 7500;
  retcode := RY3_Read(handle, offset, @first_point, 3);
  if (retcode <> 0) then
  begin
    Result := False;
    Exit;
  end
  else
  begin
    GetMem(p1, 3);
    p1 := 'www';
    if not CompareMem(@first_point, p1, 3) then
    begin
      result := False;
      Exit;
    end;
  end;
  offset := 7900;
  retcode := RY3_Read(handle, offset, @second_point, 11);
  if (retcode <> 0) then
  begin
    Result := False;
    Exit;
  end
  else
  begin
    GetMem(p2, 11);
    p2 := 'autocontrol';
    if not CompareMem(@second_point, p2, 11) then
    begin
      result := False;
      Exit;
    end;
  end;
  offset := 8000;
  retcode := RY3_Read(handle, offset, @third_point, 3);
  if (retcode <> 0) then
  begin
    Result := False;
    Exit;
  end
  else
  begin
    GetMem(p3, 3);
    p3 := 'com';
    if not CompareMem(@third_point, p3, 3) then
    begin
      result := False;
      Exit;
    end;
  end;
  RY3_Close(handle, 1);
  Result := True;
end;

class function TFTDog.R1SDog2: Boolean;
var s: string;
begin
  if RY1S_FindToken(PChar(PID), keyCount) <> 0 then
  begin
    Result := False;
    Exit;
  end;
  if RY1S_OpenToken(@keyHandle, PChar(PID), 1) <> 0 then
  begin
    Result := False;
    Exit;
  end;
  if RY1S_Verify(keyHandle, ET_VERIFY_USERPIN, PChar(USER_PIN)) <> 0 then
  begin
    Result := False;
    Exit;
  end;
  s := r1sReadKey(100, 4) + r1sReadKey(200, 6) + r1sReadKey(300, 3) +
    r1sReadKey(400, 8) + r1sReadKey(500, 1) + r1sReadKey(600, 3);
  Result := s = 'www.fzatw.comstandard-dog';
end;

class function TFTDog.R1SDogExists: Boolean;
var s: string;
begin
  if RY1S_FindToken(PChar(PID), keyCount) <> 0 then
  begin
    Result := False;
    Exit;
  end;
  if RY1S_OpenToken(@keyHandle, PChar(PID), 1) <> 0 then
  begin
    Result := False;
    Exit;
  end;
  if RY1S_Verify(keyHandle, ET_VERIFY_USERPIN, PChar(USER_PIN)) <> 0 then
  begin
    Result := False;
    Exit;
  end;
  s := r1sReadKey(100, 4) + r1sReadKey(200, 6) + r1sReadKey(300, 3) +
    r1sReadKey(400, 8) + r1sReadKey(500, 1) + r1sReadKey(600, 3);
  Result := s = 'www.fzatw.comstandard-dog';
end;

class function TFTDog.R1sReadKey(offset, length: integer): string;
var buf: array[0..512] of char;
  i: integer;
begin
  for i := 0 to 512 do
    buf[i] := char(0);
  retCode := RY1S_Read(keyHandle, offset, length, @buf[0]);
  Result := buf;
end;

{ TDog }

class function TDog.Dog2: Boolean;
begin
  Result := TFTDog.DogExists() or TETDog.Dog2 or TFTDog.R1SDog2;
end;

class function TDog.DogExists: Boolean;
begin
  Result := TFTDog.DogExists() or TETDog.DogExists or TFTDog.R1SDogExists;
  //Result := True;
end;

class function TDog.RegTimeOut: Boolean;
var reg: TRegistry;
begin
  reg := TRegistry.Create();
  try
    reg.RootKey := HKEY_CURRENT_USER;
    if reg.OpenKey('\Software\Weight', True) then
    begin
      if not reg.ValueExists('regdate') then
      begin
        reg.WriteDateTime('regdate', Now);
      end
      else
      begin
        try
          Result := DaysBetween(Now, reg.ReadDateTime('regdate')) > 15;
        except
          Result := True;
        end;
      end;
    end;
  finally
    reg.Free;
  end;
end;

{ TETDog }

class function TETDog.Dog2: Boolean;
var s: string;
begin
  if et_FindToken(PChar(PID), @keyCount) <> 0 then
  begin
    Result := False;
    Exit;
  end;
  if et_OpenToken(@keyHandle, PChar(PID), 1) <> 0 then
  begin
    Result := False;
    Exit;
  end;
  if ET_Verify(keyHandle, ET_VERIFY_USERPIN, PChar(USER_PIN)) <> 0 then
  begin
    Result := False;
    Exit;
  end;
  s := readKey(100, 4) + readKey(200, 6) + readKey(300, 3) +
    readKey(400, 8) + readKey(500, 1) + readKey(600, 3);
  Result := s = 'www.fzatw.comstandard-dog';
end;

class function TETDog.DogExists: Boolean;
var s: string;
begin
  if et_FindToken(PChar(PID), @keyCount) <> 0 then
  begin
    Result := False;
    Exit;
  end;
  if et_OpenToken(@keyHandle, PChar(PID), 1) <> 0 then
  begin
    Result := False;
    Exit;
  end;
  if ET_Verify(keyHandle, ET_VERIFY_USERPIN, PChar(USER_PIN)) <> 0 then
  begin
    Result := False;
    Exit;
  end;
  s := readKey(100, 4) + readKey(200, 6) + readKey(300, 3) +
    readKey(400, 8) + readKey(500, 1) + readKey(600, 3);
  Result := s = 'www.fzatw.comstandard-dog';
end;

class function TETDog.readKey(offset, length: integer): string;
var buf: array[0..512] of char;
  i: integer;
begin
  for i := 0 to 512 do
    buf[i] := char(0);
  retCode := et_Read(keyHandle, offset, length, @buf[0]);
  Result := buf;
end;

end.

