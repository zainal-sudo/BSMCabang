inherited frmBrowseKoreksiStok: TfrmBrowseKoreksiStok
  Left = 394
  Top = 139
  Caption = 'Browse Koreksi Stok'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited AdvPanel1: TAdvPanel
    FullHeight = 0
    inherited cxButton1: TcxButton
      Visible = False
    end
    inherited cxButton2: TcxButton
      OnClick = cxButton2Click
    end
    inherited cxButton3: TcxButton
      Left = 281
      OnClick = cxButton3Click
    end
    inherited cxButton4: TcxButton
      Width = 105
      Caption = '&Update Status'
      Visible = False
    end
    inherited cxButton7: TcxButton
      Left = 368
    end
    inherited cxButton6: TcxButton
      Left = 455
    end
  end
  inherited AdvPanel2: TAdvPanel
    FullHeight = 0
  end
  inherited AdvPanel3: TAdvPanel
    FullHeight = 0
    inherited cxGrid: TcxGrid
      inherited cxGrdMaster: TcxGridDBTableView
        OptionsView.Footer = True
      end
    end
  end
end
