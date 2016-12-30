unit SelExpedition0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ActnList;

type
  TfmSelectExpedition = class(TMlekoForm)
    Bevel1: TBevel;
    GroupBox1: TGroupBox;
    cbDate: TCheckBox;
    cbCars: TCheckBox;
    bbOK: TBitBtn;
    bbCancel: TBitBtn;
    cbShipping_Agent: TCheckBox;
    procedure cbDateClick(Sender: TObject);
    procedure cbCarsClick(Sender: TObject);
    procedure cbShipping_AgentClick(Sender: TObject);
  private
    { Private declarations }
     DateBegin:TDateTime;
     DateEnd  :TDateTime;
     CarsNo   :integer;
     Shipping_AgentNo   :integer;
  public
    { Public declarations }
  end;
type TRetSelExpedition=record
     DateBegin:TDateTime;
     DateEnd  :TDateTime;
     CarsNo   :integer;
     Shipping_AgentNo   :integer;
end;
var
  fmSelectExpedition: TfmSelectExpedition;
  SelCarsNo: integer;
  SelShipping_AgentNo: integer;
  function SelExpedition:TRetSelExpedition;


implementation
uses GetDate0, Cars0, Shipping_Agent0;

{$R *.dfm}

function SelExpedition:TRetSelExpedition;
begin
 Result.DateBegin:=0;
 Result.DateEnd:=0;
 Result.CarsNo:=-1;
 Result.Shipping_AgentNo:=-1;
 fmSelectExpedition:=TfmSelectExpedition.Create(Application);
 try
 fmSelectExpedition.CarsNo:=0;
 if fmSelectExpedition.ShowModal=mrOk then
  begin
   Result.DateBegin:=fmSelectExpedition.DateBegin;
   Result.DateEnd:=fmSelectExpedition.DateEnd;
   Result.CarsNo:=fmSelectExpedition.CarsNo;
   Result.Shipping_AgentNo:=fmSelectExpedition.Shipping_AgentNo;
  end;
 finally
 fmSelectExpedition.Free;
 end;
end;

procedure TfmSelectExpedition.cbDateClick(Sender: TObject);
var
 Period:TPeriodDate;
begin
 if cbDate.Checked then
  begin
   Period:=ZapDate(2);
   fmSelectExpedition.DateBegin:=Period[1];
   fmSelectExpedition.DateEnd:=Period[2];
   if Period[1]=0 then
    begin
     fmSelectExpedition.DateBegin:=0;
     fmSelectExpedition.DateEnd:=0;
     cbDate.Checked:=False;
    end;
  end
 else
  begin
   fmSelectExpedition.DateBegin:=0;
   fmSelectExpedition.DateEnd:=0;
  end;
end;

procedure TfmSelectExpedition.cbCarsClick(Sender: TObject);
begin
 if cbCars.Checked then
  CarsNo:=Cars(True, True, True)
 else
  CarsNo:=0;
 if CarsNo=0 then
  cbCars.Checked:=False;
end;

procedure TfmSelectExpedition.cbShipping_AgentClick(Sender: TObject);
begin
 if cbShipping_Agent.Checked then
  Shipping_AgentNo:=Shipping_Agent(True, True)
 else
  Shipping_AgentNo:=0;
 if Shipping_AgentNo=0 then
  cbShipping_Agent.Checked:=False;
end;

end.
