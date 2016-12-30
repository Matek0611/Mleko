unit PrihodPodotchet0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, DB, Grids, DBGrids, RXDBCtrl, StdCtrls, DBCtrls, 
  Buttons, ExtCtrls, MemDS, DBAccess, MsAccess, ActnList;

type
  TfmEditPodotchet = class(TMlekoForm)
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    dsPodotchetR: TDataSource;
    quPodotchetR: TMSQuery;
    quWork: TMSQuery;
    quPodotchetRPodotchetRNo: TSmallintField;
    quPodotchetRDatePodotche: TDateTimeField;
    quPodotchetRNom: TIntegerField;
    quPodotchetRName: TStringField;
    quPodotchetRDateNaklFirst: TDateTimeField;
    quPodotchetRSummaDolg: TFloatField;
    quPodotchetRSotrudNo: TSmallintField;
    quPodotchetP: TMSQuery;
    procedure bbOkClick(Sender: TObject);
    procedure EditSummaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmEditPodotchet: TfmEditPodotchet;
  procedure PrihodPodotchetList(NaklNo: integer; Summa: extended);

implementation
uses Sotrud0;

{$R *.dfm}


procedure PrihodPodotchetList(NaklNo: integer; Summa: extended);
var
 SotrudNo:integer;
begin
 SotrudNo:=Sotrud(True);
 if SotrudNo=0 then exit;
 fmEditPodotchet:=TfmEditPodotchet.Create(Application);
 try
  fmEditPodotchet.quWork.SQL.Clear;
  fmEditPodotchet.quWork.SQL.Add('select SotrudName from Sotrud where SotrudNo=:SotrudNo');
  fmEditPodotchet.quWork.ParamByName('SotrudNo').AsInteger:=SotrudNo;
  fmEditPodotchet.quWork.Open;
  fmEditPodotchet.Caption:='Закрытие подотчета '+fmEditPodotchet.quWork.FieldByName('SotrudName').AsString;
  fmEditPodotchet.quWork.Close;

  fmEditPodotchet.quPodotchetR.ParamByName('SotrudNo').AsInteger:=SotrudNo;
  fmEditPodotchet.quPodotchetR.Open;


  fmEditPodotchet.ShowModal;
 finally
  fmEditPodotchet.quPodotchetR.Close;
  fmEditPodotchet.Free;
 end;
end;


procedure TfmEditPodotchet.bbOkClick(Sender: TObject);
var
 FindPodotchet: integer;
begin
 FindPodotchet:=quPodotchetRPodotchetRNo.AsInteger;
 quWork.SQL.Clear;
 quWork.SQL.add('UPDATE PodotchetR');
 quWork.SQL.Append('SET  SummaPlat = SummaPlat + :SummaPlat');
 quWork.SQL.Append('WHERE (PodotchetRNo = :PodotchetRNo)');
// quWork.ParamByName('SummaPlat').AsFloat:=StrToFloat(EditSumma.Text);
 quWork.ParamByName('PodotchetRNo').AsInteger:=quPodotchetRPodotchetRNo.AsInteger;
 quWork.Execute;

 quPodotchetP.Close;
 quWork.SQL.Clear;
 quWork.SQL.Add('select Max(PodotchetPNo) AS MaxPodotchetPNo  from PodotchetP');
 quWork.Open;
 quPodotchetP.ParamByName('PodotchetPNo').AsInteger:=quWork.Fields[0].AsInteger+1;
 quPodotchetP.ParamByName('SotrudNo').AsInteger:=quPodotchetRSotrudNo.AsInteger;
 quPodotchetP.ParamByName('PodotchetRNo').AsInteger:=quPodotchetRPodotchetRNo.AsInteger;
// quPodotchetP.ParamByName('DatePlat').AsDate:=StrToDate(EditDate.Text);
// quPodotchetP.ParamByName('Summa').AsFloat:=StrToFloat(EditSumma.Text);
 quPodotchetP.Execute;
 quWork.Close;
 quPodotchetR.Close;
 quPodotchetR.Open;
 if not quPodotchetR.Locate('PodotchetRNo',FindPodotchet,[]) then
  quPodotchetR.First;

 ActiveControl:=RxDBGrid1;
end;

procedure TfmEditPodotchet.EditSummaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
  VK_RETURN: bbOkClick(Sender);
 end;
end;

end.
