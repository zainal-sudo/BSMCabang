unit ufrmPerusahaan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, ComCtrls, StdCtrls, AdvEdit,SqlExpr, Grids,
  BaseGrid, AdvGrid, AdvCGrid, Menus, cxLookAndFeelPainters, cxButtons,
  cxGraphics, cxLookAndFeels, dxSkinsCore, dxSkinsDefaultPainters, MyAccess;

type
  TfrmPerusahaan = class(TForm)
    AdvPanel1: TAdvPanel;
    StatusBar1: TStatusBar;
    Label3: TLabel;
    edtNama: TAdvEdit;
    Label1: TLabel;
    edtAlamat: TAdvEdit;
    Label2: TLabel;
    edtKota: TAdvEdit;
    edtTelp: TAdvEdit;
    Label4: TLabel;
    edtFax: TAdvEdit;
    Label5: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label22: TLabel;
    edtNamaNPWP: TAdvEdit;
    edtAlamatNPWP: TAdvEdit;
    edtNoNPWP: TAdvEdit;
    edtKotaNPWP: TAdvEdit;
    AdvPanel3: TAdvPanel;
    Label12: TLabel;
    edtEmail: TAdvEdit;
    cxButton1: TcxButton;
    cxButton8: TcxButton;
    Label6: TLabel;
    edtRekening: TAdvEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure loaddata;
    procedure simpandata;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure refreshdata;
    procedure cxButton8Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);

  private
    FID:string;
    FLAGEDIT : Boolean;
    { Private declarations }
  public

    { Public declarations }
  end;

var
  frmPerusahaan: TfrmPerusahaan;

implementation
uses MAIN, uModuleConnection, uFrmbantuan, Ulib, DB;

{$R *.dfm}

procedure TfrmPerusahaan.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F8 then
  begin
    if MessageDlg('Ingin Keluar dari Modul ?',mtCustom,
                      [mbYes,mbNo], 0) = mrYes
    then Release;
  end;

  if Key = VK_F7 then
  begin
    refreshdata;
  end;


  if Key = VK_F10 then
  begin
    if ( not cekedit(frmMenu.KDUSER,self.name)) then
    begin
      ShowMessage('Anda tidak berhak Edit di Modul ini');
      Exit;
    End;

    try
      if MessageDlg('Yakin ingin simpan ?',mtCustom,
                        [mbYes,mbNo], 0)= mrNo
      then Exit;

      simpandata;
    except
      ShowMessage('Gagal Simpan');
      Exit;
    end;

    refreshdata;
  end;
end;

procedure TfrmPerusahaan.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    SelectNext(ActiveControl,True,True);
end;

procedure TfrmPerusahaan.loaddata;
var
  s: String;
  tsql: TmyQuery;
begin
  s:= ' select PERUSH_NAMA,PERUSH_ALAMAT,PERUSH_KOTA,PERUSH_noTELP,PERUSH_noFAX,perush_kdpos,'
  + ' perush_npwp,perush_nama_npwp,perush_alnpwp,perush_ktnpwp,perush_rekening '
  + ' from TPERUSAHAAN';
  tsql := xOpenQuery(s, frmMenu.conn);
  with tsql do
  begin
    try
      if not eof then
      begin
        edtnama.Text := Fields[0].AsString;
        edtalamat.Text := Fields[1].AsString;
        edtkota.Text := Fields[2].AsString;
        edttelp.Text := Fields[3].AsString;
        edtfax.Text := Fields[4].AsString;

        edtNoNPWP.Text := Fields[6].AsString;
        edtNamaNPWP.Text := Fields[7].AsString;
        edtAlamatNPWP.Text := Fields[8].AsString;
        edtKotaNPWP.Text := Fields[9].AsString;
        edtRekening.Text := Fields[10].AsString;

        edtnama.SetFocus;
        FLAGEDIT := True;
      end;
    finally
      Free;
    end;
  End;
end;

procedure TfrmPerusahaan.simpandata;
var
  s: string;
  astat: Integer;
  tt: TStrings;
  i: integer;
begin
  s := 'update tperusahaan set perush_nama = ' + Quot(edtnama.Text) + ','
       + ' perush_alamat = ' + Quot(edtalamat.Text) + ','
       + ' perush_kota = ' + Quot(edtkota.Text) + ','
       + ' perush_notelp = ' + Quot(edttelp.Text) + ','
       + ' perush_nofax = ' + Quot(edtfax.Text) + ','
       + ' perush_NPWP = ' + Quot(edtNoNPWP.Text) + ','
       + ' perush_nama_NPWP = ' + Quot(edtNamaNPWP.Text) + ','
       + ' perush_alNPWP = ' + Quot(edtAlamatNPWP.Text) + ','
       + ' perush_ktNPWP = ' + Quot(edtkotaNPWP.Text) + ','
       + ' perush_rekening = ' + Quot(edtRekening.Text)
       + ';';
  
  EnsureConnected(frmMenu.conn);
  ExecSQLDirect(frmMenu.conn, s);
end;

procedure TfrmPerusahaan.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Release;
end;

procedure TfrmPerusahaan.FormShow(Sender: TObject);
begin
  refreshdata;
end;

procedure TfrmPerusahaan.refreshdata;
begin
  loaddata;
end;

procedure TfrmPerusahaan.cxButton8Click(Sender: TObject);
begin
  Release;
end;

procedure TfrmPerusahaan.cxButton1Click(Sender: TObject);
begin
  if ( not cekedit(frmMenu.KDUSER,self.name)) then
  begin
    ShowMessage('Anda tidak berhak Edit di Modul ini');
    Exit;
  End;

  try
    if MessageDlg('Yakin ingin simpan ?',mtCustom,
                        [mbYes,mbNo], 0)= mrNo
    then Exit ;

    simpandata;
  except
    ShowMessage('Gagal Simpan');
    Exit;
  end;
    
  refreshdata;
end;

end.
