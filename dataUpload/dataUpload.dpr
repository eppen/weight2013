program dataUpload;

uses
  ExceptionLog,
  Forms,
  main in 'main.pas' {MainForm},
  CommonUtil in 'CommonUtil.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '��̨�����ϴ�';
  Application.CreateForm(TUploadCloudForm, UploadCloudForm);
  Application.Run;
end.
