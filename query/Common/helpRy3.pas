{**************************************************************************************
* Copyright (c)
* All rights reserved.
*
* FileName��
*
* History:
*  ------------------------------------------------------------
*  2009/08/20   modified
*
*******************************************************************************************}
unit helpRy3;

interface

uses
  Windows, WinSock, Nb30;

//������
const RY_SUCCESS = $00000000; // �����ɹ�
const RY_NOT_FOUND = $F0000001; // δ�ҵ�ָ�����豸
const RY_INVALID_PARAMETER = $F0000002; // ��������
const RY_COMM_ERROR = $F0000003; // ͨѶ����
const RY_INSUFFICIENT_BUFFER = $F0000004; // �������ռ䲻��
const RY_NO_LIST = $F0000005; // û���ҵ��豸�б�
const RY_DEVPIN_NOT_CHECK = $F0000006; // �����̿���û����֤
const RY_USERPIN_NOT_CHECK = $F0000007; // �û�����û����֤
const RY_RSA_FILE_FORMAT_ERROR = $F0000008; // RSA�ļ���ʽ����
const RY_DIR_NOT_FOUND = $F0000009; // Ŀ¼û���ҵ�
const RY_ACCESS_DENIED = $F000000A; // ���ʱ��ܾ�
const RY_ALREADY_INITIALIZED = $F000000B; // ��Ʒ�Ѿ���ʼ��
const RY_INCORRECT_PIN = $F0000C00; // ���벻��ȷ
const RY_DF_SIZE = $F000000D; // ָ����Ŀ¼�ռ��С����
const RY_FILE_EXIST = $F000000E; // �ļ��Ѵ���
const RY_UNSUPPORTED = $F000000F; // ���ܲ�֧�ֻ���δ�����ļ�ϵͳ
const RY_FILE_NOT_FOUND = $F0000010; // δ�ҵ�ָ�����ļ�
const RY_ALREADY_OPENED = $F0000011; // ���Ѿ�����
const RY_DIRECTORY_EXIST = $F0000012; // Ŀ¼�Ѵ���
const RY_CODE_RANGE = $F0000013; // ������ڴ��ַ���
const RY_INVALID_POINTER = $F0000014; // ����������ָ��
const RY_GENERAL_FILESYSTEM = $F0000015; // �����ļ�ϵͳ����
const RY_OFFSET_BEYOND = $F0000016; // �ļ�ƫ���������ļ���С
const RY_FILE_TYPE_MISMATCH = $F0000017; // �ļ����Ͳ�ƥ��
const RY_PIN_BLOCKED = $F0000018; // PIN������
const RY_INVALID_HANDLE = $F0000019; // ��Ч�ľ��
const RY_ERROR_UNKNOWN = $FFFFFFFF; // δ֪�Ĵ���


const RY_C51_SUCCESS = $00000000; //	�ɹ�
const RY_C51_UNKNOWN = $00000001; //	δ֪����
const RY_C51_INVALID_PARAMETER = $00000002; //	��Ч�Ĳ���
const RY_C51_INVALID_ADDRESS = $00000003; //	��Ч�ĵ�ַ,�������ַԽ��
const RY_C51_INVALID_SIZE = $00000004; //	��Ч�ĳ���
const RY_C51_FILE_NOT_FOUND = $00000005; //	�ļ�û�ҵ�
const RY_C51_ACCESS_DENIED = $00000006; //	�����ļ�ʧ��
const RY_C51_FILE_SELECT = $00000007; //	�ļ��򿪸����Ѵ�����
const RY_C51_INVALID_HANDLE = $00000008; //	��Ч���ļ����
const RY_C51_FILE_OUT_OF_RANGE = $00000009; //	�ļ���дԽ��
const RY_C51_FILE_TYPE_MISMATCH = $0000000A; //	�ļ����ڵ����Ͳ�ƥ��
const RY_C51_FILE_SIZE_MISMATCH = $0000000B; //	�ļ����ڵ����Ȳ�ƥ��
const RY_C51_NO_SPACE = $0000000C; //	�ļ��пռ䲻��
const RY_C51_FILE_EXIST = $0000000D; //	�ļ�����Ŀ¼�Ѵ���
const RY_C51_INVALID_KEY_FORMAT = $0000000E; //	��Ч��RSA��Կ�ļ���ʽ
const RY_C51_KEY_LEN_MISMATCH = $0000000F; //  �û��������Կ������ʵ�ʳ��Ȳ�ƥ��
const RY_C51_RSA_INVALID_KEY_FILE = $00000010; //	�ļ����Ͳ�����Ҫ��
const RY_C51_RSA_ENC_DEC_FAILED = $00000011; //	RSA���ܽ���ʧ��
const RY_C51_RSA_SIGN_VERI_FAILED = $00000012; //	RSAǩ����֤ʧ��
const RY_C51_SHA1 = $00000013; //  SHA1�������
const RY_C51_MD5 = $00000014; //  MD5�������
const RY_C51_INVALID_ADDERSS = $00000015; //  ��Ч���ڴ�ָ��
const RY_C51_EEPROM = $00000016; //  дEEPROM����

const ET_LED_ON = $1;
const ET_LED_OFF = $2;
const ET_LED_WINK = $3;

const FILE_TYPE_EXE = $0; //��ִ���ļ�
const FILE_TYPE_DATA = $1; //�����ļ�
const FILE_TYPE_RSA_PUBLIC = $2; //RSA ��Կ�ļ�
const FILE_TYPE_RSA_PRIVATE = $3; //RSA ˽Կ�ļ�

const FLAG_ENCODE = $0;
const FLAG_DECODE = $1;

const Data_TYPE_PubKey = $0; //��Կ����
const Data_TYPE_PriKey = $1; //˽Կ����
const Data_TYPE_EsKey = $2; //ES��Կ����
const Data_TYPE_Memory = $3; //8192�ֽ�������

type
  PWord = ^Word;
  PLongword = ^Longword;
  PHIDP_PREPARSED_DATA = ^Byte;
  PPHIDP_PREPARSED_DATA = ^PHIDP_PREPARSED_DATA;
  PCSTR = ^Char;
  PByte = ^Byte;
  psize_t = ^size_t;
  size_t = Cardinal;


//===============================================================================
//����RY3 (����VendorID�ִ�, ����ҵ���RY3��Ŀ)
function RY3_Find(pVendorID: PChar; pCount: Pinteger): integer; stdcall;
{$EXTERNALSYM RY3_Find}

//��ָ����Ŀ��RY3 (������Ŀ,����1,������)
function RY3_Open(pHandle: Pinteger; Item: integer): integer; stdcall;
{$EXTERNALSYM RY3_Open}

//�ر�RY3
function RY3_Close(handle: integer; IsReset: integer): integer; stdcall;
{$EXTERNALSYM RY3_Close}

//����VendorID
function RY3_SetVendorID(handle: integer; pSeed: PChar; len: integer; pOutVendorID: PChar): integer; stdcall;
{$EXTERNALSYM RY3_SetVendorID}

//��ȡӲ�����к�(���16�ֽڵ��ַ���)
function RY3_GetHardID(handle: integer; pbuf: PChar): integer; stdcall;
{$EXTERNALSYM RY3_GetHardID}

//��ȡ�����(lenָ����������������)
function RY3_GenRandom(handle: integer; len_need: integer; pOutbuf: PChar): integer; stdcall;
{$EXTERNALSYM RY3_GenRandom}

//��ȡ���пռ��С
function RY3_GetFreeSize(handle: integer; pSize: Pinteger): integer; stdcall;
{$EXTERNALSYM RY3_GetFreeSize}

//LED����
function RY3_LEDControl(handle: integer; flag: integer): integer; stdcall;
{$EXTERNALSYM RY3_LEDControl}

//У�鿪��������
//У��ɹ�ʱ���ص�RemainCount  0
//У��ʧ��ʱ���ص�RemainCount  0:������  1-254:ʣ�����  255:������
function RY3_VerifyDevPin(handle: integer; pInPin: PChar; pRemainCount: Pinteger): integer; stdcall;
{$EXTERNALSYM RY3_VerifyDevPin}

//���Ŀ���������(TryCountȡֵ��ΧΪ0-255, ����0��255��ʾ������)
function RY3_ChangeDevPin(handle: integer; pOldPin: PChar; pNewPin: PChar; TryCount: integer): integer; stdcall;
{$EXTERNALSYM RY3_ChangeDevPin}

//���洢��(0-8192�ֽ�)
function RY3_Read(handle: integer; offset: integer; pOutbuf: PByte; len: integer): integer; stdcall;
{$EXTERNALSYM RY3_Read}

//д�洢��(0-7168�ֽ�)
function RY3_Write(handle: integer; offset: integer; pInbuf: PByte; len: integer): integer; stdcall;
{$EXTERNALSYM RY3_Write}

//������д�洢��(0-8192�ֽ�)
function RY3_VendorWrite(handle: integer; offset: integer; pInbuf: PByte; len: integer): integer; stdcall;
{$EXTERNALSYM RY3_VendorWrite}

//���������ڴ���(0-32�ֽ�)
function RY3_ReadShare(handle: integer; offset: integer; pbuf: PByte; len: integer): integer; stdcall;
{$EXTERNALSYM RY3_ReadShare}

//д�������ڴ���(0-32�ֽ�)
function RY3_WriteShare(handle: integer; offset: integer; pbuf: PByte; len: integer): integer; stdcall;
{$EXTERNALSYM RY3_WriteShare}


//�����ļ�
function RY3_CreateFile(handle: integer; FileID: Word; Size: integer; Type1: integer): integer; stdcall;
{$EXTERNALSYM RY3_CreateFile}

//д�ļ�
function RY3_WriteFile(handle: integer; FileID: Word; offset: integer; pbuf: PByte; Size: integer): integer; stdcall;
{$EXTERNALSYM RY3_WriteFile}

//ִ���ļ�
function RY3_ExecuteFile(handle: integer; FileID: Word; pInBuf: PByte; InSize: integer; pOutBuf: PByte; pOutSize: PLongword): integer; stdcall;
{$EXTERNALSYM RY3_ExecuteFile}

//ɾ�������ļ�
function RY3_EraseAllFile(handle: integer): integer; stdcall;
{$EXTERNALSYM RY3_EraseAllFile}

//����RSA��˽Կ(kidȡֵ��Χ:0-8, ����0��ʾ������˽Կ��, 1-8Ϊ��ͨ��˽Կ��)
//pPubBakup�����140�ֽڵĹ�Կ������
//pPriBakup�����340�ֽڵ�˽Կ������
//pPubBakup��pPriBakupΪNULLʱ��ʾ������
function RY3_GenRsaKey(handle: integer; kid: integer; pPubBakup: PByte; pPriBakup: PByte): integer; stdcall;
{$EXTERNALSYM RY3_GenRsaKey}

//����RSA��˽Կ(kidȡֵ��Χ:0-8, ����0��ʾ������˽Կ��, 1-8Ϊ��ͨ��˽Կ��)
//pPubKey������140�ֽڵĹ�Կ��д��
//pPriKey������340�ֽڵ�˽Կ��д��
//pPubKey��pPriKeyΪNULLʱ��ʾ��д��
function RY3_SetRsaKey(handle: integer; kid: integer; pPubKey: PByte; pPriKey: PByte): integer; stdcall;
{$EXTERNALSYM RY3_SetRsaKey}

//��Կ�����㷨(kidȡֵ��Χ:1-8)
//�������ݳ��ȱ�����128��������
function RY3_PublicEncrypt(handle: integer; kid: integer; pBuf: PByte; len: integer): integer; stdcall;
{$EXTERNALSYM RY3_PublicEncrypt}

//˽Կ�����㷨(kidȡֵ��Χ:1-8)
//�������ݳ��ȱ�����128��������
function RY3_PrivateDecrypt(handle: integer; kid: integer; pBuf: PByte; len: integer): integer; stdcall;
{$EXTERNALSYM RY3_PrivateDecrypt}

//MD5ǩ���㷨
function RY3_MD5(handle: integer; pBuf: PByte; len: integer; pMD5: PByte): integer; stdcall;
{$EXTERNALSYM RY3_MD5}

//SHA1ǩ���㷨
function RY3_SHA1(handle: integer; pBuf: PByte; len: integer; pSHA1: PByte): integer; stdcall;
{$EXTERNALSYM RY3_SHA1}


//����ES�ӽ��ܵ���Կ,��Կ���ȹ̶�Ϊ16�ֽ�, (kidȡֵ��Χ:1-8)
function RY3_Set3DESKey(handle: integer; kid: integer; pKey: PByte): integer; stdcall;
{$EXTERNALSYM RY3_Set3DESKey}

//3DES�ӽ����㷨(kidȡֵ��Χ:1-8)
//�������ݳ��ȱ�����8��������
function RY3_3DES(handle: integer; kid: integer; flag: integer; pInBuf: PByte; len: integer): integer; stdcall;
{$EXTERNALSYM RY3_3DES}

//Զ������������������(pbuf����������Կ���ܵ�UpdateData���ݽṹ, len������128�ֽڵ�������)
function RY3_Update(handle: integer; pbuf: PByte; len: integer): integer; stdcall;
{$EXTERNALSYM RY3_Update}

//�����������ݰ�
//pLicSN:     ָ����������������Ӳ�����к�,���pLicSN=NULL��ʾ������Ӳ�����к�
//type:       Ҫ��������������
//kid_offset: Ҫ������������Ŀ��ƫ�Ƶ�ַ(Ϊ��Ŀʱ,ȡֵ��ΧΪ1-8, ��type=Data_TYPE_Memoryʱ,kid��ʾ8192��������ƫ�Ƶ�ַ)
//pbuf:       Ҫ���������ݵ�ַ
//len:        Ҫ���������ݳ���(ע:len����Ϊ140�ֽ�(��Կ����),340�ֽ�(˽Կ����),16�ֽ�(ES��Կ����))
//pUPubKey:   ָ��������Կ����
//pOutData:   ����������������ݰ�
//pOutLen:    ����������ݰ��ĳ���
function RY3_GenUpdatePacket(handle: integer; pLicSN: PChar; type1: integer; kid_offset: integer; pbuf: PByte; len: integer; pUPubKey: PByte; pOutData: PByte; pOutLen: PLongword): integer; stdcall;
{$EXTERNALSYM RY3_GenUpdatePacket}


type
  GUID = record
    Data1: Longword;
    Data2: Word;
    Data3: Word;
    Data4: array[0..7] of Byte;
  end;

  Array128 = array[0..127] of WORD;
  pArray128 = ^Array128;

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

  SP_DEVICE_INTERFACE_DETAIL_DATA_A = record
    cbSize: Longword;
    DevicePath: array[0..4096] of Char;
  end;

  PSP_DEVICE_INTERFACE_DETAIL_DATA_A = ^SP_DEVICE_INTERFACE_DETAIL_DATA_A;
  PSP_DEVICE_INTERFACE_DETAIL_DATA = ^SP_DEVICE_INTERFACE_DETAIL_DATA_A;

  SP_DEVINFO_DATA = record
    cbSize: Longword;
    ClassGuid: GUID;
    DevInst: Longword;
    Reserved: Longword;
  end;

  PSP_DEVINFO_DATA = ^SP_DEVINFO_DATA;
  Feature_Report = packed record
    id: Byte;
    command: array[0..4] of Byte;
    data: array[0..17] of Byte;
    CrcData: Byte;
  end;

  PFeature_Report = ^Feature_Report;

  Device_Descript = record
    device_path: array[0..255] of Char;
    device_handle: THandle;
    uid: Longword;
    hid: Longword;
    hver: Word;
    mutex: THandle;
    KeyPass: array[0..8] of char;
    Encrypt: integer;
  end;
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
function SetupDiGetDeviceInterfaceDetailA(DeviceInfoSet: THandle; DeviceInterfaceData: PSP_DEVICE_INTERFACE_DATA; DeviceInterfaceDetailData: PSP_DEVICE_INTERFACE_DETAIL_DATA_A; DeviceInterfaceDetailDataSize: Longword; RequiredSize: PLongword; DeviceInfoData: PSP_DEVINFO_DATA): Boolean; cdecl;
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
function _printf(const format: PChar): Integer; cdecl; varargs;
function _sprintf(s: PChar; const format: PChar): Integer; cdecl; varargs;
function _rand(): Integer; cdecl;
procedure _srand(val1: Integer); cdecl;

implementation

const
  msvcrtdll = 'msvcrt.dll';
  hiddll = 'HID.DLL';
  setupapidll = 'SETUPAPI.DLL';
  ws2_32dll = 'WS2_32.DLL';

{$LINK 'Rockey3_Delphi'} //�����ⲿOBJ�ļ�
function RY3_Find; external;
function RY3_Open; external;
function RY3_Close; external;
function RY3_SetVendorID; external;
function RY3_GetHardID; external;
function RY3_GenRandom; external;
function RY3_GetFreeSize; external;
function RY3_LEDControl; external;
function RY3_VerifyDevPin; external;
function RY3_ChangeDevPin; external;
function RY3_Read; external;
function RY3_Write; external;
function RY3_VendorWrite; external;
function RY3_ReadShare; external;
function RY3_WriteShare; external;
function RY3_CreateFile; external;
function RY3_WriteFile; external;
function RY3_ExecuteFile; external;
function RY3_EraseAllFile; external;
function RY3_GenRsaKey; external;
function RY3_SetRsaKey; external;
function RY3_PublicEncrypt; external;
function RY3_PrivateDecrypt; external;
function RY3_MD5; external;
function RY3_SHA1; external;
function RY3_Set3DESKey; external;
function RY3_3DES; external;
function RY3_Update; external;
function RY3_GenUpdatePacket; external;


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
function _printf; external msvcrtdll name 'printf';
function _sprintf; external msvcrtdll name 'sprintf';
function _rand; external msvcrtdll name 'rand';
procedure _srand; external msvcrtdll name 'srand';


end.

