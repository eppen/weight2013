unit MediaTran;

interface

uses
  Windows;

const
  DLL_MediaTransmit = 'MediaTransmit.dll';

type
  TusRole =
    (
    WORK_AS_SERVER,
    WORK_AS_CLIENT,
    WORK_AS_SUPPLY
    );
  TdwMode =
    (
    SAVE_VIDEO_DATA,
    SAVE_AUDIO_DATA
    );

  TMPEG4_VERSION =
    (
    MPEG4_V1,
    MPEG4_V2,
    MPEG4_V3,
    MPEG4_XVID,
    WMV9
    );

  VIDINFO = record
    dwWidth: longword;
    dwHeight: longword;
    nCompressor: TMPEG4_VERSION;
  end;

  PVIDINFO = ^VIDINFO;
 // callback function api
 //////////////////////////////////////////////////////////////////////////
  TEvCaptureAbnormity = procedure(nCallID: LongWord; nError: LongWord); stdcall;
  TEvInComingRequest = function(dwIp: longword; usPort: word; biCardNo: BYTE;
    biCmd: BYTE; lpInData: PBYTE; biInSize: word;
    lpOutData: pbyte; var biOutSize: word): BYTE; stdcall;

  TEvCmdRespond = procedure(nCallId: longword; biCmd: char; nResult: longword; pRetData: pbyte); stdcall;

 //server function api
////////////////////////////////////////////////////////////////////////////////////////////////////////
 ///ע�����ڽ�������Ļص�����
function MTARegNotifier(evNotifier: TEvInComingRequest): bool; stdcall; external DLL_MediaTransmit;
////��ʼ����������������Ӧϵͳ��Դ
function MTALoadLibrary(usLocalPort: word; usRole: TusRole): bool; stdcall; external DLL_MediaTransmit;
//// �ͷſ����������ϵͳ��Դ
procedure MTAFreeLibrary(); stdcall; external DLL_MediaTransmit;
////////������Ƶ����֡���ú�����ʵʱ����
function MTAWriteVideo(nCardNo: byte; pData: pbyte; lSize: longword; bIFrm: longbool): longbool; stdcall; external DLL_MediaTransmit;
///////  ��������ʱ��ʱ�䳤��
procedure MTASetRequestTimeOut(usTimeOut: word); stdcall; external DLL_MediaTransmit;

////////////////////////////////////////////////////////////////////////////////////////////
// client delphi api ////////////////////////////////////////////////////////////////
////������Ƶ��ʾ���ں�Overlay��ʾ����
function MTACreateVideoDevice(hParentWnd: HWND; hNotifyWnd: HWND;
  rect: TRect; nWidth: longword; nHeight: longword;
  nSpace: longword; bUseOverlay: longword): longword; stdcall; external DLL_MediaTransmit;
/////���������Դ
function MTANewCall(pRemoteIp: pchar; usRemotePortL: WORD; biCardNo: BYTE): longword; stdcall; external DLL_MediaTransmit;
/////////������У�����ý�崫�ͷ���
function MTAMakeCall(nCallID: Longword; biReqType: byte; bWANCall: boolean; lpSndData: pbyte;
  biSndSize: byte; hEventNotify: Thandle; evCallNotify: TEvCmdRespond): boolean; stdcall; external DLL_MediaTransmit;
///������У��ͷ�ϵͳ��Դ
procedure MTAClearCall(nCallId: longword; bWait: boolean); stdcall; external DLL_MediaTransmit;
//// �����ǿ��ֹͣһ·����
procedure MTADiscardCall(biCard: BYTE; dwRemoteIp: longword; usRemotePort: longword; bWait: boolean); stdcall; external DLL_MediaTransmit;
 ///// ������Ƶ���ڵ���ʾ�з�ģʽ
function MTASetSplitMode(nMode: longword): longword; stdcall; external DLL_MediaTransmit;
function MTAPageDown(): longword; stdcall; external DLL_MediaTransmit;
function MTAPageUp(): longword; stdcall; external DLL_MediaTransmit;
function MTAGetPageNo(): longword; stdcall; external DLL_MediaTransmit;
function MTASetVideoOut(nCallID: longword; nIndex: longword; pVidInfo: PVIDINFO): boolean; stdcall; external DLL_MediaTransmit;
procedure MTASetLastError(Errno: integer); stdcall; external DLL_MediaTransmit;
function MTAGetIndexByCallID(nCallID: longword): longword; stdcall; external DLL_MediaTransmit;
function MTAStartCapture(nCallID: LongWord; pFileName: PChar; dwMode: LongWord; evCapAbnormity: TEvCaptureAbnormity): LongWord; stdcall; external DLL_MediaTransmit;
procedure MTAStopCapture(Errno: integer); stdcall; external DLL_MediaTransmit;
function MTANewPlayBack(lpFileName: pchar): longword; stdcall; external DLL_MediaTransmit;
function MTAFreePalyBack(nPlayBackId: LongWord): LongWord; stdcall; external DLL_MediaTransmit;
function MTAOpenFile(nPlayBackID: LongWord; lpFileName: pchar): LongWord; stdcall; external DLL_MediaTransmit;
function MTACloseFile(nPlayBackID: LongWord): LongWord; stdcall; external DLL_MediaTransmit;
function MTAStartPlay(nPlayBackID: LongWord; dwMode: LongWord): LongWord; stdcall; external DLL_MediaTransmit;

//////////////////////////////////////////////////////////////////////////////////////////////////
var
  VideoInfo: VIDINFO;
  pVideoInfo: PVIDINFO;

implementation

end.

