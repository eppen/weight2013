unit Storage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, ExtCtrls, StdCtrls, Buttons, ComCtrls,
  ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, DBGridEhGrouping;

type
  TStorageForm = class(TForm)
    PFunc: TPanel;
    DBGridEhStorage: TDBGridEh;
    lblGoods: TLabel;
    CBGoods: TComboBox;
    DTPStart: TDateTimePicker;
    DTPEnd: TDateTimePicker;
    lblTo: TLabel;
    BtnStat: TBitBtn;
    BtnExport: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BtnStatClick(Sender: TObject);
    procedure BtnExportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StorageForm: TStorageForm;

implementation

uses
  PrepareUtil, DateUtils, QueryDM, CommonUtil, Main;

{$R *.dfm}

procedure TStorageForm.FormShow(Sender: TObject);
begin
  TPrepareUtil.addGoods(CBGoods);
  DTPStart.Date := StartOfTheMonth(Date);
  DTPEnd.Date := EndOfTheMonth(Date);
  BtnStat.SetFocus;
end;

procedure TStorageForm.BtnStatClick(Sender: TObject);
var sqlStr: string;
begin

  if MainForm.systemConfig.databaseInUse then
  begin
    MainForm.ShowMsg('��������ʱֻ֧������ģʽ��ʹ��');
    Exit;
  end;

  DBGridEhStorage.DataSource := QueryDataModule.DSStorage;

  sqlStr := 'select t1.����,t1.������,t1.�������,t1.�����,'
    + 't2.�������,t2.��������,t2.������,'
    + 't1.�������-t2.�������� as �������,'
    + 't2.������-t1.����� as ӯ�� from '
    + '(select ����,count(��ˮ��) as ������,SUM(����) as �������,'
    + 'SUM(���) as ����� from ������Ϣ where (��������=''PO'')';
  if CBGoods.Text <> '' then
  begin
    sqlStr := sqlStr + ' and (����=''' + CBGoods.Text + ''')';
  end;
  sqlStr := sqlStr + ' and (����ʱ�� between :start1 and :end1) group by ����';

  sqlstr := sqlStr + ') as t1 join '
    + '(select ����,count(��ˮ��) as �������,SUM(����) as ��������,'
    + 'SUM(���) as ������ from ������Ϣ where (��������=''SO'')';
  if CBGoods.Text <> '' then
  begin
    sqlStr := sqlStr + ' and (����=''' + CBGoods.Text + ''')';
  end;
  sqlStr := sqlStr + ' and (����ʱ�� between :start2 and :end2) group by ����';

  sqlstr := sqlStr + ') as t2 on t1.����=t2.����';
 {
  sqlStr := 'select t1.����,t1.������,t1.�������,t1.�����,'
    + 't2.�������,t2.��������,t2.������,'
    + 't1.�������-t2.�������� as �������,'
    + 't2.������-t1.����� as ӯ�� from '
    + '(select ����,count(��ˮ��) as ������,SUM(����) as �������,'
    + 'SUM(���) as ����� from ������Ϣ where (��������=''PO'')';
  if CBGoods.Text <> '' then
    sqlStr := sqlStr + ' and (����=:goods1)';
  sqlStr := sqlStr + ' and (����ʱ�� between :start1 and :end1) group by ����';

  sqlstr := sqlStr + ') as t1 join '
    + '(select ����,count(��ˮ��) as �������,SUM(����) as ��������,'
    + 'SUM(���) as ������ from ������Ϣ where (��������=''SO'')';
  if CBGoods.Text <> '' then
    sqlStr := sqlStr + ' and (����=:goods2)';
  sqlStr := sqlStr + ' and (����ʱ�� between :start2 and :end2) group by ����';

  sqlstr := sqlStr + ') as t2 on t1.����=t2.����';
  }
  with QueryDataModule.ADOQStorage do
  begin
    Close;
    SQL.Text := sqlStr;
    {if CBGoods.Text <> '' then
    begin
      Parameters.ParamByName('goods1').Value := CBGoods.Text;
      Parameters.ParamByName('goods2').Value := CBGoods.Text;
    end;  }
    Parameters.ParamByName('start1').Value := StartOfTheDay(DTPStart.Date);
    Parameters.ParamByName('end1').Value := EndOfTheDay(DTPEnd.Date);
    Parameters.ParamByName('start2').Value := StartOfTheDay(DTPStart.Date);
    Parameters.ParamByName('end2').Value := EndOfTheDay(DTPEnd.Date);
    Open;
  end;
end;

procedure TStorageForm.BtnExportClick(Sender: TObject);
begin
  TCommonUtil.exportExcel(DBGridEhStorage);
end;

end.

