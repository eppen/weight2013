unit DS104;

interface

uses Windows;

const
  DS104_DLL = 'DvrSdk.dll';

type VidComArray = array[0..127] of char;

//========================================================================
// DvrSdk.Dll API ���ýӿ�
//========================================================================

const
  //��Ƶ���������ݽṹ
  VSubType_RGB32 = $0;
  VSubType_RGB24 = $1;
  VSubType_RGB16 = $2;
  VSubType_RGB15 = $3;
  VSubType_YUY2 = $4;
  VSubType_BTYUV = $5;
  VSubType_Y8 = $6;
  VSubType_RGB8 = $7;
  VSubType_PL422 = $8;
  VSubType_PL411 = $9;
  VSubType_YUV12 = $A;
  VSubType_YUV9 = $B;
  VSubType_RAW = $E;
  //��Ƶ��ʽ���ݽṹ
  VStandard_NTSC = $1;
  VStandard_PAL = $3;
  VStandard_SECAM = $6;
  //¼����Ƶ��ʽ���ݽṹ
  VRecord_NTSC = $0;
  VRecord_PAL = $1;
  //��Ƶ�������ݽṹ
  VProperty_Brightness = $0;
  VProperty_Contrast = $1;
  VProperty_Hue = $2;
  VProperty_Saturation = $3;
  //

  //���� MPEG4 ��׽ʱ����ģʽ���ݽṹ
  MPEG4Mode_ToFile = 0; // ֻ�����ڲ�׽���ļ�
  MPEG4Mode_Both = 1; // ���Բ�׽���ļ�Ҳ������
  MPEG4Mode_ToTransmit = 2; // ֻ����������

  //  ��׽ģʽ����
  //  ���磺Ҫ��׽ֻ����Ƶ�� MPEG4 �ļ��Ͳ�׽����������Ϊ .WAV �ļ�����ʹ��
  //  ������CaptureMode_VO_MPEG4_FILE | CaptureMode_AO_WAV_FILE
  CaptureMode_VA_MPEG4_FILE = $FFFFFFFF; // ��׽����Ƶ���ϵ� MPEG4 �ļ�
  CaptureMode_VO_MPEG4_FILE = $FFF70000; // ��׽ֻ����Ƶ�� MPEG4 �ļ�
  CaptureMode_VO_YUY2_FILE = $FFF00000; // ��׽δѹ�� YUY2 �ļ�
  CaptureMode_VO_USER = $FF000000; // ����׽������Ƶ���ṩ���û�
  CaptureMode_AO_WAV_USER = $000000FF; // ����׽����δѹ����Ƶ���ṩ���û�
  CaptureMode_AO_ADPCM_USER = $00000FFF; // ����׽����ѹ����ƵADPCM���ṩ���û�
  CaptureMode_AO_WAV_FILE = $0000FFF7; // ��׽����������Ϊ .WAV �ļ�

  // MPEG4 ¼�Ʋ�������
type
  RecordMPEGPara = record
    RecProperty_BitRate: DWORD; // λ�� (��Χ��56KBPS ~ 10MBPS)
    RecProperty_KeyFrameInterval: DWORD; // �ؼ�֡��� (Ҫ�󣺴��ڵ���֡��)
    RecProperty_FrameRate: DWORD; // ֡�� (��Χ��1 ~ 25(PAL)/30(NTSC)֡)
    RecProperty_VStandard: integer; // ��Ƶ��ʽ (ȡֵ��0 ΪNTSC, 1 ΪPAL)
  end;
  PRecordMPEGPara = ^RecordMPEGPara;

// ϵͳ���� - ������DVR�豸ȫ�ֶѽ��г�ʼ��
function HxnDVR_Init(hWnd: THandle): DWORD; stdcall; external DS104_DLL name 'HxnDVR_Init';

// ϵͳ���� - ������DVR�豸ȫ�ֶ�ռ����Դ�����ͷ�
procedure HxnDVR_UnInit(); stdcall; external DS104_DLL name 'HxnDVR_UnInit';

//��ȡDVR�豸��ʵ��������
function HxnDVR_GetDeviceAmount(): DWORD; stdcall; external DS104_DLL name 'HxnDVR_GetDeviceAmount';

//ϵͳ���� - ����ָ�����ŵ�����Ƶ�豸, �ɶ�ε���ѡ����Ƶ����˿ں�
function HxnDVR_ConnectDevice(dwCardID: DWORD; m_Insel: Integer): Boolean; stdcall; external DS104_DLL name 'HxnDVR_ConnectDevice';

// ϵͳ���� - �жϵ�ǰ�豸�Ƿ��Ѿ�����
function HxnDVR_IsConnected(dwCardID: DWORD): boolean; stdcall; external DS104_DLL name 'HxnDVR_IsConnected';

// ϵͳ���� - �ر�ָ�����ŵ�����Ƶ�豸
procedure HxnDVR_DisconnectDevice(dwCardID: DWORD); stdcall; external DS104_DLL name 'HxnDVR_DisconnectDevice';

//���õ�ǰ�豸Ҫ��ʾ��Ƶ��ʽ
function HxnDVR_SetVStandard(dwCardID: DWORD; vformat: Integer): Boolean;
stdcall; external DS104_DLL name 'HxnDVR_SetVStandard';

// ϵͳ���� - ���ò�׽��Ƶ����(���ȡ��Աȶȡ�ɫ�ȡ����ͶȺ����(������)��)
function HxnDVR_SetVPropertyValue(dwCardID: DWORD; pro: DWORD; dwValue: DWORD): Boolean;
stdcall; external DS104_DLL name 'HxnDVR_SetVPropertyValue';

// ϵͳ���� - ��ȡ��׽��Ƶ�ߴ��С
procedure HxnDVR_GetVidCapSize(dwCardID: integer; lpdwCapWidth: PDWORD; lpdwCapHeight: PDWORD);
stdcall; external DS104_DLL name 'HxnDVR_GetVidCapSize';

// ϵͳ���� - ���ò�׽��Ƶ�ߴ��С
function HxnDVR_SetVidCapSize(dwCardID: DWORD; dwCapWidth: DWORD; dwCapHeight: DWORD): boolean;
stdcall; external DS104_DLL name 'HxnDVR_SetVidCapSize';

// ϵͳ���� - ��ȡ��ʾ��������Ƶ�ߴ��С (SDK7000 ��Ч)
procedure HxnDVR_GetVidPreSize(dwCardID: DWORD; lpdwCapWidth: PDWORD; lpdwCapHeight: PDWORD);
stdcall; external DS104_DLL name 'HxnDVR_GetVidPreSize';

// ϵͳ���� - ������ʾ��������Ƶ�ߴ��С (SDK7000 ��Ч)
function HxnDVR_SetVidPreSize(dwCardID: DWORD; dwCapWidth: DWORD; dwCapHeight: DWORD): boolean;
stdcall; external DS104_DLL name 'HxnDVR_SetVidPreSize';

// ϵͳ���� - ��ȡ��ǰʹ����Ƶѹ������ID��, �����ȵ��� HxnDVR_Init
function HxnDVR_GetCurrentCardID(RegID: string): boolean;
stdcall; external DS104_DLL name 'HxnDVR_GetCurrentCardID';

//ȷ���Ƿ���ʾָ�����ŵ���Ƶͼ��(����ʾ����½���������Ƶ�����䣬�ܽ�һ������ϵͳ��Դռ��)��
function HxnDVR_ShowWindow(dwCardId: DWORD; isShow: Boolean): Boolean;
stdcall; external DS104_DLL name 'HxnDVR_ShowWindow';

//��ֻ��Ҫ��ʾ��·�ߴ�߶ȴ���288��ʹ�ô˺�����
function HxnDVR_SetOneScreenAnomaly(dwCardId: DWORD; hWnd: THandle; rc: PRect): Boolean;
stdcall; external DS104_DLL name 'HxnDVR_SetOneScreenAnomaly';

//��ֻ��Ҫ��ʾ��·��Ƶʱ�������ÿ�ߴ�߶ȴ���288��ʹ�ô˺�����
function HxnDVR_SetFourScreenAnomaly(dwCardId1, dwCardId2, dwCardId3, dwCardId4: DWORD; hWnd: THandle; rc: PRect): Boolean;
stdcall; external DS104_DLL name 'HxnDVR_SetFourScreenAnomaly';

// ��ʾ���� - �趨ָ�����ŵ���Ƶͼ��λ�ã����� HxnDVR_ShowWindow �����Ƿ���ʾ
function HxnDVR_SetWindowPos(dwCardID: DWORD; hWnd: DWORD; rc: PRect): Boolean;
stdcall; external DS104_DLL name 'HxnDVR_SetWindowPos';

//ȫ����ʾ��ָ�������ʾָ�����ŵ���Ƶ�豸
function HxnDVR_SetFullScreen(dwCardID: DWORD; isFull: Boolean): Boolean;
stdcall; external DS104_DLL name 'HxnDVR_SetFullScreen';

// ��ʾ���� - ����Logo����(�糡��˵����)
function HxnDVR_SetLogoText(dwCardID: DWORD; szLogoText: string): boolean;
stdcall; external DS104_DLL name 'HxnDVR_SetLogoText';

// ��ʾ���� - ��ʾ������Logo
procedure HxnDVR_ShowLogo(dwCardID: DWORD; bShow: Boolean; x: integer; y: integer);
stdcall; external DS104_DLL name 'HxnDVR_ShowLogo';

// ��ʾ���� - ��ʾ������ʱ��
procedure HxnDVR_ShowTime(dwCardID: DWORD; bShow: Boolean; x: integer; y: integer);
stdcall; external DS104_DLL name 'HxnDVR_ShowTime';

// ��ʾ���� - ��ʾ����������
procedure HxnDVR_ShowDate(dwCardID: DWORD; bShow: boolean; x: integer; y: integer);
stdcall; external DS104_DLL name 'HxnDVR_ShowDate';

// ��ʾ���� - ������ʾ��ǿģʽ, ѡ��Χ(0,1,...14)
function HxnDVR_ShowInfocus(dwCardID: DWORD; iMode: integer): boolean;
stdcall; external DS104_DLL name 'HxnDVR_ShowInfocus';

// ��ʾ���� - ͼ��������ʾģʽ, ѡ��Χ(0,1,...14)
function HxnDVR_ShowInBlaze(dwCardID: DWORD; iMode: integer): boolean;
stdcall; external DS104_DLL name 'HxnDVR_ShowInBlaze';

// ¼���� - ����Ҫ¼�Ƶ��ļ����ƺͲ�׽ģʽ, ���� dwMode �ο���׽ģʽ����
function HxnDVR_SetCaptureFile(dwCardID: DWORD; filename: string; dwMode: DWORD): boolean;
stdcall; external DS104_DLL name 'HxnDVR_SetCaptureFile';

// ¼���� - ��ʼ��׽�����ļ�
function HxnDVR_StartCapture(dwCardID: DWORD): boolean;
stdcall; external DS104_DLL name 'HxnDVR_StartCapture';

// ¼���� - ֹͣ��׽�����ļ�
procedure HxnDVR_StopCapture(dwCardID: DWORD);
stdcall; external DS104_DLL name 'HxnDVR_StopCapture';

// ¼���� - �ж�ָ�����Ƿ����ڽ��в�׽
function HxnDVR_IsVideoCapture(dwCardID: DWORD): boolean;
stdcall; external DS104_DLL name 'HxnDVR_IsVideoCapture';

// ¼���� - ��ȡ MPEG4 ѹ������¼�Ʋ����Ͳ�׽ģʽ����
procedure HxnDVR_GetMPEG4Property(dwCardID: DWORD; mpgPara: PRecordMPEGPara; lpdwMode: PDWORD);
stdcall; external DS104_DLL name 'HxnDVR_GetMPEG4Property';

// ¼���� - ���� MPEG4 ѹ������¼�Ʋ����Ͳ�׽ģʽ����
procedure HxnDVR_SetMPEG4Property(dwCardID: DWORD; mpgPara: PRecordMPEGPara; dwMode: DWORD);
stdcall; external DS104_DLL name 'HxnDVR_SetMPEG4Property';

// ץͼ���� - ץ�� BMP ͼƬ
function HxnDVR_SaveToBmpFile(dwCardID: DWORD; filename: string): boolean;
stdcall; external DS104_DLL name 'HxnDVR_SaveToBmpFile';

// ץͼ���� - ץ�� JPG ͼƬ
function HxnDVR_SaveToJpgFile(dwCardID: DWORD; filename: string; dwQuality: DWORD): boolean;
stdcall; external DS104_DLL name 'HxnDVR_SaveToJpgFile';

// ץͼ���� - ��ͼ����������
function HxnDVR_CopyToClipboard(dwCardID: DWORD): boolean;
stdcall; external DS104_DLL name 'HxnDVR_CopyToClipboard';

//������̬���
function HxnDVR_StartMotionDetect(dwCardId: DWORD): Boolean;
stdcall; external DS104_DLL name 'HxnDVR_StartMotionDetect';

//ֹͣ��̬���
procedure HxnDVR_StopMotionDetect(dwCardId: DWORD);
stdcall; external DS104_DLL name 'HxnDVR_StopMotionDetec';

// ��ʾ���� - ������Ƶ��ʾ֡��
function HxnDVR_SetDisplayFrame(dwCardID: DWORD; iFrame: integer): boolean;
stdcall; external DS104_DLL name 'HxnDVR_SetDisplayFrame';

// ��ʾ���� - �жϵ�ǰͨ���Ƿ�����Ƶͼ������
function HxnDVR_IsVideoSignalLocked(dwCardID: DWORD): boolean;
stdcall; external DS104_DLL name 'HxnDVR_IsVideoSignalLocked';

// ϵͳ���� - ��̨����һ��ָ��WAV�ļ�
function HxnDVR_PlaySoundFromFile(m_hWnd: integer; // ���Ŵ��ھ��
  m_filename: string; // Ҫ���ŵ�WAV�ļ���
  dwPrimaryChannels: integer; // ��Ƶͨ�����磺2
  dwPrimaryFreq: integer; // Ƶ���磺22050
  dwPrimaryBitRate: integer // λ���磺16
  ): boolean;
stdcall; external DS104_DLL name 'HxnDVR_PlaySoundFromFile';

implementation

end.

