unit FT_RY1S_API;

interface

uses Windows;

const RS1SDLL = 'dog.DLL';

const RY1S_SUCCESS = $00; //����ִ�гɹ�
const RY1S_ACCESS_DENY = $01; //���ʱ��ܾ���Ȩ�޲���
const RY1S_COMMUNICATIONS_ERROR = $02; //ͨѶ����û�д��豸
const RY1S_INVALID_PARAMETER = $03; //��Ч�Ĳ�������������
const RY1S_NOT_SET_PID = $04; //û������PID
const RY1S_UNIT_NOT_FOUND = $05; //��ָ�����豸ʧ��
const RY1S_HARD_ERROR = $06; //Ӳ������
const RY1S_UNKNOWN = $07; //δ֪����
const RY1S_PIN_ERR_MASK = $0F; //��֤PIN������
const RY1S_PIN_ERR_MAX = $FF; //��֤PIN�����ʣ������������֤���󻹷���RY1S_PIN_ERR_MAX���ʾPIN����Զ����������

//define pin Flags
const RY1S_VERIFY_USERPIN = 0;
const RY1S_VERIFY_SOPIN = 1;

//define read/write flag
const RY1S_USER_WRITE_READ = 0;
const RY1S_USER_READ_ONLY = 1;

//�������õ�PID
const CONST_PID = 'FFFFFFFF';

type
  RY1S_HANDLE = Pointer;
  PRY1S_HANDLE = ^RY1S_HANDLE;

function RY1S_FindToken(pid: PChar; var count: Integer): Integer; stdcall; external RS1SDLL name 'RY1S_FindToken';

function RY1S_OpenToken(hHandle: PRY1S_HANDLE; pid: PChar; index: Integer): Integer; stdcall; external RS1SDLL name 'RY1S_OpenToken';

function RY1S_CloseToken(hHandle: RY1S_HANDLE): Integer; stdcall; external RS1SDLL name 'RY1S_CloseToken';

function RY1S_Read(hHandle: RY1S_HANDLE; offset: Word; Len: Integer; pucReadBuf: pchar): Integer; stdcall; external RS1SDLL name 'RY1S_Read';

function RY1S_Write(hHandle: RY1S_HANDLE; offset: Word; Len: Integer; pucWriteBuf: PByte): Integer; stdcall; external RS1SDLL name 'RY1S_Write';

function RY1S_GenPID(hHandle: RY1S_HANDLE; SeedLen: Integer; pucSeed: PByte; pid: pchar): Integer; stdcall; external RS1SDLL name 'RY1S_GenPID';

function RY1S_GenRandom(hHandle: RY1S_HANDLE; pucRandBuf: pchar): Integer; stdcall; external RS1SDLL name 'RY1S_GenRandom';

function RY1S_GenSOPIN(hHandle: RY1S_HANDLE; SeedLen: Integer; pucSeed: PByte; pucNewSoPIN: pchar): Integer; stdcall; external RS1SDLL name 'RY1S_GenSOPIN';

function RY1S_ResetPIN(hHandle: RY1S_HANDLE; pucSoPIN: pchar): Integer; stdcall; external RS1SDLL name 'RY1S_ResetPIN';

function RY1S_SetKey(hHandle: RY1S_HANDLE; Keyid: Integer; pucKeyBuf: pchar): Integer; stdcall; external RS1SDLL name 'RY1S_SetKey';

function RY1S_HMAC_MD5(hHandle: RY1S_HANDLE; keyID: Integer; textLen: Integer; pucText: pchar; digest: pchar): Integer; stdcall; external RS1SDLL name 'RY1S_HMAC_MD5';

function RY1S_Verify(hHandle: RY1S_HANDLE; Flags: Integer; pucPIN: pchar): Integer; stdcall; external RS1SDLL name 'RY1S_Verify';

function RY1S_ChangeUserPIN(hHandle: RY1S_HANDLE; pucOldPIN: pchar; pucNewPIN: pchar): Integer; stdcall; external RS1SDLL name 'RY1S_ChangeUserPIN';

function RY1S_ResetSecurityState(hHandle: RY1S_HANDLE): Integer; stdcall; external RS1SDLL name 'RY1S_ResetSecurityState';

function RY1S_GetSN(hHandle: RY1S_HANDLE; pucSN: pchar): Integer; stdcall; external RS1SDLL name 'RY1S_GetSN';

function RY1S_SetupToken(hHandle: RY1S_HANDLE; bSoPINRetries: Byte; bUserPINRetries: Byte; bUserReadOnly: Byte; bBack: Byte): Integer; stdcall; external RS1SDLL name 'RY1S_SetupToken';

function RY1S_TurnOnLED(hHandle: RY1S_HANDLE): Integer; stdcall; external RS1SDLL name 'RY1S_TurnOnLED';

function RY1S_TurnOffLED(hHandle: RY1S_HANDLE): Integer; stdcall; external RS1SDLL name 'RY1S_TurnOffLED';

function
  MD5_HMAC(pucText: PChar; //* pointer to data stream        */
  ulText_Len: integer; //* length of data stream         */
  pucKey: PChar; //* pointer to authentication key */
  ulKey_Len: Integer; //* length of authentication key  */
  pucToenKey: PChar; //* inner hashed key and  outer hashed key */
  pucDigest: PChar) //* caller digest to be filled in */
  : Integer; stdcall; external RS1SDLL name 'MD5_HMAC';

implementation

end.

