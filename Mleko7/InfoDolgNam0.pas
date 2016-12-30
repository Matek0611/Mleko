unit InfoDolgNam0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, RXDBCtrl, Db, 
  MemDS, DBAccess, MsAccess, ActnList;

type
  TfmInfoDolgNam = class(TMlekoForm)
    quNaklR: TMSQuery;
    quNaklRNaklNo: TIntegerField;
    quNaklRNom: TIntegerField;
    quNaklRSumma: TFloatField;
    quNaklRSummaDolg: TFloatField;
    quNaklRDateNakl: TDateTimeField;
    quNaklRDateOpl: TDateTimeField;
    quNaklRBuhName: TStringField;
    quRashod: TMSQuery;
    quRashodNameTovar: TStringField;
    quRashodRasNo: TSmallintField;
    quRashodKol: TFloatField;
    quRashodPriceOut: TFloatField;
    dsNaklR: TDataSource;
    dsRashod: TDataSource;
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    Splitter1: TSplitter;
    Panel1: TPanel;
    bbExit: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmInfoDolgNam: TfmInfoDolgNam;
  procedure InfoDolgNam(PostNo:integer);
implementation

uses data;

{$R *.DFM}

procedure InfoDolgNam(PostNo:integer);
begin
 fmInfoDolgNam:=TfmInfoDolgNam.Create(Application);
 try
 dmDataModule.quPost.Close;
 dmDataModule.quPost.ParamByName('PostNo').AsInteger:=PostNo;
 dmDataModule.quPost.Open;
 fmInfoDolgNam.Caption:=dmDataModule.quPost.FieldByName('Name').AsString;
 dmDataModule.quPost.Close;
 fmInfoDolgNam.quNaklR.ParamByName('PostNo').AsInteger:=PostNo;
 fmInfoDolgNam.quNaklR.Open;
 fmInfoDolgNam.quRashod.Open;
 fmInfoDolgNam.ShowModal;
 finally
 fmInfoDolgNam.quRashod.Close;
 fmInfoDolgNam.quNaklR.Close;
 fmInfoDolgNam.Free;
 end;
end;



end.
