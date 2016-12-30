{$I ..\Sdac.inc}

unit CoreLab.Sdac.Design.MSReg;

{$R ..\..\Images\CoreLab.Sdac.Design.SdacHelpItem.bmp}
{$R ..\..\Images\CoreLab.Sdac.Design.CRSdacFAQItem.bmp}
{$R ..\..\Images\CoreLab.Sdac.Design.CRSdacHomePageItem.bmp}
{$R ..\..\Images\CoreLab.Sdac.Design.CRSdacPageItem.bmp}
{$R ..\..\Images\CoreLab.Sdac.Design.SdacDBMonitorItem.bmp}
{$R ..\..\Images\CoreLab.Sdac.Design.SdacEMItem.bmp}
{$R ..\..\Images\CoreLab.Sdac.Design.SdacMSItem.bmp}
{$R ..\..\Images\CoreLab.Sdac.Design.SdacQAItem.bmp}

{$IFDEF VER10P}

{$IFNDEF STD}
{$R ..\..\Images\CoreLab.Dac.CRBatchMove.TCRBatchMove.bmp}
{$R ..\..\Images\CoreLab.Dac.CRBatchMove.TCRBatchMove16.bmp}
{$R ..\..\Images\CoreLab.Dac.CRBatchMove.TCRBatchMove32.bmp}
{$ENDIF}

{$R ..\..\Images\CoreLab.Sdac.SdacVcl.TMSConnectDialog.bmp}
{$R ..\..\Images\CoreLab.Sdac.MSSQLMonitor.TMSSQLMonitor.bmp}
{$R ..\..\Images\CoreLab.Sdac.MSAccess.TMSUpdateSQL.bmp}
{$R ..\..\Images\CoreLab.Sdac.MSAccess.TMSTable.bmp}
{$R ..\..\Images\CoreLab.Sdac.MSAccess.TMSStoredProc.bmp}
{$R ..\..\Images\CoreLab.Sdac.MSAccess.TMSSQL.bmp}
{$R ..\..\Images\CoreLab.Sdac.MSScript.TMSScript.bmp}
{$R ..\..\Images\CoreLab.Sdac.MSAccess.TMSQuery.bmp}
{$R ..\..\Images\CoreLab.Sdac.MSAccess.TMSMetadata.bmp}
{$R ..\..\Images\CoreLab.Sdac.MSLoader.TMSLoader.bmp}
{$R ..\..\Images\CoreLab.Sdac.MSAccess.TMSConnection.bmp}
{$R ..\..\Images\CoreLab.Sdac.MSAccess.TMSDataSource.bmp}
{$R ..\..\Images\CoreLab.Sdac.MSServiceBroker.TMSServiceBroker.bmp}
{$R ..\..\Images\CoreLab.Sdac.MSDump.TMSDump.bmp}
{$IFNDEF STD}
{$R ..\..\Images\CoreLab.Sdac.MSCompactConnection.TMSCompactConnection.bmp}
{$R ..\..\Images\CoreLab.Sdac.MSTransaction.TMSTransaction.bmp}
{$R ..\..\Images\CoreLab.Sdac.MSAccess.TMSChangeNotification.bmp}
{$ENDIF}

{$R ..\..\Images\CoreLab.Sdac.SdacVcl.TMSConnectDialog16.bmp}
{$R ..\..\Images\CoreLab.Sdac.MSSQLMonitor.TMSSQLMonitor16.bmp}
{$R ..\..\Images\CoreLab.Sdac.MSAccess.TMSUpdateSQL16.bmp}
{$R ..\..\Images\CoreLab.Sdac.MSAccess.TMSTable16.bmp}
{$R ..\..\Images\CoreLab.Sdac.MSAccess.TMSStoredProc16.bmp}
{$R ..\..\Images\CoreLab.Sdac.MSAccess.TMSSQL16.bmp}
{$R ..\..\Images\CoreLab.Sdac.MSScript.TMSScript16.bmp}
{$R ..\..\Images\CoreLab.Sdac.MSAccess.TMSQuery16.bmp}
{$R ..\..\Images\CoreLab.Sdac.MSAccess.TMSMetadata16.bmp}
{$R ..\..\Images\CoreLab.Sdac.MSLoader.TMSLoader16.bmp}
{$R ..\..\Images\CoreLab.Sdac.MSAccess.TMSConnection16.bmp}
{$R ..\..\Images\CoreLab.Sdac.MSAccess.TMSDataSource16.bmp}
{$R ..\..\Images\CoreLab.Sdac.MSServiceBroker.TMSServiceBroker16.bmp}
{$R ..\..\Images\CoreLab.Sdac.MSDump.TMSDump16.bmp}
{$IFNDEF STD}
{$R ..\..\Images\CoreLab.Sdac.MSCompactConnection.TMSCompactConnection16.bmp}
{$R ..\..\Images\CoreLab.Sdac.MSTransaction.TMSTransaction16.bmp}
{$R ..\..\Images\CoreLab.Sdac.MSAccess.TMSChangeNotification16.bmp}
{$ENDIF}

{$R ..\..\Images\CoreLab.Sdac.SdacVcl.TMSConnectDialog32.bmp}
{$R ..\..\Images\CoreLab.Sdac.MSSQLMonitor.TMSSQLMonitor32.bmp}
{$R ..\..\Images\CoreLab.Sdac.MSAccess.TMSUpdateSQL32.bmp}
{$R ..\..\Images\CoreLab.Sdac.MSAccess.TMSTable32.bmp}
{$R ..\..\Images\CoreLab.Sdac.MSAccess.TMSStoredProc32.bmp}
{$R ..\..\Images\CoreLab.Sdac.MSAccess.TMSSQL32.bmp}
{$R ..\..\Images\CoreLab.Sdac.MSScript.TMSScript32.bmp}
{$R ..\..\Images\CoreLab.Sdac.MSAccess.TMSQuery32.bmp}
{$R ..\..\Images\CoreLab.Sdac.MSAccess.TMSMetadata32.bmp}
{$R ..\..\Images\CoreLab.Sdac.MSLoader.TMSLoader32.bmp}
{$R ..\..\Images\CoreLab.Sdac.MSAccess.TMSConnection32.bmp}
{$R ..\..\Images\CoreLab.Sdac.MSAccess.TMSDataSource32.bmp}
{$R ..\..\Images\CoreLab.Sdac.MSServiceBroker.TMSServiceBroker32.bmp}
{$R ..\..\Images\CoreLab.Sdac.MSDump.TMSDump32.bmp}
{$IFNDEF STD}
{$R ..\..\Images\CoreLab.Sdac.MSCompactConnection.TMSCompactConnection32.bmp}
{$R ..\..\Images\CoreLab.Sdac.MSTransaction.TMSTransaction32.bmp}
{$R ..\..\Images\CoreLab.Sdac.MSAccess.TMSChangeNotification32.bmp}
{$ENDIF}


{$ELSE}

{$IFNDEF STD}
{$R ..\..\Images\Delphi8\CoreLab.Dac.CRBatchMove.TCRBatchMove.bmp}
{$ENDIF}

{$R ..\..\Images\Delphi8\CoreLab.Sdac.SdacVcl.TMSConnectDialog.bmp}
{$R ..\..\Images\Delphi8\CoreLab.Sdac.MSSQLMonitor.TMSSQLMonitor.bmp}
{$R ..\..\Images\Delphi8\CoreLab.Sdac.MSAccess.TMSUpdateSQL.bmp}
{$R ..\..\Images\Delphi8\CoreLab.Sdac.MSAccess.TMSTable.bmp}
{$R ..\..\Images\Delphi8\CoreLab.Sdac.MSAccess.TMSStoredProc.bmp}
{$R ..\..\Images\Delphi8\CoreLab.Sdac.MSAccess.TMSSQL.bmp}
{$R ..\..\Images\Delphi8\CoreLab.Sdac.MSScript.TMSScript.bmp}
{$R ..\..\Images\Delphi8\CoreLab.Sdac.MSAccess.TMSQuery.bmp}
{$R ..\..\Images\Delphi8\CoreLab.Sdac.MSAccess.TMSMetadata.bmp}
{$R ..\..\Images\Delphi8\CoreLab.Sdac.MSLoader.TMSLoader.bmp}
{$R ..\..\Images\Delphi8\CoreLab.Sdac.MSAccess.TMSConnection.bmp}
{$R ..\..\Images\Delphi8\CoreLab.Sdac.MSAccess.TMSDataSource.bmp}
{$R ..\..\Images\Delphi8\CoreLab.Sdac.MSServiceBroker.TMSServiceBroker.bmp}
{$R ..\..\Images\Delphi8\CoreLab.Sdac.MSDump.TMSDump.bmp}
{$IFNDEF STD}
{$R ..\..\Images\Delphi8\CoreLab.Sdac.MSCompactConnection.TMSCompactConnection.bmp}
{$R ..\..\Images\Delphi8\CoreLab.Sdac.MSTransaction.TMSTransaction.bmp}
{$R ..\..\Images\Delphi8\CoreLab.Sdac.MSAccess.TMSChangeNotification.bmp}
{$ENDIF}

{$ENDIF}

{$I ..\Design\MSReg.pas}
