unit VC404;

interface

uses
  Windows;

const
  DLL_SA7134CAPTURE = 'Sa7134Capture.dll';
  DLL_CAPTUREPICTURE = 'CapturePicture.dll';

  BrightnessDefault: longword = $80;
  ContrastDefault: longword = $46; // $44;
  SaturationDefault: longword = $44; //$40;
  HueDefault: longword = $00;
  SharpnessDefault: longword = $01; //$00;

  MIN_VAMP_BRIGHTNESS_UNITS = 0;
  MAX_VAMP_BRIGHTNESS_UNITS = 255;

  MIN_VAMP_CONTRAST_UNITS = -128;
  MAX_VAMP_CONTRAST_UNITS = 127;

  MIN_VAMP_HUE_UNITS = -128;
  MAX_VAMP_HUE_UNITS = 127;

  MIN_VAMP_SATURATION_UNITS = -128;
  MAX_VAMP_SATURATION_UNITS = 127;

  MIN_VAMP_SHARPNESS_UNITS = -8;
  MAX_VAMP_SHARPNESS_UNITS = 7;

  //---- error define area
  ERR_VC404_OK = 0; // no error,success
  ERR_VC404_NODEVICEFOUND = 1; // no device found in system
  ERR_VC404_UNSUPPORTFUNC = 2; // unsupport func tempro?
  ERR_VC404_ALLOCRESOURCE = 3; // alloc resource error
  ERR_VC404_INITDIRECTDRAW = 4; // Init Directdraw error
  ERR_VC404_INITDIRECTSOUND = 5; // Init Directdraw error
  ERR_VC404_NOT_10MOONSDEV = 6; // it is not device of 10Moons

  //NEW_DATE_TIME				        = 'NEW_DATE_TIME';

type
  TColorControl =
    (
    BRIGHTNESS = 0, // control for brightness
    CONTRAST = 1, // control for contrast
    SATURATION = 2, // control for saturation
    HUE = 3, // control for hue
    SHARPNESS = 4 // control for sharpness
    );

  TColorDeviceType =
    (
    COLOR_DECODER = 0, //������(������ƵԤ������Ƶ����)
    COLOR_PREVIEW = 1, //��ƵԤ��
    COLOR_CAPTURE = 2 //��Ƶ����
    );
  TDisplayType =
    (
    NOT_DISPLAY = 0,
    PCI_VIEDOMEMORY = 1, // AGP VGA card
    PCI_MEMORY_VIDEOMEMORY = 2, // PCI-E VGA card
    OFF_SCREEN = 3
    );

  TCOMPRESSMODE =
    (
    XVID_CBR_MODE = 0,
    XVID_VBR_MODE = 1 //,
    );
  TEventType =
    (
    VID_CAPTURE_EVENT = 0,
    AUD_CAPTURE_EVENT1 = 1,
    AUD_CAPTURE_EVENT2 = 2,
    IO_ALERT_EVENT = 3,
    MOTION_DETECT = 4
    );

  TColorFormat =
    (
    RGB32 = $0,
    RGB24 = $1,
    RGB16 = $2,
    RGB15 = $3,
    YUY2 = $4,
    BTYUV = $5,
    Y8 = $6,
    RGB8 = $7,
    PL422 = $8,
    PL411 = $9,
    YUV12 = $A,
    YUV9 = $B,
    RAW = $E
    );

  TCapModel =
    (
    CAP_NULL_STREAM = 0, //������Ч
    CAP_ORIGIN_STREAM = 1, //	/*ԭʼ���ص�*/
    CAP_MPEG4_STREAM = 2, ///*Mpeg4��*/
    CAP_MPEG4_XVID_STREAM = 3,
    CAP_ORIGIN_MPEG4_STREAM = 4,
    CAP_ORIGIN_XVID_STREAM = 5,
    CAP_WMV9_STREAM = 6,
    CAP_ORIGIN_WMV9_STREAM = 7
    );

  TMP4Model =
    (
    MPEG4_AVIFILE_ONLY = 0, // ��ΪMPEG�ļ�
    MPEG4_CALLBACK_ONLY = 1, // MPEG���ݻص�
    MPEG4_AVIFILE_CALLBACK = 2 // ��ΪMPEG�ļ����ص�
    );

  TFieldFrequency =
    (// Field frequency
    FIELD_FREQ_50HZ = 0, // source is 50 Hz (PAL)
    FIELD_FREQ_60HZ = 1, // source is 60 Hz (NTSC)
    FIELD_FREQ_0HZ = 2, // source is 0 Hz   (NO SIGNL)
    FIELD_FREQ_50HZ_NULL = 3,
    FIELD_FREQ_60HZ_NULL = 4
    );

  TVoltageLevel =
    (// ��ƽ�ȼ�
    HIGH_VOLTAGE = 0, // �ߵ�ƽ
    LOW_VOLTAGE = 1 // �͵�ƽ
    );

  TVideoStandard = (
    VideoStandard_None = $00000000,
    VideoStandard_NTSC_M = $00000001,
    VideoStandard_NTSC_M_J = $00000002,
    VideoStandard_NTSC_433 = $00000004,
    VideoStandard_PAL_B = $00000010,
    VideoStandard_PAL_D = $00000020,
    VideoStandard_PAL_H = $00000080,
    VideoStandard_PAL_I = $00000100,
    VideoStandard_PAL_M = $00000200,
    VideoStandard_PAL_N = $00000400,
    VideoStandard_PAL_60 = $00000800,
    VideoStandard_SECAM_B = $00001000,
    VideoStandard_SECAM_D = $00002000,
    VideoStandard_SECAM_G = $00004000,
    VideoStandard_SECAM_H = $00008000,
    VideoStandard_SECAM_K = $00010000,
    VideoStandard_SECAM_K1 = $00020000,
    VideoStandard_SECAM_L = $00040000,
    VideoStandard_SECAM_L1 = $00080000
    );


  TOSD_DATE_TIME_TYPE =
    (
    OSD_DATE = 0, //��������
    OSD_TIME = 1, //ʱ������
    OSD_DATE_TIME = 2 //�������� + ʱ������
    );
  {
  POSDParam = ^TOSDParam;
  TOSDParam = record
    // EnableOSD: LongBool;                // �Ƿ�������� FALSE�������� TRUE������
    // Type: OSDType;                      // �������� 0���ı����� 1���������� 2��ʱ������
    // Text: array[0..255] of char;        // �����ı�
    Hight: longword; // �ַ��߶�
    Width: longword; // �ַ����
    Weight: longword; // �ַ���ϸ
    Spacing: longword; // �ַ����
    Italic: LongBool; // б��
    UnderLine: LongBool; // �»���
    StrikeOut: LongBool; // ɾ����
    Transparent: LongBool; // �����Ƿ�͸����������͸��ʱ�����ַ���Ե�����б���ɫ����ɫ���뽫����ɫ��Ϊ�����������ɫ������ʹ��ɫ������
    BkColor: COLORREF; // ����ɫ
    TextColor: COLORREF; // ǰ��ɫ
    FaceName: array[0..32] of char; // ������  TCHAR[32]
    // TopLeft: TPoint;                    // �����ı��󶥵�λ�ã����񴰿��У�
  end;
  POSDParam = ^TOSDParam;
  }
  pOSDPARAM = ^OSDPARAM;
  OSDPARAM = packed record
    cfHeight: Longword; //�ַ��߶�
    cfWidth: Longword; //�ַ����
    cfWeight: Longword; //�ַ���ϸ
    cfSpacing: Longword; //�ַ����
    cfItalic: longword; //б��
    cfUnderline: longword; //�»���
    cfStrikeOut: longword; //ɾ����
    bTransparent: longword; //͸��
    cfBkColor: TCOLORREF; //����ɫ COLORREF
    cfTextColor: TCOLORREF; //ǰ��ɫ COLORREF
    cfFaceName: array[0..31] of char; //������[32]TCHAR
  end;

  OSD_INFO = packed record
    OSDParam: OSDPARAM; //
    cfEnableOSD: Boolean; //BOOL
    cfText: array[0..255] of char; //[256]TCHAR
    cfTransparent: Boolean; // BOOL
    cfTopLeft: TPoint; //  POINT
  end;

  Device_Info = record
    bCapStart: Boolean; // BOOL
    dwCard: Longword; //DWORD
    dwCapTime: Longword; // DWORD
    dwRealFrameRate: Longword; // DWORD
    dwCapHeight: Longword; //DWORD
    dwCapWeight: Longword; //DWORD
    dwFrameRate: Longword; //DWORD
    dwSwitchFreq: Longword; //DWORD
    dwBitRate: Longword; //DWORD
    dwKeyFrmInterval: Longword; // DWORD
    enVidCapModel: Longword; //CAPMODEL -----168
    enVidMpegModel: Longword; // MP4MODEL
    enAudCapModel: Longword; //CAPMODEL
    enAudMpegModel: Longword; //MP4MODEL
    dwSharpness: Longword; //DWORD
    dwSaturation: Longword; //DWORD
    dwHue: Longword; //DWORD
    dwContrast: Longword; // DWORD
    dwBrightness: Longword; //DWORD
    bNetTrans: Boolean; // BOOL
    bFrameRateReduction: Boolean; // BOOL
    bMotionDetect: Boolean; //BOOL
    dwQuantizer: Longword; //DWORD
      //DWORD			dwMotionPrecision;
    enCompessMode: Longword; // COMPRESSMODE
    dwVBRPeakrate: Longword; //DWORD
    dwVBRMaxrate: Longword; //DWORD
    bPrev: Boolean; // BOOL
      //BOOL	bIOLowLevelIn;
      //BOOL	bFirstIoAlert;
  end;
  pDevice_Info = ^Device_Info;
  (*
    1���������� �� 2��ʱ������ �Ƚ����⣬Ϊ�������Ƶ������ӵ�Ч��,ÿ·��Ƶ����
    ���������ͺ�ʱ�����͹�������������

    Hight: longword;                    // �ַ��߶�
    Width: longword;                    // �ַ����
    Weight: longword;                   // �ַ���ϸ
    Spacing: longword;                  // �ַ����
    Italic: LongBool;                   // б��
    UnderLine: LongBool;                // �»���
    StrikeOut: LongBool;                // ɾ����
    BkColor: COLORREF;                  // ����ɫ
    TextColor: COLORREF;                // ǰ��ɫ
    FaceName: array[0..31] of char;     // ������

    �������ı�Ϊ"NEW_DATE_TIME", ʱ��ʾÿ·�������������������ͺ�ʱ������,��ʱÿ
    ·��Ƶ����ֹͣʱ�򲶻���ͣʱ������Ч
  *)


  //---- call back functions define
  // ��̬���ص�
  TPrcCbMotionDetect = procedure(ACard: longword; AMove: LongBool; AContext: pointer); stdcall;

  // ��Ƶ����ԭʼ���ݻص�
  TPrcVidCapCallBack = procedure(ACard: longword; ABuf: PByte; ASize: longword); stdcall;

  // ��ƵMPEGѹ�����ݻص�
  TPrcVidMpegCallBack = procedure(ACard: longword; ABuf: PByte; ASize: longword; AIsKeyFrm: LongBool); stdcall;

  // ��Ƶ������̳���ص�
  TPrcVidSaveErrCallBack = procedure(ACard: longword); stdcall;

  // ��Ƶ������Ļ���ӳ���ص�
  TPrcVidOSDErrCallBack = procedure(ACard: longword; OSDNum: longword); stdcall;

  // ��Ƶ����ԭʼ���ݻص�
  TPrcAudCapCallBack = procedure(ACard: longword; ABuf: PByte; ASize: longword); stdcall;

  // ��ƵMPEGѹ�����ݻص�
  TPrcAudMpegCallBack = procedure(ACard: longword; ABuf: PByte; ASize: longword); stdcall;

  // ��Ƶ������̳���ص�
  TPrcAudSaveErrCallBack = procedure(ACard: longword); stdcall;

  // IO�����ص�
  TPrcIoAlertCallBack = procedure(ACard: longword); stdcall;


  //---- �ص�������ע�ắ��
  // ע����Ƶ����ԭʼ���ݻص�

function VCARegVidCapCallBack(ACard: longword; AFunc: TPrcVidCapCallBack): longbool; stdcall; external DLL_SA7134CAPTURE;

  // ע����ƵMPEGѹ�����ݻص�
function VCARegVidMpegCallBack(ACard: longword; AFunc: TPrcVidMpegCallBack): longbool; stdcall; external DLL_SA7134CAPTURE;

  // ע����Ƶ������̳���ص�
function VCARegVidSaveErrCallBack(ACard: longword; AFunc: TPrcVidSaveErrCallBack): longbool; stdcall; external DLL_SA7134CAPTURE;

  // ע����Ƶ������Ļ���ӳ���ص�
function VCARegVidOSDErrCallBack(ACard: longword; AFunc: TPrcVidOSDErrCallBack): longbool; stdcall; external DLL_SA7134CAPTURE;

  // ע����Ƶ����ԭʼ���ݻص�
function VCARegAudCapCallBack(ACard: longword; AFunc: TPrcAudCapCallBack): longbool; stdcall; external DLL_SA7134CAPTURE;

  // ע����ƵMPEGѹ�����ݻص�
function VCARegAudMpegCallBack(ACard: longword; AFunc: TPrcAudMpegCallBack): longbool; stdcall; external DLL_SA7134CAPTURE;

  // ע����ƵƵ������̳���ص�
function VCARegAudSaveErrCallBack(ACard: longword; AFunc: TPrcAudSaveErrCallBack): longbool; stdcall; external DLL_SA7134CAPTURE;

  // ע��IO�����ص�
function VCARegIoAlertCallBack(ACard: longword; AFunc: TPrcIoAlertCallBack): longbool; stdcall; external DLL_SA7134CAPTURE;

  //---- dll export functions
  // ���ô������
procedure VCASetLastError(AErrNo: longword); stdcall; external DLL_SA7134CAPTURE;

  // �õ��������
function VCAGetLastError(): longword; stdcall; external DLL_SA7134CAPTURE;

  // ��ʼ��SDK
function VCAInitSdk(AMainWnd: HWND; ADisplay: TDisplayType; bInitAudDev: longbool): longbool; stdcall; external DLL_SA7134CAPTURE;

  // �ͷ�SDK��Դ
procedure VCAUnInitSdk(); stdcall; external DLL_SA7134CAPTURE;

  // �õ��豸����
function VCAGetDevNum(): longword; stdcall; external DLL_SA7134CAPTURE;

  // ���豸
function VCAOpenDevice(ACard: longword; APreviewWnd: HWND): longbool; stdcall; external DLL_SA7134CAPTURE;
  // ACard: ��0��ʼ

  // �ر��豸
function VCACloseDevice(ACard: longword): longbool; stdcall; external DLL_SA7134CAPTURE;
  //������ƵԤ���ߴ�
  //  function VCASetVidPreviewSize(ACard: longword,Card: dwWidth,dwHeight: longword): longbool; stdcall; external DLL_SA7134CAPTURE;
  // ��ʼ��ƵԤ��
function VCAStartVideoPreview(ACard: longword): longbool; stdcall; external DLL_SA7134CAPTURE;

  // ֹͣ��ƵԤ��
function VCAStopVideoPreview(ACard: longword): longbool; stdcall; external DLL_SA7134CAPTURE;

  //����overlay���ڣ���overlay���ھ���ı��ߴ硢λ�øı�ʱ���ã�overlay���ھ��ǰ�����·��ʾС���ڵĴ󴰿ڡ�
  //overlay���ڱ�����һ������·��ʾС���ڱ�����������ڲ���
function VCAUpdateOverlayWnd(hOverlayWnd: HWND): Boolean; stdcall; external DLL_SA7134CAPTURE;

  // ������ƵԤ���������Ѿ��ı�����ʾ���ڵĳߴ磬�������ʾ�ֱ���Ϊ��ǰ���ڵĴ�С����ı�����ʾ����ʱ�����á�
function VCAUpdateVideoPreview(ACard: longword; hPreviewWnd: HWND): longbool; stdcall; external DLL_SA7134CAPTURE;

  // OVERLAY���߼������û������ӳ�䣬�����Ѿ��ı�����ʾ���ڵĳߴ��λ�ã������뵱ǰ�ı���ʾ�ֱ��ʣ�ʱ���á�
function VCAResetMapRegion(ASrcRect: PRect; ADesRect: PRect): longbool; stdcall; external DLL_SA7134CAPTURE;

  // ������ƵԤ��ɫ��
  // function VCASetVidDisplayColor(ACard: longword; ACtlType: TColorControl; AValue: longword): longbool: stdcall; external DLL_SA7134CAPTURE;
  //������ƵԤ���ߴ�
  //function VCASetVidCapSize(ACard: longword; dwWidth: longword; dwHeight: longword): longbool; stdcall; external DLL_SA7134CAPTURE;

  // WINAPI VCASetVidPreviewSize( DWORD dwCard, DWORD dwWidth, DWORD dwHeight )
  // ����������ݵ���Ӧ�Ļ�����
function VCASaveBitsToBuf(ACard: longword; ADestBuf: TPoint; var AWidth, AHeight: longword): longbool; stdcall; external DLL_SA7134CAPTURE;

  // �������ΪJPEG�ļ�
function VCASaveAsJpegFile(ACard: longword; AFileName: PChar; AQuality: longword): longbool; stdcall; external DLL_SA7134CAPTURE;

  // �������ΪBMP�ļ�
function VCASaveAsBmpFile(ACard: longword; AFileName: PChar): longbool; stdcall; external DLL_SA7134CAPTURE;

  // ��ʼ��Ƶ����
function VCAStartVideoCapture(ACard: longword; ACapMode: longword; AMp4Mode: longword;
  AFileName: PChar): longbool; stdcall; external DLL_SA7134CAPTURE;

  // ֹͣ��Ƶ����
function VCAStopVideoCapture(ACard: longword): longbool; stdcall; external DLL_SA7134CAPTURE;

  // ������Ƶ����ߴ�
function VCASetVidCapSize(ACard: longword; AWidth, AHeight: longword): longbool; stdcall; external DLL_SA7134CAPTURE;

  // �õ���Ƶ����ߴ�
function VCAGetVidCapSize(ACard: longword; var AWidth, AHeight: longword): longbool; stdcall; external DLL_SA7134CAPTURE;
  //������Ƶ��ʽ
function VCASetVidFieldFrq(ACard: longword; eVidSourceFieldRate: TFieldFrequency): longbool; stdcall; external DLL_SA7134CAPTURE;

function VCASetVidCapFrameRate(ACard: longword; AFrameRate: longword; AFrameRateReduction: longbool = false): longbool; stdcall; external DLL_SA7134CAPTURE;

  //����MPEG4_XVIDѹ�������� dwQuantizer: 1 ~ 31 (1Ϊ��С���ȣ�ѹ���������); dwMotionPrecision: 0 ~ 6 (0��С�˶�����)
function VCASetXVIDQuality(dwCard: Longword; dwQuantizer: Longword; dwMotionPrecision: Longword): boolean; stdcall; external 'Sa7134Capture.dll' name 'VCASetXVIDQuality';
function VCASetXVIDCompressMode(dwCard: Longword; enCompessMode: Longword): boolean; stdcall; external 'Sa7134Capture.dll' name 'VCASetXVIDCompressMode';
  // ����MPEGѹ����λ��,��Χ:56KBPS ~ 10MBPS
function VCASetBitRate(ACard: longword; ABitRate: longword): longbool; stdcall; external DLL_SA7134CAPTURE;

  // ����MPEGѹ���Ĺؼ�֡�����������ڵ���֡��
function VCASetKeyFrmInterval(ACard: longword; AKeyFrmInterval: longword): longbool; stdcall; external DLL_SA7134CAPTURE;

  // ���ö�̬��⣬��Ƶ����ֹͣʱ������Ч
function VCAEnableMotionDetect(ACard: longword;
  AEnableDetect: longbool; // �Ƿ�����̬���
  AAreaMap: PByte; // �˶�����ͼ
  ASizeOfMap: longword; // AAreaMap�ߴ�,��BYTEΪ��λ
  APersistTime: longword; // �������nPersistTime�벻������Ϊֹͣ 1-30s
  AContext: pointer; // ���������
  AOnObjectMove: TPrcCbMotionDetect // �˶�/ֹͣ�ص�����
  ): longbool; stdcall; external DLL_SA7134CAPTURE;

  // ������Ƶ����ɫ��
function VCASetVidCaptureColor(ACard: longword; ACtlType: TColorControl; AValue: longword): longbool; stdcall; external DLL_SA7134CAPTURE;

  // ������Ƶɫ��
function VCASetVidDeviceColor(ACard: longword; ACtlType: TColorControl; AValue: longword): longbool; stdcall; external DLL_SA7134CAPTURE;

  // �õ���ƵԴ����Ƶ��( 0HZ / 50HZ / 60HZ )��Ӧ( ���ź� / PAL�� / NTSC�� ), �ο�ö�ٱ��� TFieldFrequency
function VCAGetVidFieldFrq(ACard: longword; var AVidSourceFieldRate: TFieldFrequency): longbool; stdcall; external DLL_SA7134CAPTURE;

  // ��ʼ��Ƶ���������Ƶ����ʽΪMPEG4,��Ƶ����MPEG4��ʽ��ʼʱ��������Ч
function VCAStartAudioCapture(ACard: longword; ACapMode: TCapModel; AMp4Mode: longword): longbool; stdcall; external DLL_SA7134CAPTURE;

  // ������Ƶ���������,��dwCard >= 16 ʱ��Ϊ��������ʼ��Ƶ����ʱ��Ч
function VCASetAudioCardOutOn(ACard: longword): longbool; stdcall; external DLL_SA7134CAPTURE;


  // ֹͣ��Ƶ���������Ƶ����ʽΪMPEG4,��Ƶ����MPEG4��ʽ��ʼʱ��������Ч
function VCAStopAudioCapture(ACard: longword): longbool; stdcall; external DLL_SA7134CAPTURE;

  // ����IO���뱨����ǰ��ƽ
function VCASetIOAlertLevelIn(ACard: longword; ACurrentLevel: TVoltageLevel): longbool; stdcall; external DLL_SA7134CAPTURE;

  // ��ʼIO���뱨����enSpringLevelΪ������ƽ
function VCAStartIOAlertIn(ACard: longword; ASpringLevel: TVoltageLevel): longbool; stdcall; external DLL_SA7134CAPTURE;

  // ֹͣIO���뱨��
function VCAStopIOAlertIn(ACard: longword): longbool; stdcall; external DLL_SA7134CAPTURE;

  // IO�������
function VCAIOAlertOut(ACard: longword; ALevel: TVoltageLevel): longbool; stdcall; external DLL_SA7134CAPTURE;

  // ��ͣ������ͣ��Ƶ�������Ƶ����,�����ڿ��ٸı�����Ƶ�������ͺ��ļ��л���������Ƶ������Ļ����
function VCAPauseCapture(ACard: longword): longbool; stdcall; external DLL_SA7134CAPTURE;

  // ������Ƶ�����ı����ӣ���Ƶ����ֹͣʱ�򲶻���ͣʱ������Ч
function VCASetVidCapTextOSD(dwCard: Longword; bEnableOSD: longword; tcText: Pchar; var ptTopLeft: Tpoint; var MyOSDParm: OSDPARAM): boolean; stdcall; external 'Sa7134Capture.dll';

function VCASetVidCapDateTimeOSD(dwCard: Longword; bEnableOSD: longword; var ptTopLeft: tpoint): boolean; stdcall; external 'Sa7134Capture.dll';
    //������Ƶ������Ļ����                 OSDPARAM*
function VCASetVidCapDateTimeOSDParam(var pOSDParm: OSDPARAM): boolean; stdcall; external 'Sa7134Capture.dll';
    //������ƵMpeg����ص�
  // ��ʼ����Ƶ
function VCAInitVidDev(): longbool; stdcall; external DLL_SA7134CAPTURE;

  // ��ʼ����Ƶ
function VCAInitAudDev(): longbool; stdcall; external DLL_SA7134CAPTURE;

//---- DLL_CAPTUREPICTURE
function CaptureFileAsBmp(AFileName: PChar; AYUVBuf, ARGBBuf: PChar; AWidth, AHeight: longword): longword; stdcall; external DLL_CAPTUREPICTURE;

function CaptureFileAsJpeg(AFileName: PChar; AYUVBuf, ARGBBuf: PChar; AWidth, AHeight: longword; AQuality: longword): longword; stdcall; external DLL_CAPTUREPICTURE;

var
  Device_Inf: Device_Info;
  OSD_INFO1: OSD_INFO;
  OSD_INFO2: OSD_INFO;
  VideoSet: boolean;
  VideoRec: boolean;
  SnapPic: boolean;
  osdparameter: OSDPARAM;

implementation

end.

