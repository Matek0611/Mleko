unit cittime;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  citBaseTimeDlg;

type
  TcitTimeForm = class(TTimeForm)
  protected
    procedure TrackBarHChange(Sender: TObject); override;
    procedure TrackBarMChange(Sender: TObject); override;
    procedure TrackBarSChange(Sender: TObject); override;
  end;

var
  citTimeForm: TcitTimeForm;

implementation

uses citTimeEdit;

procedure TcitTimeForm.TrackBarHChange(Sender: TObject);
var
   s : string;
begin
  s := IntToStr(TrackBarH.Position);
  if TrackBarH.Position < 10 then s := '0' + s;
  TcitTimeEdit(Tag).SelStart := 0;
  TcitTimeEdit(Tag).SelLength := 2;
  TcitTimeEdit(Tag).SelText := s;
end;

procedure TcitTimeForm.TrackBarMChange(Sender: TObject);
var
   s : string;
begin
  s := IntToStr(TrackBarM.Position);
  if TrackBarM.Position < 10 then s := '0'+s;
  if TcitTimeEdit(Tag).TimeStyle in [tsMinSec, tsMin] then TcitTimeEdit(Tag).SelStart := 0
                                                      else TcitTimeEdit(Tag).SelStart := 3;
  TcitTimeEdit(Tag).SelLength := 2;
  TcitTimeEdit(Tag).SelText := s;
end;

procedure TcitTimeForm.TrackBarSChange(Sender: TObject);
var
   s : string;
begin
  s := IntToStr(TrackBarS.Position);
  if TrackBarS.Position < 10 then s := '0'+s;
  if TcitTimeEdit(Tag).TimeStyle = tsAll then TcitTimeEdit(Tag).SelStart := 6
                                         else TcitTimeEdit(Tag).SelStart := 3;
  TcitTimeEdit(Tag).SelLength := 2;
  TcitTimeEdit(Tag).SelText := s;
end;
end.
