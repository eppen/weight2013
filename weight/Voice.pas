unit Voice;

interface

uses
  SysUtils, Classes, Controls, Forms,
  StdCtrls, Buttons, ExtCtrls;

type
  TVoiceForm = class(TForm)
    MemoVoiceList: TMemo;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VoiceForm: TVoiceForm;

implementation

uses Main;

{$R *.dfm}

procedure TVoiceForm.FormShow(Sender: TObject);
var sl: TStringList;
begin
  if not FileExists(ExtractFilePath(ParamStr(0)) + 'VoiceList.txt') then
  begin
    sl := TStringList.Create;
    try
      sl.Add('������ϣ����뿪��̨��');
      sl.Add('��Ϩ���³���');
      sl.Add('��ͣ����̨�м䣡');
      sl.Add('ף��һ·ƽ����');
      sl.Add('���ϳ�');
      sl.SaveToFile(ExtractFilePath(ParamStr(0)) + 'VoiceList.txt');
    finally
      sl.Free;
    end;
  end;
  MemoVoiceList.Lines.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'VoiceList.txt');
end;

procedure TVoiceForm.BitBtn1Click(Sender: TObject);
begin
  if not FileExists(ExtractFilePath(ParamStr(0)) + 'VoiceList.txt') then
    Exit;
  MemoVoiceList.Lines.SaveToFile(ExtractFilePath(ParamStr(0)) + 'VoiceList.txt');
  MainForm.loadVoiceList;
end;

end.

