unit ufrmListSaldoPiutang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, SqlExpr,  cxGraphics,
  cxControls, dxStatusBar, te_controls, Menus, cxLookAndFeelPainters,
  cxButtons, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxClasses, cxGridCustomView, cxGrid ,
  Grids, BaseGrid, AdvGrid, AdvCGrid, ComCtrls, Mask, ImgList, FMTBcd,
  Provider, DB, DBClient, DBGrids, cxLookAndFeels, cxDBData,
  cxGridBandedTableView, cxGridDBTableView,
  cxGridChartView, cxCustomPivotGrid, cxDBPivotGrid, cxPC,
  cxPivotGridChartConnection, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg,
  dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPScxPageControlProducer,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxCommon, dxPSCore,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, AdvEdit,
  AdvEdBtn, dxPScxGrid6Lnk;

type
  TfrmListSaldoPiutang = class(TForm)
    tscrlbx1: TTeScrollBox;
    TePanel4: TTePanel;
    ilMenu: TImageList;
    TePanel1: TTePanel;
    ilToolbar: TImageList;
    TePanel2: TTePanel;
    TeLabel1: TTeLabel;
    SaveDialog1: TSaveDialog;
    TePanel3: TTePanel;
    dtstprvdr1: TDataSetProvider;
    sqlqry1: TSQLQuery;
    ds2: TDataSource;
    ds3: TClientDataSet;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxstyl1: TcxStyle;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    cxChart: TcxGrid;
    cxGrdChart: TcxGridChartView;
    lvlChart: TcxGridLevel;
    cxPivot: TcxDBPivotGrid;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrdDetail: TcxGridDBTableView;
    cxGrid11Level1: TcxGridLevel;
    cxVCLPrinter: TdxComponentPrinter;
    cxVCLPrinterChart: TdxGridReportLink;
    btnRefresh: TcxButton;
    Label1: TLabel;
    startdate: TDateTimePicker;
    Label2: TLabel;
    enddate: TDateTimePicker;
    TePanel5: TTePanel;
    cxButton8: TcxButton;
    cxButton7: TcxButton;
    Label5: TLabel;
    edtCustomer: TAdvEditBtn;
    edtCusNama: TAdvEdit;
    PopupMenu1: TPopupMenu;
    LihatFakturPenjualan1: TMenuItem;
    procedure FormDblClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure sbNewClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure FormKeyPress(Sender: TObject; var Key: Char);

    procedure sbPrintClick(Sender: TObject);
    procedure btnTampilClick(Sender: TObject);
    procedure cxPageControl1Click(Sender: TObject);
    procedure TeSpeedButton1Click(Sender: TObject);
    procedure dttanggalChange(Sender: TObject);
    procedure TeSpeedButton2Click(Sender: TObject);
    procedure SetPivotColumns(ColumnSets: Array Of String);
    procedure SetPivotData(ColumnSets: Array Of String);
    procedure SetPivotRow(ColumnSets: Array Of String);
    procedure cxButton1Click(Sender: TObject);
    procedure edtCustomerClickBtn(Sender: TObject);
    procedure LihatFakturPenjualan1Click(Sender: TObject);

  private
    flagedit : Boolean;
    fid : integer;
    fnomorjual : string ;
    FPivotChartLink: TcxPivotGridChartConnection;
    xtotal,xhpp : Double;
    iskupon : Integer;
    ntotalpremium , ntotalsolar , ntotalpertamax, ntotalpertamaxplus , ntotalpenjualan : double;
    ntotaljpremium , ntotaljsolar , ntotaljpertamax, ntotaljpertamaxplus  : double;
    ntotalbayar : double;
    xhppPremium,xhppsolar,xhpppertamaxplus,xhpppertamax : double ;
    function GetPivotChartLink: TcxPivotGridChartConnection;
  public

    procedure loaddata;
    procedure refreshdata;
    property PivotChartLink: TcxPivotGridChartConnection read GetPivotChartLink
        write FPivotChartLink;

    { Public declarations }
  end;

var

  frmListSaldoPiutang: TfrmListSaldoPiutang;

implementation
   uses Ulib, MAIN, uModuleConnection, cxgridExportlink, uFrmbantuan, ufrmFP, ufrmBayarCustomer;
{$R *.dfm}



procedure TfrmListSaldoPiutang.FormDblClick(Sender: TObject);
begin
  WindowState := wsMaximized;
end;

procedure TfrmListSaldoPiutang.btnExitClick(Sender: TObject);
begin
      Release;
end;

procedure TfrmListSaldoPiutang.refreshdata;
begin
  startdate.DateTime := Date;
  startdate.setfocus;

end;

procedure TfrmListSaldoPiutang.sbNewClick(Sender: TObject);
begin
   refreshdata;
   startdate.SetFocus;
//   sbdelete.Enabled := False;
end;




procedure TfrmListSaldoPiutang.FormShow(Sender: TObject);
begin
  flagedit := False;
  startdate.DateTime := Date;
  enddate.DateTime := Date;
  refreshdata;
end;





procedure TfrmListSaldoPiutang.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
      SelectNext(ActiveControl,True,True);

end;


procedure TfrmListSaldoPiutang.sbPrintClick(Sender: TObject);
begin
  refreshdata;
end;

procedure TfrmListSaldoPiutang.loaddata;
var
  skolom,s: string ;
  afilter : string ;
  i:integer;
begin


        s:= 'select Customer,cus_nama Nama,Tax,ifnull(saldo_awal,0) Saldo_awal,ifnull(Total,0) Total,'
      + ' ifnull(retur,0) Retur,Bayar_cash,Bayar_transfer,Giro,Potongan,Deposit,Koreksi_LR,Hutang_Internal,UM_Penjualan,PPN_Keluaran,PPh_22,'
      + ' (ifnull(saldo_awal,0)+ifnull(Total,0))- '
      + ' (ifnull(retur,0)+ifnull(bayar_cash,0)+ifnull(bayar_transfer,0)+ifnull(giro,0)+ifnull(potongan,0)+ifnull(deposit,0)+ifnull(KOREKSI_LR,0)+ifnull(um_penjualan,0)+ifnull(hutang_internal,0)+ifnull(ppn_keluaran,0)++ifnull(pph_22,0)) Saldo_Akhir from ('
      + ' select aa.customer,aa.tax,'
      + ' ifnull(( select sum(kredit-debet) from kartu_piutang where tanggal < '+quotd(startdate.Date)
      + ' and customer= aa.customer and tax=aa.tax),0) Saldo_Awal ,'
      + ' sum(Bruto) Bruto,sum(Disc)Disc,sum(Dpp) Dpp,'
      + ' sum(Pajak) Pajak,sum(Total) Total ,sum(Biaya_Promosi) Biaya_Promosi,sum(Kontrak) Kontrak,sum(freight) Freight,'
      + '  sum(Retur) Retur,sum(Bayar_Cash) Bayar_Cash,sum(Bayar_Transfer) Bayar_Transfer,sum(Giro) Giro,'
      + ' sum(Deposit) Deposit,sum(Potongan) Potongan,sum(koreksi_lr) koreksi_lr,sum(hutang_internal) Hutang_Internal,sum(um_penjualan) Um_Penjualan,sum(PPn_Keluaran) PPn_Keluaran,sum(PPh_22) PPh_22'
      + ' from '
      + ' (select customer,tax from transaksi_harian group by customer,tax) aa'
      + ' left join transaksi_harian A on  aa.customer=a.customer and a.tax=aa.tax'
      + ' and tanggal between '+quotd(startdate.Date)+' and '+quotd(enddate.Date)
      + ' group by Aa.customer,Aa.Tax  order by Tanggal ) final'
      + ' inner join tcustomer on cus_kode=customer ';

//
//        select Tanggal,Customer,cus_nama Nama,Tax,sum(Bruto) Bruto,sum(Disc)Disc,sum(Dpp) Dpp,sum(Pajak) Pajak,sum(Total) Total'
//        + ' ,sum(Biaya_Promosi) Biaya_Promosi,sum(Kontrak) Kontrak,sum(freight) Freight,'
//        + ' sum(Retur) Retur,sum(Bayar_Cash) Bayar_Cash,sum(Bayar_Transfer) Bayar_Transfer,sum(Giro) Giro,sum(Deposit) Deposit,sum(Potongan) Potongan'
//        + ' from transaksi_harian A inner join tcustomer on cus_kode=customer '
//        + ' where tanggal between ' + QuotD(startdate.DateTime) + ' and ' + QuotD(enddate.DateTime)
//        + ' and customer like '+ quot(edtcustomer.text+'%')
//        +' group by Tanggal,customer,cus_nama,Tax '
//        + ' order by Tanggal';

        ds3.Close;
        sqlqry1.SQLConnection := frmmenu.conn;
        sqlqry1.SQL.Text := s;
        ds3.open;


        Skolom :='Customer,Nama,Tax,Saldo_Awal,Total,Retur,Bayar_Cash,Bayar_Transfer,Giro,Potongan,Deposit,Koreksi_LR,Hutang_Internal,UM_Penjualan,PPN_Keluaran,Pph_22,Saldo_Akhir';
        QueryToDBGrid(cxGrid1DBTableView1, s,skolom ,ds2);
           cxGrid1DBTableView1.Columns[0].MinWidth := 60;
           cxGrid1DBTableView1.Columns[1].MinWidth := 60;
           cxGrid1DBTableView1.Columns[2].MinWidth := 100;
           cxGrid1DBTableView1.Columns[3].MinWidth := 100;
           cxGrid1DBTableView1.Columns[4].MinWidth := 100;
           cxGrid1DBTableView1.Columns[5].MinWidth := 100;
           cxGrid1DBTableView1.Columns[6].MinWidth := 100;
           cxGrid1DBTableView1.Columns[7].MinWidth := 100;

        for i:=0 To cxGrid1DBTableView1.ColumnCount -1 do
        begin
          if ds3.Fields[i].DataType = ftFloat then
          begin
             ds3.Fields[i].Alignment := taRightJustify;
             TFloatField(ds3.Fields[i]).DisplayFormat := '###,###,###';
          end;

        end;
        cxGrid1DBTableView1.Columns[1].Summary.GroupFooterKind:=skCount;
        cxGrid1DBTableView1.Columns[1].Summary.GroupFooterFormat:='####';
        cxGrid1DBTableView1.Columns[9].Summary.GroupFooterKind:=skSum;
        cxGrid1DBTableView1.Columns[9].Summary.GroupFooterFormat:='###,###,###,###';

        cxGrid1DBTableView1.Columns[8].Summary.GroupFooterKind:=skSum;
        cxGrid1DBTableView1.Columns[8].Summary.GroupFooterFormat:='###,###,###,###';
        cxGrid1DBTableView1.Columns[4].Summary.GroupFooterKind:=skSum;
        cxGrid1DBTableView1.Columns[4].Summary.GroupFooterFormat:='###,###,###,###';

        cxGrid1DBTableView1.Columns[5].Summary.GroupFooterKind:=skSum;
        cxGrid1DBTableView1.Columns[5].Summary.GroupFooterFormat:='###,###,###,###';
        cxGrid1DBTableView1.Columns[6].Summary.GroupFooterKind:=skSum;
        cxGrid1DBTableView1.Columns[6].Summary.GroupFooterFormat:='###,###,###,###';
        cxGrid1DBTableView1.Columns[7].Summary.GroupFooterKind:=skSum;
        cxGrid1DBTableView1.Columns[7].Summary.GroupFooterFormat:='###,###,###,###';
        cxGrid1DBTableView1.Columns[9].Summary.FooterKind:=skSum;
        cxGrid1DBTableView1.Columns[9].Summary.FooterFormat:='###,###,###,###';
        cxGrid1DBTableView1.Columns[10].Summary.FooterKind:=skSum;
        cxGrid1DBTableView1.Columns[10].Summary.FooterFormat:='###,###,###,###';
        cxGrid1DBTableView1.Columns[11].Summary.FooterKind:=skSum;
        cxGrid1DBTableView1.Columns[11].Summary.FooterFormat:='###,###,###,###';
        cxGrid1DBTableView1.Columns[12].Summary.FooterKind:=skSum;
        cxGrid1DBTableView1.Columns[12].Summary.FooterFormat:='###,###,###,###';
        cxGrid1DBTableView1.Columns[13].Summary.FooterKind:=skSum;
        cxGrid1DBTableView1.Columns[13].Summary.FooterFormat:='###,###,###,###';
        cxGrid1DBTableView1.Columns[14].Summary.FooterKind:=skSum;
        cxGrid1DBTableView1.Columns[14].Summary.FooterFormat:='###,###,###,###';
        cxGrid1DBTableView1.Columns[15].Summary.FooterKind:=skSum;
        cxGrid1DBTableView1.Columns[15].Summary.FooterFormat:='###,###,###,###';
        cxGrid1DBTableView1.Columns[16].Summary.FooterKind:=skSum;
        cxGrid1DBTableView1.Columns[16].Summary.FooterFormat:='###,###,###,###';

        cxGrid1DBTableView1.Columns[8].Summary.FooterKind:=skSum;
        cxGrid1DBTableView1.Columns[8].Summary.FooterFormat:='###,###,###,###';
        cxGrid1DBTableView1.Columns[4].Summary.FooterKind:=skSum;
        cxGrid1DBTableView1.Columns[4].Summary.FooterFormat:='###,###,###,###';
        cxGrid1DBTableView1.Columns[3].Summary.FooterKind:=skSum;
        cxGrid1DBTableView1.Columns[3].Summary.FooterFormat:='###,###,###,###';

        cxGrid1DBTableView1.Columns[5].Summary.FooterKind:=skSum;
        cxGrid1DBTableView1.Columns[5].Summary.FooterFormat:='###,###,###,###';
        cxGrid1DBTableView1.Columns[6].Summary.FooterKind:=skSum;
        cxGrid1DBTableView1.Columns[6].Summary.FooterFormat:='###,###,###,###';
        cxGrid1DBTableView1.Columns[7].Summary.FooterKind:=skSum;
        cxGrid1DBTableView1.Columns[7].Summary.FooterFormat:='###,###,###,###';

//  hitung;
          TcxDBPivotHelper(cxPivot).LoadFromCDS(ds3);
           SetPivotColumns(['Tax']);
           SetPivotRow (['Customer']);
           SetPivotData(['Saldo_Akhir']);


end;

procedure TfrmListSaldoPiutang.btnTampilClick(Sender: TObject);
begin
    loaddata;

end;

procedure TfrmListSaldoPiutang.cxPageControl1Click(Sender: TObject);
begin
IF PageControl1.Pages[2].Visible  then
begin
  PivotChartLink.GridChartView := cxGrdChart;
  PivotChartLink.PivotGrid := cxPivot;
end;
end;

procedure TfrmListSaldoPiutang.TeSpeedButton1Click(Sender: TObject);
begin

  IF PageControl1.Pages[1].Visible  then
     TcxDBPivotHelper(cxPivot).ExportToXLS
  else
  begin
     if SaveDialog1.Execute then
     begin
       ExportGridToExcel(SaveDialog1.FileName, cxGrid1);
     end;
 end;


end;


procedure TfrmListSaldoPiutang.dttanggalChange(Sender: TObject);
begin
  enddate.DateTime := startdate.DateTime;
end;

function TfrmListSaldoPiutang.GetPivotChartLink: TcxPivotGridChartConnection;
begin
  If not Assigned(FPivotChartLink) then
    FPivotChartLink := TcxPivotGridChartConnection.Create(Self);
  Result := FPivotChartLink;
end;

procedure TfrmListSaldoPiutang.TeSpeedButton2Click(Sender: TObject);
begin
//  IF PageControl1.Pages[1].Visible  then
//     cxVCLPrinterPivot.Preview
//  else
//  if PageControl1.Pages[2].Visible  then
//    cxVCLPrinterChart.Preview;
end;

procedure TfrmListSaldoPiutang.SetPivotRow(ColumnSets: Array Of String);
begin
  TcxDBPivotHelper(cxPivot).SetRowColumns(ColumnSets);
end;

procedure TfrmListSaldoPiutang.SetPivotColumns(ColumnSets: Array Of String);
begin

  TcxDBPivotHelper(cxPivot).SetColColumns(ColumnSets);
end;

procedure TfrmListSaldoPiutang.SetPivotData(ColumnSets: Array Of String);
begin

  TcxDBPivotHelper(cxPivot).SetDataColumns(ColumnSets);
end;


procedure TfrmListSaldoPiutang.cxButton1Click(Sender: TObject);
begin
//With cxPivot.GetFieldByName('Salesman') do
//  begin
//    if SortBySummaryInfo.Field = nil then
//      SortBySummaryInfo.Field := cxPivot.GetFieldByName('Riil')
//    else
//      SortBySummaryInfo.Field := nil;
//  end;
//
//With cxPivot.GetFieldByName('Customer') do
//  begin
//    if SortBySummaryInfo.Field = nil then
//      SortBySummaryInfo.Field := cxPivot.GetFieldByName('Riil')
//    else
//      SortBySummaryInfo.Field := nil;
//  end;

end;

procedure TfrmListSaldoPiutang.edtCustomerClickBtn(Sender: TObject);
begin
  sqlbantuan := ' select cus_kode Kode,cus_nama Nama from tcustomer  ';
  sqlfilter := 'Kode,Nama';
  Application.CreateForm(Tfrmbantuan,frmbantuan);
  frmBantuan.SQLMaster := SQLbantuan;
  frmBantuan.ShowModal;
   if varglobal <> '' then
 begin
  edtcustomer.Text := varglobal;
  edtCusNama.Text :=  varglobal1;
 end;

end;

procedure TfrmListSaldoPiutang.LihatFakturPenjualan1Click(
  Sender: TObject);
var
  frmFP: TfrmFP;
  frmbayarcustomer : TfrmBayarCustomer;
begin
  inherited;
  If ds3.FieldByname('Nomor').IsNull then exit;
  if pos(UpperCase('FP'),UpperCase(ds3.FieldByname('Nomor').AsString)) > 0  then
  begin
  if ActiveMDIChild.Caption <> 'Faktur Penjualan' then
   begin
//      ShowForm(TfrmBrowseBarang).Show;
      frmFP  := frmmenu.ShowForm(TfrmFP) as TfrmFP;
      frmFP.ID := ds3.FieldByname('Nomor').AsString;
      frmFP.FLAGEDIT := True;
      frmFP.edtnOMOR.Text := ds3.FieldByname('Nomor').AsString;
      frmFP.loaddataall(ds3.FieldByname('Nomor').AsString);
//      if cekbayar(CDS.FieldByname('Invoice').AsString) = 1 then
//      begin
//        ShowMessage('Transaksi ini sudah ada pembayaran,Tidak dapat di edit');
        frmFP.cxButton2.Enabled :=False;
        frmFP.cxButton1.Enabled :=False;
        frmFP.cxButton3.Enabled := False;
//      end;
   end;
   frmFP.Show;
 end;
   if pos(UpperCase('CR'),UpperCase(ds3.FieldByname('Nomor').AsString)) > 0  then
  begin
  if ActiveMDIChild.Caption <> 'Faktur Penjualan' then
   begin
//      ShowForm(TfrmBrowseBarang).Show;
      frmBayarCustomer  := frmmenu.ShowForm(TfrmBayarCustomer) as TfrmBayarCustomer;
      frmBayarCustomer.ID := ds3.FieldByname('Nomor').AsString;
      frmBayarCustomer.FLAGEDIT := True;
      frmBayarCustomer.edtnOMOR.Text := ds3.FieldByname('Nomor').AsString;
      frmBayarCustomer.loaddataall(ds3.FieldByname('Nomor').AsString);
//      if cekbayar(CDS.FieldByname('Invoice').AsString) = 1 then
//      begin
//        ShowMessage('Transaksi ini sudah ada pembayaran,Tidak dapat di edit');
        frmBayarCustomer.cxButton2.Enabled :=False;
        frmBayarCustomer.cxButton1.Enabled :=False;

//      end;
   end;
   frmBayarCustomer.Show;
 end;
end;


end.
