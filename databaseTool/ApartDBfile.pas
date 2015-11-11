unit ApartDBfile;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms,
   StdCtrls, ExtCtrls;
  // Dialogs,

type
  TApartDBfileForm = class(TForm)
    Panel1: TPanel;
    LabelDBName: TLabel;
    EditDBName: TComboBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditDBNameEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ApartDBfileForm: TApartDBfileForm;

implementation

uses DBDataModule;

{$R *.dfm}

procedure TApartDBfileForm.Button1Click(Sender: TObject);
var DBNameStr: string;
begin
  if Trim(EditDBName.Text) <> '' then
    DBNameStr := Trim(EditDBName.Text)
  else
  begin
    MessageBox(0, '�������ݿ�������Ϊ�գ����������룡', '����', MB_OK + MB_ICONWARNING);
    EditDBName.SetFocus;
    Exit;
  end;
  with DataModuleDB.ADOQueryAddDB do
  begin
    Close;
    SQL.Clear;
    SQL.Add('EXEC sp_detach_db @dbname=N' + #39 + DBNameStr + #39);
    try
      ExecSQL;
      MessageBox(0, PChar('���ݿ����ɹ���' + Char(13) + '�ѷ������ݿ⡾' + Trim(EditDBName.Text) + '����'), '��ʾ', MB_OK + MB_ICONINFORMATION);
      Close;
    except
      on E: Exception do
      begin
        MessageBox(0, PChar(E.Message), '����', MB_OK + MB_ICONWARNING);
        Exit;
      end;
    end;
  end;
end;

procedure TApartDBfileForm.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TApartDBfileForm.Button3Click(Sender: TObject);
begin
  with DataModuleDB.ADOQueryAddDB do
  begin
    Close;
    SQL.Clear;
    SQL.Add('dbcc shrinkdatabase (' + Trim(EditDBName.Text) + ', 20)');
    try
      ExecSQL;
      MessageBox(0, '���ݿ�ѹ���ɹ���', '��ʾ', MB_OK + MB_ICONINFORMATION);
    except
      on E: Exception do
        MessageBox(0, PChar(E.Message), '����', MB_OK + MB_ICONWARNING);
    end;
  end;
end;

procedure TApartDBfileForm.FormShow(Sender: TObject);
begin
  EditDBName.Items.Clear;
  with DataModuleDB.ADOQueryAddDB do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select name from sysdatabases');
    Open;
    First;
    while not Eof do
    begin
      EditDBName.Items.Add(FieldByName('name').asString);
      Next;
    end;
  end;
end;

procedure TApartDBfileForm.EditDBNameEnter(Sender: TObject);
begin
  EditDBName.Items.Clear;
  with DataModuleDB.ADOQueryAddDB do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select name from sysdatabases');
    Open;
    First;
    while not Eof do
    begin
      EditDBName.Items.Add(FieldByName('name').asString);
      Next;
    end;
  end;
end;

end.

