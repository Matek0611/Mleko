unit SyncroNetworkUnit;

interface

uses Windows, SysUtils, Classes, Forms;

const
  BufSize = 3*16*1024;

type
  PBuffer = ^TBuffer;
  TBuffer = array [1..BufSize] of Byte;

  TSyncroNetworkUnit = class(TThread)
  private
    FApplicationName: string;
    FPathWorking: string;
    FPathLocalUpdate: string;
    FPathRemoteUpdate: string;
    FUpdatedFiles: TStringList;
    procedure SetDiffFlag;
  protected
    procedure Execute; override;
  public
    constructor Create(
      aApplicationName:string;
      aPathWorking: string;
      aPathLocalUpdate :string;
      aPathRemoteUpdate: string);
    destructor Destroy; override;
  end;


implementation

uses UpdaterUnit, CommFn;

{ TSyncroNetworkUnit }

constructor TSyncroNetworkUnit.Create(aApplicationName, aPathWorking, aPathLocalUpdate, aPathRemoteUpdate: string);
begin
  FreeOnTerminate := True;
  inherited Create(true);

  { передаем параметры }
  FApplicationName:=  aApplicationName;
  FPathWorking := aPathWorking;
  FPathLocalUpdate:= aPathLocalUpdate;
  FPathRemoteUpdate:= aPathRemoteUpdate;

  FUpdatedFiles:= TStringList.Create;
  {$Warnings Off}
  Resume;
  {$Warnings On}
end;

destructor TSyncroNetworkUnit.Destroy;
begin
  if Assigned(FUpdatedFiles) then FUpdatedFiles.Free;
  inherited;
end;

procedure TSyncroNetworkUnit.Execute;
var
  SRecRemote, SRecLocal: TSearchrec;
  srr, srl, idx: integer;
  FFileFrom: string;
  FFileTo: string;
  FSize: LongInt;
  FBuffer: PBuffer;
  infile, outfile: file;

  CurrRemoteFileVersion, CurrLocalFileVersion: string;
  CurrRemoteFileSize, CurrLocalFileSize: int64;
begin
  inherited;
  try
    {сначала проверим текущие файлы на различи€ с обновлением}
    srr := FindFirst(FPathRemoteUpdate + '*.*', faAnyFile-faDirectory, SRecRemote);
    while srr = 0  do
    begin
      CurrRemoteFileVersion:= '';
      CurrLocalFileVersion:= '';
      CurrLocalFileSize:= 0;

      FFileFrom:= FPathRemoteUpdate + SRecRemote.Name;
      FFileTo:= FPathWorking + SRecRemote.Name;
      CurrRemoteFileVersion:=  CommFn.GetFileVersion(FFileFrom);
      CurrRemoteFileSize:= SRecRemote.Size;
      srl:= FindFirst(FFileTo, faAnyFile-faDirectory, SRecLocal);
      if srl = 0 then
      begin
        CurrLocalFileVersion:= CommFn.GetFileVersion(FFileTo);
        CurrLocalFileSize:= SRecLocal.Size;
      end;
      if ((srl <> 0) or
          (CompareFileVersion(CurrLocalFileVersion,CurrRemoteFileVersion) = 1) or
          (CurrLocalFileSize <> CurrRemoteFileSize))
        then
          FUpdatedFiles.Add(SRecRemote.Name);

      srr := FindNext(SRecRemote);
    end;

    SysUtils.FindClose(SRecRemote);

    {если рабоча€ папка содержит различи€, готовим обновление}
    if FUpdatedFiles.Count > 0  then
    begin
      ForceDirectories(FPathLocalUpdate);
      for idx := 0 to FUpdatedFiles.Count - 1 do
      begin
        { опирование текущего файла}
        FFileFrom:= FPathRemoteUpdate + FUpdatedFiles.Strings[idx];
        FFileTo:= FPathLocalUpdate + FUpdatedFiles.Strings[idx];
        FBuffer := Nil;
        AssignFile(infile, FFileFrom);
        System.Reset(infile, 1);
        try
          AssignFile(outfile, FFileTo);
          System.Rewrite(outfile, 1);
          try
            New(FBuffer);
            repeat
              BlockRead(infile, FBuffer^, BufSize, FSize);
              BlockWrite(outfile,FBuffer^, FSize);
            until FSize < BufSize;
            {$Warnings Off}
            FileSetDate(TFileRec(outfile).Handle, FileGetDate(TFileRec(infile).Handle) );
            {$Warnings On}
          finally
           if FBuffer <> Nil then Dispose(FBuffer);
           System.close(outfile)
          end;
        finally
          System.close(infile);
        end;
        { опирование одного файла завершено}
        Sleep(1000);
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

procedure TSyncroNetworkUnit.SetDiffFlag;
begin
  (Application.MainForm as TUpdaterForm).UpdatedFiles:= FUpdatedFiles.Count;
end;

end.
