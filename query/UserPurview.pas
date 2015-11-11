unit UserPurview;

interface

uses
  Classes, Controls, Forms, StdCtrls, Windows,
  ExtCtrls, DBGridEh, Dialogs, GridsEh, ToolCtrlsEh,
  DBGridEhToolCtrls, DBAxisGridsEh, DBGridEhGrouping;

type
  TUserPurviewForm = class(TForm)
    DBGridEhUser: TDBGridEh;
    PTop: TPanel;
    PUser: TPanel;
    PAttrib: TPanel;
    GBLegal: TGroupBox;
    Label2: TLabel;
    EdtUser: TEdit;
    GBWeightData: TGroupBox;
    CBAddData: TCheckBox;
    CBModData: TCheckBox;
    CBDelData: TCheckBox;
    GBModify: TGroupBox;
    CBCar: TCheckBox;
    CBTare: TCheckBox;
    CBFaHuo: TCheckBox;
    CBBundle: TCheckBox;
    CBShouHuo: TCheckBox;
    CBPrice: TCheckBox;
    CBGoods: TCheckBox;
    CBScale: TCheckBox;
    CBSpec: TCheckBox;
    CBGross: TCheckBox;
    CBCost: TCheckBox;
    CBBackup6: TCheckBox;
    CBBackup1: TCheckBox;
    CBBackup7: TCheckBox;
    CBBackup2: TCheckBox;
    CBBackup8: TCheckBox;
    CBBackup3: TCheckBox;
    CBBackup9: TCheckBox;
    CBBackup4: TCheckBox;
    CBBackup5: TCheckBox;
    CBBackup15: TCheckBox;
    CBBackup10: TCheckBox;
    CBBackup16: TCheckBox;
    CBBackup11: TCheckBox;
    CBBackup17: TCheckBox;
    CBBackup12: TCheckBox;
    CBBackup18: TCheckBox;
    CBBackup13: TCheckBox;
    CBBackup14: TCheckBox;
    CBDataQuery: TCheckBox;
    GBEqua: TGroupBox;
    CBMeterSet: TCheckBox;
    CBVideoSet: TCheckBox;
    CBReaderSet: TCheckBox;
    CBIOSet: TCheckBox;
    CBScreenSet: TCheckBox;
    CBVoiceSet: TCheckBox;
    GBDatabase: TGroupBox;
    CBDataExport: TCheckBox;
    CBDataBackup: TCheckBox;
    CBDBSet: TCheckBox;
    CBDataClear: TCheckBox;
    CBDataInit: TCheckBox;
    GBSystem: TGroupBox;
    CBUser: TCheckBox;
    CBManualInput: TCheckBox;
    CBSystemSet: TCheckBox;
    CBFormSet: TCheckBox;
    GBData: TGroupBox;
    CBPrintReport: TCheckBox;
    CBModifyTicket: TCheckBox;
    CBPremaintain: TCheckBox;
    CBPrintTicket: TCheckBox;
    CBCard: TCheckBox;
    CBLog: TCheckBox;
    CBBackRecord: TCheckBox;
    CBDataImport: TCheckBox;
    BtnMod: TButton;
    BtnAdd: TButton;
    BtnCancel: TButton;
    BtnDel: TButton;
    BtnRefresh: TButton;
    BtnSave: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridEhUserCellClick(Column: TColumnEh);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnModClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure BtnRefreshClick(Sender: TObject);
    procedure CBModDataClick(Sender: TObject);
  private
    { Private declarations }
    User: string; //��������û�
    InsertOrModify: boolean; //Ϊ0ʱ�������,Ϊ1ʱ�����޸�
    Admin: boolean; //�ǹ���Ա
  public
    { Public declarations }
    //flagΪ0,��Ϊ��ʼδ������޸�״̬ʱ�ĸ���ť״̬;
    //Ϊ1��Ϊ���������޸�״̬��ĸ�����ť��״̬
    procedure SetBtnStatus(Flag: boolean);
    function getModCheck(): Boolean;
  end;

var
  UserPurviewForm: TUserPurviewForm;

implementation

uses QueryDM, Main, CommonUtil;
{$R *.dfm}

procedure TUserPurviewForm.SetBtnStatus(Flag: boolean);
begin
  BtnAdd.Enabled := not Flag;
  BtnMod.Enabled := not Flag;
  BtnSave.Enabled := Flag;
  BtnCancel.Enabled := Flag;
  EdtUser.Enabled := Flag;
  GBLegal.Enabled := Flag;
  DBGridEhUser.Enabled := not Flag;
end;

procedure TUserPurviewForm.FormShow(Sender: TObject);
begin
  with QueryDataModule.ADOQUser do
  begin
    Close;
    SQL.Text := 'select * from �û���Ϣ';
    Open;
    RecordSet.Properties.Get_Item('Update Criteria').Value := 0
  end;
  DBGridEhUser.DataSource := QueryDataModule.DSUser;
end;

procedure TUserPurviewForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DBGridEhUser.DataSource := nil;
end;

procedure TUserPurviewForm.DBGridEhUserCellClick(Column: TColumnEh);
begin
  with QueryDataModule.ADOQUser do
  begin
    User := FieldByName('�û���').AsString;
    EdtUser.Text := User;

    CBPremaintain.Checked := FieldByName('Ԥ��ά��').AsBoolean;
    CBCard.Checked := FieldByName('���Ź���').AsBoolean;
    CBLog.Checked := FieldByName('ϵͳ��־').AsBoolean;
    CBBackRecord.Checked := FieldByName('��̨��¼').AsBoolean;
    CBPrintTicket.Checked := FieldByName('��ӡ����').AsBoolean;
    CBModifyTicket.Checked := FieldByName('�޸İ���').AsBoolean;
    CBPrintReport.Checked := FieldByName('��ӡ����').AsBoolean;

    CBUser.Checked := FieldByName('�û�����').AsBoolean;
    CBSystemSet.Checked := FieldByName('ϵͳ����').AsBoolean;
    CBFormSet.Checked := FieldByName('��������').AsBoolean;
    CBManualInput.Checked := FieldByName('�ֹ�����').AsBoolean;

    CBDBSet.Checked := FieldByName('���ݿ�����').AsBoolean;
    CBDataBackup.Checked := FieldByName('���ݱ���').AsBoolean;
    CBDataImport.Checked := FieldByName('���ݵ���').AsBoolean;
    CBDataExport.Checked := FieldByName('���ݵ���').AsBoolean;
    CBDataClear.Checked := FieldByName('��������').AsBoolean;
    CBDataInit.Checked := FieldByName('���ݳ�ʼ��').AsBoolean;

    CBMeterSet.Checked := FieldByName('�Ǳ�����').AsBoolean;
    CBVideoSet.Checked := FieldByName('��Ƶ����').AsBoolean;
    CBReaderSet.Checked := FieldByName('����������').AsBoolean;
    CBIOSet.Checked := FieldByName('IOģ������').AsBoolean;
    CBScreenSet.Checked := FieldByName('����Ļ����').AsBoolean;
    CBVoiceSet.Checked := FieldByName('�������').AsBoolean;

    CBDataQuery.Checked := FieldByName('���ݲ�ѯ').AsBoolean;
    CBAddData.Checked := FieldByName('��Ӽ�¼').AsBoolean;
    CBDelData.Checked := FieldByName('ɾ����¼').AsBoolean;

    CBCar.Checked := FieldByName('�޸ĳ���').AsBoolean;
    CBFaHuo.Checked := FieldByName('�޸ķ�����λ').AsBoolean;
    CBShouHuo.Checked := FieldByName('�޸��ջ���λ').AsBoolean;
    CBGoods.Checked := FieldByName('�޸Ļ���').AsBoolean;
    CBSpec.Checked := FieldByName('�޸Ĺ��').AsBoolean;
    CBGross.Checked := FieldByName('�޸�ë��').AsBoolean;
    CBTare.Checked := FieldByName('�޸�Ƥ��').AsBoolean;
    CBBundle.Checked := FieldByName('�޸Ŀ���').AsBoolean;
    CBPrice.Checked := FieldByName('�޸ĵ���').AsBoolean;
    CBScale.Checked := FieldByName('�޸��۷�ϵ��').AsBoolean;
    CBCost.Checked := FieldByName('�޸Ĺ�����').AsBoolean;
    CBBackup1.Checked := FieldByName('�޸ı���1').AsBoolean;
    CBBackup2.Checked := FieldByName('�޸ı���2').AsBoolean;
    CBBackup3.Checked := FieldByName('�޸ı���3').AsBoolean;
    CBBackup4.Checked := FieldByName('�޸ı���4').AsBoolean;
    CBBackup5.Checked := FieldByName('�޸ı���5').AsBoolean;
    CBBackup6.Checked := FieldByName('�޸ı���6').AsBoolean;
    CBBackup7.Checked := FieldByName('�޸ı���7').AsBoolean;
    CBBackup8.Checked := FieldByName('�޸ı���8').AsBoolean;
    CBBackup9.Checked := FieldByName('�޸ı���9').AsBoolean;
    CBBackup10.Checked := FieldByName('�޸ı���10').AsBoolean;
    CBBackup11.Checked := FieldByName('�޸ı���11').AsBoolean;
    CBBackup12.Checked := FieldByName('�޸ı���12').AsBoolean;
    CBBackup13.Checked := FieldByName('�޸ı���13').AsBoolean;
    CBBackup14.Checked := FieldByName('�޸ı���14').AsBoolean;
    CBBackup15.Checked := FieldByName('�޸ı���15').AsBoolean;
    CBBackup16.Checked := FieldByName('�޸ı���16').AsBoolean;
    CBBackup17.Checked := FieldByName('�޸ı���17').AsBoolean;
    CBBackup18.Checked := FieldByName('�޸ı���18').AsBoolean;

    //CBModData.Checked := getModCheck;

    Admin := FieldByName('����Ա').AsBoolean
  end
end;

procedure TUserPurviewForm.BtnAddClick(Sender: TObject);
var i: Integer;
begin
  SetBtnStatus(True);

  EdtUser.Clear; //�������û���������

  //Ȩ��ȫ��Ϊ��
  for i := 0 to GBData.ControlCount - 1 do
  begin
    if (GBData.Controls[i] is TCheckBox) then
      (GBData.Controls[i] as TCheckBox).Checked := False;
  end;
  for i := 0 to GBSystem.ControlCount - 1 do
  begin
    if (GBSystem.Controls[i] is TCheckBox) then
      (GBSystem.Controls[i] as TCheckBox).Checked := False;
  end;
  for i := 0 to GBDatabase.ControlCount - 1 do
  begin
    if (GBDatabase.Controls[i] is TCheckBox) then
      (GBDatabase.Controls[i] as TCheckBox).Checked := False;
  end;
  for i := 0 to GBEqua.ControlCount - 1 do
  begin
    if (GBEqua.Controls[i] is TCheckBox) then
      (GBEqua.Controls[i] as TCheckBox).Checked := False;
  end;
  for i := 0 to GBWeightData.ControlCount - 1 do
  begin
    if (GBWeightData.Controls[i] is TCheckBox) then
      (GBWeightData.Controls[i] as TCheckBox).Checked := False;
  end;
  for i := 0 to GBModify.ControlCount - 1 do
  begin
    if (GBModify.Controls[i] is TCheckBox) then
      (GBModify.Controls[i] as TCheckBox).Checked := False;
  end;

  EdtUser.SetFocus;
  InsertOrModify := False; //����״̬
end;

procedure TUserPurviewForm.BtnModClick(Sender: TObject);
begin
  if EdtUser.Text = '' then
    Exit;
  SetBtnStatus(True);
  EdtUser.SetFocus;
  InsertOrModify := True; //�޸�״̬
end;

procedure TUserPurviewForm.BtnCancelClick(Sender: TObject);
begin
  SetBtnStatus(False);
end;

procedure TUserPurviewForm.BtnSaveClick(Sender: TObject);
begin
  //�������ݿ���޸�
  if EdtUser.Text = '' then
    Exit;
  with QueryDataModule.ADOQUser do
  begin
    if InsertOrModify then //�޸�״̬
    begin
      Edit;
      FieldByName('�û���').AsString := EdtUser.Text;
      FieldByName('����Ա').AsBoolean := Admin;
    end
    else
    begin
      //����״̬
      Insert;
      FieldByName('�û���').AsString := EdtUser.Text;
      FieldByName('����').AsString := TCommonUtil.Md5('123');
      FieldByName('����Ա').AsBoolean := False;
    end;
    FieldByName('Ԥ��ά��').AsBoolean := CBPremaintain.Checked;
    FieldByName('���Ź���').AsBoolean := CBCard.Checked;
    FieldByName('ϵͳ��־').AsBoolean := CBLog.Checked;
    FieldByName('��̨��¼').AsBoolean := CBBackRecord.Checked;
    FieldByName('��ӡ����').AsBoolean := CBPrintTicket.Checked;
    FieldByName('�޸İ���').AsBoolean := CBModifyTicket.Checked;
    FieldByName('��ӡ����').AsBoolean := CBPrintReport.Checked;

    FieldByName('�û�����').AsBoolean := CBUser.Checked;
    FieldByName('ϵͳ����').AsBoolean := CBSystemSet.Checked;
    FieldByName('��������').AsBoolean := CBFormSet.Checked;
    FieldByName('�ֹ�����').AsBoolean := CBManualInput.Checked;

    FieldByName('���ݿ�����').AsBoolean := CBDBSet.Checked;
    FieldByName('���ݱ���').AsBoolean := CBDataBackup.Checked;
    FieldByName('���ݵ���').AsBoolean := CBDataImport.Checked;
    FieldByName('���ݵ���').AsBoolean := CBDataExport.Checked;
    FieldByName('��������').AsBoolean := CBDataClear.Checked;
    FieldByName('���ݳ�ʼ��').AsBoolean := CBDataInit.Checked;

    FieldByName('�Ǳ�����').AsBoolean := CBMeterSet.Checked;
    FieldByName('��Ƶ����').AsBoolean := CBVideoSet.Checked;
    FieldByName('����������').AsBoolean := CBReaderSet.Checked;
    FieldByName('IOģ������').AsBoolean := CBIOSet.Checked;
    FieldByName('����Ļ����').AsBoolean := CBScreenSet.Checked;
    FieldByName('�������').AsBoolean := CBVoiceSet.Checked;

    FieldByName('���ݲ�ѯ').AsBoolean := CBDataQuery.Checked;
    FieldByName('��Ӽ�¼').AsBoolean := CBAddData.Checked;
    FieldByName('ɾ����¼').AsBoolean := CBDelData.Checked;

    FieldByName('�޸ĳ���').AsBoolean := CBCar.Checked;
    FieldByName('�޸ķ�����λ').AsBoolean := CBFaHuo.Checked;
    FieldByName('�޸��ջ���λ').AsBoolean := CBShouHuo.Checked;
    FieldByName('�޸Ļ���').AsBoolean := CBGoods.Checked;
    FieldByName('�޸Ĺ��').AsBoolean := CBSpec.Checked;
    FieldByName('�޸�ë��').AsBoolean := CBGross.Checked;
    FieldByName('�޸�Ƥ��').AsBoolean := CBTare.Checked;
    FieldByName('�޸Ŀ���').AsBoolean := CBBundle.Checked;
    FieldByName('�޸ĵ���').AsBoolean := CBPrice.Checked;
    FieldByName('�޸��۷�ϵ��').AsBoolean := CBScale.Checked;
    FieldByName('�޸Ĺ�����').AsBoolean := CBCost.Checked;
    FieldByName('�޸ı���1').AsBoolean := CBBackup1.Checked;
    FieldByName('�޸ı���2').AsBoolean := CBBackup2.Checked;
    FieldByName('�޸ı���3').AsBoolean := CBBackup3.Checked;
    FieldByName('�޸ı���4').AsBoolean := CBBackup4.Checked;
    FieldByName('�޸ı���5').AsBoolean := CBBackup5.Checked;
    FieldByName('�޸ı���6').AsBoolean := CBBackup6.Checked;
    FieldByName('�޸ı���7').AsBoolean := CBBackup7.Checked;
    FieldByName('�޸ı���8').AsBoolean := CBBackup8.Checked;
    FieldByName('�޸ı���9').AsBoolean := CBBackup9.Checked;
    FieldByName('�޸ı���10').AsBoolean := CBBackup10.Checked;
    FieldByName('�޸ı���11').AsBoolean := CBBackup11.Checked;
    FieldByName('�޸ı���12').AsBoolean := CBBackup12.Checked;
    FieldByName('�޸ı���13').AsBoolean := CBBackup13.Checked;
    FieldByName('�޸ı���14').AsBoolean := CBBackup14.Checked;
    FieldByName('�޸ı���15').AsBoolean := CBBackup15.Checked;
    FieldByName('�޸ı���16').AsBoolean := CBBackup16.Checked;
    FieldByName('�޸ı���17').AsBoolean := CBBackup17.Checked;
    FieldByName('�޸ı���18').AsBoolean := CBBackup18.Checked;
    if InsertOrModify then
    begin
      if Admin then //�ǹ���Ա�Ļ�,���û�����Ȩ��Ϊ��
        FieldByName('�û�����').AsBoolean := True;
    end;
    Post;
    if InsertOrModify then
    begin
      if User = MainForm.CurrentUser then //�޸ĵ��û��ǵ�ǰ���û�,���������ϵ��û���ҲҪ����
        MainForm.CurrentUser := EdtUser.Text;
    end
    else
    begin
      MessageBox(0, '�����û��ɹ���Ĭ������Ϊ123', '��ʾ', MB_OK +
        MB_ICONINFORMATION + MB_TOPMOST);
    end;
  end;
  SetBtnStatus(False);
end;

procedure TUserPurviewForm.BtnDelClick(Sender: TObject);
begin
  if (EdtUser.Text = '') or Admin then //�ǹ���Ա����ɾ��
    Exit;
  if MessageDlg('��ȷ��Ҫɾ��������¼ ?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk then
    DBGridEhUser.DataSource.DataSet.Delete;
end;

procedure TUserPurviewForm.BtnRefreshClick(Sender: TObject);
begin
  DBGridEhUser.DataSource.DataSet.Refresh;
end;

procedure TUserPurviewForm.CBModDataClick(Sender: TObject);
var i: Integer;
begin
  for i := 0 to GBModify.ControlCount - 1 do
  begin
    if (GBModify.Controls[i] is TCheckBox) then
      (GBModify.Controls[i] as TCheckBox).Checked := CBModData.Checked;
  end;
end;

function TUserPurviewForm.getModCheck: Boolean;
var i: Integer;
  r: Boolean;
begin
  r := True;
  for i := 0 to GBModify.ControlCount - 1 do
  begin
    if (GBModify.Controls[i] is TCheckBox) then
      r := r and (GBModify.Controls[i] as TCheckBox).Checked;
  end;
  Result := r;
end;

end.
d.

