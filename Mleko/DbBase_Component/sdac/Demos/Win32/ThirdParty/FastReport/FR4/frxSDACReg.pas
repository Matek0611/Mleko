
{******************************************}
{                                          }
{             FastReport v4.0              }
{       SDAC components registration       }
{                                          }

// Created by: CoreLab
// E-mail: sdac@crlab.com

{                                          }
{******************************************}

unit frxSDACReg;

interface

{$I frx.inc}

procedure Register;

implementation

uses
  Windows, Messages, SysUtils, Classes
{$IFNDEF Delphi6}
, DsgnIntf
{$ELSE}
, DesignIntf, DesignEditors
{$ENDIF}
, frxSDACComponents;

procedure Register;
begin
  RegisterComponents('FastReport 4.0', [TfrxSDACComponents]);
end;

end.
