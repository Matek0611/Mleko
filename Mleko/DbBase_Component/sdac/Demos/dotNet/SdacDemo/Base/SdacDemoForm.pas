{$I DacDemo.inc}
unit SdacDemoForm;

interface

uses
  SysUtils, Classes, DB,
  {$IFDEF VER6P}
  Variants,
  {$ENDIF}
  Windows, Messages, Graphics, Controls, Forms, SdacVcl,
  Dialogs, Menus, ImgList, StdCtrls, ComCtrls, Buttons, ExtCtrls, ToolWin,
  DBAccess,  MSAccess, SdacAbout, DemoFrame, DemoForm, DemoBase, DAScript,
  MSScript;

type
  TSdacForm = class(TDemoForm)
    MSConnection: TMSConnection;
    MSConnectDialog1: TMSConnectDialog;
    scCreate: TMSScript;
    scDrop: TMSScript;
    procedure lbAboutClick(Sender: TObject); override;
    procedure cbDebugClick(Sender: TObject);
  private
    { Private declarations }
  protected
        //Product customization
    function GetConnection: TCustomDAConnection; override;
    function ApplicationTitle: string; override;
    function ProductName: string; override;    
    procedure RegisterDemos; override;
  public
    function ProductColor: TColor; override;
    procedure ExecCreateScript; override;
    procedure ExecDropScript; override;
  end;

var
  SdacForm: TSdacForm;

implementation

uses
  CachedUpdates,
{$IFDEF CRDBGRID}
  CRDBGrid,
{$ENDIF}
  ConnectDialog, FetchAll, LongStrings, MasterDetail,
  Pictures, Query, ServerCursors, Sql, StoredProc, StoredProcUpdates, 
{$IFNDEF STD}
  Dump, ServiceBroker, Transaction, ChangeNotification,
{$ENDIF}
{$IFDEF WIN32}
  Threads,
{$ENDIF}
{$IFNDEF CLR}
  UDT,
{$ENDIF}
  FilterAndIndex, Table, Text, UpdateSQL, VTable{$IFNDEF STD}, Loader{$ENDIF}, Lock;

{$IFDEF CLR}
{$R *.nfm}
{$ENDIF}
{$IFDEF WIN32}
{$R *.dfm}
{$ENDIF}

function TSdacForm.GetConnection: TCustomDAConnection;
begin
  Result := MSConnection;
end;

function TSdacForm.ProductColor: TColor;
begin
  Result := clGreen;
end;

procedure TSdacForm.ExecCreateScript;
begin
  scCreate.Execute;
end;

procedure TSdacForm.ExecDropScript;
begin
  scDrop.Execute;
end;

function TSdacForm.ApplicationTitle: string;
begin
  Result := 'SQL Server Data Access Components demos';
end;

function TSdacForm.ProductName: string;
begin
  Result := 'SDAC';
end;

procedure TSdacForm.RegisterDemos;
begin
  Demos.RegisterCategory('SDAC Demo', 'SDAC Demo');
  Demos.RegisterCategory('Working with components', 'Working with components');
  Demos.RegisterCategory('General demos', 'General demos');
  Demos.RegisterCategory('SQL Server specific', 'SQL Server specific');

{$IFNDEF STD}
  Demos.RegisterDemo('ChangeNotification', 'Using TMSChangeNotification component', 'Demonstrates working with the TMSChangeNotification component. This sample shows how to subscribe, recieve and reflect query result changes. This functionality is available only for SQL Server 2005.', 'Working with components', TChangeNotificationFrame, 13);
{$ENDIF}
  Demos.RegisterDemo('ConnectDialog', 'Customizing login dialog', 'Demonstrates how to customize the SDAC connect dialog. Changes the standard SDAC connect dialog to two custom connect dialogs. The first customized sample dialog is inherited from the TForm class, ' + 'and the second one is inherited from the default SDAC connect dialog class.', 'Working with components', TConnectDialogFrame, 2);
{$IFDEF CRDBGRID}
  Demos.RegisterDemo('CRDBGrid', 'Using TCRDBGrid component', 'Demonstrates how to work with the TCRDBGrid component.  Shows off the main TCRDBGrid features, like filtering, searching, stretching, using compound headers, and more.', 'Working with components', TCRDBGridFrame, 3);
{$ENDIF}
{$IFNDEF STD}
  Demos.RegisterDemo('Dump', 'Using TMSDump component', 'Demonstrates how to backup data from tables with the TMSDump component. Shows how to use scripts created during back up to restore table data. ' + 'This demo lets you back up a table either by specifying the table name or by writing a SELECT query.', 'Working with components', TDumpFrame, 14);
  Demos.RegisterDemo('Loader', 'Using TMSLoader component', 'Uses the TMSLoader component to quickly load data into a server table. This demo also compares the two TMSLoader data loading handlers: GetColumnData and PutData.', 'Working with components', TLoaderFrame, 4);
{$ENDIF}
  Demos.RegisterDemo('Query', 'Using TMSQuery component', 'Demonstrates working with TMSQuery, which is one of the most useful SDAC components. Includes many TMSQuery usage scenarios. Demonstrates how to execute queries in both standard and NonBlocking mode' + ' and how to edit data and export it to XML files. Note: This is a very good introductory demo. We recommend starting here when first becoming familiar with SDAC.', 'Working with components', TQueryFrame, 5);
  Demos.RegisterDemo('Sql', 'Using TMSSQL component', 'Uses the TMSSQL component to execute SQL statements. Demonstrates how to work in a separate thread, in standard mode, in NonBlocking mode, and how to break long-duration query execution.', 'Working with components', TSqlFrame, 6);
{$IFNDEF STD}
  Demos.RegisterDemo('ServiceBroker', 'Using TMSServiceBroker component', 'Demonstrates working with the TMSServiceBroker component. This sample shows how to organize simple messaging.', 'Working with components', TServiceBrokerFrame, 11);
{$ENDIF}
  Demos.RegisterDemo('StoredProc', 'Using TMSStoredProc component', 'Uses the TMSStoredProc component to access an editable recordset from an MS SQL stored procedure in the client application.', 'Working with components', TStoredProcFrame, 7);
  Demos.RegisterDemo('Table', 'Using TMSTable component', 'Demonstrates how to use TMSTable to work with data from a single table on the server without manually writing any SQL queries. Performs server-side data sorting and filtering and retrieves results for browsing and editing.', 'Working with components', TTableFrame, 8);
{$IFNDEF STD}
  Demos.RegisterDemo('Transaction', 'Using TMSTransaction component', 'Demonstrates working with the TMSTransaction component. This sample shows how to organize simple distributed transaction.', 'Working with components', TTransactionFrame, 12);
{$ENDIF}
  Demos.RegisterDemo('UpdateSQL', 'Using TMSUpdateSQL component', 'Demonstrates using the TMSUpdateSQL component to customize update commands. Lets you optionally use TMSSQL and TMSQuery objects for carrying out insert, delete, query, and update commands.', 'Working with components', TUpdateSQLFrame, 9);
  Demos.RegisterDemo('VirtualTable', 'Using TVirtualTable component', 'Demonstrates working with the TVirtualTable component. This sample shows how to fill virtual dataset with data from other datasets, filter data by a given criteria, locate specified records, perform file operations, and change data and table structure.', 'Working with components', TVirtualTableFrame, 10, 'VTable');

  Demos.RegisterDemo('CachedUpdates', 'Cached updates, transaction control', 'Demonstrates how to perform the most important tasks of working with data in CachedUpdates mode, including highlighting uncommitted changes, managing transactions, and committing changes in a batch.', 'General demos', TCachedUpdatesFrame, 1);
  Demos.RegisterDemo('FetchAll', 'Illustrates how to open TMSQuery with or without fetching all data to client', 'Demonstrates how to open a query that returns a large recordset using different values of the FetchAll option. This demo lets the user to fill in the table used in the query.', 'General demos', TFetchAllFrame, 1);
  Demos.RegisterDemo('FilterAndIndex', 'Using Filter and IndexFieldNames', 'Demonstrates SDAC''s local storage functionality. This sample shows how to perform local filtering, sorting and locating by multiple fields, including by calculated and lookup fields.', 'General demos', TFilterAndIndexFrame, 1);    
    Demos.RegisterDemo('MasterDetail', 'Master/detail relationship', 'Uses SDAC functionality to work with master/detail relationships. This sample shows how to use local master/detail functionality. Demonstrates different kinds of master/detail linking, including linking by SQL, by simple fields, and by calculated fields.', 'General demos', TMasterDetailFrame, 1);
  Demos.RegisterDemo('Pictures', 'Working with BLOB field', 'Uses SDAC functionality to work with graphics. The sample demonstrates how to retrieve binary data from MS SQL database and display it on visual components. Sample also shows how to load and save pictures to files and to the database.', 'General demos', TPicturesFrame, 1);
  Demos.RegisterDemo('StoredProcUpdates', 'Using StoredProcs to Insert, Update and Delete with TMSQuery component', 'Demonstrates updating a recordset using stored procedures. Update events are tied to stored procedure calls in design time, and every recordset change causes the corresponding stored procedure call to be performed. ' + 'The commands to call stored procedures are stored in the SQLInsert, SQLDelete, SQLUpdate properties of TMSQuery.', 'General demos', TStoredProcUpdatesFrame, 1);
{$IFNDEF CLR}
  Demos.RegisterDemo('Threads', 'Using Sdac in multi-threaded environment', 'Demonstrates how SDAC can be used in multithreaded applications. This sample allows you to set up several threads and test SDAC''s performance with multithreading.', 'General demos', TThreadsFrame, 1);
{$ENDIF}
  Demos.RegisterDemo('Lock', 'Editing data with row-level locking', 'Demonstrates two kinds of row-level locking (Update locking and Exclusive locking). This functionality is based on locking hints.', 'SQL Server specific', TLockFrame, 1);
  Demos.RegisterDemo('LongStrings', 'Working with string fields', 'Demonstrates SDAC functionality for working with long string fields (fields that have more than 256 characters). Shows the different ways they can be displayed as memo fields and string fields.', 'SQL Server specific', TLongStringsFrame, 1);
  Demos.RegisterDemo('ServerCursors', 'Open and navigate using client and server cursor types', 'Compares performance of opening a large recordset with different cursor types: client cursor in FetchAll=True mode, client cursor in FetchAll=False mode, and server cursor.', 'SQL Server specific', TServerCursorsFrame, 1);
  Demos.RegisterDemo('Text', 'Working with long string fields', 'Uses SDAC functionality to work with text. The sample demonstrates how to retrieve text data from MS SQL database and display it on visual components. Sample also shows how to load and save text to files and to the database.', 'SQL Server specific', TTextFrame, 1);
{$IFNDEF CLR}
  Demos.RegisterDemo('UDT', 'Working with User-defined type', 'Uses SDAC functionality to work with User-defined type. The sample demonstrates how to retrieve UDT data from SQL Server database and call its methods on client. Sample also shows how to update UDT fields. For more information about the demo see the' + ' Readme.html file in the demo folder.', 'SQL Server specific', TUDTFrame, 1);
{$ENDIF}

  Demos.RegisterCategory('Miscellaneous', '', -1, True);
{$IFDEF CLR}
  Demos.RegisterDemo('AspNet', 'AspNet', 'Uses MSDataAdapter to create a simple ASP .NET application. This demo shows how to create an ASP.NET application that lets you connect to a database and execute queries. ' + 'Application displays query results in a DataGrid and sends user changes back to the database.', 'Miscellaneous', nil, 1, '', True);
{$ENDIF}
{$IFNDEF CLR}
  Demos.RegisterDemo('Dll', 'Dll', 'Demonstrates creating and loading DLLs for SDAC-based projects. This demo project consists of two parts - an MS_Dll project that creates a DLL of a form that sends a query to the server and displays its results, ' + 'and an MS_Exe project that can be executed to display a form for loading and running this DLL. Allows you to build a dll for one SDAC-based project and load and test it from a separate application.', 'Miscellaneous', nil, 1, '', True);
{$ENDIF}
  Demos.RegisterDemo('FailOver', 'FailOver', 'Demonstrates the recommended approach to working with unstable networks. This sample lets you perform transactions and updates in several different modes, ' + 'simulate a sudden session termination, and view what happens to your data state when connections to the server are unexpectedly lost. Shows off CachedUpdates, LocalMasterDetail, FetchAll, Pooling, and different Failover modes.', 'Miscellaneous', nil, 1, '', True);
{$IFNDEF CLR}
  Demos.RegisterDemo('Midas', 'Midas', 'Demonstrates using MIDAS technology with SDAC. This project consists of two parts: a MIDAS server that processes requests to the database and a thin MIDAS client that displays an interactive grid. ' + 'This demo shows how to build thin clients that display interactive components and delegate all database interaction to a server application for processing.', 'Miscellaneous', nil, 1, '', True);
  Demos.RegisterDemo('Performance', 'Performance', 'Measures SDAC performance on several types of queries. This project lets you compare SDAC performance to BDE, ADO, and dbExpress. Tests the following functionality: Fetch, Master/Detail, ' + 'Stored Procedure Call, Multi Executing, and Insert/Post.', 'Miscellaneous', nil, 1, '', True);
{$ENDIF}
{$IFDEF CLR}
  Demos.RegisterDemo('WinForms', 'AspNet', 'Shows how to use SDAC to create a WinForm application. This demo project creates a simple WinForms application and fills a data grid from an MSDataAdapter data source.', 'Miscellaneous', nil, 1, '', True);
{$ENDIF}

{$IFNDEF CLR}
  Demos.RegisterCategory('', '', -1, True);
{$ENDIF}
  Demos.RegisterCategory('TechnologySpecific', '', -1, True);
  Demos.RegisterDemo('MSSQLCompact', 'MSSQLCompact', 'Demonstrates how to create applications that work with MS SQL Server Compact Edition. Demo connects to a database and opens a table. If the specified database does not exists, it will be created automatically.', 'TechnologySpecific', nil, 1, '', True);
{$IFNDEF CLR}
  Demos.RegisterCategory('', '', -1, True);
{$ENDIF}

{$IFNDEF CLR}
  Demos.RegisterCategory('ThirdParty', '', -1, True);
  Demos.RegisterDemo('FastReport', 'FastReport hint', 'Demonstrates how SDAC can be used with FastReport components. This project consists of two parts. The first part is several packages that integrate SDAC components into the FastReport editor. ' + 'The second part is a demo application that lets you design and preview reports with SDAC technology in the FastReport editor.', 'ThirdParty', nil, 1, '', True);
  Demos.RegisterDemo('InfoPower', 'InfoPower hint', 'Uses InfoPower components to display recordsets retrieved with SDAC. This demo project displays an InfoPower grid component and fills it with the result of an SDAC query. Shows how to link SDAC data sources to InfoPower components.', 'ThirdParty', nil, 1, '', True);
  Demos.RegisterDemo('IntraWeb', 'IntraWeb hint', 'A collection of sample projects that show how to use SDAC components as data sources for IntraWeb  applications. Contains IntraWeb samples for setting up a connection, querying ' + 'a database and modifying data and working with CachedUpdates and MasterDetail relationships.', 'ThirdParty', nil, 1, '', True);
  Demos.RegisterDemo('QuickReport', 'QuickReport hint', 'Lets you launch and view a QuickReport application based on SDAC. This demo project lets you modify the application in design-time.', 'ThirdParty', nil, 1, '', True);
  Demos.RegisterDemo('ReportBuilder', 'ReportBuilder hint', 'Uses SDAC data sources to create a ReportBuilder report that takes data from an MS SQL database. This demo project shows how to set up a ReportBuilder document in design-time and how to integrate SDAC components into the ' + 'Report Builder editor to perform document design in run-time.', 'ThirdParty', nil, 1, '', True);
{$ENDIF}
{$IFNDEF CLR}
  Demos.RegisterCategory('', '', -1, True);
{$ENDIF}

end;

procedure TSdacForm.lbAboutClick(Sender: TObject);
begin
  inherited;
  SdacAboutForm.ShowModal;
end;

procedure TSdacForm.cbDebugClick(Sender: TObject);
begin
  inherited;
  scCreate.Debug := (Sender as TCheckBox).Checked;
  scDrop.Debug := (Sender as TCheckBox).Checked;
end;

end.

