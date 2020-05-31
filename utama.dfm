object mf: Tmf
  Left = 420
  Top = 166
  Caption = 'Untitled - MulTitle 1.0'
  ClientHeight = 375
  ClientWidth = 684
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mm
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object sl: TSplitter
    Left = 121
    Top = 0
    Height = 356
    ExplicitHeight = 365
  end
  object sb: TStatusBar
    Left = 0
    Top = 356
    Width = 684
    Height = 19
    BorderWidth = 1
    Panels = <
      item
        Width = 500
      end
      item
        Text = 'Ln 1, Col 1'
        Width = 200
      end>
  end
  object m: TRichEdit
    Left = 124
    Top = 0
    Width = 560
    Height = 356
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 1
    Zoom = 100
    OnChange = mChange
    OnKeyUp = mKeyUp
    OnMouseUp = mMouseUp
  end
  object lb: TListBox
    Left = 0
    Top = 0
    Width = 121
    Height = 356
    Align = alLeft
    ItemHeight = 13
    MultiSelect = True
    TabOrder = 0
    OnDblClick = lbDblClick
  end
  object mm: TMainMenu
    Left = 424
    Top = 272
    object F1: TMenuItem
      Caption = 'File'
      object N1: TMenuItem
        Caption = 'New'
        ImageIndex = 0
        ShortCut = 32846
        OnClick = N1Click
      end
      object O1: TMenuItem
        Caption = 'Open'
        ImageIndex = 3
        ShortCut = 32847
        OnClick = O1Click
      end
      object S1: TMenuItem
        Caption = 'Save'
        ImageIndex = 5
        ShortCut = 32851
        OnClick = S1Click
      end
      object S2: TMenuItem
        Caption = 'Save As'
        ImageIndex = 12
        ShortCut = 41043
        OnClick = S2Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object E2: TMenuItem
        Caption = 'Exit'
        ImageIndex = 40
        ShortCut = 32883
        OnClick = E2Click
      end
    end
    object t2: TMenuItem
      Caption = 'Items'
      object N7: TMenuItem
        Caption = 'New'
        ShortCut = 41038
        OnClick = N7Click
      end
      object I1: TMenuItem
        Caption = 'Import'
        ShortCut = 32841
        OnClick = I1Click
      end
      object E3: TMenuItem
        Caption = 'Export'
        ShortCut = 32837
        OnClick = E3Click
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object M1: TMenuItem
        Caption = 'Move Up'
        ShortCut = 32806
        OnClick = M1Click
      end
      object M2: TMenuItem
        Caption = 'Move Down'
        ShortCut = 32808
        OnClick = M2Click
      end
      object D2: TMenuItem
        Caption = 'Delete'
        ShortCut = 32814
        OnClick = D2Click
      end
      object R2: TMenuItem
        Caption = 'Rename'
        ShortCut = 113
        OnClick = R2Click
      end
    end
    object E1: TMenuItem
      Caption = 'Edit'
      object C1: TMenuItem
        Caption = 'Undo'
        ShortCut = 32858
        OnClick = C1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object C2: TMenuItem
        Caption = 'Cut'
        ShortCut = 32856
        OnClick = C2Click
      end
      object P1: TMenuItem
        Caption = 'Paste'
        ShortCut = 32854
        OnClick = P1Click
      end
      object C3: TMenuItem
        Caption = 'Copy'
        ShortCut = 32835
        OnClick = C3Click
      end
      object C4: TMenuItem
        Caption = 'Delete'
        ShortCut = 46
        OnClick = C4Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object F2: TMenuItem
        Caption = 'Find'
        ShortCut = 32838
        OnClick = F2Click
      end
      object F3: TMenuItem
        Caption = 'Find Next'
        ShortCut = 114
        OnClick = F3Click
      end
      object R1: TMenuItem
        Caption = 'Replace'
        ShortCut = 32840
        OnClick = R1Click
      end
      object G1: TMenuItem
        Caption = 'Go To'
        ShortCut = 32839
        OnClick = G1Click
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object S3: TMenuItem
        Caption = 'Select All'
        ShortCut = 32833
        OnClick = S3Click
      end
      object D1: TMenuItem
        Caption = 'Date/Time'
        ShortCut = 116
        OnClick = D1Click
      end
    end
    object F4: TMenuItem
      Caption = 'Format'
      object W1: TMenuItem
        Caption = 'Word Wrap'
        Checked = True
        ShortCut = 32855
        OnClick = W1Click
      end
      object F5: TMenuItem
        Caption = 'Font'
        ShortCut = 115
        OnClick = F5Click
      end
    end
    object V1: TMenuItem
      Caption = 'View'
      object S4: TMenuItem
        Caption = 'Status Bar'
        Checked = True
        ShortCut = 32817
        OnClick = S4Click
      end
      object T1: TMenuItem
        Caption = 'Title Panel'
        Checked = True
        ShortCut = 32818
        OnClick = T1Click
      end
    end
    object H1: TMenuItem
      Caption = 'Help'
      object C5: TMenuItem
        Caption = 'Contents'
        ShortCut = 112
        OnClick = C5Click
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object A1: TMenuItem
        Caption = 'About MulTitle'
        ShortCut = 32880
        OnClick = A1Click
      end
    end
  end
  object fod: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Left = 152
    Top = 40
  end
  object opd: TOpenDialog
    FilterIndex = 0
    Options = [ofReadOnly, ofOverwritePrompt, ofHideReadOnly, ofNoReadOnlyReturn, ofNoNetworkButton, ofEnableIncludeNotify, ofDontAddToRecent, ofForceShowHidden]
    Left = 152
    Top = 96
  end
  object sad: TSaveDialog
    FilterIndex = 0
    Options = [ofReadOnly, ofOverwritePrompt, ofHideReadOnly, ofNoReadOnlyReturn, ofNoNetworkButton, ofEnableIncludeNotify, ofDontAddToRecent, ofForceShowHidden]
    Left = 224
    Top = 96
  end
  object fid: TFindDialog
    OnFind = fidFind
    Left = 224
    Top = 40
  end
  object red: TReplaceDialog
    OnFind = redFind
    OnReplace = redReplace
    Left = 296
    Top = 40
  end
end
