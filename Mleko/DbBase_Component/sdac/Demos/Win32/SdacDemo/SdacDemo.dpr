program SdacDemo;

{$I Base\DacDemo.inc}

uses
  Forms,
  CategoryFrame in 'Base\CategoryFrame.pas' {CategoryFrame},
  DemoBase in 'Base\DemoBase.pas',
  DemoForm in 'Base\DemoForm.pas' {DemoForm},
  DemoFrame in 'Base\DemoFrame.pas' {DemoFrame},
  HtmlConsts in 'Base\HtmlConsts.pas',
  VTable in 'VirtualTable\VTable.pas',
  SdacAbout in 'Base\SdacAbout.pas' {SdacAboutForm},
  CachedUpdates in 'CachedUpdates\CachedUpdates.pas' {CachedUpdates},
  UpdateAction in 'CachedUpdates\UpdateAction.pas' {UpdateAction},
  ConnectDialog in 'ConnectDialog\ConnectDialog.pas' {ConnectDialog},
{$IFDEF CRDBGRID}
  CRDBGrid in 'CRDBGrid\CRDBGrid.pas' {CRDBGrid},
{$ENDIF}
  FetchAll in 'FetchAll\FetchAll.pas' {FetchAll},
  LongStrings in 'LongStrings\LongStrings.pas' {LongStringsFrame},
  MasterDetail in 'MasterDetail\MasterDetail.pas' {MasterDetail},
  Pictures in 'Pictures\Pictures.pas' {Pictures},
  ServerCursors in 'ServerCursors\ServerCursors.pas' {ServerCursors},
  Sql in 'Sql\Sql.pas' {SqlFrame},
  StoredProc in 'StoredProc\StoredProc.pas' {StoredProcFrame},
  StoredProcUpdates in 'StoredProcUpdates\StoredProcUpdates.pas' {StoredProcUpdatesFrame},
  Table in 'Table\Table.pas' {TableFrame},
  Text in 'Text\Text.pas' {TextFrame},
  Threads in 'Threads\Threads.pas' {ThreadsFrame},
  ThreadsData in 'Threads\ThreadsData.pas' {ThreadsData: TDataModule},
  UpdateSQL in 'UpdateSQL\UpdateSQL.pas' {UpdateSQLFrame},
  SdacDemoForm in 'Base\SdacDemoForm.pas' {SdacForm},
  Query in 'Query\Query.pas' {QueryFrame: TFrame},
  FilterAndIndex in 'FilterAndIndex\FilterAndIndex.pas',
{$IFNDEF STD}  
  Dump in 'Dump\Dump.pas' {DumpForm},
  Fetch in 'Loader\Fetch.pas' {FetchForm},
  Loader in 'Loader\Loader.pas', {LoaderFrame}
  ServiceBroker in 'ServiceBroker\ServiceBroker.pas' {ServiceBrokerFrame: TFrame},
  Transaction in 'Transaction\Transaction.pas' {TransactionFrame: TFrame},
  ChangeNotification in 'ChangeNotification\ChangeNotification.pas' {ChangeNotificationFrame: TFrame},
{$ENDIF}
  InheritedConnectForm in 'ConnectDialog\InheritedConnectForm.pas' {fmInheritedConnect},
  MyConnectForm in 'ConnectDialog\MyConnectForm.pas' {fmMyConnect},
  Lock in 'Lock\Lock.pas' {LockFrame}
  {$IFNDEF CLR}, UDT in 'UDT\UDT.pas' {UDTFrame} {$ENDIF};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TSdacForm, SdacForm);
  Application.CreateForm(TSdacAboutForm, SdacAboutForm);
  Application.Run;
end.
