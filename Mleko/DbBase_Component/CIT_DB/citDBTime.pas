unit citDBTime;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  citBaseTimeDlg;

type
  TDBTimeForm = class(TTimeForm)
  protected
    procedure TrackBarHChange(Sender: TObject); override;
    procedure TrackBarMChange(Sender: TObject); override;
    procedure TrackBarSChange(Sender: TObject); override;
  end;

implementation

uses citDBTimeEdit;         

procedure TDBTimeForm.TrackBarHChange(Sender: TObject);
var
   s : string;
begin
  s := IntToStr(TrackBarH.Position);
  if TrackBarH.Position < 10 then s := '0'+s;
  TcitDBTimeEdit(Tag).SelStart := 0;
  TcitDBTimeEdit(Tag).SelLength := 2;
  TcitDBTimeEdit(Tag).SelText := s;
end;


procedure TDBTimeForm.TrackBarMChange(Sender: TObject);
var
   s : string;
begin
  s := IntToStr(TrackBarM.Position);
  if TrackBarM.Position < 10 then s := '0'+s;
  if TcitDBTimeEdit(Tag).TimeStyle in [tsMinSec, tsMin] then TcitDBTimeEdit(Tag).SelStart := 0
                                                     else TcitDBTimeEdit(Tag).SelStart := 3;
  TcitDBTimeEdit(Tag).SelLength := 2;
  TcitDBTimeEdit(Tag).SelText := s;
end;

procedure TDBTimeForm.TrackBarSChange(Sender: TObject);
var
   s : string;
begin
  s := IntToStr(TrackBarS.Position);
  if TrackBarS.Position < 10 then s := '0'+s;
  if TcitDBTimeEdit(Tag).TimeStyle = tsAll then TcitDBTimeEdit(Tag).SelStart := 6
                                        else TcitDBTimeEdit(Tag).SelStart := 3;
  TcitDBTimeEdit(Tag).SelLength := 2;
  TcitDBTimeEdit(Tag).SelText := s;
end;

end.
 