
{******************************************}
{                                          }
{             FastScript v1.9              }
{         SDAC Registration unit           }
{                                          }
{          Created by: CoreLab             }
{         E-mail: sdac@crlab.com           }
{                                          }
{******************************************}

unit fs_isdacreg;

{$i fs.inc}

interface


procedure Register;

implementation

uses
  Classes
{$IFNDEF Delphi6}
, DsgnIntf
{$ELSE}
, DesignIntf
{$ENDIF}
, fs_isdacrtti;

{-----------------------------------------------------------------------}

procedure Register;
begin
  RegisterComponents('FastScript', [TfsSDACRTTI]);
end;

end.
