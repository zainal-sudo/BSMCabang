inherited frmLapStokItemterlaris: TfrmLapStokItemterlaris
  Left = 270
  Top = 225
  Caption = 'Laporan Stok Item terlaris'
  OldCreateOrder = True
  WindowState = wsNormal
  PixelsPerInch = 96
  TextHeight = 13
  inherited AdvPanel1: TAdvPanel
    FullHeight = 0
    inherited cxButton1: TcxButton
      Visible = False
      OnClick = cxButton1Click
    end
    inherited cxButton2: TcxButton
      Visible = False
      OnClick = cxButton2Click
    end
    inherited cxButton3: TcxButton
      Visible = False
    end
    inherited cxButton4: TcxButton
      Visible = False
      OnClick = cxButton4Click
    end
    object cxButton5: TcxButton
      Left = 538
      Top = 2
      Width = 103
      Height = 32
      Caption = 'Lihat Gambar'
      TabOrder = 7
      Visible = False
      OnClick = cxButton5Click
      Align = alLeft
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FFFFFF00EFE7E700EFE7E700EFE7E700EFE7E700EFE7E700E7E7
        E700E7DEDE00DEDEDE00EFEFEF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00EFE7E700FF00FF00FF00FF00FF00FF00FF00FF00DEDE
        DE00DED6D600E7DEDE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00E7DEDE00DED6D600FF00FF00FF00FF00FF00FF00FFEF
        EF00D6CECE006B6B6B00BDBDBD00C6C6C600BDBDBD00BDBDBD00BDBDBD00BDBD
        BD00C6C6C600ADADAD0073737300E7DEDE00A59C9C00FF00FF00FF00FF00E7D6
        D600CEBDBD00524A4A006B6B6B00736B73007373730073737B0073737B007373
        7300737373006B636B00635A5A00D6BDBD00EFD6D600FF00FF00FF00FF00D6BD
        BD00CEB5B500D6BDBD00DEBDA500E7BD9C00E7AD8400E79C6300E79C6B00E7B5
        8C00E7BD9C00DEBDAD00CEBDBD00CEB5B500D6BDBD00FF00FF00FF00FF00F7EF
        EF00EFEFEF00EFD6B500FF840000FF7B0000FF840000FF840000FF840000FF84
        0000FF840000F77B0000E7CEAD00EFE7EF00EFDEDE00FF00FF00FF00FF00FFFF
        FF00EFEFEF00DEC6B500F7BD6B00FFC65A00FFAD3100FFAD2900FFAD2900FFAD
        2900FFAD2900EFA53900D6C6BD00EFDEE700FFF7F700FF00FF00FF00FF00FFFF
        FF00EFEFEF00DECECE00E7D6BD00FFEFD600FFEFD600FFE7CE00FFE7C600F7DE
        BD00FFDEB500E7CEB500D6CED600B5BD9C00F7E7EF00FF00FF00FF00FF00C6BD
        BD00FFFFFF00F7EFEF00D6CEC600F7F7F700F7F7EF00F7F7F700F7F7F700F7F7
        F700EFEFF700CEBDB500FFF7F700FFF7F700B5ADAD00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00DEDEDE00F7FFFF00F7FFFF00EFFFFF00EFFFFF00F7FF
        FF00F7FFFF00DEDEDE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00DEDEDE00FFFFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
        FF00FFFFFF00DEDEDE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00DEDEDE00FFFFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
        FF00FFFFFF00DEDEDE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00DEDEDE00FFFFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
        FF00FFFFFF00DEDEDE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00DEDEDE00FFFFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
        FF00FFFFFF00DEDEDE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00DEDEDE00EFE7E700DEDEDE00DEDEDE00DEDEDE00DEDE
        DE00EFE7E700DEDEDE00FF00FF00FF00FF00FF00FF00FF00FF00}
      LookAndFeel.Kind = lfStandard
      LookAndFeel.SkinName = 'LondonLiquidSky'
    end
  end
  inherited AdvPanel2: TAdvPanel
    FullHeight = 0
    object Label3: TLabel [2]
      Left = 448
      Top = 10
      Width = 57
      Height = 13
      Caption = 'Item Terlaris'
    end
    object edtbatas: TAdvEdit
      Left = 520
      Top = 5
      Width = 72
      Height = 21
      AutoFocus = False
      EditAlign = eaRight
      EditType = etNumeric
      ErrorMarkerPos = 0
      ErrorMarkerLen = 0
      ErrorColor = clRed
      ErrorFontColor = clWhite
      ExcelStyleDecimalSeparator = False
      Flat = False
      FlatLineColor = clBlack
      FlatParentColor = True
      FocusAlign = eaDefault
      FocusBorder = False
      FocusColor = clWindow
      FocusFontColor = clWindowText
      FocusLabel = False
      FocusWidthInc = 0
      ModifiedColor = clHighlight
      DisabledColor = clSilver
      URLColor = clBlue
      ReturnIsTab = False
      LengthLimit = 0
      TabOnFullLength = False
      Precision = 0
      LabelPosition = lpLeftTop
      LabelMargin = 4
      LabelTransparent = False
      LabelAlwaysEnabled = False
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'MS Sans Serif'
      LabelFont.Style = []
      Lookup.CaseSensitive = False
      Lookup.Color = clWindow
      Lookup.DisplayCount = 4
      Lookup.Enabled = False
      Lookup.History = False
      Lookup.NumChars = 2
      Lookup.Multi = False
      Lookup.Separator = ';'
      Persistence.Enable = False
      Persistence.Location = plInifile
      Color = clWindow
      Enabled = True
      HintShowLargeText = False
      OleDropTarget = False
      OleDropSource = False
      Signed = False
      TabOrder = 3
      Text = '200'
      Transparent = False
      Visible = True
    end
  end
  inherited AdvPanel3: TAdvPanel
    FullHeight = 0
    inherited cxGrid: TcxGrid
      inherited cxGrdMaster: TcxGridDBTableView
        OnDblClick = cxButton1Click
        Styles.OnGetContentStyle = cxGrdMasterStylesGetContentStyle
      end
    end
  end
  object cxStyleRepository2: TcxStyleRepository
    Left = 766
    Top = 155
    PixelsPerInch = 96
    object cxStyle2: TcxStyle
      AssignedValues = [svColor]
      Color = clYellow
    end
  end
end
