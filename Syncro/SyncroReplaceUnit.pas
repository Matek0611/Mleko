unit SyncroReplaceUnit;

interface

uses Windows, Classes;

type
  TSyncroReplace = class (TThread)
    FApplicationName: string;
    FPathWorking: string;
    FPathLocalUpdate: string;
    FUpdatedFiles: TStringList;
  protected
    procedure Execute; override;
  public
    constructor Create(
      aApplicationName:string;
      aPathWorking: string;
      aPathLocalUpdate :string);
    destructor Destroy; override;
  end;
implementation

uses SysUtils;
{ TSyncroReplace }

constructor TSyncroReplace.Create(aApplicationName, aPathWorking, aPathLocalUpdate: string);
begin
  FreeOnTerminate := True;
  inherited Create(true);

  { передаем параметры }
  FApplicationName:=  aApplicationName;
  FPathWorking := aPathWorking;
  FPathLocalUpdate:= aPathLocalUpdate;
  FUpdatedFiles:= TStringList.Create;
  {$Warnings Off}
  Resume;
  {$Warnings On}
end;

destructor TSyncroReplace.Destroy;
begin
  if Assigned(FUpdatedFiles) then FUpdatedFiles.Free;
  inherited;
end;

procedure TSyncroReplace.Execute;
var
  idx: integer;
  FFileFrom: string;
  FFileTo: string;
begin
  inherited;
  try
    {если по совести, то надо бы бекап подготовить на случай битого обновления.... но пока обойдемся}

    FFileFrom:= FPathLocalUpdate+FApplicationName+'.lst';
    if FileExists(FFileFrom)
      then FUpdatedFiles.LoadFromFile(FFileFrom);

    for idx:= 0 to FUpdatedFiles.Count -1 do
    begin
      FFileFrom:= FPathLocalUpdate + FUpdatedFiles.Strings[idx];
      FFileTo:= FPathWorking + FUpdatedFiles.Strings[idx];
      while FileExists(FFileTo) do  DeleteFile(FFileTo);

      RenameFile(FFileFrom, FFileTo);
    end;
    RemoveDir(FPathLocalUpdate);
  except
  end;
end;

end.

  
