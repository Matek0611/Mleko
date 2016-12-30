unit SyncroHTTPUnit;

interface

uses Classes, HTTPGetUnit;

const
  BufSize = 3*16*1024;

type
  PBuffer = ^TBuffer;
  TBuffer = array [1..BufSize] of Byte;

  TSyncroHTTPUnit = class(TThread)
  private
    FApplicationName: string;
    FPathWorking: string;
    FPathLocalUpdate: string;
    FUpdatedFiles: TStringList;
    FStringList: TStringList;
    FGet: THTTPGet;

    procedure SetDiffFlag;
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

uses Forms, Windows, SysUtils, CommFn, UpdaterUnit;

{ TSyncroNetworkUnit }

constructor TSyncroHTTPUnit.Create(aApplicationName, aPathWorking, aPathLocalUpdate: string);
begin
  FreeOnTerminate := True;
  inherited Create(true);

  { передаем параметры }
  FApplicationName:=  aApplicationName;
  FPathWorking := aPathWorking;
  FPathLocalUpdate:= aPathLocalUpdate;

  FUpdatedFiles:= TStringList.Create;

  FStringList:= TStringList.Create;

  FGet:= THTTPGet.Create(nil);
  FGet.URL:= 'http://istochnik.com.ua/downloads/'+FApplicationName+'.upd';
  FGet.FileName:=FPathLocalUpdate+FApplicationName+'.tmp';
  FGet.BinaryData:= true;
  FGet.WaitThread:= True;

  {$Warnings Off}
  Resume;
  {$Warnings On}
end;

destructor TSyncroHTTPUnit.Destroy;
begin
  if Assigned(FGet) then FGet.Free;
  if Assigned(FStringList) then FStringList.Free;
  if Assigned(FUpdatedFiles) then FUpdatedFiles.Free;
end;

procedure TSyncroHTTPUnit.Execute;
var
  SRec: TSearchrec;
  FFileWork: string;
  FFileTo: string;

  idx: integer;

  TempStr: string;
  p: integer;
  CurrFileName: string;
  CurrFileVersion: string;
  WorkFileVersion: string;
  CurrFileSizeStr: string;
  CurrFileSize: int64;
begin
  inherited;
  try
    ForceDirectories(FPathLocalUpdate);

    FGet.GetFile;


    FStringList.LoadFromFile(FGet.FileName);
    DeleteFile(FGet.FileName);
    for idx := 0 to FStringList.Count - 1 do
    begin
      TempStr:= FStringList.Strings[idx];
      p:= pos('|',TempStr); CurrFileName:= copy(TempStr,1,p-1);
      TempStr:= copy (TempStr, p+1, length(TempStr));
      p:= pos('|',TempStr);  CurrFileSizeStr:= copy(TempStr,1,p-1);  CurrFileSize:= strtoint(CurrFileSizeStr);
      CurrFileVersion:= copy (TempStr, p+1, length(TempStr));

      if CurrFileName = '' then continue ;

      FFileWork:= FPathWorking + CurrFileName;
      FFileTo:= FPathLocalUpdate + CurrFileName;
      {$Warnings Off}
      FindFirst(FFileWork, faAnyFile, SRec);
      {$Warnings On}
      WorkFileVersion:= CommFn.GetFileVersion(FFileWork);
      if (not FileExists(FFileWork) or
          (CompareFileVersion(WorkFileVersion, CurrFileVersion) = -1) or
          (SRec.Size <> CurrFileSize)
          ) then
      begin
        FGet.URL:='hts/'+FApplicationName+'/'+CurrFileName;
        FGet.GetFile;
        if FileExists(FFileTo) then DeleteFile(FFileTo);
        RenameFile(FGet.FileName,  FFileTo);
        FUpdatedFiles.Add(CurrFileName);
      end;
    end;
    if FUpdatedFiles.Count > 0 then
    begin
      FFileTo:= FPathLocalUpdate+FApplicationName+'.lst';
      FUpdatedFiles.Add(FApplicationName+'.lst');
      FUpdatedFiles.SaveToFile(FFileTo);
    end;
    Synchronize(SetDiffFlag);
  except
  end;
end;

procedure TSyncroHTTPUnit.SetDiffFlag;
begin
  (Application.MainForm as TUpdaterForm).UpdatedFiles:= FUpdatedFiles.Count;
end;

end.
