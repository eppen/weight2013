object TicketSelForm: TTicketSelForm
  Left = 515
  Top = 207
  BorderStyle = bsNone
  Caption = #30917#21333#36873#25321
  ClientHeight = 373
  ClientWidth = 214
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object LBTicket: TListBox
    Left = 0
    Top = 0
    Width = 214
    Height = 373
    Hint = #21452#20987#36873#25321#30917#21333#26684#24335#20197#20851#38381#31383#21475
    Style = lbOwnerDrawFixed
    Align = alClient
    ItemHeight = 30
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnDblClick = LBTicketDblClick
    OnKeyDown = LBTicketKeyDown
  end
end
