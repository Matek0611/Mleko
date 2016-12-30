{$I Base\DacDemo.inc}

program SdacDemo_VclNet;

{%DelphiDotNetAssemblyCompiler 'System.Drawing.dll'}
{%DelphiDotNetAssemblyCompiler 'Borland.VclDbRtl.dll'}
{%DelphiDotNetAssemblyCompiler 'Borland.Delphi.dll'}
{%DelphiDotNetAssemblyCompiler 'Borland.VclRtl.dll'}
{%DelphiDotNetAssemblyCompiler 'Borland.Vcl.dll'}
{%DelphiDotNetAssemblyCompiler 'CoreLab.Dac.dll'}
{%DelphiDotNetAssemblyCompiler 'CoreLab.Sdac.dll'}

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
  ConnectForm in 'ConnectDialog\ConnectForm.pas' {MyConnect},
  InheritedConnectForm in 'ConnectDialog\InheritedConnectForm.pas' {InheritedConnect},
{$IFDEF CRDBGRID}
  CRDBGrid in 'CRDBGrid\CRDBGrid.pas' {CRDBGrid},
{$ENDIF}
  FetchAll in 'FetchAll\FetchAll.pas' {FetchAll},
  MasterDetail in 'MasterDetail\MasterDetail.pas' {MasterDetail},
  Pictures in 'Pictures\Pictures.pas' {Pictures},
  ServerCursors in 'ServerCursors\ServerCursors.pas' {ServerCursors},
  Sql in 'Sql\Sql.pas' {SqlFrame},
  StoredProc in 'StoredProc\StoredProc.pas' {StoredProcFrame},
  StoredProcUpdates in 'StoredProcUpdates\StoredProcUpdates.pas' {StoredProcUpdatesFrame},
  Table in 'Table\Table.pas' {TableFrame},
  Text in 'Text\Text.pas' {TextFrame},
  ThreadsData in 'Threads\ThreadsData.pas' {ThreadsData: TDataModule},
  UpdateSQL in 'UpdateSQL\UpdateSQL.pas' {UpdateSQLFrame},
  SdacDemoForm in 'Base\SdacDemoForm.pas' {SdacForm},
  Query in 'Query\Query.pas' {QueryFrame: TFrame},
  FilterAndIndex in 'FilterAndIndex\FilterAndIndex.pas',
{$IFNDEF STD}
  Dump in 'Dump\Dump.pas' {DumpForm},
  Loader in 'Loader\Loader.pas',
  Fetch in 'Loader\Fetch.pas' {FetchForm},
  ServiceBroker in 'ServiceBroker\ServiceBroker.pas' {ServiceBroker},
  Transaction in 'Transaction\Transaction.pas' {Transaction},
  ChangeNotification in 'ChangeNotification\ChangeNotification.pas' {ChangeNotification},
{$ENDIF}
  LongStrings in 'LongStrings\LongStrings.pas',
  Lock in 'Lock\Lock.pas';

{$R *.res}

[STAThread]

begin
  Application.Initialize;
  Application.CreateForm(TSdacForm, SdacForm);
  Application.CreateForm(TSdacAboutForm, SdacAboutForm);
  Application.Run;
end.
