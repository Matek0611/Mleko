unit RecycleExpedition0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, DB, StdCtrls, Buttons, ExtCtrls,
  DBGridEh, RxMemDS, GridsEh, MemDS, DBAccess, MsAccess,
  ActnList;

type
  TfmRecycleExpedition = class(TMlekoForm)
    DBGridEh1: TDBGridEh;
    paBottom: TPanel;
    DBGridEh2: TDBGridEh;
    quRashodTovarChange: TMSQuery;
    dsNaklR: TDataSource;
    quRashodTovarReal: TMSQuery;
    quRashodTovarChangeTovarNo: TSmallintField;
    quRashodTovarChangeNameTovar: TStringField;
    quRashodTovarChangeNameCompany: TStringField;
    quRashodTovarChangeKol: TFloatField;
    mdRashod: TRxMemoryData;
    mdRashodTovarNo: TIntegerField;
    mdRashodNameTovar: TStringField;
    mdRashodNameCompany: TStringField;
    quRashodTovarChangeEdIzm: TStringField;
    mdRashodEdIzm: TStringField;
    mdRashodRashodOut: TFloatField;
    mdRashodRashodReal: TFloatField;
    mdRashodRashodRazn: TFloatField;
    quRashodTovarRealTovarNo: TSmallintField;
    quRashodTovarRealKol: TFloatField;
    quNakl: TMSQuery;
    quNaklNaklNo: TIntegerField;
    quNakls: TMSQuery;
    dsNakls: TDataSource;
    quNaklsNaklNo: TIntegerField;
    quNaklsNameTovar: TStringField;
    quNaklsEdIzm: TStringField;
    quNaklsKol: TFloatField;
    quNaklsName: TStringField;
    quNaklsDateDel: TDateTimeField;
    quNaklsNom: TIntegerField;
    quNaklsTipName: TStringField;
    quNaklsUserName: TStringField;
    bbCancel: TBitBtn;
    procedure DBGridEh2CellClick(Column: TColumnEh);
    procedure DBGridEh2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh2DblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGridEh2TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmRecycleExpedition: TfmRecycleExpedition;
  StringSQL: String;
  procedure RecycleExpedition(ExpeditionNo: integer);

implementation

{$R *.dfm}

procedure RecycleExpedition(ExpeditionNo: integer);
var
 SqlTmp: string;
begin
 fmRecycleExpedition:=TfmRecycleExpedition.Create(Application);
 try
  fmRecycleExpedition.mdRashod.Active:=False;
  fmRecycleExpedition.mdRashod.Active:=True;
  SqlTmp:='(';
  fmRecycleExpedition.quNakl.ParamByName('ExpeditionNo').AsInteger:=ExpeditionNo;
//  fmRecycleExpedition.quNakl.ParamByName('DateNakl').AsDate:=Now;
  fmRecycleExpedition.quNakl.Open;
  while not fmRecycleExpedition.quNakl.Eof do
   begin
    SqlTmp:=SqlTmp+IntToStr(fmRecycleExpedition.quNaklNaklNo.AsInteger)+', ';
    fmRecycleExpedition.quNakl.Next;
   end;
  if SqlTmp<>'(' then
   begin
    SqlTmp:=Copy(SqlTmp,1,Length(SqlTmp)-2)+')';

  StringSQL:=SqlTmp;

    fmRecycleExpedition.quNakl.Close;
    fmRecycleExpedition.quRashodTovarChange.Close;
    fmRecycleExpedition.quRashodTovarChange.SQL.Clear;
    fmRecycleExpedition.quRashodTovarChange.SQL.Add('SELECT s.TovarNo, s.NameTovar, s.NameCompany, s.EdIzm, SUM(s.qty_change) AS Kol ');
    fmRecycleExpedition.quRashodTovarChange.SQL.Append('FROM v_audit_dspec s ');
    fmRecycleExpedition.quRashodTovarChange.SQL.Append('WHERE (s.NaklNo IN '+SqlTmp+') ');
    fmRecycleExpedition.quRashodTovarChange.SQL.Append('GROUP BY s.TovarNo, s.NameTovar, s.NameCompany, s.EdIzm ');
    fmRecycleExpedition.quRashodTovarChange.SQL.Append('HAVING (SUM(s.qty_change) <> 0) ');
//    fmRecycleExpedition.quRashodTovarChange.ParamByName('NaklNo').AsString:=SqlTmp;
    fmRecycleExpedition.quRashodTovarChange.Open;
    fmRecycleExpedition.quRashodTovarReal.Close;
    fmRecycleExpedition.quRashodTovarReal.SQL.Clear;
    fmRecycleExpedition.quRashodTovarReal.SQL.Add('SELECT Rashod.TovarNo, SUM(Rashod.Kol) AS Kol ');
    fmRecycleExpedition.quRashodTovarReal.SQL.Append('FROM Rashod INNER JOIN ');
    fmRecycleExpedition.quRashodTovarReal.SQL.Append('NaklR ON Rashod.NaklNo = NaklR.NaklNo ');
//    fmRecycleExpedition.quRashodTovarReal.SQL.Append('WHERE (Rashod.NaklNo IN :NaklNo) ');
    fmRecycleExpedition.quRashodTovarReal.SQL.Append('WHERE (Rashod.NaklNo IN '+SqlTmp+') ');
    fmRecycleExpedition.quRashodTovarReal.SQL.Append('GROUP BY Rashod.TovarNo ');
//    fmRecycleExpedition.quRashodTovarReal.ParamByName('NaklNo').AsString:=SqlTmp;
    fmRecycleExpedition.quRashodTovarReal.Open;


//    fmRecycleExpedition.quRashodTovarReal.ParamByName('ExpeditionNo').AsInteger:=ExpeditionNo;
//    fmRecycleExpedition.quRashodTovarReal.Open;
    if fmRecycleExpedition.quRashodTovarChange.RecordCount>0 then
     begin
      while not fmRecycleExpedition.quRashodTovarChange.Eof do
       begin
        fmRecycleExpedition.mdRashod.Insert;
        fmRecycleExpedition.mdRashodTovarNo.AsInteger:=
         fmRecycleExpedition.quRashodTovarChangeTovarNo.AsInteger;
        fmRecycleExpedition.mdRashodNameTovar.AsString:=
         fmRecycleExpedition.quRashodTovarChangeNameTovar.AsString;
        fmRecycleExpedition.mdRashodNameCompany.AsString:=
         fmRecycleExpedition.quRashodTovarChangeNameCompany.AsString;
        fmRecycleExpedition.mdRashodEdIzm.AsString:=
         fmRecycleExpedition.quRashodTovarChangeEdIzm.AsString;
        fmRecycleExpedition.mdRashodRashodRazn.AsFloat:=
         -fmRecycleExpedition.quRashodTovarChangeKol.AsFloat;
        if fmRecycleExpedition.quRashodTovarReal.Locate('TovarNo',fmRecycleExpedition.quRashodTovarChangeTovarNo.AsInteger,[]) then
         begin
          fmRecycleExpedition.mdRashodRashodOut.AsFloat:=
           ABS(fmRecycleExpedition.quRashodTovarRealKol.AsFloat+
           fmRecycleExpedition.quRashodTovarChangeKol.AsFloat);

          fmRecycleExpedition.mdRashodRashodReal.AsFloat:=
           ABS(fmRecycleExpedition.quRashodTovarRealKol.AsFloat+
           fmRecycleExpedition.quRashodTovarChangeKol.AsFloat)-
           fmRecycleExpedition.quRashodTovarChangeKol.AsFloat;

           fmRecycleExpedition.quRashodTovarChangeKol.AsFloat;

         end
        else
         begin
          fmRecycleExpedition.mdRashodRashodOut.AsFloat:=
           ABS(fmRecycleExpedition.quRashodTovarChangeKol.AsFloat);
          fmRecycleExpedition.mdRashodRashodReal.AsFloat:=0;
         end;
        fmRecycleExpedition.mdRashod.Post;
        fmRecycleExpedition.mdRashod.Refresh;
        fmRecycleExpedition.quRashodTovarChange.Next;
       end;
      fmRecycleExpedition.ShowModal;
     end;
   end;
 finally
 fmRecycleExpedition.quRashodTovarChange.Close;
 fmRecycleExpedition.quRashodTovarReal.Close;
 fmRecycleExpedition.quNakls.Close;
 fmRecycleExpedition.Free;
 end;
end;

procedure TfmRecycleExpedition.DBGridEh2CellClick(Column: TColumnEh);
begin
 quNakls.Close;
 quNakls.SQL.Clear;
 quNakls.SQL.Add('SELECT s.NaklNo, s.NameTovar, s.EdIzm, (s.qty_change*-1) as Kol, Post.Name, NaklRChange.DateDel, NaklRChange.Nom, TipNakl.TipName, Users.UserName ');
 quNakls.SQL.Append('FROM Post INNER JOIN ');
 quNakls.SQL.Append('NaklRChange ON Post.PostNo = NaklRChange.PostNo INNER JOIN ');
 quNakls.SQL.Append('TipNakl ON NaklRChange.VidNaklNo = TipNakl.TipNo LEFT OUTER JOIN ');
 quNakls.SQL.Append('Users ON NaklRChange.UserDel = Users.UserNo LEFT OUTER JOIN ');
 quNakls.SQL.Append('Tovar INNER JOIN ');
 quNakls.SQL.Append('v_audit_dspec s ON Tovar.TovarNo = s.TovarNo ON NaklRChange.NaklNo = s.NaklNo ');
 quNakls.SQL.Append('WHERE (s.NaklNo IN '+StringSQL+') AND (Tovar.TovarNo=:TovarNo) ');
 quNakls.SQL.Append('ORDER BY Post.Name, NaklRChange.DateDel ');
 quNakls.ParamByName('TovarNo').AsInteger:=mdRashodTovarNo.AsInteger;
 quNakls.Open;
 DBGridEh1.Columns[0].Width:=53;
 DBGridEh1.Columns[1].Width:=64;
 DBGridEh1.Columns[2].Width:=64;
 DBGridEh1.Columns[3].Width:=246;
 DBGridEh1.Columns[4].Width:=70;
 DBGridEh1.Columns[5].Width:=160;
end;

procedure TfmRecycleExpedition.DBGridEh2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if (Rect.Top = DBGridEh2.CellRect(DBGridEh2.Col,DBGridEh2.Row).Top) and (not (gdFocused in State) or not DBGridEh2.Focused) then
    DBGridEh2.Canvas.Brush.Color := clSilver;
  DBGridEh2.DefaultDrawColumnCell( Rect,DataCol,Column,State);
end;

procedure TfmRecycleExpedition.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if (Rect.Top = DBGridEh1.CellRect(DBGridEh1.Col,DBGridEh1.Row).Top) and (not (gdFocused in State) or not DBGridEh1.Focused) then
    DBGridEh1.Canvas.Brush.Color := clSilver;
  DBGridEh1.DefaultDrawColumnCell(Rect,DataCol,Column,State);


{  if Column.Field.FieldName='Kol' then // ВАЖНО: имя поля большими буквами!
   begin
    DBGridEh1.Canvas.FillRect(Rect);
    DBGridEh1.Canvas.TextOut(Rect.Left+1,Rect.Top+2, FloatToStr(quNaklsKol.AsFloat*-1));
   end;    }


//  quNaklsKol.AsFloat:=quNaklsKol.AsFloat*-1;
end;

procedure TfmRecycleExpedition.DBGridEh2DblClick(Sender: TObject);
begin
 quNakls.Close;
 quNakls.SQL.Clear;
 quNakls.SQL.Add('SELECT s.NaklNo, Tovar.NameTovar, Tovar.EdIzm, (s.qty_change*-1) as Kol, Post.Name, NaklRChange.DateDel, NaklRChange.Nom, TipNakl.TipName, Users.UserName ');
 quNakls.SQL.Append('FROM Post INNER JOIN ');
 quNakls.SQL.Append('NaklRChange ON Post.PostNo = NaklRChange.PostNo INNER JOIN ');
 quNakls.SQL.Append('TipNakl ON NaklRChange.VidNaklNo = TipNakl.TipNo LEFT OUTER JOIN ');
 quNakls.SQL.Append('Users ON NaklRChange.UserDel = Users.UserNo LEFT OUTER JOIN ');
 quNakls.SQL.Append('Tovar INNER JOIN v_audit_dspec s');
 quNakls.SQL.Append(' ON Tovar.TovarNo = s.TovarNo ON NaklRChange.NaklNo = s.NaklNo ');
 quNakls.SQL.Append('WHERE (s.NaklNo IN '+StringSQL+') AND (Tovar.TovarNo=:TovarNo) ');
 quNakls.SQL.Append('ORDER BY Post.Name, NaklRChange.DateDel ');
 quNakls.ParamByName('TovarNo').AsInteger:=mdRashodTovarNo.AsInteger;
 quNakls.Open;
 DBGridEh1.Columns[0].Width:=53;
 DBGridEh1.Columns[1].Width:=64;
 DBGridEh1.Columns[2].Width:=64;
 DBGridEh1.Columns[3].Width:=246;
 DBGridEh1.Columns[4].Width:=70;
 DBGridEh1.Columns[5].Width:=160;
end;

procedure TfmRecycleExpedition.FormActivate(Sender: TObject);
begin
 DBGridEh2DblClick(Sender);
end;

procedure TfmRecycleExpedition.DBGridEh2TitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
var
 TovarNo:integer;
begin
 Screen.Cursor:=crHourGlass;
 TovarNo:=mdRashodTovarNo.AsInteger;
 mdRashod.Close;
 case ACol of
  0:mdRashod.SortOnFields('TovarNo',True,False);
  1:mdRashod.SortOnFields('NameTovar',True,False);
  2:mdRashod.SortOnFields('NameCompany',True,False);
//  3:mdRashod.SortOnFields('',True,False);
  4:mdRashod.SortOnFields('RashodOut',True,False);
  5:mdRashod.SortOnFields('RashodReal',True,False);
  6:mdRashod.SortOnFields('RashodRazn',True,False);
 end;
 mdRashod.Open;
 mdRashod.Locate('TovarNo',TovarNo,[]);
 Screen.Cursor:=crDefault;
end;

end.
