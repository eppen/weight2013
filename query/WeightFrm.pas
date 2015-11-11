unit WeightFrm;

interface

uses
  Windows, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzPanel, RzCmboBx, RzLabel, Buttons,
  ExtCtrls, RzEdit, SysConfig, Math, DB, RzAnimtr, ImgList, Mask, CnAAFont,
  CnAACtrls, Menus;

type
  TFrmWeight = class(TFrame)
    PMain: TPanel;
    PInfo: TPanel;
    TReadWeight: TTimer;
    TSteady: TTimer;
    ImgList: TImageList;
    PMeter1: TPanel;
    lblTrans1: TLabel;
    lblSteady1: TLabel;
    lblUnit1: TLabel;
    PWeight1: TRzPanel;
    AniTrans1: TRzAnimator;
    AniSteady1: TRzAnimator;
    PMeter2: TPanel;
    PWeight2: TRzPanel;
    AniTrans2: TRzAnimator;
    lblTrans2: TLabel;
    AniSteady2: TRzAnimator;
    lblSteady2: TLabel;
    lblUnit2: TLabel;
    TAuto: TTimer;
    TWaitForZero: TTimer;
    TWaitForScreen: TTimer;
    procedure TSteadyTimer(Sender: TObject);
    procedure PWeight1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
  private
    { Private declarations }
    //�ж��ȶ�
    arrWeight1, arrWeight2: array[0..50] of string;
    cishu1, cishu2: Integer;
    weightField, maxGlideNo, updateRecNo, weightType: string;

    flagReverse: Boolean;
    grossTime: TDateTime;
    grossAddr, grossMan: string;

    //С̨���Զ���������
    autoStep: Integer;
    FlastGlideNo: string;
    function clearPosition(): Boolean; //�������пؼ�
    procedure loadFormDesign(const pv: string; pWin: TPanel);
    function setPosition(): Boolean; //2.���ؼ��ڵ����õ�λ����ȥ
    procedure SetlastGlideNo(const Value: string);
  public
    { Public declarations }
    saved: Boolean;
    function setSysConfig(systemConfig: TSysConfig): Boolean;
    function setLastWeightInfo(ds: TDataSet): Boolean; //ȡ�ϴεĹ�����Ϣ��ʾ��������
    function calcNet(): Boolean; //���㾻��
    function calcSum(): Boolean;
    function clearInfo(clearAll: Boolean = False): Boolean; //����հ�ťʱȫ���
    function clearWeight(): Boolean;
    function grossFindTare(): Boolean; //��ë���ҳ���Ƥ����Ϣ
    function tareFindGross(): Boolean; //��Ƥ���ҳ���ë����Ϣ
    function createCost(): Boolean; //�����Ѽ���
    function updateCost(lastCost: Double): Boolean;
    function setExpressionValue(): Boolean; //�Զ��幫ʽ��Ŀ
    function simpleTareFindGross(): Boolean; //�򵥹���
    function getWeight(): string; //ȡ��ǰ����
    function getScaleNo(): Char; //A�ӻ�B��
    function getSteady(): Boolean; //�Ƿ��ȶ�
    function getMust(): Boolean; //�Ƿ��Ѿ�����ȫ��������
    function resizeFrame(): Boolean; //���Ž���
    function resizeWidth(): Boolean; //3.ˢ�´���,�����ؼ��ĳ���
    function startSteady(start: Boolean = True): Boolean;
    function setSimpleBtnState(st: Boolean): Boolean;
    function setBtnState(st: Boolean): Boolean;
    procedure P00SetFocus(); //���ý���
    function showMeter2(): Boolean;
    function weightAndSave(): Boolean; //�Զ�����
    procedure addAutoDebug(s: string);
    property lastGlideNo: string read FlastGlideNo write SetlastGlideNo;
  end;

implementation

uses
  Main, QueryDM, MultiGross, Video, PrepareUtil, DogUtil,
  ExpressionUtil, WeightUtil, OtherUtil, PayUtil, ReportUtil,
  Car, CommonUtil, PrepareMaintain;

{$R *.dfm}

{ TFrmWeight }

function TFrmWeight.clearInfo(clearAll: Boolean): Boolean;
begin
  lastGlideNo := ''; 
end;

function TFrmWeight.grossFindTare: Boolean;
begin
 
end;

function TFrmWeight.tareFindGross: Boolean;
begin
end;

function TFrmWeight.createCost: Boolean;
begin

end;

function TFrmWeight.updateCost(lastCost: Double): Boolean;
begin

end;

function TFrmWeight.setExpressionValue: Boolean;
begin
  
end;

function TFrmWeight.simpleTareFindGross: Boolean;
begin

end;

procedure TFrmWeight.TSteadyTimer(Sender: TObject);
var i: Integer;
  flag1, flag2: Boolean;
begin
  AniTrans1.ImageIndex := 0;
  AniTrans2.ImageIndex := 0;

  //һ���Ǳ��ж��ȶ�
  arrWeight1[cishu1] := PWeight1.Caption;
  inc(CiShu1);
  if CiShu1 > MainForm.systemConfig.steadyCount then
    CiShu1 := 0;
  for i := 0 to MainForm.systemConfig.steadyCount - 1 do
  begin
    flag1 := True;
    if Abs(StrToFloatDef(arrWeight1[i], 0) - StrToFloatDef(arrWeight1[i + 1], 0)) > MainForm.systemConfig.range then
    begin
      flag1 := False;
      break;
    end;
  end;
  if flag1 then
    AniSteady1.ImageIndex := 1
  else
    AniSteady1.ImageIndex := 0;

  //�����Ǳ�����
  arrWeight2[cishu2] := PWeight2.Caption;
  inc(CiShu2);
  if CiShu2 > MainForm.systemConfig.steadyCount then
    CiShu2 := 0;
  for i := 0 to MainForm.systemConfig.steadyCount - 1 do
  begin
    flag2 := True;
    if Abs(StrToFloatDef(arrWeight2[i], 0) - StrToFloatDef(arrWeight2[i + 1], 0)) > MainForm.systemConfig.range then
    begin
      flag2 := False;
      break;
    end;
  end;
  if flag2 then
    AniSteady2.ImageIndex := 1
  else
    AniSteady2.ImageIndex := 0;
end;

function TFrmWeight.setSysConfig(systemConfig: TSysConfig): Boolean;
begin
  lblUnit1.Caption := systemConfig.metricUnit;
  lblUnit2.Caption := systemConfig.metricUnit;
end;

function TFrmWeight.clearWeight: Boolean;
begin 
end;

function TFrmWeight.getSteady: Boolean;
begin
  if MainForm.systemConfig.allowNotSteady then
    Result := True
  else
    Result := AniSteady1.ImageIndex = 1;
end;

function TFrmWeight.setLastWeightInfo(ds: TDataSet): Boolean;
begin
 
end;

function TFrmWeight.resizeFrame: Boolean;
begin
  //����ؼ�λ����Ϣ ,��MainForm��weightSetConfig�ж�ȡ
  //1.�����пؼ��ŵ���������ȥ
  clearPosition();
  //2.���ؼ��ڵ����õ�λ����ȥ
  setPosition();
  //3.ˢ�´���,�����ؼ��ĳ���
  resizeWidth;
end;

function TFrmWeight.clearPosition: Boolean;
begin
  
end;

function TFrmWeight.resizeWidth: Boolean;
begin
  
end;

function TFrmWeight.setPosition: Boolean;
begin

end;

procedure TFrmWeight.loadFormDesign(const pv: string; pWin: TPanel);
begin
end;

function TFrmWeight.startSteady(start: Boolean): Boolean;
begin
  TSteady.Enabled := start;
end;

function TFrmWeight.calcNet: Boolean;
begin

end;

function TFrmWeight.setSimpleBtnState(st: Boolean): Boolean;
begin

end;

function TFrmWeight.getMust: Boolean;
begin

end;

function TFrmWeight.setBtnState(st: Boolean): Boolean;
begin
 
end;

procedure TFrmWeight.P00SetFocus;
begin

end;

function TFrmWeight.getWeight: string;
begin

end;

function TFrmWeight.showMeter2(): Boolean;
begin
  PMeter2.Visible := not PMeter2.Visible;
  PWeight1.Color := clBlack;
  PWeight2.Color := clBlack;
end;

procedure TFrmWeight.PWeight1ContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
  if TUserUtil.HasAuthority('����Ա') then
    PWeight1.Caption := InputBox('', '', '0');
end;

function TFrmWeight.weightAndSave: Boolean;
begin

end;

procedure TFrmWeight.addAutoDebug(s: string);
begin
end;

procedure TFrmWeight.SetlastGlideNo(const Value: string);
begin
   
end;

function TFrmWeight.calcSum: Boolean;
begin
 
end;

function TFrmWeight.getScaleNo: Char;
begin
  if PWeight1.Color = clBlack then
    Result := 'A'
  else if PWeight2.Color = clBlack then
    Result := 'B'
  else
    Result := 'C';
end;

end.

