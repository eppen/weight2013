{**************************************************************************************
* Copyright (c)
* All rights reserved.
*
* FileName��
*
*
*******************************************************************************************}
unit ET_API;

interface

uses
  Windows;

 // const definition

const ET_TYPE_99 = $1;
const ET_TYPE_299 = $2;
const ET_TYPE_99TIME = $3;

//Return Value Status Definition
const ET_SUCCESS = $00; //����ִ�гɹ�
const ET_ACCESS_DENY = $01; //���ʱ��ܾ�,Ȩ�޲���
const ET_COMMUNICATIONS_ERROR = $02; //ͨѶ����,û�д��豸
const ET_INVALID_PARAMETER = $03; //��Ч�Ĳ���,��������
const ET_NOT_SET_PID = $04; //û������PID
const ET_UNIT_NOT_FOUND = $05; //��ָ�����豸ʧ��
const ET_HARD_ERROR = $06; //Ӳ������
const ET_UNKNOWN = $07; //һ���Դ���
const ET_PIN_ERR_MASK = $0F; //��֤PIN������
const ET_PIN_ERR_MAX = $FF; //��֤PIN�����ʣ�����,�����֤���󻹻���ET_PIN_ERR_MAX���ʾPIN����Զ��������

//����������
const ET_KEY_TYPE = $10; //��Կ���ʹ���
const ET_LICENSE_TYPE = $11; //��Ȩ���ʹ���
const ET_LICENSE_UNINIT = $12; //��Ȩ��Ԫδ����,����ʱ,ȫ����Ȩ��Ԫ��δ����,ֻ�е�������Ȩ��Żᱻ����
const ET_NO_LICENSE = $13; //��Ȩʧ��
const ET_UNKNOWN_UPDATE_FILE = $14; //δ֪�������ļ���ʽ
const ET_INVALID_DATA_LEN = $15; //�Ƿ������ݳ���
const ET_NO_TDES_KEY = $16; //��Ч��TDES��Կ
const ET_INVALID_UPDATE_FILE = $17; //��Ч�������ļ�
const ET_UNSUPPORTED = $18; //��֧�ֵĹ���
const ET_ADJUST_TIMER = $19; //����ϵͳʱ��ʧ��
const ET_KEY_INDEX = $1A; //�������Կ����
const ET_KEY_ZERO = $1B; //0����ԿΪϵͳר��

//��������
const ET_VERIFY_USERPIN = $0; //У���û�����
const ET_VERIFY_SOPIN = $1; //У�鿪��������
const ET_USER_WRITE_READ = $0; //��д
const ET_USER_READ_ONLY = $1; //ֻ��
const ET_KEY_HMAC_MD5 = $0; //ѡ��HMAC-MD5��Կ
const ET_KEY_TDES = $1; //ѡ��3DES��Կ
const ET_EXPIRE_DATE = $0; //��ֹ������Ȩ
const ET_TIME_MINUTE = $1; //��ʱ��Ȩ(��λ����)
const ET_TIME_DAY = $2; //������Ȩ(��λ����)

const ET99_MEMORY_SIZE = 1 * 1024; //ET99����������С
const ET299_MEMORY_SIZE = 6 * 1024; //ET299����������С
const ET99_TIME_MEMORY_SIZE = 512; //ET99 time����������С

//�������õ�PID
const CONST_PID = 'FFFFFFFF';

type

  ET_HANDLE = Pointer;
  PET_HANDLE = ^ET_HANDLE;

  PWord = ^Word;
  PLongword = ^Longword;
  PHIDP_PREPARSED_DATA = ^Byte;
  PPHIDP_PREPARSED_DATA = ^PHIDP_PREPARSED_DATA;

  PInteger = ^Integer;
  PCSTR = ^Char;
  PByte = ^Byte;
  psize_t = ^size_t;
  size_t = Cardinal;

//ʱ�����ݸ�ʽ
  TimeData = record
    m_Year: Byte; //��(0-99)
    m_Month: Byte; //��(1-12)
    m_Day: Byte; //��(1-31)
    m_Hour: Byte; //ʱ(0-23)
    m_Minute: Byte; //��(0-59)
    m_Second: Byte; //��(0-59)
  end;

//ʱ���������ݸ�ʽ
//��Ϊ��������ʱm_hours�ĺ���:
//0:m_endΪ��ֹʱ��  >0:������Сʱ��, m_end����  <0:ȡ��ʱ������(����ֵ:-1)
//��Ϊ�������ʱ m_hours�ĺ���:
//0:m_endΪ��ֹʱ��  >0:������Сʱ��, m_endΪ��ֹʱ�� <0:��ʱ������ m_end����
  LimitData = record
    m_hours: short; //���26280
    m_end: TimeData;
  end;

//Զ���������ݸ�ʽ
  UpdateData = record
    m_limit: LimitData; //�µ�ʱ����������
    m_sn: array[0..7] of Byte; //ȫ0xFF��ʾ������Ӳ��SN,�����ʾ����������Ӳ��SN
    m_md5: array[0..15] of Byte; //(sizeof(UpdateData)-16)����keyid=9�������md5ǩ��ֵ
  end;

{$EXTERNALSYM et_FindToken}
function et_FindToken(PIDstr: PChar; pcount: PInteger): DWORD; stdcall;
{$EXTERNALSYM et_OpenToken}
function et_OpenToken(hHandle: PET_HANDLE; PIDstr: PAnsiChar; index: integer): DWORD; stdcall;
{$EXTERNALSYM et_CloseToken}
function et_CloseToken(hHandle: ET_HANDLE): DWORD; stdcall;
{$EXTERNALSYM et_Read}
function et_Read(hHandle: ET_HANDLE; offset: Word; Len: Integer; pucReadBuf: PByte): DWORD; stdcall;
{$EXTERNALSYM et_Write}
function et_Write(hHandle: ET_HANDLE; offset: Word; Len: Integer; pucWriteBuf: PByte): DWORD; stdcall;
{$EXTERNALSYM et_GenPID}
function et_GenPID(hHandle: ET_HANDLE; SeedLen: Integer; pucSeed: PByte; pid: PChar): DWORD; stdcall;
{$EXTERNALSYM et_GenRandom}
function et_GenRandom(hHandle: ET_HANDLE; pucRandBuf: PByte): DWORD; stdcall;
{$EXTERNALSYM et_GenSOPIN}
function et_GenSOPIN(hHandle: ET_HANDLE; SeedLen: Integer; pucSeed: PByte; pucNewSoPIN: PChar): DWORD; stdcall;
{$EXTERNALSYM et_ResetPIN}
function et_ResetPIN(hHandle: ET_HANDLE; pucSoPIN: PChar): DWORD; stdcall;
{$EXTERNALSYM et_SetKey}
function et_SetKey(hHandle: ET_HANDLE; Keyid: Integer; pucKeyBuf: PByte): DWORD; stdcall;
{$EXTERNALSYM et_HMAC_MD5}
function et_HMAC_MD5(hHandle: ET_HANDLE; keyID: Integer; textLen: Integer; pucText: PByte; digest: PByte): DWORD; stdcall;
{$EXTERNALSYM et_Verify}
function et_Verify(hHandle: ET_HANDLE; Flags: Integer; pucPIN: PChar): DWORD; stdcall;
{$EXTERNALSYM et_ChangeUserPIN}
function et_ChangeUserPIN(hHandle: ET_HANDLE; pucOldPIN: PChar; pucNewPIN: PChar): DWORD; stdcall;
{$EXTERNALSYM et_ResetSecurityState}
function et_ResetSecurityState(hHandle: ET_HANDLE): DWORD; stdcall;
{$EXTERNALSYM et_GetSN}
function et_GetSN(hHandle: ET_HANDLE; pucSN: PByte): DWORD; stdcall;
{$EXTERNALSYM et_SetupToken}
function et_SetupToken(hHandle: ET_HANDLE; bSoPINRetries: Byte; bUserPINRetries: Byte; bUserReadOnly: Byte; bBack: Byte): DWORD; stdcall;
{$EXTERNALSYM et_TurnOnLED}
function et_TurnOnLED(hHandle: ET_HANDLE): DWORD; stdcall;
{$EXTERNALSYM et_TurnOffLED}
function et_TurnOffLED(hHandle: ET_HANDLE): DWORD; stdcall;
{$EXTERNALSYM et_TurnOffLED}
function MD5_HMAC(pucText: PByte; ulText_Len: DWORD; pucKey: PByte; ulKey_Len: DWORD; pucToenKey: PByte; pucDigest: PByte): DWORD; stdcall;

type

  GUID = record
    Data1: Longword;
    Data2: Word;
    Data3: Word;
    Data4: array[0..7] of Byte;
  end;

  LPGUID = ^GUID;

  HIDP_CAPS = record
    Usage: Word;
    UsagePage: Word;
    InputReportByteLength: Word;
    OutputReportByteLength: Word;
    FeatureReportByteLength: Word;
    Reserved: array[0..16] of Word;
    NumberLinkCollectionNodes: Word;
    NumberInputButtonCaps: Word;
    NumberInputValueCaps: Word;
    NumberInputDataIndices: Word;
    NumberOutputButtonCaps: Word;
    NumberOutputValueCaps: Word;
    NumberOutputDataIndices: Word;
    NumberFeatureButtonCaps: Word;
    NumberFeatureValueCaps: Word;
    NumberFeatureDataIndices: Word;
  end;

  PHIDP_CAPS = ^HIDP_CAPS;

  HIDD_ATTRIBUTES = record
    Size: Longword;
    VendorID: Word;
    ProductID: Word;
    VersionNumber: Word;
  end;

  PHIDD_ATTRIBUTES = ^HIDD_ATTRIBUTES;

  SP_DEVICE_INTERFACE_DATA = record
    cbSize: Longword;
    InterfaceClassGuid: GUID;
    Flags: Longword;
    Reserved: Longword;
  end;

  PSP_DEVICE_INTERFACE_DATA = ^SP_DEVICE_INTERFACE_DATA;

  SP_DEVICE_INTERFACE_DETAIL_DATA = record
    cbSize: Longword;
    DevicePath: array[0..4096] of Char;
  end;

  //PSP_DEVICE_INTERFACE_DETAIL_DATA_A = ^SP_DEVICE_INTERFACE_DETAIL_DATA_A;
  PSP_DEVICE_INTERFACE_DETAIL_DATA = ^SP_DEVICE_INTERFACE_DETAIL_DATA;

  SP_DEVINFO_DATA = record
    cbSize: Longword;
    ClassGuid: GUID;
    DevInst: Longword;
    Reserved: Longword;
  end;

  PSP_DEVINFO_DATA = ^SP_DEVINFO_DATA;

  tm = record
    tm_sec: integer;
    tm_min: integer;
    tm_hour: integer;
    tm_mday: integer;
    tm_mon: integer;
    tm_year: integer;
    tm_wday: integer;
    tm_yday: integer;
    tm_isdst: integer;
  end;

  ptm = ^tm;


{$EXTERNALSYM HidD_FreePreparsedData}
function HidD_FreePreparsedData(PreparsedData: PHIDP_PREPARSED_DATA): Boolean; cdecl;
{$EXTERNALSYM HidP_GetCaps}
function HidP_GetCaps(PreparsedData: PHIDP_PREPARSED_DATA; Capabilities: PHIDP_CAPS): Longint; cdecl;
{$EXTERNALSYM HidD_GetPreparsedData}
function HidD_GetPreparsedData(HidDeviceObject: THandle; PreparsedData: PPHIDP_PREPARSED_DATA): Boolean; cdecl;
{$EXTERNALSYM HidD_SetFeature}
function HidD_SetFeature(HidDeviceObject: THandle; ReportBuffer: pointer; ReportBufferLength: Longword): Boolean; cdecl;
{$EXTERNALSYM HidD_GetFeature}
function HidD_GetFeature(HidDeviceObject: THandle; ReportBuffer: pointer; ReportBufferLength: Longword): Boolean; cdecl;
{$EXTERNALSYM HidD_FlushQueue}
function HidD_FlushQueue(HidDeviceObject: THandle): Boolean; cdecl;
{$EXTERNALSYM HidD_GetSerialNumberString}
function HidD_GetSerialNumberString(HidDeviceObject: THandle; Buffer: PChar; BufferLength: Longword): Boolean; cdecl;
{$EXTERNALSYM HidD_GetProductString}
function HidD_GetProductString(HidDeviceObject: THandle; Buffer: PChar; BufferLength: Longword): Boolean; cdecl;
{$EXTERNALSYM HidD_GetAttributes}
function HidD_GetAttributes(HidDeviceObject: THandle; Attributes: PHIDD_ATTRIBUTES): Boolean; cdecl;
{$EXTERNALSYM HidD_GetHidGuid}
function HidD_GetHidGuid(HidGuid: LPGUID): integer; cdecl;
{$EXTERNALSYM HidD_GetManufacturerString}
function HidD_GetManufacturerString(HidDeviceObject: THANDLE; Buffer: PCHAR; BufferLength: ULONG): Boolean; cdecl;

{$EXTERNALSYM SetupDiDestroyDeviceInfoList}
function SetupDiDestroyDeviceInfoList(DeviceInfoSet: THandle): Boolean; cdecl;
{$EXTERNALSYM SetupDiGetDeviceInterfaceDetailA}
function SetupDiGetDeviceInterfaceDetailA(DeviceInfoSet: THandle; DeviceInterfaceData: PSP_DEVICE_INTERFACE_DATA; DeviceInterfaceDetailData: PSP_DEVICE_INTERFACE_DETAIL_DATA; DeviceInterfaceDetailDataSize: Longword; RequiredSize: PLongword; DeviceInfoData: PSP_DEVINFO_DATA): Boolean; cdecl;
{$EXTERNALSYM SetupDiEnumDeviceInterfaces}
function SetupDiEnumDeviceInterfaces(DeviceInfoSet: THandle; DeviceInfoData: PSP_DEVINFO_DATA; InterfaceClassGuid: LPGUID; MemberIndex: Longword; DeviceInterfaceData: PSP_DEVICE_INTERFACE_DATA): Boolean; cdecl;
{$EXTERNALSYM SetupDiGetClassDevsA}
function SetupDiGetClassDevsA(ClassGuid: LPGUID; Enumerator: PCSTR; hwndParent: HWND; Flags: Longword): THandle; cdecl;

{$EXTERNALSYM _memset}
function _memset(s: Pointer; c: Integer; n: size_t): Pointer; cdecl;
{$EXTERNALSYM _memcpy}
function _memcpy(s1: Pointer; const s2: Pointer; n: size_t): Pointer; cdecl;
{$EXTERNALSYM _memcmp}
function _memcmp(s1: Pointer; const s2: Pointer; n: size_t): Integer; cdecl;
{$EXTERNALSYM _strcpy}
function _strcpy(s1: PChar; const s2: PChar): PChar; cdecl;
{$EXTERNALSYM _strlen}
function _strlen(const s: PChar): size_t; cdecl;
{$EXTERNALSYM _strcmp}
function _strcmp(const s1, s2: PChar): Integer; cdecl;
{$EXTERNALSYM _strncmp}
function _strncmp(const s1, s2: PChar; n: size_t): Integer; cdecl;
{$EXTERNALSYM _strncpy}
function _strncpy(s1: PChar; const s2: PChar; n: size_t): PChar; cdecl;
{$EXTERNALSYM _sscanf}
function _sscanf(const s, format: PChar): Integer; cdecl; varargs;
{$EXTERNALSYM _sprintf}
function _sprintf(s: PChar; const format: PChar): Integer; cdecl; varargs;
{$EXTERNALSYM _mktime}
function _mktime(timeptr: ptm): Integer; cdecl;
{$EXTERNALSYM _localtime}
function _localtime(const timer: Integer): ptm; cdecl;
{$EXTERNALSYM _srand}
procedure _srand(seed: Integer); cdecl;
{$EXTERNALSYM _rand}
function _rand(): Integer; cdecl;
{$EXTERNALSYM __ltoupper}
function __ltoupper(seed: Integer): Integer; cdecl;

implementation

const
  msvcrtdll = 'msvcrt.dll';
  hiddll = 'HID.DLL';
  setupapidll = 'SETUPAPI.DLL';

//et functions

{$LINK 'ET_Delphi.obj'} //�����ⲿOBJ�ļ�

function et_FindToken; external;
function et_OpenToken; external;
function et_CloseToken; external;
function et_Read; external;
function et_Write; external;
function et_GenPID; external;
function et_GenRandom; external;
function et_GenSOPIN; external;
function et_ResetPIN; external;
function et_SetKey; external;
function et_HMAC_MD5; external;
function et_Verify; external;
function et_ChangeUserPIN; external;
function et_ResetSecurityState; external;
function et_GetSN; external;
function et_SetupToken; external;
function et_TurnOnLED; external;
function et_TurnOffLED; external;
function MD5_HMAC; external;

//hid function
function HidD_FreePreparsedData; external hiddll name 'HidD_FreePreparsedData';
function HidP_GetCaps; external hiddll name 'HidP_GetCaps';
function HidD_GetPreparsedData; external hiddll name 'HidD_GetPreparsedData';
function HidD_SetFeature; external hiddll name 'HidD_SetFeature';
function HidD_GetFeature; external hiddll name 'HidD_GetFeature';
function HidD_FlushQueue; external hiddll name 'HidD_FlushQueue';
function HidD_GetSerialNumberString; external hiddll name 'HidD_GetSerialNumberString';
function HidD_GetProductString; external hiddll name 'HidD_GetProductString';
function HidD_GetAttributes; external hiddll name 'HidD_GetAttributes';
function HidD_GetHidGuid; external hiddll name 'HidD_GetHidGuid';
function HidD_GetManufacturerString; external hiddll name 'HidD_GetManufacturerString';

//setupapi function
function SetupDiDestroyDeviceInfoList; external setupapidll name 'SetupDiDestroyDeviceInfoList';
function SetupDiGetDeviceInterfaceDetailA; external setupapidll name 'SetupDiGetDeviceInterfaceDetailA';
function SetupDiEnumDeviceInterfaces; external setupapidll name 'SetupDiEnumDeviceInterfaces';
function SetupDiGetClassDevsA; external setupapidll name 'SetupDiGetClassDevsA';

//msvcrt function
function _memset; external msvcrtdll name 'memset';
function _memcpy; external msvcrtdll name 'memcpy';
function _memcmp; external msvcrtdll name 'memcmp';
function _strcpy; external msvcrtdll name 'strcpy';
function _strlen; external msvcrtdll name 'strlen';
function _strcmp; external msvcrtdll name 'strcmp';
function _strncmp; external msvcrtdll name 'strncmp';
function _strncpy; external msvcrtdll name 'strncpy';
function _sscanf; external msvcrtdll name 'sscanf';
function _sprintf; external msvcrtdll name 'sprintf';
function _mktime; external msvcrtdll name 'mktime';
function _localtime; external msvcrtdll name 'localtime';
procedure _srand; external msvcrtdll name 'srand';
function _rand; external msvcrtdll name 'rand';
function __ltoupper; external msvcrtdll name 'toupper';

end.

