unit dhnetsdk;

interface

uses
  SysUtils, WinTypes;

type
 //�������Ͽ��ص�ԭ��
  TDisConnect = procedure(lLoginID: LongInt; strDVRIP: PChar; nDVRPort: LongInt;
    dwUser: LongWord); stdcall;

    // �������ӻָ��ص�����ԭ��
  THaveReConnect = procedure(lLoginID: LongInt; strDVRIP: PChar; nDVRPort: LongInt;
    dwUser: LongWord); stdcall;

 //�ص�ԭ��
  TMessCallBack = function(lCommand, lLoginID: LongInt; var pBuf;
    dwBufLen: LongWord; strDVRIP: Pchar; nDVRPort: LongInt; dwUser: LongWord): LongBool; stdcall;

 //��Ļ���ӻص�ԭ��
  TDrawCallBack = procedure(lLoginID, lPlayHandle: LongInt; hDC: THandle; dwUser: LongInt); stdcall;

 //�豸��Ϣ
  NET_DEVICEINFO = record
    sSerialNumber: array[0..47] of Byte; //���к�
    byAlarmInPortNum: byte; //DVR�����������
    byAlarmOutPortNum: BYTE; //DVR�����������
    byDiskNum: BYTE; //DVR Ӳ�̸���
    byDVRType: BYTE; //DVR����,
    byChanNum: BYTE; //DVR ͨ������
  end;

 //SDK��ʼ��
function CLIENT_Init(cbDisConnect: TDisConnect; dwUser: LongWord): LongBool;
stdcall; external 'dhnetsdk.dll';

 //SDK�˳�����
procedure CLIENT_Cleanup(); stdcall; external 'dhnetsdk.dll';

// ���ö��������ɹ��ص����������ú�SDK�ڲ������Զ�����
procedure CLIENT_SetAutoReconnect(cbAutoConnect: THaveReConnect; dwUser: LongWord);
stdcall; external 'dhnetsdk.dll';

 //�������ӷ�������ʱʱ��ͳ��Դ���
procedure CLIENT_SetConnectTime(nWaitTime: Integer; nTryTimes: Integer);
stdcall; external 'dhnetsdk.dll';

// ���غ���ִ��ʧ�ܴ���
function CLIENT_GetLastError(): DWORD; stdcall; external 'dhnetsdk.dll';

 //��ȡSDK�İ汾��Ϣ
function CLIENT_GetSDKVersion(): LongWord; stdcall; external 'dhnetsdk.dll';

 //���豸ע��
function CLIENT_Login(strDVRIP: string; wDVRPort: Integer; strUserName: string;
  strPassword: string; var netDeviceInfo: NET_DEVICEINFO; var error: Integer): LongInt;
stdcall; external 'dhnetsdk.dll';

 //���豸ע��
function CLIENT_Logout(lLoginID: LongInt): LongBool;
stdcall; external 'dhnetsdk.dll';

procedure CLIENT_SetDVRMessCallBack(cbMessage: TMessCallBack; dwUser: LongWord);
stdcall; external 'dhnetsdk.dll';

 //������Ļ���ӻص�
procedure CLIENT_RigisterDrawFun(cbDraw: TDrawCallBack; dwUser: LongWord);
stdcall; external 'dhnetsdk.dll';

 //��ʼʵʱԤ��
function CLIENT_RealPlay(lLoginID: LongInt; nChannelID: Integer; hWnd: HWND): LongInt;
stdcall; external 'dhnetsdk.dll';

 //ֹͣʵʱԤ��
function CLIENT_StopRealPlay(lRealHandle: LongInt): LongBool;
stdcall; external 'dhnetsdk.dll';

// ץͼ��hPlayHandleΪ���ӻ�طž��
function CLIENT_CapturePicture(hPlayHandle: LongInt; strPicFileName: string): Boolean;
stdcall; external 'dhnetsdk.dll';

// ��������Ϊ�ļ�
function CLIENT_SaveRealData(lRealHandle: LongInt; pchFileName: string): Boolean;
stdcall; external 'dhnetsdk.dll';

// ������������Ϊ�ļ�
function CLIENT_StopSaveRealData(lRealHandle: LongInt): Boolean;
stdcall; external 'dhnetsdk.dll';

function getInitError(ret: Integer): string;

implementation

function getInitError(ret: Integer): string;
begin
  case ret of
    1: Result := '���벻��ȷ';
    2: Result := '�û���������';
    3: Result := '��¼��ʱ';
    4: Result := '�ʺ��ѵ�¼';
    5: Result := '�ʺ��ѱ�����';
    6: Result := '�ʺű���Ϊ������';
    7: Result := '��Դ���㣬ϵͳæ';
    8: Result := '������ʧ��';
    9: Result := '������ʧ��';
    10: Result := '��������û�������';
  end;

end;

end.

