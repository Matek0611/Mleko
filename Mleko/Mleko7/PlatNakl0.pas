unit PlatNakl0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, StdCtrls, Buttons, DB, DBGridEh, GridsEh, MemDS,
  DBAccess, MsAccess, ActnList;

type
  TfmPlatNakl = class(TMlekoForm)
    dbgListPlatP: TDBGridEh;
    dsListPlatP: TDataSource;
    BitBtn1: TBitBtn;
    qListPlatP: TMSQuery;
    qListPlatPPlatNo: TIntegerField;
    qListPlatPNom: TIntegerField;
    qListPlatPPostNo: TSmallintField;
    qListPlatPPostNoFirst: TSmallintField;
    qListPlatPDatePlat: TDateTimeField;
    qListPlatPSumma: TFloatField;
    qListPlatPSummaDolg: TFloatField;
    qListPlatPBuh: TSmallintField;
    qListPlatPSpravka: TStringField;
    qListPlatPTipPlat: TSmallintField;
    qListPlatPSummaPlat: TFloatField;
    qListPlatPDayDolg: TIntegerField;
    qListPlatPDateOpl: TDateTimeField;
    qListPlatPNaklNo: TIntegerField;
    qListPlatPNaklNom: TIntegerField;
    qListPlatPDateNakl: TDateTimeField;
    qListPlatPNaklSum: TFloatField;
    qListPlatPNaklDolg: TFloatField;
    qListPlatPName: TStringField;
    qListPlatPNameLong: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPlatNakl: TfmPlatNakl;
  procedure PlatNakl(NaklNoSel:integer);

implementation

{$R *.dfm}

procedure PlatNakl(NaklNoSel:integer);
begin
 fmPlatNakl:=TfmPlatNakl.Create(Application);
 try
 fmPlatNakl.qListPlatP.Close;
 fmPlatNakl.qListPlatP.ParamByName('NaklNo').AsInteger:=NaklNoSel;
 fmPlatNakl.qListPlatP.Open;
 fmPlatNakl.Caption:=fmPlatNakl.qListPlatPName.AsString+' Долг: '+FloatToStr(fmPlatNakl.qListPlatPSummaDolg.AsFloat);
 fmPlatNakl.ShowModal;
 finally
 fmPlatNakl.qListPlatP.Close;
 fmPlatNakl.Free;
 end;
end;

end.
