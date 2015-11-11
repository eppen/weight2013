unit Tao;

interface

uses
  Classes, Controls, Forms, Windows,
  DBGridEh, Menus, ExtCtrls, StdCtrls, GridsEh,
  ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, AppEvnts, Buttons,
  DBGridEhGrouping;

type
  TTaoForm = class(TForm)
    PopupMenu1: TPopupMenu;
    NDelete: TMenuItem;
    Panel1: TPanel;
    lblCar: TLabel;
    lblFaHuo: TLabel;
    lblShouHuo: TLabel;
    lblGoods: TLabel;
    lblSpec: TLabel;
    lblBackup1: TLabel;
    lblBackup2: TLabel;
    lblBackup3: TLabel;
    lblBackup4: TLabel;
    lblBackup5: TLabel;
    CBCar: TComboBox;
    CBFaHuo: TComboBox;
    CBShouHuo: TComboBox;
    CBGoods: TComboBox;
    CBSpec: TComboBox;
    CBBackup1: TComboBox;
    CBBackup2: TComboBox;
    CBBackup3: TComboBox;
    CBBackup4: TComboBox;
    CBBackup5: TComboBox;
    BtnSave: TButton;
    NFresh: TMenuItem;
    N3: TMenuItem;
    NModify: TMenuItem;
    lblBackup10: TLabel;
    lblBackup11: TLabel;
    lblBackup12: TLabel;
    lblBackup13: TLabel;
    lblBackup14: TLabel;
    CBBackup10: TComboBox;
    CBBackup11: TComboBox;
    CBBackup12: TComboBox;
    CBBackup13: TComboBox;
    CBBackup14: TComboBox;
    BtnAdd: TButton;
    ApplicationEvents1: TApplicationEvents;
    EdtSearch: TEdit;
    BitBtn1: TBitBtn;
    DBGridEhTao: TDBGridEh;
    procedure FormShow(Sender: TObject);
    procedure NDeleteClick(Sender: TObject);
    procedure NFreshClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure NModifyClick(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure DBGridEhTaoDblClick(Sender: TObject);
    procedure ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
    procedure N2Click(Sender: TObject);
    procedure EdtSearchChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure lblCarDblClick(Sender: TObject);
    procedure lblFaHuoDblClick(Sender: TObject);
    procedure lblShouHuoDblClick(Sender: TObject);
    procedure lblGoodsDblClick(Sender: TObject);
    procedure lblSpecDblClick(Sender: TObject);
    procedure lblBackup1DblClick(Sender: TObject);
    procedure lblBackup2DblClick(Sender: TObject);
    procedure lblBackup3DblClick(Sender: TObject);
    procedure lblBackup4DblClick(Sender: TObject);
    procedure lblBackup5DblClick(Sender: TObject);
    procedure lblBackup10DblClick(Sender: TObject);
    procedure lblBackup11DblClick(Sender: TObject);
    procedure lblBackup12DblClick(Sender: TObject);
    procedure lblBackup13DblClick(Sender: TObject);
    procedure lblBackup14DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    insertOrModify: Boolean;
  public
    { Public declarations }
  end;

var
  TaoForm: TTaoForm;

implementation

uses QueryDM, Main, PrepareUtil, IniFiles, Dialogs, SysUtils;

{$R *.dfm}

procedure TTaoForm.FormShow(Sender: TObject);
begin
  lblCar.Caption := MainForm.poWeightSetConfig.carCaption;
  lblFaHuo.Caption := MainForm.poWeightSetConfig.faHuoCaption;
  lblShouHuo.Caption := MainForm.poWeightSetConfig.shouHuoCaption;
  lblGoods.Caption := MainForm.poWeightSetConfig.goodsCaption;
  lblSpec.Caption := MainForm.poWeightSetConfig.specCaption;
  lblBackup1.Caption := MainForm.poWeightSetConfig.backup1Caption;
  lblBackup2.Caption := MainForm.poWeightSetConfig.backup2Caption;
  lblBackup3.Caption := MainForm.poWeightSetConfig.backup3Caption;
  lblBackup4.Caption := MainForm.poWeightSetConfig.backup4Caption;
  lblBackup5.Caption := MainForm.poWeightSetConfig.backup5Caption;
  lblBackup10.Caption := MainForm.poWeightSetConfig.backup10Caption;
  lblBackup11.Caption := MainForm.poWeightSetConfig.backup11Caption;
  lblBackup12.Caption := MainForm.poWeightSetConfig.backup12Caption;
  lblBackup13.Caption := MainForm.poWeightSetConfig.backup13Caption;
  lblBackup14.Caption := MainForm.poWeightSetConfig.backup14Caption;

  TPrepareUtil.addCar(CBCar);
  TPrepareUtil.addFaHuo(CBFaHuo);
  TPrepareUtil.addShouHuo(CBShouHuo);
  TPrepareUtil.addGoods(CBGoods);
  TPrepareUtil.addSpec(CBSpec);
  TPrepareUtil.addBackup1(CBBackup1);
  TPrepareUtil.addBackup2(CBBackup2);
  TPrepareUtil.addBackup3(CBBackup3);
  TPrepareUtil.addBackup4(CBBackup4);
  TPrepareUtil.addBackup5(CBBackup5);
  TPrepareUtil.addBackup10(CBBackup10);
  TPrepareUtil.addBackup11(CBBackup11);
  TPrepareUtil.addBackup12(CBBackup12);
  TPrepareUtil.addBackup13(CBBackup13);
  TPrepareUtil.addBackup14(CBBackup14);

  insertOrModify := False;

  DBGridEhTao.PopupMenu := PopupMenu1;

  DBGridEhTao.DataSource := QueryDataModule.DSTao;
  with QueryDataModule.ADOQTao do
  begin
    Close;
    SQL.Text := 'select * from �ױ� order by ����';
    Open;
  end;
  DBGridEhTao.FieldColumns['����'].Visible := MainForm.DBGridEh1.FieldColumns['����'].Visible;
  DBGridEhTao.FieldColumns['������λ'].Visible := MainForm.DBGridEh1.FieldColumns['������λ'].Visible;
  DBGridEhTao.FieldColumns['�ջ���λ'].Visible := MainForm.DBGridEh1.FieldColumns['�ջ���λ'].Visible;
  DBGridEhTao.FieldColumns['����'].Visible := MainForm.DBGridEh1.FieldColumns['����'].Visible;
  DBGridEhTao.FieldColumns['���'].Visible := MainForm.DBGridEh1.FieldColumns['���'].Visible;
  DBGridEhTao.FieldColumns['����1'].Visible := MainForm.DBGridEh1.FieldColumns['����1'].Visible;
  DBGridEhTao.FieldColumns['����2'].Visible := MainForm.DBGridEh1.FieldColumns['����2'].Visible;
  DBGridEhTao.FieldColumns['����3'].Visible := MainForm.DBGridEh1.FieldColumns['����3'].Visible;
  DBGridEhTao.FieldColumns['����4'].Visible := MainForm.DBGridEh1.FieldColumns['����4'].Visible;
  DBGridEhTao.FieldColumns['����5'].Visible := MainForm.DBGridEh1.FieldColumns['����5'].Visible;
  DBGridEhTao.FieldColumns['����10'].Visible := MainForm.DBGridEh1.FieldColumns['����10'].Visible;
  DBGridEhTao.FieldColumns['����11'].Visible := MainForm.DBGridEh1.FieldColumns['����11'].Visible;
  DBGridEhTao.FieldColumns['����12'].Visible := MainForm.DBGridEh1.FieldColumns['����12'].Visible;
  DBGridEhTao.FieldColumns['����13'].Visible := MainForm.DBGridEh1.FieldColumns['����13'].Visible;
  DBGridEhTao.FieldColumns['����14'].Visible := MainForm.DBGridEh1.FieldColumns['����14'].Visible;


  DBGridEhTao.FieldColumns['����'].Title.Caption := MainForm.poWeightSetConfig.carCaption;
  DBGridEhTao.FieldColumns['������λ'].Title.Caption := MainForm.poWeightSetConfig.faHuoCaption;
  DBGridEhTao.FieldColumns['�ջ���λ'].Title.Caption := MainForm.poWeightSetConfig.shouHuoCaption;
  DBGridEhTao.FieldColumns['����'].Title.Caption := MainForm.poWeightSetConfig.goodsCaption;
  DBGridEhTao.FieldColumns['���'].Title.Caption := MainForm.poWeightSetConfig.specCaption;
  DBGridEhTao.FieldColumns['����1'].Title.Caption := MainForm.poWeightSetConfig.backup1Caption;
  DBGridEhTao.FieldColumns['����2'].Title.Caption := MainForm.poWeightSetConfig.backup2Caption;
  DBGridEhTao.FieldColumns['����3'].Title.Caption := MainForm.poWeightSetConfig.backup3Caption;
  DBGridEhTao.FieldColumns['����4'].Title.Caption := MainForm.poWeightSetConfig.backup4Caption;
  DBGridEhTao.FieldColumns['����5'].Title.Caption := MainForm.poWeightSetConfig.backup5Caption;
  DBGridEhTao.FieldColumns['����10'].Title.Caption := MainForm.poWeightSetConfig.backup10Caption;
  DBGridEhTao.FieldColumns['����11'].Title.Caption := MainForm.poWeightSetConfig.backup11Caption;
  DBGridEhTao.FieldColumns['����12'].Title.Caption := MainForm.poWeightSetConfig.backup12Caption;
  DBGridEhTao.FieldColumns['����13'].Title.Caption := MainForm.poWeightSetConfig.backup13Caption;
  DBGridEhTao.FieldColumns['����14'].Title.Caption := MainForm.poWeightSetConfig.backup14Caption;

  EdtSearch.SetFocus;
end;

procedure TTaoForm.NDeleteClick(Sender: TObject);
begin
  if Application.MessageBox('��ȷʵҪɾ��������¼��?', '��ʾ', MB_YESNO +
    MB_ICONQUESTION + MB_DEFBUTTON2 + MB_TOPMOST) = IDYES then
  begin
    DBGridEhTao.DataSource.DataSet.Delete;
  end;
end;

procedure TTaoForm.NFreshClick(Sender: TObject);
begin
  DBGridEhTao.DataSource := QueryDataModule.DSTao;
  with QueryDataModule.ADOQTao do
  begin
    Close;
    SQL.Text := 'select * from �ױ� order by ����';
    Open;
  end;
  DBGridEhTao.FieldColumns['����'].Visible := MainForm.DBGridEh1.FieldColumns['����'].Visible;
  DBGridEhTao.FieldColumns['������λ'].Visible := MainForm.DBGridEh1.FieldColumns['������λ'].Visible;
  DBGridEhTao.FieldColumns['�ջ���λ'].Visible := MainForm.DBGridEh1.FieldColumns['�ջ���λ'].Visible;
  DBGridEhTao.FieldColumns['����'].Visible := MainForm.DBGridEh1.FieldColumns['����'].Visible;
  DBGridEhTao.FieldColumns['���'].Visible := MainForm.DBGridEh1.FieldColumns['���'].Visible;
  DBGridEhTao.FieldColumns['����1'].Visible := MainForm.DBGridEh1.FieldColumns['����1'].Visible;
  DBGridEhTao.FieldColumns['����2'].Visible := MainForm.DBGridEh1.FieldColumns['����2'].Visible;
  DBGridEhTao.FieldColumns['����3'].Visible := MainForm.DBGridEh1.FieldColumns['����3'].Visible;
  DBGridEhTao.FieldColumns['����4'].Visible := MainForm.DBGridEh1.FieldColumns['����4'].Visible;
  DBGridEhTao.FieldColumns['����5'].Visible := MainForm.DBGridEh1.FieldColumns['����5'].Visible;
  DBGridEhTao.FieldColumns['����10'].Visible := MainForm.DBGridEh1.FieldColumns['����10'].Visible;
  DBGridEhTao.FieldColumns['����11'].Visible := MainForm.DBGridEh1.FieldColumns['����11'].Visible;
  DBGridEhTao.FieldColumns['����12'].Visible := MainForm.DBGridEh1.FieldColumns['����12'].Visible;
  DBGridEhTao.FieldColumns['����13'].Visible := MainForm.DBGridEh1.FieldColumns['����13'].Visible;
  DBGridEhTao.FieldColumns['����14'].Visible := MainForm.DBGridEh1.FieldColumns['����14'].Visible;
end;

procedure TTaoForm.BtnSaveClick(Sender: TObject);
begin
  if insertOrModify then
  begin
    with QueryDataModule.ADOQExec do
    begin
      Close;
      SQL.Text := 'insert into �ױ�(����,������λ,�ջ���λ,����,���,����1,'
        + '����2,����3,����4,����5,����10,����11,����12,����13,����14) '
        + 'values (:car,:faHuo,:shouHuo,:goods,:spec,:backup1,:backup2,'
        + ':backup3,:backup4,:backup5,:backup10,:backup11,:backup12,:backup13,:backup14)';

      Parameters.ParamByName('car').Value := CBCar.Text;
      Parameters.ParamByName('faHuo').Value := CBFaHuo.Text;
      Parameters.ParamByName('shouHuo').Value := CBShouHuo.Text;
      Parameters.ParamByName('goods').Value := CBGoods.Text;
      Parameters.ParamByName('spec').Value := CBSpec.Text;
      Parameters.ParamByName('backup1').Value := CBBackup1.Text;
      Parameters.ParamByName('backup2').Value := CBBackup2.Text;
      Parameters.ParamByName('backup3').Value := CBBackup3.Text;
      Parameters.ParamByName('backup4').Value := CBBackup4.Text;
      Parameters.ParamByName('backup5').Value := CBBackup5.Text;
      Parameters.ParamByName('backup10').Value := CBBackup10.Text;
      Parameters.ParamByName('backup11').Value := CBBackup11.Text;
      Parameters.ParamByName('backup12').Value := CBBackup12.Text;
      Parameters.ParamByName('backup13').Value := CBBackup13.Text;
      Parameters.ParamByName('backup14').Value := CBBackup14.Text;
      ExecSQL;

      Application.MessageBox('�������ݳɹ�!', '��ʾ', MB_OK +
        MB_ICONINFORMATION + MB_DEFBUTTON2 + MB_TOPMOST);
    end
  end
  else
  begin
    with QueryDataModule.ADOQExec do
    begin
      Close;
      SQL.Text := 'update �ױ� set ������λ=:faHuo,�ջ���λ=:shouHuo,����=:goods,'
        + '���=:spec,����1=:backup1,����2=:backup2,����3=:backup3,����4=:backup4,����5=:backup5,'
        + '����10=:backup10,����11=:backup11,'
        + '����12=:backup12,����13=:backup13,����14=:backup14 where ����=:car';

      Parameters.ParamByName('car').Value := CBCar.Text;
      Parameters.ParamByName('faHuo').Value := CBFaHuo.Text;
      Parameters.ParamByName('shouHuo').Value := CBShouHuo.Text;
      Parameters.ParamByName('goods').Value := CBGoods.Text;
      Parameters.ParamByName('spec').Value := CBSpec.Text;
      Parameters.ParamByName('backup1').Value := CBBackup1.Text;
      Parameters.ParamByName('backup2').Value := CBBackup2.Text;
      Parameters.ParamByName('backup3').Value := CBBackup3.Text;
      Parameters.ParamByName('backup4').Value := CBBackup4.Text;
      Parameters.ParamByName('backup5').Value := CBBackup5.Text;
      Parameters.ParamByName('backup10').Value := CBBackup10.Text;
      Parameters.ParamByName('backup11').Value := CBBackup11.Text;
      Parameters.ParamByName('backup12').Value := CBBackup12.Text;
      Parameters.ParamByName('backup13').Value := CBBackup13.Text;
      Parameters.ParamByName('backup14').Value := CBBackup14.Text;
      ExecSQL;

      Application.MessageBox('�������ݳɹ�!', '��ʾ', MB_OK +
        MB_ICONINFORMATION + MB_DEFBUTTON2 + MB_TOPMOST);

    end
  end;
  insertOrModify := False;
  NFresh.Click;

end;

procedure TTaoForm.NModifyClick(Sender: TObject);
begin
  if CBCar.Text = '' then
  begin
    Application.MessageBox('����˫��ѡ���¼�����޸�!', '��ʾ', MB_OK +
      MB_ICONINFORMATION + MB_DEFBUTTON2 + MB_TOPMOST);
    Exit;
  end;
  insertOrModify := False;
  CBCar.SetFocus;
end;

procedure TTaoForm.BtnAddClick(Sender: TObject);
begin
  CBCar.Text := '';
  CBFaHuo.Text := '';
  CBShouHuo.Text := '';
  CBGoods.Text := '';
  CBSpec.Text := '';
  CBBackup1.Text := '';
  CBBackup2.Text := '';
  CBBackup3.Text := '';
  CBBackup4.Text := '';
  CBBackup5.Text := '';
  CBBackup10.Text := '';
  CBBackup11.Text := '';
  CBBackup12.Text := '';
  CBBackup13.Text := '';
  CBBackup14.Text := '';
  insertOrModify := True;
  CBCar.SetFocus;

end;

procedure TTaoForm.DBGridEhTaoDblClick(Sender: TObject);
begin
  with DBGridEhTao.DataSource.DataSet do
  begin
    CBCar.Text := FieldByName('����').AsString;
    CBFaHuo.Text := FieldByName('������λ').AsString;
    CBShouHuo.Text := FieldByName('�ջ���λ').AsString;
    CBGoods.Text := FieldByName('����').AsString;
    CBSpec.Text := FieldByName('���').AsString;
    CBBackup1.Text := FieldByName('����1').AsString;
    CBBackup2.Text := FieldByName('����2').AsString;
    CBBackup3.Text := FieldByName('����3').AsString;
    CBBackup4.Text := FieldByName('����4').AsString;
    CBBackup5.Text := FieldByName('����5').AsString;
    CBBackup10.Text := FieldByName('����10').AsString;
    CBBackup11.Text := FieldByName('����11').AsString;
    CBBackup12.Text := FieldByName('����12').AsString;
    CBBackup13.Text := FieldByName('����13').AsString;
    CBBackup14.Text := FieldByName('����14').AsString;
  end;
end;

procedure TTaoForm.ApplicationEvents1Idle(Sender: TObject;
  var Done: Boolean);
begin
  BtnAdd.Enabled := not insertOrModify;
end;

procedure TTaoForm.N2Click(Sender: TObject);
var arrTao: array of TStringListEh;
  i: Integer;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select * from �ױ� order by ����';
    Open;
    if not IsEmpty then
    begin
      First;
      SetLength(arrTao, RecordCount);
      for i := 0 to Length(arrTao) - 1 do
      begin
        arrTao[i] := TStringListEh.Create;
      end;
      i := 0;
      while not Eof do
      begin
        arrTao[i].Add(FieldByName('����').AsString);
        arrTao[i].Add(FieldByName('������λ').AsString);
        arrTao[i].Add(FieldByName('�ջ���λ').AsString);
        arrTao[i].Add(FieldByName('����').AsString);
        arrTao[i].Add(FieldByName('���').AsString);
        arrTao[i].Add(FieldByName('����1').AsString);
        arrTao[i].Add(FieldByName('����2').AsString);
        arrTao[i].Add(FieldByName('����3').AsString);
        arrTao[i].Add(FieldByName('����4').AsString);
        arrTao[i].Add(FieldByName('����5').AsString);
        arrTao[i].Add(FieldByName('����10').AsString);
        arrTao[i].Add(FieldByName('����11').AsString);
        arrTao[i].Add(FieldByName('����12').AsString);
        arrTao[i].Add(FieldByName('����13').AsString);
        arrTao[i].Add(FieldByName('����14').AsString);
        Inc(i);
        Next;
      end;
      SQL.Text := 'drop table �ױ�';
      ExecSQL;

      SQL.Text := 'create table �ױ�([���] Counter primary key,[����] Text(50),'
        + '[������λ] Text(50),[�ջ���λ] Text(50),[����] Text(50),[���] Text(50),'
        + '[����1] Text(50),[����2] Text(50),[����3] Text(50),[����4] Text(50),'
        + '[����5] Text(50),[����10] Text(50),[����11] Text(50),[����12] Text(50),'
        + '[����13] Text(50),[����14] Text(50))';
      ExecSQL;

      for i := 0 to Length(arrTao) - 1 do
      begin
        SQL.Text := 'insert into �ױ�(����,������λ,�ջ���λ,����,���,'
          + '����1,����2,����3,����4,����5,'
          + '����10,����11,����12,����13,����14) '
          + 'Values (:carNo,:faHuo,:shouHuo,:goods,:spec,'
          + ':backup1,:backup2,:backup3,:backup4,:backup5,'
          + ':backup10,:backup11,:backup12,:backup13,:backup14)';
        Parameters.ParamByName('carNo').Value := arrTao[i].Strings[0];
        Parameters.ParamByName('faHuo').Value := arrTao[i].Strings[1];
        Parameters.ParamByName('shouHuo').Value := arrTao[i].Strings[2];
        Parameters.ParamByName('goods').Value := arrTao[i].Strings[3];
        Parameters.ParamByName('spec').Value := arrTao[i].Strings[4];
        Parameters.ParamByName('backup1').Value := arrTao[i].Strings[5];
        Parameters.ParamByName('backup2').Value := arrTao[i].Strings[6];
        Parameters.ParamByName('backup3').Value := arrTao[i].Strings[7];
        Parameters.ParamByName('backup4').Value := arrTao[i].Strings[8];
        Parameters.ParamByName('backup5').Value := arrTao[i].Strings[9];
        Parameters.ParamByName('backup10').Value := arrTao[i].Strings[10];
        Parameters.ParamByName('backup11').Value := arrTao[i].Strings[11];
        Parameters.ParamByName('backup12').Value := arrTao[i].Strings[12];
        Parameters.ParamByName('backup13').Value := arrTao[i].Strings[13];
        Parameters.ParamByName('backup14').Value := arrTao[i].Strings[14];
        ExecSQL;
      end;
      for i := 0 to Length(arrTao) - 1 do
      begin
        arrTao[i].Free;
      end;
      Application.MessageBox('�ױ�ṹ�����ɹ�', '��ʾ', MB_OK +
        MB_ICONINFORMATION + MB_TOPMOST);

    end;
  end;
end;

procedure TTaoForm.EdtSearchChange(Sender: TObject);
begin
  with QueryDataModule.ADOQTao do
  begin
    Close;
    SQL.Text := 'select * from �ױ� where (���� like :carNo) '
      + 'or (������λ like :faHuo) '
      + 'or (�ջ���λ like :shouHuo) '
      + 'or (���� like :goods) order by ����';
    Parameters.ParamByName('carNo').Value := '%' + EdtSearch.Text + '%';
    Parameters.ParamByName('faHuo').Value := '%' + EdtSearch.Text + '%';
    Parameters.ParamByName('shouHuo').Value := '%' + EdtSearch.Text + '%';
    Parameters.ParamByName('goods').Value := '%' + EdtSearch.Text + '%';
    Open;
  end;
end;

procedure TTaoForm.BitBtn1Click(Sender: TObject);
begin
  with DBGridEhTao.DataSource.DataSet, MainForm.FrmWeight1 do
  begin
    CBCar.Text := FieldByName('����').AsString;
    CBFaHuo.Text := FieldByName('������λ').AsString;
    CBShouHuo.Text := FieldByName('�ջ���λ').AsString;
    CBGoods.Text := FieldByName('����').AsString;
    CBSpec.Text := FieldByName('���').AsString;
    CBBackup1.Text := FieldByName('����1').AsString;
    CBBackup2.Text := FieldByName('����2').AsString;
    CBBackup3.Text := FieldByName('����3').AsString;
    CBBackup4.Text := FieldByName('����4').AsString;
    CBBackup5.Text := FieldByName('����5').AsString;
    CBBackup10.Text := FieldByName('����10').AsString;
    CBBackup11.Text := FieldByName('����11').AsString;
    CBBackup12.Text := FieldByName('����12').AsString;
    CBBackup13.Text := FieldByName('����13').AsString;
    CBBackup14.Text := FieldByName('����14').AsString;
  end;
end;

procedure TTaoForm.lblCarDblClick(Sender: TObject);
begin
  MainForm.systemConfig.taoPrimayKey := 1;
  ShowMessage('������' + MainForm.poWeightSetConfig.carCaption + 'Ϊ����')
end;

procedure TTaoForm.lblFaHuoDblClick(Sender: TObject);
begin
  MainForm.systemConfig.taoPrimayKey := 2;
  ShowMessage('������' + MainForm.poWeightSetConfig.faHuoCaption + 'Ϊ����')
end;

procedure TTaoForm.lblShouHuoDblClick(Sender: TObject);
begin
  MainForm.systemConfig.taoPrimayKey := 3;
  ShowMessage('������' + MainForm.poWeightSetConfig.shouHuoCaption + 'Ϊ����')
end;

procedure TTaoForm.lblGoodsDblClick(Sender: TObject);
begin
  MainForm.systemConfig.taoPrimayKey := 4;
  ShowMessage('������' + MainForm.poWeightSetConfig.goodsCaption + 'Ϊ����')
end;

procedure TTaoForm.lblSpecDblClick(Sender: TObject);
begin
  MainForm.systemConfig.taoPrimayKey := 5;
  ShowMessage('������' + MainForm.poWeightSetConfig.specCaption + 'Ϊ����')
end;

procedure TTaoForm.lblBackup1DblClick(Sender: TObject);
begin
  MainForm.systemConfig.taoPrimayKey := 6;
  ShowMessage('������' + MainForm.poWeightSetConfig.backup1Caption + 'Ϊ����')
end;

procedure TTaoForm.lblBackup2DblClick(Sender: TObject);
begin
  MainForm.systemConfig.taoPrimayKey := 7;
  ShowMessage('������' + MainForm.poWeightSetConfig.backup2Caption + 'Ϊ����')
end;

procedure TTaoForm.lblBackup3DblClick(Sender: TObject);
begin
  MainForm.systemConfig.taoPrimayKey := 8;
  ShowMessage('������' + MainForm.poWeightSetConfig.backup3Caption + 'Ϊ����')
end;

procedure TTaoForm.lblBackup4DblClick(Sender: TObject);
begin
  MainForm.systemConfig.taoPrimayKey := 9;
  ShowMessage('������' + MainForm.poWeightSetConfig.backup4Caption + 'Ϊ����')
end;

procedure TTaoForm.lblBackup5DblClick(Sender: TObject);
begin
  MainForm.systemConfig.taoPrimayKey := 10;
  ShowMessage('������' + MainForm.poWeightSetConfig.backup5Caption + 'Ϊ����')
end;

procedure TTaoForm.lblBackup10DblClick(Sender: TObject);
begin
  MainForm.systemConfig.taoPrimayKey := 11;
  ShowMessage('������' + MainForm.poWeightSetConfig.backup10Caption + 'Ϊ����')
end;

procedure TTaoForm.lblBackup11DblClick(Sender: TObject);
begin
  MainForm.systemConfig.taoPrimayKey := 12;
  ShowMessage('������' + MainForm.poWeightSetConfig.backup11Caption + 'Ϊ����')
end;

procedure TTaoForm.lblBackup12DblClick(Sender: TObject);
begin
  MainForm.systemConfig.taoPrimayKey := 13;
  ShowMessage('������' + MainForm.poWeightSetConfig.backup12Caption + 'Ϊ����')
end;

procedure TTaoForm.lblBackup13DblClick(Sender: TObject);
begin
  MainForm.systemConfig.taoPrimayKey := 14;
  ShowMessage('������' + MainForm.poWeightSetConfig.backup13Caption + 'Ϊ����')
end;

procedure TTaoForm.lblBackup14DblClick(Sender: TObject);
begin
  MainForm.systemConfig.taoPrimayKey := 15;
  ShowMessage('������' + MainForm.poWeightSetConfig.backup14Caption + 'Ϊ����')
end;

procedure TTaoForm.FormClose(Sender: TObject; var Action: TCloseAction);
var myini: TIniFile;
begin
  myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'setup.ini');
  try
    myini.WriteInteger('system_set', 'tao_primary_key', MainForm.systemConfig.taoPrimayKey);
  finally
    myini.Free;
  end;
end;

end.
