program upgradeAccess;

uses
  ExceptionLog,
  Forms,
  main in 'main.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '�������ݿ�����';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
