
//////////////////////////////////////////////////
//  MS SQL Server Data Access Components
//  Copyright © 1998-2001 Core Lab. All right reserved.
//  InfoPower compatible components
//  This module contains classes for Woll2Woll InfoPower compatibility
//////////////////////////////////////////////////

unit MSIP;

interface

uses
  SysUtils,
  WinTypes,
  WinProcs,
  Messages,
  Classes,
  Graphics,
  Controls,
  Forms,
  DB,
  dialogs,
  wwFilter,
  wwStr,
  wwSystem,
  wwTable,
  wwTypes,
  MSAccess;

type

{ TwwMSQuery }

  TwwMSQuery = class (TMSQuery)
  private
    FControlType: TStrings;
    FPictureMasks: TStrings;
    FUsePictureMask: boolean;
    FOnInvalidValue: TwwInvalidValueEvent;

    function GetControlType: TStrings;
    procedure SetControlType(Sel: TStrings);
    function GetPictureMasks: TStrings;
    procedure SetPictureMasks(Sel: TStrings);

  protected
    procedure DoBeforePost; override; { For picture support }

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

  published
    property ControlType: TStrings read GetControlType write SetControltype;
    property PictureMasks: TStrings read GetPictureMasks write SetPictureMasks;
    property ValidateWithMask: boolean read FUsePictureMask write FUsePictureMask;
    property OnInvalidValue: TwwInvalidValueEvent read FOnInvalidValue write FOnInvalidValue;
  end;

{ TwwMSTable }

  TwwMSTable = class (TMSTable)
  private
    FControlType: TStrings;
    FPictureMasks: TStrings;
    FUsePictureMask: boolean;
    FOnInvalidValue: TwwInvalidValueEvent;

    function GetControlType: TStrings;
    procedure SetControlType(Sel: TStrings);
    function GetPictureMasks: TStrings;
    procedure SetPictureMasks(Sel: TStrings);

  protected
    procedure DoBeforePost; override; { For picture support }

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

  published
    property ControlType: TStrings read GetControlType write SetControltype;
    property PictureMasks: TStrings read GetPictureMasks write SetPictureMasks;
    property ValidateWithMask: boolean read FUsePictureMask write FUsePictureMask;
    property OnInvalidValue: TwwInvalidValueEvent read FOnInvalidValue write FOnInvalidValue;
  end;

{ TwwMSStoredProc }

  TwwMSStoredProc = class (TMSStoredProc)
  private
    FControlType: TStrings;
    FPictureMasks: TStrings;
    FUsePictureMask: boolean;
    FOnInvalidValue: TwwInvalidValueEvent;

    function GetControlType: TStrings;
    procedure SetControlType(Sel: TStrings);
    function GetPictureMasks: TStrings;
    procedure SetPictureMasks(Sel: TStrings);

  protected
    procedure DoBeforePost; override; { For picture support }

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

  published
    property ControlType: TStrings read GetControlType write SetControltype;
    property PictureMasks: TStrings read GetPictureMasks write SetPictureMasks;
    property ValidateWithMask: boolean read FUsePictureMask write FUsePictureMask;
    property OnInvalidValue: TwwInvalidValueEvent read FOnInvalidValue write FOnInvalidValue;
  end;

procedure Register;

implementation
uses
  wwCommon,
  dbConsts;

{ TwwMSQuery }

constructor TwwMSQuery.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FControlType := TStringList.Create;
  FPictureMasks := TStringList.Create;
  FUsePictureMask := True;
end;

destructor TwwMSQuery.Destroy;
begin
  FControlType.Free;
  FPictureMasks.Free;
  FPictureMasks := nil;

  inherited Destroy;
end;

function TwwMSQuery.GetControlType: TStrings;
begin
  Result := FControlType;
end;

procedure TwwMSQuery.SetControlType(Sel: TStrings);
begin
  FControlType.Assign(Sel);
end;

function TwwMSQuery.GetPictureMasks: TStrings;
begin
  Result := FPictureMasks
end;

procedure TwwMSQuery.SetPictureMasks(Sel: TStrings);
begin
  FPictureMasks.Assign(Sel);
end;

procedure TwwMSQuery.DoBeforePost;
begin
  inherited DoBeforePost;

  if FUsePictureMask then
    wwValidatePictureFields(Self, FOnInvalidValue);
end;

{ TwwMSTable }

constructor TwwMSTable.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FControlType := TStringList.Create;
  FPictureMasks := TStringList.Create;
  FUsePictureMask := True;
end;

destructor TwwMSTable.Destroy;
begin
  FControlType.Free;
  FPictureMasks.Free;
  FPictureMasks := nil;

  inherited Destroy;
end;

function TwwMSTable.GetControlType: TStrings;
begin
  Result := FControlType;
end;

procedure TwwMSTable.SetControlType(Sel: TStrings);
begin
  FControlType.Assign(Sel);
end;

function TwwMSTable.GetPictureMasks: TStrings;
begin
  Result := FPictureMasks
end;

procedure TwwMSTable.SetPictureMasks(Sel: TStrings);
begin
  FPictureMasks.Assign(Sel);
end;

procedure TwwMSTable.DoBeforePost;
begin
  inherited DoBeforePost;

  if FUsePictureMask then
    wwValidatePictureFields(Self, FOnInvalidValue);
end;

{ TwwMSStoredProc }

constructor TwwMSStoredProc.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FControlType := TStringList.Create;
  FPictureMasks := TStringList.Create;
  FUsePictureMask := True;
end;

destructor TwwMSStoredProc.Destroy;
begin
  FControlType.Free;
  FPictureMasks.Free;
  FPictureMasks := nil;

  inherited Destroy;
end;

function TwwMSStoredProc.GetControlType: TStrings;
begin
  Result := FControlType;
end;

procedure TwwMSStoredProc.SetControlType(Sel: TStrings);
begin
  FControlType.Assign(Sel);
end;

function TwwMSStoredProc.GetPictureMasks: TStrings;
begin
  Result := FPictureMasks
end;

procedure TwwMSStoredProc.SetPictureMasks(Sel: TStrings);
begin
  FPictureMasks.Assign(Sel);
end;

procedure TwwMSStoredProc.DoBeforePost;
begin
  inherited DoBeforePost;

  if FUsePictureMask then
    wwValidatePictureFields(Self, FOnInvalidValue);
end;

procedure Register;
begin
  RegisterComponents('SQLServer Access', [TwwMSQuery]);
  RegisterComponents('SQLServer Access', [TwwMSTable]);
  RegisterComponents('SQLServer Access', [TwwMSStoredProc]);
end;

{
For IP3

wwCommon.pas

Function wwDataSet(dataSet : TDataSet): boolean;
begin
   if dataset=nil then result:= false
   else
     result:=
     wwIsClass(dataset.classType, 'TwwTable') or
     wwIsClass(dataset.classType, 'TwwQuery') or
     wwIsClass(dataset.classType, 'TwwQBE') or
     wwIsClass(dataset.classType, 'TwwStoredProc') or
     wwIsClass(dataset.classType, 'TwwClientDataSet')
   // SDAC components
     or
     wwIsClass(dataset.classType, 'TwwMSQuery') or
     wwIsClass(dataset.classType, 'TwwSmartQuery') or
     wwIsClass(dataset.classType, 'TwwMSTable') or
     wwIsClass(dataset.classType, 'TwwMSStoredProc');
end;
}

end.