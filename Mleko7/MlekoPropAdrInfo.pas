unit MlekoPropAdrInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKPropCustomDialog, DBAccess, MsAccess, DB, ActnList, ImgList, ComCtrls,
  StdCtrls;

type
  TMlekoPropAdrInfoDlg = class(TCFLMLKPropCustomDialogDlg)
  private
    { Private declarations }
  public
   class function Add_Dlg(var p_id: integer; p_TovarNo:integer ;p_Prihod_NaklNo:integer;p_Rashod_id:integer
;p_TovarNo_Enable:boolean=true ;p_Prihod_NaklNo_Enable:boolean=true;p_Rashod_id_Enable:boolean=true):boolean;
   class function Upd_Dlg(var p_id: integer; p_TovarNo:integer ;p_Prihod_NaklNo:integer;p_Rashod_id:integer
;p_TovarNo_Enable:boolean=true ;p_Prihod_NaklNo_Enable:boolean=true;p_Rashod_id_Enable:boolean=true):boolean;
  end;

var
  MlekoPropAdrInfoDlg: TMlekoPropAdrInfoDlg;

implementation

{$R *.dfm}

class function TMlekoPropAdrInfoDlg.Add_Dlg(var p_id: integer; p_TovarNo:integer ;p_Prihod_NaklNo:integer;p_Rashod_id:integer
;p_TovarNo_Enable:boolean=true ;p_Prihod_NaklNo_Enable:boolean=true;p_Rashod_id_Enable:boolean=true):boolean;
begin
result:=AddDlg;
end;

class function TMlekoPropAdrInfoDlg.Upd_Dlg(var p_id: integer; p_TovarNo:integer ;p_Prihod_NaklNo:integer;p_Rashod_id:integer
;p_TovarNo_Enable:boolean=true ;p_Prihod_NaklNo_Enable:boolean=true;p_Rashod_id_Enable:boolean=true):boolean;
begin
result:=UpdDlg;
end;

end.
