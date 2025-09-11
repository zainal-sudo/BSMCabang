unit ufrmLapBulanan4;

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
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, AdvCombo,
  cxCurrencyEdit, cxGridDBBandedTableView, dxPScxGrid6Lnk,DateUtils,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue,
  DBAccess, MyAccess, MemDS;

type
  TfrmLapBulanan4 = class(TForm)
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
    sqlqry2: TSQLQuery;
    ds2: TDataSource;
    ds3: TClientDataSet;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxstyl1: TcxStyle;
    cxVCLPrinter: TdxComponentPrinter;
    cxVCLPrinterChart: TdxGridReportLink;
    btnRefresh: TcxButton;
    Label1: TLabel;
    TePanel5: TTePanel;
    cxButton8: TcxButton;
    cxButton7: TcxButton;
    cbbBulan: TAdvComboBox;
    cxGrid1: TcxGrid;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView1Column1: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column2: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column3: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column4: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column5: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column6: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column7: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column8: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column9: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column10: TcxGridDBBandedColumn;
    cxGrid1Level1: TcxGridLevel;
    Label2: TLabel;
    edtTahun: TComboBox;
    cxGrid1DBBandedTableView1Column11: TcxGridDBBandedColumn;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle2: TcxStyle;
    cxGrid1DBBandedTableView1Column12: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column13: TcxGridDBBandedColumn;
    growth: TcxGridDBBandedColumn;
    growth2: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column16: TcxGridDBBandedColumn;
    cxStyleRepository3: TcxStyleRepository;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxGrid1DBBandedTableView1Column14: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column15: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column17: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column18: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column19: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column20: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column21: TcxGridDBBandedColumn;
    clAll: TcxGridDBBandedColumn;
    clAllratio: TcxGridDBBandedColumn;
    newcustomer: TcxGridDBBandedColumn;
    cxRSKLINIK: TcxGridDBBandedColumn;
    sqlqry1: TMyQuery;

    procedure FormDblClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure sbNewClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure FormKeyPress(Sender: TObject; var Key: Char);

    procedure sbPrintClick(Sender: TObject);
    procedure btnTampilClick(Sender: TObject);
    procedure cxGrid1DBBandedTableView1Column10CustomDrawCell(Sender:
        TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo:
        TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBBandedTableView1Column10CustomDrawFooterCell(Sender:
        TcxGridTableView; ACanvas: TcxCanvas; AViewInfo:
        TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure growthCustomDrawCell(Sender:
        TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo:
        TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure growthCustomDrawFooterCell(Sender:
        TcxGridTableView; ACanvas: TcxCanvas; AViewInfo:
        TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure cxGrid1DBBandedTableView1Column8CustomDrawCell(Sender:
        TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo:
        TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBBandedTableView1Column8CustomDrawFooterCell(Sender:
        TcxGridTableView; ACanvas: TcxCanvas; AViewInfo:
        TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure
        cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems12GetText(
        Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean; var
        AText: string);
    procedure
        cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems14GetText(
        Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean; var
        AText: string);
    procedure TeSpeedButton1Click(Sender: TObject);
    procedure cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems8GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);
    procedure cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems9GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);
    procedure growth2CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas:
        TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure growth2CustomDrawFooterCell(Sender: TcxGridTableView; ACanvas:
        TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems16GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);
    procedure cxGrid1DBBandedTableView1Column19CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBBandedTableView1Column19CustomDrawFooterCell(
      Sender: TcxGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure cxGrid1DBBandedTableView1Column21CustomDrawCell(Sender:
        TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo:
        TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBBandedTableView1Column21CustomDrawFooterCell(Sender:
        TcxGridTableView; ACanvas: TcxCanvas; AViewInfo:
        TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems19GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);
    procedure
        cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems21GetText(
        Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean; var
        AText: string);
    procedure cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems23GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);

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

    procedure loaddata
    ;
    procedure refreshdata;
    property PivotChartLink: TcxPivotGridChartConnection read GetPivotChartLink
        write FPivotChartLink;

    { Public declarations }
  end;

var

  frmLapBulanan4: TfrmLapBulanan4;

implementation
   uses Ulib, MAIN, uModuleConnection, cxgridExportlink;
{$R *.dfm}



procedure TfrmLapBulanan4.FormDblClick(Sender: TObject);
begin
  WindowState := wsMaximized;
end;

procedure TfrmLapBulanan4.btnExitClick(Sender: TObject);
begin
      Release;
end;

procedure TfrmLapBulanan4.refreshdata;
begin
  edttahun.text :=  FormatDateTime('yyyy',Date);
end;

procedure TfrmLapBulanan4.sbNewClick(Sender: TObject);
begin
   refreshdata;

end;




procedure TfrmLapBulanan4.FormShow(Sender: TObject);
begin
  flagedit := False;
  refreshdata;
end;





procedure TfrmLapBulanan4.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
      SelectNext(ActiveControl,True,True);

end;


procedure TfrmLapBulanan4.sbPrintClick(Sender: TObject);
begin
  refreshdata;
end;

procedure TfrmLapBulanan4.loaddata;
var
  s,ssql:string;
  capaibulanini : double;
  totaltarget : double;
  tsql : TmyQuery;
akhir,akhir2 : TDateTime;
begin
      if  cbbBulan.itemindex <> 0 then
      begin
      akhir := EndOfTheMonth(StrToDate(IntToStr(cbbBulan.itemindex )+'/01/'+edttahun.Text));
      akhir2 := EndOfTheMonth(StrToDate(IntToStr(cbbBulan.itemindex+1 )+'/01/'+edttahun.Text));
      end
      else
      begin
        akhir := EndOfTheMonth(StrToDate('12/01/'+inttostr(StrToInt(edtTahun.text)-1)));
        akhir2 := EndOfTheMonth(StrToDate(IntToStr(cbbBulan.itemindex+1 )+'/01/'+edttahun.Text));
      end;

    ssql:='SELECT distinct sls_kode,sls_nama salesman,CAST(0 AS DECIMAL(15,2)) targetbulanini,CAST(0 AS DECIMAL(15,2)) targetsdbulanini, '
        + ' cast(0 as decimal(5,2)) pfratio,cast(0 as decimal(5,2)) growth,cast(0 as decimal(5,2)) growth2,cast(0 as decimal) riilbulaninilalu,'
        + ' cast(0 as decimal) riilsdbulaniniLalu,cast(0 as decimal) targettahunan,cast(0 as decimal(5,2)) ratio,'
        + ' cast(0 as decimal(5,2)) ratiopiutang,cast(0 as decimal) targetpiutang,cast(0 as decimal) realisasipiutang,'
        + ' CAST(0 AS DECIMAL(15,2))  riilbulanini,CAST(0 AS DECIMAL(15,2))  riilsdbulanini,CAST(0 AS DECIMAL(15,2))  pf,CAST(0 AS DECIMAL(15,2))  persenbulanini'
        + ' ,CAST(0 AS DECIMAL(15,2))  persensdbulanini,CAST(0 AS DECIMAL(15,2))  realisasiall,CAST(0 AS DECIMAL(15,2))  allratio,cast(0 as decimal(5,0)) newcustomer'
        + ' ,cast(0 as decimal(5,0)) rsklinik '
        + ' FROM tsalesman INNER JOIN tsalesmantarget '
        + ' ON sls_kode=st_sls_kode '
        + ' WHERE st_tahun='+ edttahun.text;
        ds3.Close;
        sqlqry1.Connection := frmMenu.conn;
        sqlqry1.SQL.Text := ssql;
        ds3.open;
// target

    ssql := 'SELECT sls_nama salesman,st_targetsales target FROM tsalesmantarget inner join tsalesman on sls_kode=st_sls_kode WHERE st_periode='+IntToStr(cbbBulan.itemindex+1 )+' AND st_tahun='+ edttahun.text;
    tsql := xOpenQuery(ssql,frmMenu.conn);

    with tsql do
    begin
      try
        while not eof do
        begin
             if ds3.Locate('salesman',FieldByName('salesman').AsString,[loCaseInsensitive]) then
             begin
               If ds3.State <> dsEdit then ds3.Edit;
                ds3.FieldByName('targetBulanini').AsFloat := FieldByName('target').AsFloat/1000;
             end;
          Next;
        end;
      finally
        Free;
      end;
    end;

 /// target sd bulan ini

    ssql := 'SELECT sls_nama salesman,sum(st_targetsales) targetsdbulanini '
            + ' FROM tsalesmantarget inner join tsalesman on sls_kode=st_sls_kode WHERE st_periode <= '+IntToStr(cbbBulan.itemindex+1 )+' AND st_tahun='+ edttahun.text
            +  ' group by sls_nama ';
    tsql := xOpenQuery(ssql,frmMenu.conn);
    with tsql do
    begin
      try
        while not eof do
        begin
             if ds3.Locate('salesman',FieldByName('salesman').AsString,[loCaseInsensitive]) then
             begin
               If ds3.State <> dsEdit then ds3.Edit;
                ds3.FieldByName('targetsdbulanini').AsFloat := FieldByName('targetsdbulanini').AsFloat/1000;
             end;
          Next;
        end;
      finally
        Free;
      end;
    end;
// riill

  ssql :='SELECT salesman,riil-ifnull(retur,0) Riilbulanini FROM ('
+ ' SELECT b.sls_nama salesman ,SUM(if(year(tanggal)>2021,dpp,total)-biaya_promosi-kontrak) riil,'
+ ' (select sum(ifnull(if(year(retj_tanggal)>2021,retj_amount-retj_taxamount,retj_amount),0)) from tretj_hdr inner join tfp_hdr on retj_fp_nomor=fp_nomor'
+ ' inner join tdo_hdr on do_nomor=fp_do_nomor inner join tso_hdr on so_nomor=do_so_nomor'
+ ' where so_sls_kode = a.salesman  and month(retj_tanggal)='+ IntToStr(cbbBulan.itemindex +1)+' and year(retj_tanggal)='+ edtTahun.Text
+ ' group by so_sls_kode) Retur'
+ ' FROM penjualan a INNER JOIN tsalesman b ON sls_kode=salesman '
+ ' WHERE MONTH(tanggal) = '+ IntToStr(cbbBulan.itemindex +1) +' AND YEAR(tanggal)='+ edttahun.text
+ ' GROUP BY b.sls_nama) final ';
    tsql := xOpenQuery(ssql,frmMenu.conn);
    with tsql do
    begin
      try
        while not eof do
        begin
             if ds3.Locate('salesman',FieldByName('salesman').AsString,[loCaseInsensitive]) then
             begin
               If ds3.State <> dsEdit then ds3.Edit;
                ds3.FieldByName('riilbulanini').AsFloat := FieldByName('riilbulanini').AsFloat/1000;
                if FieldByName('riilbulanini').AsFloat > 0 then
                ds3.FieldByName('persenbulanini').AsFloat :=ds3.FieldByName('riilbulanini').AsFloat/ds3.FieldByName('targetbulanini').AsFloat*100;

             end;
          Next;
        end;
      finally
        Free;
      end;
    end;

// riill

  ssql :='SELECT salesman,riil-ifnull(retur,0) Riilsdbulanini FROM ('
+ ' SELECT b.sls_nama salesman ,SUM(if(year(tanggal)>2021,dpp,total)-biaya_promosi-kontrak) riil,'
+ ' (select sum(ifnull(if(year(retj_tanggal)>2021,retj_amount-retj_taxamount,retj_amount),0)) from tretj_hdr inner join tfp_hdr on retj_fp_nomor=fp_nomor'
+ ' inner join tdo_hdr on do_nomor=fp_do_nomor inner join tso_hdr on so_nomor=do_so_nomor'
+ ' where so_sls_kode = a.salesman  and month(retj_tanggal)<='+ IntToStr(cbbBulan.itemindex +1)+' and year(retj_tanggal)='+ edtTahun.Text
+ ' group by so_sls_kode) Retur'
+ ' FROM penjualan a INNER JOIN tsalesman b ON sls_kode=salesman'
+ ' WHERE MONTH(tanggal) <= '+ IntToStr(cbbBulan.itemindex +1) +' AND YEAR(tanggal)='+ edttahun.text
+ ' GROUP BY b.sls_nama) final ';
    tsql := xOpenQuery(ssql,frmMenu.conn);
    with tsql do
    begin
      try
        while not eof do
        begin
             if ds3.Locate('salesman',FieldByName('salesman').AsString,[loCaseInsensitive]) then
             begin
               If ds3.State <> dsEdit then ds3.Edit;
                ds3.FieldByName('riilsdbulanini').AsFloat := FieldByName('riilsdbulanini').AsFloat/1000;
                if ds3.FieldByName('targetsdbulanini').AsFloat > 0 then
                ds3.FieldByName('persensdbulanini').AsFloat :=ds3.FieldByName('riilsdbulanini').AsFloat/(ds3.FieldByName('targetsdbulanini').AsFloat)*100;
                ds3.Post;
             end;
          Next;
        end;
      finally
        Free;
      end;
    end;

// riill tahun lalu

  ssql :='SELECT salesman,riil-ifnull(retur,0) Riilbulaninilalu FROM ('
+ ' SELECT b.sls_nama salesman ,SUM(if(year(tanggal)>2021,dpp,total)-biaya_promosi-kontrak) riil,'
+ ' (select sum(ifnull(if(year(retj_tanggal)>2021,retj_amount-retj_taxamount,retj_amount),0)) from tretj_hdr inner join tfp_hdr on retj_fp_nomor=fp_nomor'
+ ' inner join tdo_hdr on do_nomor=fp_do_nomor inner join tso_hdr on so_nomor=do_so_nomor'
+ ' where so_sls_kode = a.salesman  and month(retj_tanggal)='+ IntToStr(cbbBulan.itemindex +1)+' and year(retj_tanggal)='+ inttostr(strtoint(edtTahun.Text)-1)
+ ' group by so_sls_kode) Retur'
+ ' FROM penjualan a INNER JOIN tsalesman b ON sls_kode=salesman'
+ ' WHERE MONTH(tanggal) = '+ IntToStr(cbbBulan.itemindex +1) +' AND YEAR(tanggal)='+ inttostr(strtoint(edtTahun.Text)-1)
+ ' GROUP BY b.sls_nama) final ';
    tsql := xOpenQuery(ssql,frmMenu.conn);
    with tsql do
    begin
      try
        while not eof do
        begin

             if ds3.Locate('salesman',FieldByName('salesman').AsString,[loCaseInsensitive]) then
             begin
               If ds3.State <> dsEdit then ds3.Edit;
                ds3.FieldByName('riilbulaninilalu').AsFloat := FieldByName('riilbulaninilalu').AsFloat/1000;
              if FieldByName('riilbulaninilalu').AsFloat > 0 then
                ds3.FieldByName('growth').AsFloat :=ds3.FieldByName('riilbulanini').AsFloat/(FieldByName('riilbulaninilalu').AsFloat/1000)*100;


             end;
          Next;
        end;
      finally
        Free;
      end;
    end;

// riill tahun lalu

  ssql :='SELECT salesman,riil-ifnull(retur,0) Riilsdbulaninilalu FROM ('
+ ' SELECT b.sls_nama salesman ,SUM(if(year(tanggal)>2021,dpp,total)-biaya_promosi-kontrak) riil,'
+ ' (select sum(ifnull(if(year(retj_tanggal)>2021,retj_amount-retj_taxamount,retj_amount),0)) from tretj_hdr inner join tfp_hdr on retj_fp_nomor=fp_nomor'
+ ' inner join tdo_hdr on do_nomor=fp_do_nomor inner join tso_hdr on so_nomor=do_so_nomor'
+ ' where so_sls_kode = a.salesman  and month(retj_tanggal)<='+ IntToStr(cbbBulan.itemindex +1)+' and year(retj_tanggal)='+ inttostr(strtoint(edtTahun.Text)-1)
+ ' group by so_sls_kode) Retur'
+ ' FROM penjualan a INNER JOIN tsalesman b ON sls_kode=salesman'
+ ' WHERE MONTH(tanggal) <= '+ IntToStr(cbbBulan.itemindex +1) +' AND YEAR(tanggal)='+ inttostr(strtoint(edtTahun.Text)-1)
+ ' GROUP BY b.sls_nama) final ';
    tsql := xOpenQuery(ssql,frmMenu.conn);
    with tsql do
    begin
      try
        while not eof do
        begin
             if ds3.Locate('salesman',FieldByName('salesman').AsString,[loCaseInsensitive]) then
             begin
               If ds3.State <> dsEdit then ds3.Edit;
                ds3.FieldByName('riilsdbulaninilalu').AsFloat := FieldByName('riilsdbulaninilalu').AsFloat/1000;
                if FieldByName('riilsdbulaninilalu').AsFloat > 0 then
                ds3.FieldByName('growth2').AsFloat :=ds3.FieldByName('riilsdbulanini').AsFloat/(FieldByName('riilsdbulaninilalu').AsFloat/1000)*100;
                ds3.Post;
             end;
          Next;
        end;
      finally
        Free;
      end;
    end;

// target tahunan
    ssql := 'SELECT sls_nama salesman,sum(st_targetsales) targettahunan FROM tsalesmantarget inner join tsalesman on sls_kode=st_sls_kode WHERE st_tahun='+ edttahun.text
    + ' group by sls_nama ';
    tsql := xOpenQuery(ssql,frmMenu.conn);

    with tsql do
    begin
      try
        while not eof do
        begin
             if ds3.Locate('salesman',FieldByName('salesman').AsString,[loCaseInsensitive]) then
             begin
               If ds3.State <> dsEdit then ds3.Edit;
                ds3.FieldByName('targettahunan').AsFloat := FieldByName('targettahunan').AsFloat/1000;
                if FieldByName('targettahunan').AsFloat > 0 then
                ds3.FieldByName('ratio').AsFloat := ds3.FieldByName('riilsdbulanini').AsFloat/(FieldByName('targettahunan').AsFloat/1000)*100;
                ds3.post;
             end;
          Next;
        end;
      finally
        Free;
      end;
    end;

//--- pf

    ssql :='select sls_nama salesman , '
        + '  sum((100-fpd_discpr)*(fpd_harga*fpd_qty)/100*if(fp_istax=1,if(fp_tanggal<"2022/04/01",1.1,1.11),1)) -'
        + '  sum(fpd_cn*((100-fpd_discpr)*fpd_harga/100)*fpd_qty/100) - '
        + '  sum(fpd_bp_pr*((100-fpd_discpr)*fpd_harga/100)*fpd_qty/100)+sum(fpd_bp_rp*fpd_qty)-'
        + ' (SELECT ifnull(sum((retjd_harga*retjd_qty)*(100-ifnull(retjd_discpr,0))/100),0)*if(fp_istax=1,if(fp_tanggal<"2022/04/01",1.1,1.11),1)'
        + '  FROM tretj_dtl inner join tretj_hdr ON retjd_retj_nomor=retj_nomor INNER JOIN tfp_hdr ON retj_fp_nomor=fp_nomor INNER JOIN tdo_hdr ON do_nomor=fp_do_nomor '
        + '  INNER JOIN tso_hdr ON so_nomor=do_so_nomor '
        + '  INNER JOIN tbarang ON retjd_brg_kode=brg_kode'
        + '  WHERE  so_sls_kode=sls_kode '
        + '  and month(retj_tanggal)='+inttostr(cbbBulan.ItemIndex+1)+' and year(retj_tanggal)=' + edttahun.text
        + '  AND brg_isproductfocus=1 ) pf'
        + '  from tfp_dtl inner join tfp_hdr on fp_nomor=fpd_fp_nomor '
        + '  inner join tdo_hdr on do_nomor=fp_do_nomor '
        + '  inner join tso_hdr on so_nomor =do_so_nomor '
        + '  inner join tbarang on brg_kode=fpd_brg_kode '
        + '  and month(fp_tanggal)='+inttostr(cbbBulan.ItemIndex+1)+' and year(fP_tanggal)=' + edttahun.text
        + '  and brg_isproductfocus=1 '
        + '  INNER JOIN tsalesman ON sls_kode=so_sls_kode '
        + '  GROUP BY so_sls_kode ';
    tsql := xOpenQuery(ssql,frmMenu.conn);

    with tsql do
    begin
      try
        while not eof do
        begin
             if ds3.Locate('salesman',FieldByName('salesman').AsString,[loCaseInsensitive]) then
             begin
               If ds3.State <> dsEdit then ds3.Edit;
                ds3.FieldByName('pf').AsFloat := FieldByName('pf').AsFloat/1000;
                if ds3.FieldByName('targetbulanini').AsFloat > 0 then
                ds3.FieldByName('pfratio').AsFloat := (FieldByName('pf').AsFloat/1000)/(ds3.FieldByName('targetbulanini').AsFloat)*100;
                ds3.post;
             end;
          Next;
        end;
      finally
        Free;
      end;
    end;
//
// // piutang
ssql := 'SELECT sls_nama salesman,SUM(debet-kredit) - '
+ ' ('
+ ' SELECT IFNULL(SUM(jt_nilai),0) FROM tjatuhtempofp'
+ ' INNER JOIN tfp_hdr ON fp_nomor=jt_fp_nomor'
+ ' INNER JOIN tdo_hdr ON do_nomor=fp_do_nomor'
+ ' INNER JOIN tso_hdr ON so_nomor=do_so_nomor'
+ ' WHERE fp_amount > fp_bayar'
+ ' AND jt_tanggaljt > '+ QuotD(akhir2)
+ ' AND so_sls_kode=a.salesman'
+ ' and fp_jthtempo<='+ QuotD(akhir2)+')'
+ ' target_piutang,'
+ ' (SELECT SUM(kredit-debet) FROM kartu_piutang'
+ ' WHERE nomor LIKE "%CR%" AND MONTH(tanggal) = '+inttostr(cbbBulan.ItemIndex+1)+' AND YEAR(tanggal)='+edttahun.Text
+ ' AND ( jthtempo > '+ QuotD(akhir2)+' or noreferensi LIKE '+quot('%.'+FormatDateTime('yymm',akhir2)+'.%')+')'
+ ' AND salesman=a.salesman) tunai,'
+ ' (SELECT SUM(kredit-debet) FROM kartu_piutang'
+ ' INNER JOIN tfp_hdr ON fp_nomor=noreferensi'
+ ' WHERE (nomor LIKE "%CR%" or nomor LIKE "%RETJ%") AND MONTH(tanggal) = '+inttostr(cbbBulan.ItemIndex+1)+' AND YEAR(tanggal)='+edttahun.Text
+ ' AND (jthtempo <= '+quotd(akhir2)+' AND fp_tanggal <= '+quotd(akhir)+')'
+ ' AND salesman=a.salesman) realisasi,0 Persentase'
+ ' FROM kartu_piutang a INNER JOIN tsalesman ON sls_kode=salesman AND sls_insentif=1'
+ ' WHERE tanggal <= '+quotd(akhir)+' AND jthtempo < '+quotd(akhir2)
+ ' GROUP BY sls_nama';

//
//         ssql:= 'select sls_nama Salesman,'
//            + ' (Piutang) Target_Piutang,'
//            + ' ifnull(inkaso,0) Realisasi,inkaso/(Piutang+ifnull(tunai2,0))*100 Persentase'
//            + '  from ('
//            + ' select salesman, '
//            + ' sum(IF ((select count(*) from tjatuhtempofp where jt_fp_nomor=nomor) > 0 ,'
//            + ' (select sum(jt_nilai) from tjatuhtempofp where jt_fp_nomor=nomor and jt_tanggaljt <= '+quotd(akhir2)+') , total)) -  '
//            + ' ifnull((select sum(bayar_cash+bayar_transfer+giro+potongan+ppn+pph- '
//            + ' ifnull((select sum(bycd_bayar) from tbayarcus_dtl '
//            + ' inner join tfp_hdr on fp_nomor=bycd_fp_nomor '
//            + ' where bycd_byc_nomor=xx.nomor and fp_jthtempo > '+quotd(akhir2)+'),0)) '
//            + ' from pembayaran xx where salesman=a.salesman and tanggal <= '+quotd(akhir)+'),0) -'
//            + ' ifnull((select sum(retur) from retur inner join tfp_hdr on fp_nomor=retj_fp_nomor where fp_jthtempo <= '+quotd(akhir2)+'  and salesman=a.salesman and tanggal <= '+quotd(akhir)+'),0) piutang,'
//            + ' (select sum(bycd_bayar) from tbayarcus_dtl inner join tbayarcus_hdr on byc_nomor=bycd_byc_nomor '
//            + ' inner join  tfp_hdr on fp_nomor=bycd_fp_nomor'
//            + ' inner join tdo_hdr on do_nomor=fp_do_nomor'
//            + ' inner join tso_hdr on so_nomor=do_so_nomor'
//            + ' where so_sls_kode=a.salesman and fp_tanggal > '+quotd(akhir)
//            + ' and month(byc_tanggal)='+IntToStr(cbbBulan.itemindex +1)+' ) tunai,'
//              + ' (select sum(bycd_bayar) from tbayarcus_dtl inner join tbayarcus_hdr on byc_nomor=bycd_byc_nomor '
//            + ' inner join  tfp_hdr on fp_nomor=bycd_fp_nomor'
//            + ' inner join tdo_hdr on do_nomor=fp_do_nomor'
//            + ' inner join tso_hdr on so_nomor=do_so_nomor'
//            + ' where so_sls_kode=a.salesman and fp_jthtempo > '+quotd(akhir2)
//            + ' and month(byc_tanggal)='+IntToStr(cbbBulan.itemindex +1)+' and year(byc_tanggal)='+edttahun.Text+') tunai2,'
////            + ' where so_sls_kode=a.salesman  and fp_jthtempo > '+quotd(akhir2)
////            + ' and month(byc_tanggal)='+IntToStr(cbbBulan.itemindex +1)+') tunai2,'
//            + ' (select sum(ifnull(bayar_cash,0)+ifnull(bayar_transfer,0)+ifnull(giro,0)+ifnull(potongan,0)+ifnull(pph,0)+ifnull(ppn,0)) from pembayaran where month(tanggal)='+IntToStr(cbbBulan.itemindex +1)+' and year(tanggal)='+edttahun.Text
//            + ' and salesman=a.salesman) inkaso'
//            + ' from penjualan a'
//            + ' inner join tfp_hdr on fp_nomor=nomor'
//            + ' where  fp_jthtempo <= '+quotd(akhir2)
//            + ' group by salesman) a inner join tsalesman on a.salesman=sls_kode';

        tsql :=xOpenQuery(ssql,frmMenu.conn);
        with tsql do
        begin
          try
            while not Eof do
            begin
//             showmessage(FieldByName('salesman').AsString);
             if ds3.Locate('salesman',FieldByName('salesman').AsString,[loCaseInsensitive]) then
             begin
               If ds3.State <> dsEdit then ds3.Edit;
                ds3.FieldByName('targetpiutang').AsFloat := FieldByName('target_piutang').AsFloat/1000;
                ds3.FieldByName('realisasipiutang').AsFloat := FieldByName('realisasi').AsFloat/1000;
                if ds3.FieldByName('targetpiutang').AsFloat > 0 then
                ds3.FieldByName('ratiopiutang').AsFloat := ds3.FieldByName('realisasipiutang').AsFloat/ds3.FieldByName('targetpiutang').AsFloat *100
                else
                ds3.FieldByName('ratiopiutang').AsFloat := 0;

                ds3.FieldByName('realisasiall').AsFloat := (FieldByName('realisasi').AsFloat+FieldByName('tunai').AsFloat)/1000;
                if ds3.FieldByName('targetpiutang').AsFloat > 0 then
                ds3.FieldByName('allratio').AsFloat := ds3.FieldByName('realisasiall').AsFloat/ds3.FieldByName('targetpiutang').AsFloat *100
                else
                ds3.FieldByName('allratio').AsFloat := 0;
                ds3.Post;
             end;

//             totaltarget := totaltarget +(FieldByName('target').AsFloat/1000);
             Next;
             end;
           finally
            free;
          end;
        end;

        s:='SELECT sls_nama salesman,COUNT(*) newcustomer FROM (SELECT DISTINCT sls_nama,fp_cus_kode ,cus_nama FROM tfp_hdr'
          + ' INNER JOIN tdo_hdr ON do_nomor=fp_do_nomor'
          + ' INNER JOIN tso_hdr ON so_nomor=do_so_nomor '
          + ' INNER JOIN tsalesman ON sls_kode=so_sls_kode'
          + ' INNER JOIN tcustomer ON cus_kode=fp_cus_kode'
          + ' WHERE MONTH(fp_tanggal)='+IntToStr(cbbBulan.itemindex +1)+' AND YEAR(fp_tanggal)='+edttahun.Text
          + ' and fp_cus_kode NOT IN (SELECT DISTINCT (fp_cus_kode) FROM tfp_hdr '
          + ' WHERE fp_tanggal <='+quotd(akhir)+')) final group by sls_nama';
        tsql :=xOpenQuery(s,frmMenu.conn);
        with tsql do
        begin
          try
            while not Eof do
            begin
             if ds3.Locate('salesman',FieldByName('salesman').AsString,[loCaseInsensitive]) then
             begin
               If ds3.State <> dsEdit then ds3.Edit;
                ds3.FieldByName('newcustomer').AsFloat := Fields[1].AsFloat;
                ds3.Post;
             end;

//             totaltarget := totaltarget +(FieldByName('target').AsFloat/1000);
             Next;
             end;
           finally
            free;
          end;
        end;

     s:='SELECT sls_nama salesman,COUNT(*) rsklinik FROM (SELECT DISTINCT sls_nama,fp_cus_kode ,cus_nama FROM tfp_hdr'
          + ' INNER JOIN tdo_hdr ON do_nomor=fp_do_nomor'
          + ' INNER JOIN tso_hdr ON so_nomor=do_so_nomor '
          + ' INNER JOIN tsalesman ON sls_kode=so_sls_kode'
          + ' INNER JOIN tcustomer ON cus_kode=fp_cus_kode'
          + ' WHERE MONTH(fp_tanggal)='+IntToStr(cbbBulan.itemindex +1)+' AND YEAR(fp_tanggal)='+edttahun.Text
          + ' and cus_gc_kode  IN ("RS","KL","PS")) final group by sls_nama';
        tsql :=xOpenQuery(s,frmMenu.conn);
        with tsql do
        begin
          try
            while not Eof do
            begin
             if ds3.Locate('salesman',FieldByName('salesman').AsString,[loCaseInsensitive]) then
             begin
               If ds3.State <> dsEdit then ds3.Edit;
                ds3.FieldByName('rsklinik').AsFloat := Fields[1].AsFloat;
                ds3.Post;
             end;

//             totaltarget := totaltarget +(FieldByName('target').AsFloat/1000);
             Next;
             end;
           finally
            free;
          end;
        end;

end;

procedure TfrmLapBulanan4.btnTampilClick(Sender: TObject);
begin

    loaddata

end;

procedure TfrmLapBulanan4.cxGrid1DBBandedTableView1Column10CustomDrawCell(
    Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo:
    TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if StrToFloatDef(AViewInfo.Text,0) < 70 then
      ACanvas.font.Color := clRed
    else if StrToFloatDef(AViewInfo.Text,0) < 100 then
        ACanvas.font.Color := clpurple
    else
      ACanvas.font.Color := clgreen;
        ACanvas.font.Style := [fsbold];
end;

procedure
    TfrmLapBulanan4.cxGrid1DBBandedTableView1Column10CustomDrawFooterCell(
    Sender: TcxGridTableView; ACanvas: TcxCanvas; AViewInfo:
    TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  if StrToFloatDef(AViewInfo.Text,0) < 70 then
      ACanvas.font.Color := clRed
    else if StrToFloatDef(AViewInfo.Text,0) < 100 then
        ACanvas.font.Color := clpurple
    else
      ACanvas.font.Color := clgreen;
      ACanvas.Font.Style := [fsbold];
end;

procedure TfrmLapBulanan4.growthCustomDrawCell(
    Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo:
    TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if StrToFloatDef(AViewInfo.Text,0) < 100 then
  begin
      ACanvas.Font.Color := clRed;

  end
    else
      ACanvas.Font.Color := clGreen;
        ACanvas.Font.Style := [fsbold];
end;

procedure
    TfrmLapBulanan4.growthCustomDrawFooterCell(
    Sender: TcxGridTableView; ACanvas: TcxCanvas; AViewInfo:
    TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  if StrToFloatDef(AViewInfo.Text,0) < 100 then
  begin
      ACanvas.Font.Color := clRed;

  end
    else
      ACanvas.Font.Color := clGreen;
        ACanvas.Font.Style := [fsbold];
end;

procedure TfrmLapBulanan4.cxGrid1DBBandedTableView1Column8CustomDrawCell(
    Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo:
    TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
    if StrToFloatDef(AViewInfo.Text,0) < 70 then
      ACanvas.Font.Color := clRed
    else if StrToFloatDef(AViewInfo.Text,0) < 100 then
        ACanvas.Font.Color := clpurple
    else
      ACanvas.Font.Color := clGreen;
       ACanvas.Font.Style := [fsbold];
end;

procedure TfrmLapBulanan4.cxGrid1DBBandedTableView1Column8CustomDrawFooterCell(
    Sender: TcxGridTableView; ACanvas: TcxCanvas; AViewInfo:
    TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  if StrToFloatDef(AViewInfo.Text,0) < 70 then
      ACanvas.Font.Color := clRed
    else if StrToFloatDef(AViewInfo.Text,0) < 100 then
        ACanvas.Font.Color := clpurple
    else
      ACanvas.Font.Color := clGreen;
       ACanvas.Font.Style := [fsbold];
end;

procedure
    TfrmLapBulanan4.cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems12GetText(
    Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean; var
    AText: string);
  var
    capaibulanini :double;
begin
  capaibulanini := 0;
  try
    if cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('riilbulaninilalu')) > 0  then
            capaibulanini :=cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('riilbulanini'))/ cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('riilbulaninilalu'))*100;
    AText := FormatFloat('###.##',capaibulanini);


  except
  end;
end;

procedure
    TfrmLapBulanan4.cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems14GetText(
    Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean; var
    AText: string);
var
    capaibulanini :double;
begin
  capaibulanini := 0;
  try
    if cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('riilsdbulaninilalu')) > 0  then
            capaibulanini :=cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('riilsdbulanini'))/ cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('riilsdbulaninilalu'))*100;
    AText := FormatFloat('###.##',capaibulanini);
  except
  end;
end;

procedure TfrmLapBulanan4.TeSpeedButton1Click(Sender: TObject);
begin

     if SaveDialog1.Execute then
     begin
       ExportGridToExcel(SaveDialog1.FileName, cxGrid1);
     end;

end;


function TfrmLapBulanan4.GetPivotChartLink: TcxPivotGridChartConnection;
begin
  If not Assigned(FPivotChartLink) then
    FPivotChartLink := TcxPivotGridChartConnection.Create(Self);
  Result := FPivotChartLink;
end;

procedure TfrmLapBulanan4.cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems8GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: String);
  var
    capaibulanini :double;
begin
  capaibulanini := 0;
  try
    if cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('Targetsdbulanini')) > 0  then
            capaibulanini :=cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('riilsdbulanini'))/ cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('Targetsdbulanini'))*100;
    AText := FormatFloat('###.##',capaibulanini);
  except
  end;
end;

procedure TfrmLapBulanan4.cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems9GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: String);
  var
    capaibulanini :double;
begin
  capaibulanini := 0;
  try
    if cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('Targetbulanini')) > 0  then
            capaibulanini :=cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('riilbulanini'))/ cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('Targetbulanini'))*100;
    AText := FormatFloat('###.##',capaibulanini);
  except
  end;
end;

procedure TfrmLapBulanan4.growth2CustomDrawCell(Sender: TcxCustomGridTableView;
    ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone:
    Boolean);
begin

  if StrToFloatDef(AViewInfo.Text,0) < 100 then
  begin
      ACanvas.Font.Color := clRed;

  end
    else
      ACanvas.Font.Color := clGreen;
        ACanvas.Font.Style := [fsbold];
end;

procedure TfrmLapBulanan4.growth2CustomDrawFooterCell(Sender: TcxGridTableView;
    ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo; var ADone:
    Boolean);
begin
  if StrToFloatDef(AViewInfo.Text,0) < 100 then
  begin
      ACanvas.Font.Color := clRed;

  end
    else
      ACanvas.Font.Color := clGreen;
        ACanvas.Font.Style := [fsbold];
end;

procedure TfrmLapBulanan4.cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems16GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: String);
  var
    capaibulanini :double;
begin
  capaibulanini := 0;
  try
    if cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('Targettahunan')) > 0  then
        capaibulanini :=cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('riilsdbulanini'))/ cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('targettahunan'))*100;
    AText := FormatFloat('###.##',capaibulanini);
  except
  end;
end;


procedure TfrmLapBulanan4.cxGrid1DBBandedTableView1Column19CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin

  if StrToFloatDef(AViewInfo.Text,0) < 70 then
  begin
      ACanvas.Font.Color := clRed;

  end
    else
      ACanvas.Font.Color := clGreen;
        ACanvas.Font.Style := [fsbold];

end;

procedure TfrmLapBulanan4.cxGrid1DBBandedTableView1Column19CustomDrawFooterCell(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin

  if StrToFloatDef(AViewInfo.Text,0) < 70 then
  begin
      ACanvas.Font.Color := clRed;

  end
    else
      ACanvas.Font.Color := clGreen;
        ACanvas.Font.Style := [fsbold];

end;

procedure TfrmLapBulanan4.cxGrid1DBBandedTableView1Column21CustomDrawCell(
    Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo:
    TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if StrToFloatDef(AViewInfo.Text,0) < 30 then
  begin
      ACanvas.Font.Color := clRed;

  end
    else
      ACanvas.Font.Color := clGreen;
        ACanvas.Font.Style := [fsbold];


end;

procedure
    TfrmLapBulanan4.cxGrid1DBBandedTableView1Column21CustomDrawFooterCell(
    Sender: TcxGridTableView; ACanvas: TcxCanvas; AViewInfo:
    TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  if StrToFloatDef(AViewInfo.Text,0) < 30 then
  begin
      ACanvas.Font.Color := clRed;

  end
    else
      ACanvas.Font.Color := clGreen;
        ACanvas.Font.Style := [fsbold];


end;

procedure TfrmLapBulanan4.cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems19GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: String);
var
    capaibulanini :double;
begin
  capaibulanini := 0;
  try
    if cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('realisasipiutang')) > 0  then
            capaibulanini :=cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('realisasipiutang'))/ cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('targetpiutang'))*100;
    AText := FormatFloat('###.##',capaibulanini);
  except
  end;
end;

procedure
    TfrmLapBulanan4.cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems21GetText(
    Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean; var
    AText: string);
var
    capaibulanini :double;
begin
  capaibulanini := 0;
  try
    if cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('pf')) > 0  then
            capaibulanini :=cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('pf'))/ cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('TargetBulanini'))*100;
    AText := FormatFloat('###.##',capaibulanini);
  except
  end;
end;

procedure TfrmLapBulanan4.cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems23GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: String);
var
    capaibulanini :double;
begin
  capaibulanini := 0;
  try
    if cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('realisasiall')) > 0  then
            capaibulanini :=cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('realisasiall'))/ cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('targetpiutang'))*100;
    AText := FormatFloat('###.##',capaibulanini);
  except
  end;
end;



end.
